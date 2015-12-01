within Nordic44.Components_subsystems;
model Gen1_bus_3000 "Configuration of synchronous generator with regulators: GENROU, STAB2A, IEEET2, IEESGO;
  Nordic 44 model: Buses 3000, 7000"
  extends iPSL.Electrical.Essentials.pfComponent;
  parameter Real Psch "Active power MW";
  parameter Real Qsch "Rective power MVAr";
  parameter Real Vmag0 "Voltage magnitude";
  parameter Real Vang0 "Voltage angle in degrees";
  parameter Real Sbase=Systembase "Systembase, inherited";
  parameter Real Mbase=Sbase "Machinebase";
  outer parameter Real Systembase;
  iPSL.Electrical.Machines.PSSE.GENROU.GENROU gENROU(
    Ra=0 "amature resistance",
    Tpd0=5 "d-axis transient open-circuit time constant s",
    Tppd0=0.05 "d-axis sub-transient open-circuit time constant s",
    Tpq0=1 "q-axis transient open-circuit time constant s",
    Tppq0=0.05 "q-axis transient open-circuit time constant s",
    H=5.97 "inertia constant s",
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
    wbase=2*gENROU.pi*50,
    eterm=Vmag0,
    anglev0=Vang0,
    pelec=Psch,
    qelec=Qsch,
    Mbase=Mbase,
    Sbase=Sbase)
    annotation (Placement(transformation(extent={{2,-42},{89,43}})));
  iPSL.Electrical.Controls.PSSE.TG.IEESGO iEESGO(
    T_1=0.01 "controller lag (s)",
    T_2=0 "controller lead compensation (s)",
    T_3=0.15 "governor lag (s)",
    T_4=0.3
      "delay due to steam inlet volumes associated with steam chest and inlet piping(s)",
    T_5=8 "reheater delay including hot and cold leads (s)",
    T_6=0.4 "delay due to IP-LP turbine, crossover pipes, and LP end hoods (s)",
    K_1=0 "1/p.u regulation ",
    K_2=0.7 "fraction ",
    K_3=0.43 "fraction ",
    P_MAX=1 "upper power limit",
    P_MIN=0 "lower power limit") annotation (Placement(transformation(
        extent={{-23,-14},{23,14}},
        rotation=0,
        origin={-44,32})));

  iPSL.Electrical.Controls.PSSE.ES.IEEET2.IEEET2 iEEET2(
    T_R=0 "Voltage input time const., s",
    K_A=729 "AVR gain, p.u",
    T_A=0.04 "AVR time const., s",
    V_RMAX=5.32 "Max. AVR output, p.u",
    V_RMIN=-4.05 "Min. AVR output, p.u",
    K_E=1 "Exciter field gain, s",
    T_E=0.44 "Exciter time const., s",
    K_F=0.0667 "Rate feedback gain, p.u",
    T_F1=2 "Rate feedback time const., s",
    T_F2=0.44 "Rate feedback time const., s",
    E_1=6.5 "Exciter sat. point 1, p.u",
    S_EE_1=0.054 "Saturation at E1",
    E_2=8 "Exciter sat. point 2, p.u",
    S_EE_2=0.2020 "Saturation at E2",
    V_0=Vmag0) annotation (Placement(transformation(
        extent={{-31,-17.5},{31,17.5}},
        rotation=0,
        origin={-39,-20.5})));
  iPSL.Electrical.Controls.PSSE.PSS.STAB2A.STAB2A sTAB2A(
    K_2=1 "fraction ",
    T_2=2 "controller lead compensation (s)",
    K_3=0 "fraction ",
    T_3=2 "governor lag (s)",
    K_4=0.55,
    K_5=1,
    T_5=0.01,
    H_LIM=0.03) annotation (Placement(transformation(extent={{-43,64},{8,92}})));

  Modelica.Blocks.Sources.Constant cte(k=0) annotation (Placement(
        transformation(extent={{-97.5,-8},{-87.5,2}})));
  iPSL.Connectors.PwPin pwPin
    annotation (Placement(transformation(extent={{100,-10},{120,10}})));

equation
  connect(cte.y, iEEET2.VOEL) annotation (Line(
      points={{-87,-3},{-84.5,-3},{-84.5,-20.5},{-68.9667,-20.5}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(cte.y, iEEET2.VUEL) annotation (Line(
      points={{-87,-3},{-84.5,-3},{-84.5,-27.5},{-68.9667,-27.5}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(iEESGO.PMECH, gENROU.PMECH) annotation (Line(
      points={{-17.1667,32},{-10,32},{-10,21.75},{2.87,21.75}},
      color={0,0,127},
      smooth=Smooth.None));

  connect(iEEET2.EFD, gENROU.EFD) annotation (Line(
      points={{-5.675,-20.5},{-5,-20.5},{-5,-21},{-1,-21},{-1,-20.75},{2.87,-20.75}},
      color={0,0,127},
      smooth=Smooth.None));

  connect(gENROU.EFD0, iEEET2.EFD0) annotation (Line(
      points={{92.48,-29.25},{64,-29.25},{64,-53},{-76,-53},{-76,-34.5},{
          -68.9667,-34.5}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(gENROU.ETERM, iEEET2.ECOMP) annotation (Line(
      points={{92.48,21.75},{76,21.75},{76,57},{-76,57},{-76,-6.5},{-68.9667,
          -6.5}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(gENROU.SPEED, iEESGO.SPEED) annotation (Line(
      points={{92.48,38.75},{66,38.75},{66,49},{-73,49},{-73,39},{-66.2333,39}},
      color={0,0,127},
      smooth=Smooth.None));

  connect(gENROU.PMECH0, iEESGO.PMECH0) annotation (Line(
      points={{92.48,-12.25},{73,-12.25},{73,-57},{-80,-57},{-80,25},{-66.2333,
          25}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(sTAB2A.VOTHSG, iEEET2.VOTHSG) annotation (Line(
      points={{10.3182,78},{31,78},{31,60},{-84,60},{-84,-13.5},{-68.9667,-13.5}},
      color={0,0,127},
      smooth=Smooth.None));

  connect(gENROU.PELEC, sTAB2A.PELEC) annotation (Line(
      points={{92.48,-20.75},{81,-20.75},{81,-62},{-99,-62},{-99,78},{-42.3045,
          78}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(gENROU.p, pwPin) annotation (Line(points={{93.35,0.5},{99.175,0.5},{99.175,
          0},{110,0}}, color={0,0,255}));
  annotation (Diagram(coordinateSystem(
        extent={{-100,-100},{100,100}},
        preserveAspectRatio=false,
        initialScale=0.1,
        grid={1,1})),           Icon(coordinateSystem(
        extent={{-100,-100},{100,100}},
        preserveAspectRatio=false,
        initialScale=0.1,
        grid={1,1}), graphics={Line(
          points={{-76,-26},{-28,52},{27,-52},{74,23}},
          color={0,0,255},
          smooth=Smooth.Bezier), Ellipse(extent={{-100,-100},{101,100}},
            lineColor={0,0,255})}));
end Gen1_bus_3000;
