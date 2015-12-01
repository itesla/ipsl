within Nordic44.Components_subsystems;
model Gen5_bus_6000 "Configuration of synchronous generator with regulators: GENSAL, SEXS, HYGOV;
  Nordic 44 model: Buses 5100, 5400, 5500, 6000, 6500"
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
    Tppd0=0.05 "T''do (> 0)",
    Tppq0=0.15 "T''qo (> 0)",
    D=0 "Speed Damping",
    s10=0.1,
    s12=0.3,
    Tpd0=9.7,
    H=3.5,
    Xd=1.28,
    Xq=0.94,
    Xpd=0.37,
    Xppd=0.28,
    Xppq=0.28,
    Xl=0.2,
    eterm=Vmag0,
    anglev0=Vang0,
    pelec=Psch,
    qelec=Qsch,
    Mbase=Mbase,
    Sbase=Sbase)
    annotation (Placement(transformation(extent={{-66,-40},{8,42}})));
  PowerSystems.Electrical.Controls.PSSE.TG.HYGOV hYGOV(
    R=0.06 "Permanent droop, p.u",
    Tr=5 "Governor time constant, s",
    Tf=0.05 "Filter time constant, s",
    Tg=0.2 "Servo time constant, s",
    VELM=0.2 "Gate open/close velosiy limit, p.u/sec",
    Gmax=1 "Maximum gate limit, p.u",
    Gmin=0 "Minimum gate limit, p.u",
    Tw=1 "Water time constant, s",
    At=1.1 "Turbine gain, p.u",
    Dturb=0.5 "Turbine damping, p.u",
    qnl=0.1 "Water flow at no load. p.u",
    r=0.3) annotation (Placement(transformation(extent={{-90,48},{42,88}})));
  PowerSystems.Electrical.Controls.PSSE.ES.SEXS sEXS(
    EMAX=4,
    TB=0.1,
    K=20,
    TE=0.1,
    EMIN=-4,
    Ec0=Vmag0,
    TATB_ratio=1)
    annotation (Placement(transformation(extent={{-6,-98},{88,-40}})));
  Modelica.Blocks.Sources.Constant cte(k=0)
    annotation (Placement(transformation(extent={{-25,-65},{-15,-55}})));
  PowerSystems.Connectors.PwPin p annotation (Placement(transformation(
          rotation=0, extent={{100,-10},{120,10}}), iconTransformation(
          extent={{100,-10},{120,10}})));
equation
  connect(cte.y, sEXS.VOEL) annotation (Line(
      points={{-14.5,-60},{0,-60},{0,-60.01},{14.6077,-60.01}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(cte.y, sEXS.VUEL) annotation (Line(
      points={{-14.5,-60},{0,-60},{0,-65.81},{14.6077,-65.81}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(cte.y, sEXS.VOTHSG) annotation (Line(
      points={{-14.5,-60},{0,-60},{0,-54.79},{14.6077,-54.79}},
      color={0,0,127},
      smooth=Smooth.None));

  connect(gENSAL.p, p) annotation (Line(
      points={{-3.1,1.82},{75.1,1.82},{75.1,0},{110,0}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(gENSAL.SPEED, hYGOV.SPEED) annotation (Line(
      points={{-4.58,36.26},{16,36.26},{16,88},{-68,88},{-68,70.6},{
          -62.3625,70.6}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(gENSAL.PMECH0, hYGOV.PMECH0) annotation (Line(
      points={{-4.58,-8.84},{20,-8.84},{20,92},{-74,92},{-74,62.2},{
          -63.1875,62.2}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(hYGOV.PMECH, gENSAL.PMECH) annotation (Line(
      points={{1.9875,70.2},{10,70.2},{10,50},{-64,50},{-64,24.78},{-54.9,
          24.78}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(gENSAL.ETERM, sEXS.ECOMP) annotation (Line(
      points={{-4.58,19.04},{10,19.04},{10,-48.99},{14.6077,-48.99}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(gENSAL.EFD0, sEXS.EFD0) annotation (Line(
      points={{-4.58,-25.24},{5,-25.24},{5,-77.99},{14.6077,-77.99}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(sEXS.EFD, gENSAL.EFD) annotation (Line(
      points={{60.5231,-63.2},{72,-63.2},{72,-88},{-64,-88},{-64,0.18},{
          -54.16,0.18}},
      color={0,0,127},
      smooth=Smooth.None));
  annotation (Icon(graphics={Ellipse(extent={{-100,-100},{101,100}},
            lineColor={0,0,255}), Line(
          points={{-76,-26},{-28,52},{27,-52},{74,23}},
          color={0,0,255},
          smooth=Smooth.Bezier)}), Diagram(coordinateSystem(
          preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
        graphics));
end Gen5_bus_6000;
