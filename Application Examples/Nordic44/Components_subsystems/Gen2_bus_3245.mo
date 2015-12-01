within Nordic44.Components_subsystems;
model Gen2_bus_3245 "Configuration of synchronous generator with regulators: GENSAL, HYGOV, SCRX;
  Nordic 44 model: Buses 3245, 3249, 5600"
  parameter Real Psch "Active power MW";
  parameter Real Qsch "Rective power MVAr";
  parameter Real Vmag0 "Voltage magnitude";
  parameter Real Vang0 "Voltage angle in degrees";
  parameter Real Sbase=Systembase "Systembase, inherited";
  parameter Real Mbase=Sbase "Machinebase";
  outer parameter Real Systembase;
  PowerSystems.Electrical.Machines.PSSE.GENSAL.GENSAL gENSAL(
    wbase=2*gENSAL.pi*50 "system base speed",
    Ra=0,
    Tpd0=5.0 "T'do (> 0)",
    Tppd0=0.06 "T''do (> 0)",
    Tppq0=0.1 "T''qo (> 0)",
    H=3.3 "Inertia",
    D=0 "Speed Damping",
    Xd=0.75 "d-axis reactance",
    Xq=0.5 "q-axis reactance",
    Xpd=0.25 "d-axis transient reactance",
    s12=0.2742,
    Xppd=0.15385,
    Xppq=0.15385,
    Xl=0.11538,
    s10=0.10239,
    anglev0=Vang0,
    pelec=Psch,
    qelec=Qsch,
    Mbase=Mbase,
    Sbase=Sbase,
    eterm=Vmag0)
    annotation (Placement(transformation(extent={{-63,-44},{33,46}})));
  PowerSystems.Electrical.Controls.PSSE.TG.HYGOV hYGOV(
    R=0.06 "Permanent droop, p.u",
    r=0.4 "Temporary droop, p.u",
    Tr=5 "Governor time constant, s",
    Tf=0.05 "Filter time constant, s",
    Tg=0.2 "Servo time constant, s",
    VELM=0.1 "Gate open/close velosiy limit, p.u/sec",
    Gmax=1 "Maximum gate limit, p.u",
    Gmin=0 "Minimum gate limit, p.u",
    Tw=1 "Water time constant, s",
    Dturb=0.5 "Turbine damping, p.u",
    qnl=0.1 "Water flow at no load. p.u",
    At=1.01)
    annotation (Placement(transformation(extent={{-72,42},{58,94}})));
  PowerSystems.Electrical.Controls.PSSE.ES.SCRX.SCRX sCRX(
    TE=0.05 "TE (sec)",
    EMIN=0 "EMIN (pu on EFD base)",
    CSWITCH=0 "Cswitch",
    RC_rfd=0 "rc/rfd",
    TATB_ratio=0.25385,
    TB=13,
    K=31,
    EMAX=4,
    Ec0=Vmag0,
    Et0=Vmag0)
    annotation (Placement(transformation(extent={{35,-92},{89,-34}})));
  Modelica.Blocks.Sources.Constant cte(k=0)
    annotation (Placement(transformation(extent={{-5,-85},{5,-75}})));
  PowerSystems.Connectors.PwPin p annotation (Placement(transformation(
          rotation=0, extent={{100,-10},{120,10}}), iconTransformation(
          extent={{100,-10},{120,10}})));
equation

  connect(p, p) annotation (Line(
      points={{110,0},{104,0},{104,0},{110,0}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(gENSAL.p, p) annotation (Line(
      points={{18.6,1.9},{60.1,1.9},{60.1,0},{110,0}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(gENSAL.SPEED, hYGOV.SPEED) annotation (Line(
      points={{16.68,39.7},{34,39.7},{34,94},{-54,94},{-54,71.38},{-44.7813,
          71.38}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(gENSAL.PMECH0, hYGOV.PMECH0) annotation (Line(
      points={{16.68,-9.8},{39,-9.8},{39,97},{-59,97},{-59,60.46},{-45.5938,
          60.46}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(hYGOV.PMECH, gENSAL.PMECH) annotation (Line(
      points={{18.5938,70.86},{24,70.86},{24,50},{-56,50},{-56,27.1},{-48.6,
          27.1}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(gENSAL.ETERM, sCRX.ECOMP) annotation (Line(
      points={{16.68,20.8},{30,20.8},{30,-37.77},{35.225,-37.77}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(gENSAL.XADIFD, sCRX.XADIFD) annotation (Line(
      points={{-0.6,-46.7},{-0.6,-66.77},{34.775,-66.77}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(sCRX.ETERM, gENSAL.ETERM) annotation (Line(
      points={{34.775,-76.34},{30,-76.34},{30,20.8},{16.68,20.8}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(gENSAL.EFD0, sCRX.EFD0) annotation (Line(
      points={{16.68,-27.8},{23,-27.8},{23,-86.49},{35.225,-86.49}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(sCRX.VOTHSG, cte.y) annotation (Line(
      points={{35.225,-45.89},{18,-45.89},{18,-80},{5.5,-80}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(sCRX.VOEL, cte.y) annotation (Line(
      points={{35.225,-52.85},{18,-52.85},{18,-80},{5.5,-80}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(sCRX.VUEL, cte.y) annotation (Line(
      points={{35.225,-60.39},{18,-60.39},{18,-80},{5.5,-80}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(sCRX.EFD, gENSAL.EFD) annotation (Line(
      points={{89.9,-62.71},{94,-62.71},{94,-96},{-56,-96},{-56,0.1},{
          -47.64,0.1}},
      color={0,0,127},
      smooth=Smooth.None));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics={Ellipse(extent={{-100,-100},{101,
              100}}, lineColor={0,0,255}), Line(
          points={{-76,-26},{-28,52},{27,-52},{74,23}},
          color={0,0,255},
          smooth=Smooth.Bezier)}), Diagram(coordinateSystem(
          preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
        graphics));
end Gen2_bus_3245;
