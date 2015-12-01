within Nordic44.Components_subsystems;
model Gen3_bus_6700 "Configuration of synchronous generator with regulators: GENSAL, HYGOV, SCRX, STAB2A; 
  Nordic 44 model: Buses 3115, 5300, 6100, 6700, 7100"
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
    Tpd0=5.24 "T'do (> 0)",
    Tppd0=0.05 "T''do (> 0)",
    Tppq0=0.15 "T''qo (> 0)",
    H=3.592 "Inertia",
    D=0 "Speed Damping",
    Xd=1.1044 "d-axis reactance",
    s10=0.1,
    s12=0.3,
    Xq=0.66186,
    Xpd=0.25484,
    Xppd=0.17062,
    Xppq=0.17062,
    Xl=0.14737,
    anglev0=Vang0,
    pelec=Psch,
    qelec=Qsch,
    Mbase=Mbase,
    Sbase=Sbase,
    eterm=Vmag0)
    annotation (Placement(transformation(extent={{-62,-30},{10,46}})));
  PowerSystems.Electrical.Controls.PSSE.TG.HYGOV hYGOV(
    R=0.06 "Permanent droop, p.u",
    r=0.4 "Temporary droop, p.u",
    Tr=5 "Governor time constant, s",
    Tf=0.05 "Filter time constant, s",
    Tg=0.2 "Servo time constant, s",
    VELM=0.2 "Gate open/close velosiy limit, p.u/sec",
    Gmax=1 "Maximum gate limit, p.u",
    Gmin=0 "Minimum gate limit, p.u",
    Tw=1 "Water time constant, s",
    At=1.1 "Turbine gain, p.u",
    Dturb=0.5 "Turbine damping, p.u",
    qnl=0.1 "Water flow at no load. p.u")
    annotation (Placement(transformation(extent={{-82,58},{46,96}})));
  PowerSystems.Electrical.Controls.PSSE.ES.SCRX.SCRX sCRX(
    TB=13 "TB (sec)",
    K=61 "K",
    TE=0.05 "TE (sec)",
    EMIN=0 "EMIN (pu on EFD base)",
    EMAX=4 "EMAX (pu on EFD base)",
    CSWITCH=0 "Cswitch",
    RC_rfd=0 "rc/rfd",
    TATB_ratio=0.25385,
    Ec0=Vmag0,
    Et0=Vmag0)
    annotation (Placement(transformation(extent={{20,-88},{74,-32}})));
  Modelica.Blocks.Sources.Constant cte(k=0)
    annotation (Placement(transformation(extent={{-19,-83},{-9,-73}})));
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
    annotation (Placement(transformation(extent={{-72,-60},{-12,-36}})));
  PowerSystems.Connectors.PwPin p annotation (Placement(transformation(
          rotation=0, extent={{100,-10},{120,10}}), iconTransformation(
          extent={{100,-10},{120,10}})));
equation

  connect(gENSAL.p, p) annotation (Line(
      points={{-0.8,8.76},{77.1,8.76},{77.1,0},{110,0}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(gENSAL.SPEED, hYGOV.SPEED) annotation (Line(
      points={{-2.24,40.68},{18,40.68},{18,94},{-60,94},{-60,79.47},{-55.2,
          79.47}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(gENSAL.PMECH0, hYGOV.PMECH0) annotation (Line(
      points={{-2.24,-1.12},{22,-1.12},{22,96},{-64,96},{-64,71.49},{-56,
          71.49}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(hYGOV.PMECH, gENSAL.PMECH) annotation (Line(
      points={{7.2,79.09},{12,79.09},{12,58},{-62,58},{-62,30.04},{-51.2,
          30.04}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(gENSAL.ETERM, sCRX.ECOMP) annotation (Line(
      points={{-2.24,24.72},{11,24.72},{11,-35.64},{20.225,-35.64}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(gENSAL.XADIFD, sCRX.XADIFD) annotation (Line(
      points={{-15.2,-32.28},{-15.2,-63.64},{19.775,-63.64}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(sCRX.ETERM, gENSAL.ETERM) annotation (Line(
      points={{19.775,-72.88},{11,-72.88},{11,24.72},{-2.24,24.72}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(gENSAL.EFD0, sCRX.EFD0) annotation (Line(
      points={{-2.24,-16.32},{7,-16.32},{7,-82.68},{20.225,-82.68}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(cte.y, sCRX.VOEL) annotation (Line(
      points={{-8.5,-78},{0,-78},{0,-50.2},{20.225,-50.2}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(sCRX.VUEL, cte.y) annotation (Line(
      points={{20.225,-57.48},{0,-57.48},{0,-78},{-8.5,-78}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(sTAB2A.VOTHSG, sCRX.VOTHSG) annotation (Line(
      points={{-25.9091,-48},{-2.84205,-48},{-2.84205,-43.48},{20.225,
          -43.48}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(gENSAL.PELEC, sTAB2A.PELEC) annotation (Line(
      points={{-2.24,-8.72},{20,-8.72},{20,-28},{0,-28},{0,-38},{-68,-38},{
          -68,-48},{-58.6364,-48}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(sCRX.EFD, gENSAL.EFD) annotation (Line(
      points={{74.9,-59.72},{84,-59.72},{84,-94},{-72,-94},{-72,7.24},{
          -50.48,7.24}},
      color={0,0,127},
      smooth=Smooth.None));
  annotation (Icon(graphics={Ellipse(extent={{-100,-100},{101,100}},
            lineColor={0,0,255}), Line(
          points={{-76,-26},{-28,52},{27,-52},{74,23}},
          color={0,0,255},
          smooth=Smooth.Bezier)}), Diagram(coordinateSystem(
          preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
        graphics));
end Gen3_bus_6700;
