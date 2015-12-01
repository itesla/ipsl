within Nordic44.Components_subsystems;
model Gen4_bus_8500 "Configuration of synchronous generator with regulators: GENROU, STAB2A, IEEET2, IEESGO;
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
    Xd=2.42 "d-axis reactance",
    Xq=2 "q-axis reactance",
    Xpd=0.23 "d-axis transient reactance",
    Xpq=0.4108 "d-axis transient reactance",
    s10=0.1089,
    Tpd0=10,
    H=7,
    Xppd=0.17062,
    Xppq=0.17062,
    Xl=0.14812,
    s12=0.37795,
    eterm=Vmag0,
    anglev0=Vang0,
    pelec=Psch,
    qelec=Qsch,
    Mbase=Mbase,
    Sbase=Sbase)
    annotation (Placement(transformation(extent={{-62,-22},{22,64}})));
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
        extent={{-44.5,-18.5},{44.5,18.5}},
        rotation=0,
        origin={-16.5,83.5})));

  PowerSystems.Electrical.Controls.PSSE.ES.SCRX.SCRX sCRX(
    TATB_ratio=0 "TA/TB",
    TB=0.04 "TB (sec)",
    K=10 "K",
    TE=0.04 "TE (sec)",
    EMIN=0 "EMIN (pu on EFD base)",
    EMAX=5 "EMAX (pu on EFD base)",
    CSWITCH=0 "Cswitch",
    RC_rfd=0 "rc/rfd",
    Ec0=Vmag0,
    Et0=Vmag0) annotation (Placement(transformation(
        extent={{-27.5,-30.5},{27.5,30.5}},
        rotation=0,
        origin={60.5,-56.5})));
  PowerSystems.Electrical.Controls.PSSE.PSS.STAB2A.STAB2A sTAB2A(
    K2=1 "fraction ",
    T2=4.5 "controller lead compensation (s)",
    K3=0 "fraction ",
    T3=2 "governor lag (s)",
    K4=0.55,
    K5=1,
    T5=0.01,
    H_LIM=0.03,
    PELEC0=Psch/Mbase)
    annotation (Placement(transformation(extent={{-60,-59},{-6,-29}})));
  Modelica.Blocks.Sources.Constant cte(k=0)
    annotation (Placement(transformation(extent={{-21,-79},{-11,-69}})));
  PowerSystems.Connectors.PwPin pwPin annotation (Placement(transformation(
          extent={{100,-10},{120,10}}), iconTransformation(extent={{100,-10},
            {120,10}})));
equation

  connect(gENROU.p, pwPin) annotation (Line(
      points={{9.4,21},{62,21},{62,0},{110,0}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(gENROU.SPEED, iEESGO.SPEED) annotation (Line(
      points={{6.88,57.12},{26,57.12},{26,94},{-52,94},{-52,87.015},{-46.76,
          87.015}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(gENROU.PMECH0, iEESGO.PMECH0) annotation (Line(
      points={{8.56,1.22},{32,1.22},{32,98},{-56,98},{-56,78.135},{-46.76,
          78.135}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(iEESGO.PMECH, gENROU.PMECH) annotation (Line(
      points={{13.76,83.5},{22,83.5},{22,68},{-64,68},{-64,46.8},{-49.4,
          46.8}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(gENROU.ETERM, sCRX.ECOMP) annotation (Line(
      points={{7.72,39.92},{26,39.92},{26,-29.965},{33.2292,-29.965}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(gENROU.XADIFD, sCRX.XADIFD) annotation (Line(
      points={{-7.4,-24.58},{-7.4,-60.465},{32.7708,-60.465}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(sCRX.ETERM, gENROU.ETERM) annotation (Line(
      points={{32.7708,-70.53},{26,-70.53},{26,39.92},{7.72,39.92}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(gENROU.EFD0, sCRX.EFD0) annotation (Line(
      points={{8.56,-7.38},{22,-7.38},{22,-81.205},{33.2292,-81.205}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(sTAB2A.VOTHSG, sCRX.VOTHSG) annotation (Line(
      points={{-18.5182,-44},{0.123683,-44},{0.123683,-38.505},{33.2292,
          -38.505}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(gENROU.PELEC, sTAB2A.PELEC) annotation (Line(
      points={{8.56,9.82},{16,9.82},{16,-32},{-58,-32},{-58,-44},{-47.9727,
          -44}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(sCRX.VOEL, cte.y) annotation (Line(
      points={{33.2292,-45.825},{14,-45.825},{14,-74},{-10.5,-74}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(sCRX.VUEL, cte.y) annotation (Line(
      points={{33.2292,-53.755},{14,-53.755},{14,-74},{-10.5,-74}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(sCRX.EFD, gENROU.EFD) annotation (Line(
      points={{88.9167,-56.195},{94,-56.195},{94,-94},{-64,-94},{-64,29.6},
          {-49.4,29.6}},
      color={0,0,127},
      smooth=Smooth.None));
  annotation (Icon(graphics={Line(
          points={{-76,-26},{-28,52},{27,-52},{74,23}},
          color={0,0,255},
          smooth=Smooth.Bezier), Ellipse(extent={{-100,-100},{101,100}},
            lineColor={0,0,255})}), Diagram(coordinateSystem(
          preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
        graphics));
end Gen4_bus_8500;
