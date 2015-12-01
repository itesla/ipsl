within Nordic44.Components_subsystems;
model Gen2_bus_3249 "Configuration of synchronous generator with regulators: GENSAL, HYGOV, SCRX;
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
    Tppd0=0.06 "T''do (> 0)",
    Tppq0=0.1 "T''qo (> 0)",
    D=0 "Speed Damping",
    s12=0.2742,
    Tpd0=10.13,
    H=4.543,
    Xd=1.036,
    Xq=0.63,
    Xpd=0.28,
    Xppd=0.21,
    Xppq=0.21,
    Xl=0.11538,
    s10=0.10239,
    eterm=Vmag0,
    anglev0=Vang0,
    pelec=Psch,
    qelec=Qsch,
    Mbase=Mbase,
    Sbase=Sbase)
    annotation (Placement(transformation(extent={{-68,-36},{22,54}})));
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
    At=1.1)
    annotation (Placement(transformation(extent={{-84,52},{48,98}})));
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
    annotation (Placement(transformation(extent={{26,-92},{81,-32}})));
  Modelica.Blocks.Sources.Constant cte(k=0)
    annotation (Placement(transformation(extent={{-9,-83},{1,-73}})));
  PowerSystems.Connectors.PwPin p annotation (Placement(transformation(
          rotation=0, extent={{100,-10},{120,10}}), iconTransformation(
          extent={{100,-10},{120,10}})));
equation

  connect(p, p) annotation (Line(
      points={{110,0},{104,0},{104,0},{110,0}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(gENSAL.SPEED, hYGOV.SPEED) annotation (Line(
      points={{6.7,47.7},{20,47.7},{20,94},{-62,94},{-62,77.99},{-56.3625,
          77.99}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(gENSAL.PMECH0, hYGOV.PMECH0) annotation (Line(
      points={{6.7,-1.8},{26,-1.8},{26,96},{-68,96},{-68,68.33},{-57.1875,
          68.33}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(hYGOV.PMECH, gENSAL.PMECH) annotation (Line(
      points={{7.9875,77.53},{14,77.53},{14,58},{-64,58},{-64,35.1},{-54.5,
          35.1}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(gENSAL.ETERM, sCRX.ECOMP) annotation (Line(
      points={{6.7,28.8},{22,28.8},{22,-35.9},{26.2292,-35.9}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(gENSAL.XADIFD, sCRX.XADIFD) annotation (Line(
      points={{-9.5,-38.7},{-9.5,-65.9},{25.7708,-65.9}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(sCRX.ETERM, gENSAL.ETERM) annotation (Line(
      points={{25.7708,-75.8},{22,-75.8},{22,28.8},{6.7,28.8}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(gENSAL.EFD0, sCRX.EFD0) annotation (Line(
      points={{6.7,-19.8},{16,-19.8},{16,-86.3},{26.2292,-86.3}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(sCRX.VOTHSG, cte.y) annotation (Line(
      points={{26.2292,-44.3},{10,-44.3},{10,-78},{1.5,-78}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(sCRX.VOEL, cte.y) annotation (Line(
      points={{26.2292,-51.5},{10,-51.5},{10,-78},{1.5,-78}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(sCRX.VUEL, cte.y) annotation (Line(
      points={{26.2292,-59.3},{10,-59.3},{10,-78},{1.5,-78}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(sCRX.EFD, gENSAL.EFD) annotation (Line(
      points={{81.9167,-61.7},{88,-61.7},{88,-96},{-64,-96},{-64,8.1},{
          -53.6,8.1}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(gENSAL.p, p) annotation (Line(
      points={{8.5,9.9},{50,9.9},{50,0},{110,0}},
      color={0,0,255},
      smooth=Smooth.None));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics={Ellipse(extent={{-100,-100},{101,
              100}}, lineColor={0,0,255}), Line(
          points={{-76,-26},{-28,52},{27,-52},{74,23}},
          color={0,0,255},
          smooth=Smooth.Bezier)}), Diagram(coordinateSystem(
          preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
        graphics));
end Gen2_bus_3249;
