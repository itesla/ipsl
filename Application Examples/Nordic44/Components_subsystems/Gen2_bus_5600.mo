within Nordic44.Components_subsystems;
model Gen2_bus_5600 "Configuration of synchronous generator with regulators: GENSAL, HYGOV, SCRX;
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
    D=0 "Speed Damping",
    Tpd0=7.85,
    Tppd0=0.05,
    Tppq0=0.15,
    H=3.5,
    Xd=1,
    Xq=0.51325,
    Xpd=0.38,
    Xppd=0.28,
    Xppq=0.28,
    Xl=0.21,
    s10=0.1,
    s12=0.3,
    eterm=Vmag0,
    anglev0=Vang0,
    pelec=Psch,
    qelec=Qsch,
    Mbase=Mbase,
    Sbase=Sbase)
    annotation (Placement(transformation(extent={{-72,-24},{10,50}})));
  PowerSystems.Electrical.Controls.PSSE.TG.HYGOV hYGOV(
    R=0.06 "Permanent droop, p.u",
    Tr=5 "Governor time constant, s",
    Tf=0.05 "Filter time constant, s",
    Tg=0.2 "Servo time constant, s",
    Gmax=1 "Maximum gate limit, p.u",
    Gmin=0 "Minimum gate limit, p.u",
    Tw=1 "Water time constant, s",
    Dturb=0.5 "Turbine damping, p.u",
    qnl=0.1 "Water flow at no load. p.u",
    r=0.3,
    VELM=0.2,
    At=1.1)
    annotation (Placement(transformation(extent={{-90,54},{46,96}})));
  PowerSystems.Electrical.Controls.PSSE.ES.SCRX.SCRX sCRX(
    TE=0.05 "TE (sec)",
    EMIN=0 "EMIN (pu on EFD base)",
    CSWITCH=0 "Cswitch",
    RC_rfd=0 "rc/rfd",
    TATB_ratio=0.25385,
    TB=13,
    K=61,
    EMAX=4,
    Ec0=Vmag0,
    Et0=Vmag0)
    annotation (Placement(transformation(extent={{14,-84},{72,-22}})));
  Modelica.Blocks.Sources.Constant cte(k=0)
    annotation (Placement(transformation(extent={{-27,-75},{-17,-65}})));
  PowerSystems.Connectors.PwPin p annotation (Placement(transformation(
          rotation=0, extent={{100,-10},{120,10}}), iconTransformation(
          extent={{100,-10},{120,10}})));
equation

  connect(p, p) annotation (Line(
      points={{110,0},{104,0},{104,0},{110,0}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(gENSAL.p, p) annotation (Line(
      points={{-2.3,13.74},{110,13.74},{110,0}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(gENSAL.SPEED, hYGOV.SPEED) annotation (Line(
      points={{-3.94,44.82},{16,44.82},{16,94},{-68,94},{-68,77.73},{
          -61.525,77.73}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(gENSAL.PMECH0, hYGOV.PMECH0) annotation (Line(
      points={{-3.94,4.12},{10,5},{22,5},{22,97},{-74,97},{-74,69},{-68,69},
          {-68,68.91},{-62.375,68.91}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(hYGOV.PMECH, gENSAL.PMECH) annotation (Line(
      points={{4.775,77.31},{12,77.31},{12,56},{-68,56},{-68,34.46},{-59.7,
          34.46}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(gENSAL.ETERM, sCRX.ECOMP) annotation (Line(
      points={{-3.94,29.28},{8,29.28},{8,-26.03},{14.2417,-26.03}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(gENSAL.XADIFD, sCRX.XADIFD) annotation (Line(
      points={{-18.7,-26.22},{-18.7,-57.03},{13.7583,-57.03}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(sCRX.ETERM, gENSAL.ETERM) annotation (Line(
      points={{13.7583,-67.26},{8,-67.26},{8,29.28},{-3.94,29.28}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(gENSAL.EFD0, sCRX.EFD0) annotation (Line(
      points={{-3.94,-10.68},{4,-10.68},{4,-78.11},{14.2417,-78.11}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(sCRX.VOTHSG, cte.y) annotation (Line(
      points={{14.2417,-34.71},{-2,-34.71},{-2,-70},{-16.5,-70}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(sCRX.VOEL, cte.y) annotation (Line(
      points={{14.2417,-42.15},{-2,-42.15},{-2,-70},{-16.5,-70}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(sCRX.VUEL, cte.y) annotation (Line(
      points={{14.2417,-50.21},{-2,-50.21},{-2,-70},{-16.5,-70}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(sCRX.EFD, gENSAL.EFD) annotation (Line(
      points={{72.9667,-52.69},{80,-52.69},{80,-90},{-70,-90},{-70,12.26},{
          -58.88,12.26}},
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
end Gen2_bus_5600;
