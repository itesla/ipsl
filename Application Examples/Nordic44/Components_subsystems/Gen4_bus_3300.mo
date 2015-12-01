within Nordic44.Components_subsystems;
model Gen4_bus_3300 "Configuration of synchronous generator with regulators: GENROU, STAB2A, IEEET2, IEESGO;
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
    Tpd0=10.8 "d-axis transient open-circuit time constant s",
    Tppd0=0.05 "d-axis sub-transient open-circuit time constant s",
    Tpq0=1 "q-axis transient open-circuit time constant s",
    Tppq0=0.05 "q-axis transient open-circuit time constant s",
    H=6 "inertia constant s",
    D=0 "Damping",
    Xd=2.42 "d-axis reactance",
    Xq=2 "q-axis reactance",
    Xpd=0.23 "d-axis transient reactance",
    Xpq=0.4108 "d-axis transient reactance",
    Xppd=0.16 "d-axis sub-transient reactance",
    Xppq=0.16 "q-axis sub-transient reactance",
    Xl=0.1481 "leakage reactance",
    s10=0.1089,
    s12=0.378,
    eterm=Vmag0,
    anglev0=Vang0,
    pelec=Psch,
    qelec=Qsch,
    Mbase=Mbase,
    Sbase=Sbase)
    annotation (Placement(transformation(extent={{-76,-28},{18,64}})));
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
        extent={{-45,-21},{45,21}},
        rotation=0,
        origin={-31,79})));

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
        extent={{-27,-29},{27,29}},
        rotation=0,
        origin={51,-67})));
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
    annotation (Placement(transformation(extent={{-101,-69},{-42,-28}})));
  Modelica.Blocks.Sources.Constant cte(k=0)
    annotation (Placement(transformation(extent={{-46,-70},{-35,-59}})));
  PowerSystems.Connectors.PwPin pwPin annotation (Placement(transformation(
          extent={{100,-10},{120,10}}), iconTransformation(extent={{100,-10},
            {120,10}})));
equation

  connect(gENROU.p, pwPin) annotation (Line(
      points={{3.9,18},{66,18},{66,0},{110,0}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(gENROU.SPEED, iEESGO.SPEED) annotation (Line(
      points={{1.08,56.64},{18,56.64},{18,90},{-68,90},{-68,82.99},{-61.6,
          82.99}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(gENROU.PMECH0, iEESGO.PMECH0) annotation (Line(
      points={{2.96,-3.16},{22,-3.16},{22,94},{-72,94},{-72,72.91},{-61.6,
          72.91}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(iEESGO.PMECH, gENROU.PMECH) annotation (Line(
      points={{-0.4,79},{8,79},{8,68},{-74,68},{-74,45.6},{-61.9,45.6}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(gENROU.ETERM, sCRX.ECOMP) annotation (Line(
      points={{2.02,38.24},{16,38.24},{16,-41.77},{24.225,-41.77}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(sTAB2A.VOTHSG, sCRX.VOTHSG) annotation (Line(
      points={{-55.6773,-48.5},{-18.6795,-48.5},{-18.6795,-49.89},{24.225,
          -49.89}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(sCRX.XADIFD, gENROU.XADIFD) annotation (Line(
      points={{23.775,-70.77},{-14.9,-70.77},{-14.9,-30.76}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(sCRX.ETERM, gENROU.ETERM) annotation (Line(
      points={{23.775,-80.34},{16,-80.34},{16,38.24},{2.02,38.24}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(gENROU.EFD0, sCRX.EFD0) annotation (Line(
      points={{2.96,-12.36},{10,-12.36},{10,-90.49},{24.225,-90.49}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(sCRX.EFD, gENROU.EFD) annotation (Line(
      points={{78.9,-66.71},{86,-66.71},{86,-98},{-98,-98},{-98,27.2},{
          -61.9,27.2}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(cte.y, sCRX.VUEL) annotation (Line(
      points={{-34.45,-64.5},{-5.1375,-64.5},{-5.1375,-64.39},{24.225,
          -64.39}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(sCRX.VOEL, cte.y) annotation (Line(
      points={{24.225,-56.85},{-30,-56.85},{-30,-64.5},{-34.45,-64.5}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(gENROU.PELEC, sTAB2A.PELEC) annotation (Line(
      points={{2.96,6.04},{26,6.04},{26,-26},{6,-26},{6,-36},{-94,-36},{-94,
          -48.5},{-87.8591,-48.5}},
      color={0,0,127},
      smooth=Smooth.None));
  annotation (Icon(graphics={Line(
          points={{-76,-26},{-28,52},{27,-52},{74,23}},
          color={0,0,255},
          smooth=Smooth.Bezier), Ellipse(extent={{-100,-100},{101,100}},
            lineColor={0,0,255})}), Diagram(coordinateSystem(
          preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
        graphics));
end Gen4_bus_3300;
