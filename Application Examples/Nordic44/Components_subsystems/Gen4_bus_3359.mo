within Nordic44.Components_subsystems;
model Gen4_bus_3359 "Configuration of synchronous generator with regulators: GENROU, STAB2A, IEEET2, IEESGO;
  Nordic 44 model: Buses 3300, 3359, 8500"
  parameter Real Psch "Active power MW";
  parameter Real Qsch "Rective power MVAr";
  parameter Real Vmag0 "Voltage magnitude";
  parameter Real Vang0 "Voltage angle in degrees";
  parameter Real Sbase=Systembase "Systembase, inherited";
  parameter Real Mbase=Sbase "Machinebase";
  outer parameter Real Systembase;
  PowerSystems.Electrical.Machines.PSSE.GENROU.GENROU gENROU(
    wbase=2*gENROU.pi*50 "system base speed",
    Ra=0 "amature resistance",
    Tppd0=0.05 "d-axis sub-transient open-circuit time constant s",
    Tpq0=1 "q-axis transient open-circuit time constant s",
    Tppq0=0.05 "q-axis transient open-circuit time constant s",
    D=0 "Damping",
    s10=0.1089,
    Tpd0=4.75,
    H=4.82,
    Xd=2.13,
    Xq=2.03,
    Xpd=0.31,
    Xpq=0.403,
    Xppd=0.1937,
    Xppq=0.1937,
    Xl=0.14531,
    s12=0.37795,
    eterm=Vmag0,
    anglev0=Vang0,
    pelec=Psch,
    qelec=Qsch,
    Mbase=Mbase,
    Sbase=Sbase)
    annotation (Placement(transformation(extent={{-64,-20},{24,60}})));
  PowerSystems.Electrical.Controls.PSSE.TG.IEESGO iEESGO(
    T1=0.01 "controller lag (s)",
    T2=0 "controller lead compensation (s)",
    T3=0.15 "governor lag (s)",
    T4=0.3
      "delay due to steam inlet volumes associated with steam chest and inlet piping(s)",
    T5=8 "reheater delay including hot and cold leads (s)",
    T6=0.4 "delay due to IP-LP turbine, crossover pipes, and LP end hoods (s)",
    K1=0 "1/p.u regulation ",
    K2=0.7 "fraction ",
    K3=0.43 "fraction ",
    PMAX=1 "upper power limit",
    PMIN=0 "lower power limit") annotation (Placement(transformation(
        extent={{-44.5,-17.5},{44.5,17.5}},
        rotation=0,
        origin={-12.5,82.5})));

  PowerSystems.Electrical.Controls.PSSE.ES.SCRX.SCRX sCRX(
    TE=0.04 "TE (sec)",
    EMIN=0 "EMIN (pu on EFD base)",
    EMAX=5 "EMAX (pu on EFD base)",
    CSWITCH=0 "Cswitch",
    RC_rfd=0 "rc/rfd",
    TATB_ratio=0.2,
    TB=10,
    K=165,
    Ec0=Vmag0,
    Et0=Vmag0) annotation (Placement(transformation(
        extent={{-27.5,-33.5},{27.5,33.5}},
        rotation=0,
        origin={54.5,-57.5})));
  PowerSystems.Electrical.Controls.PSSE.PSS.STAB2A.STAB2A sTAB2A(
    K2=1 "fraction ",
    T2=4.5 "controller lead compensation (s)",
    K3=0 "fraction ",
    T3=2 "governor lag (s)",
    K5=1,
    T5=0.01,
    H_LIM=0.03,
    K4=0.68,
    PELEC0=Psch/Mbase)
    annotation (Placement(transformation(extent={{-79,-53},{-30,-22}})));
  Modelica.Blocks.Sources.Constant cte(k=0)
    annotation (Placement(transformation(extent={{-30,-55},{-20,-45}})));
  PowerSystems.Connectors.PwPin pwPin annotation (Placement(transformation(
          extent={{100,-10},{120,10}}), iconTransformation(extent={{100,-10},
            {120,10}})));
equation

  connect(gENROU.p, pwPin) annotation (Line(
      points={{10.8,20},{64,20},{64,0},{110,0}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(gENROU.SPEED, iEESGO.SPEED) annotation (Line(
      points={{8.16,53.6},{28,53.6},{28,94},{-48,94},{-48,85.825},{-42.76,
          85.825}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(gENROU.PMECH0, iEESGO.PMECH0) annotation (Line(
      points={{9.92,1.6},{34,1.6},{34,98},{-54,98},{-54,77.425},{-42.76,
          77.425}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(iEESGO.PMECH, gENROU.PMECH) annotation (Line(
      points={{17.76,82.5},{24,82.5},{24,68},{-64,68},{-64,44},{-50.8,44}},
      color={0,0,127},
      smooth=Smooth.None));

  connect(gENROU.ETERM, sCRX.ECOMP) annotation (Line(
      points={{9.04,37.6},{23,37.6},{23,-28.355},{27.2292,-28.355}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(sTAB2A.VOTHSG, sCRX.VOTHSG) annotation (Line(
      points={{-41.3591,-37.5},{-17.6795,-37.5},{-17.6795,-37.735},{27.2292,
          -37.735}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(gENROU.XADIFD, sCRX.XADIFD) annotation (Line(
      points={{-6.8,-22.4},{-6.8,-61.855},{26.7708,-61.855}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(sCRX.ETERM, gENROU.ETERM) annotation (Line(
      points={{26.7708,-72.91},{23,-72.91},{23,37.6},{9.04,37.6}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(gENROU.EFD0, sCRX.EFD0) annotation (Line(
      points={{9.92,-6.4},{18,-6.4},{18,-84.635},{27.2292,-84.635}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(cte.y, sCRX.VUEL) annotation (Line(
      points={{-19.5,-50},{-2,-50},{-2,-54.485},{27.2292,-54.485}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(sCRX.VOEL, cte.y) annotation (Line(
      points={{27.2292,-45.775},{-2,-45.775},{-2,-50},{-19.5,-50}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(sCRX.EFD, gENROU.EFD) annotation (Line(
      points={{82.9167,-57.165},{90,-57.165},{90,-94},{-84,-94},{-84,28},{
          -50.8,28}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(gENROU.PELEC, sTAB2A.PELEC) annotation (Line(
      points={{9.92,9.6},{44,9.6},{44,-14},{10,-14},{10,-28},{-80,-28},{-80,
          -37.5},{-68.0864,-37.5}},
      color={0,0,127},
      smooth=Smooth.None));
  annotation (Icon(graphics={Line(
          points={{-76,-26},{-28,52},{27,-52},{74,23}},
          color={0,0,255},
          smooth=Smooth.Bezier), Ellipse(extent={{-100,-100},{101,100}},
            lineColor={0,0,255})}), Diagram(coordinateSystem(
          preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
        graphics));
end Gen4_bus_3359;
