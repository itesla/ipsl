within Nordic44.Components_subsystems;
model Gen1_bus_7000 "Configuration of synchronous generator with regulators: GENROU, STAB2A, IEEET2, IEESGO;
   Nordic 44 model: Buses 3000, 7000"
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
    Xd=2.22 "d-axis reactance",
    Xq=2.13 "q-axis reactance",
    Xpd=0.36 "d-axis transient reactance",
    Xpq=0.468 "d-axis transient reactance",
    Xppd=0.225 "d-axis sub-transient reactance",
    Xppq=0.225 "q-axis sub-transient reactance",
    Xl=0.1688 "leakage reactance",
    s10=0.1089,
    s12=0.378,
    Mbase=1278,
    Tpd0=10,
    H=5.5,
    Sbase=1000,
    eterm=Vmag0,
    anglev0=Vang0,
    pelec=Psch,
    qelec=Qsch)
    annotation (Placement(transformation(extent={{-16,-42},{71,43}})));
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
        extent={{-36,-26},{36,26}},
        rotation=0,
        origin={-42,29})));

  PowerSystems.Electrical.Controls.PSSE.ES.IEEET2.IEEET2 iEEET2(
    TR=0 "Voltage input time const., s",
    TA=0.04 "AVR time const., s",
    VRMAX=5.32 "Max. AVR output, p.u",
    VRMIN=-4.05 "Min. AVR output, p.u",
    KE=1 "Exciter field gain, s",
    TE=0.44 "Exciter time const., s",
    KF=0.0667 "Rate feedback gain, p.u",
    TF1=2 "Rate feedback time const., s",
    TF2=0.44 "Rate feedback time const., s",
    E1=6.5 "Exciter sat. point 1, p.u",
    SE1=0.054 "Saturation at E1",
    E2=8 "Exciter sat. point 2, p.u",
    SE2=0.2020 "Saturation at E2",
    KA=800,
    Ec0=Vmag0)     annotation (Placement(transformation(
        extent={{-34,-28.5},{34,28.5}},
        rotation=0,
        origin={-41,-7.5})));
  PowerSystems.Electrical.Controls.PSSE.PSS.STAB2A.STAB2A sTAB2A(
    K2=1 "fraction ",
    K3=0 "fraction ",
    T3=2 "governor lag (s)",
    K4=0.55,
    K5=1,
    T5=0.01,
    H_LIM=0.03,
    T2=1,
    PELEC0=Psch/Mbase)
    annotation (Placement(transformation(extent={{-19,58},{39,103}})));

  Modelica.Blocks.Sources.Constant cte(k=0)
    annotation (Placement(transformation(extent={{-96,-9},{-86,1}})));

  PowerSystems.Connectors.PwPin pwPin annotation (Placement(transformation(
          extent={{100,-10},{120,10}}), iconTransformation(extent={{100,-10},
            {120,10}})));
equation
  connect(cte.y, iEEET2.VOEL) annotation (Line(
      points={{-85.5,-4},{-82,-4},{-82,-3.225},{-70.92,-3.225}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(cte.y, iEEET2.VUEL) annotation (Line(
      points={{-85.5,-4},{-82,-4},{-82,-9.495},{-70.92,-9.495}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(iEESGO.PMECH, gENROU.PMECH) annotation (Line(
      points={{-17.52,29},{-15,29},{-15,26},{-2.95,26}},
      color={0,0,127},
      smooth=Smooth.None));

  connect(iEEET2.EFD, gENROU.EFD) annotation (Line(
      points={{-18.22,-7.5},{-16,-7.5},{-16,9},{-2.95,9}},
      color={0,0,127},
      smooth=Smooth.None));

  connect(gENROU.EFD0, iEEET2.EFD0) annotation (Line(
      points={{57.08,-27.55},{65,-27.55},{65,-53},{-75,-53},{-75,-24.885},{
          -70.92,-24.885}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(gENROU.ETERM, iEEET2.ECOMP) annotation (Line(
      points={{56.21,19.2},{77,19.2},{77,57},{-75,57},{-75,9.315},{-70.92,
          9.315}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(gENROU.SPEED, iEESGO.SPEED) annotation (Line(
      points={{55.34,36.2},{63,36},{63,36},{70,36},{70,49},{-72,49},{-72,
          33.94},{-66.48,33.94}},
      color={0,0,127},
      smooth=Smooth.None));

  connect(gENROU.PMECH0, iEESGO.PMECH0) annotation (Line(
      points={{57.08,-19.05},{74,-19.05},{74,-57},{-79,-57},{-79,21.46},{
          -66.48,21.46}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(sTAB2A.VOTHSG, iEEET2.VOTHSG) annotation (Line(
      points={{25.5545,80.5},{47.5,80.5},{47.5,63},{-82.5,63},{-82.5,3.045},
          {-70.92,3.045}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(gENROU.PELEC, sTAB2A.PELEC) annotation (Line(
      points={{57.08,-10.55},{85,-10.55},{85,-64},{-98,-64},{-98,80.5},{
          -6.08182,80.5}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(gENROU.p, pwPin) annotation (Line(
      points={{57.95,0.5},{82.975,0.5},{82.975,0},{110,0}},
      color={0,0,255},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(
        extent={{-100,-100},{100,100}},
        preserveAspectRatio=false,
        initialScale=0.1,
        grid={1,1}), graphics), Icon(coordinateSystem(
        extent={{-100,-100},{100,100}},
        preserveAspectRatio=false,
        initialScale=0.1,
        grid={1,1}), graphics={Line(
          points={{-76,-26},{-28,52},{27,-52},{74,23}},
          color={0,0,255},
          smooth=Smooth.Bezier), Ellipse(extent={{-100,-100},{101,100}},
            lineColor={0,0,255})}));
end Gen1_bus_7000;
