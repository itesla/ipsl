within Nordic44.Components_subsystems;
model Gen3_bus_6100 "Configuration of synchronous generator with regulators: GENSAL, HYGOV, SCRX, STAB2A; 
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
    Tppd0=0.05 "T''do (> 0)",
    Tppq0=0.15 "T''qo (> 0)",
    D=0 "Speed Damping",
    s10=0.1,
    s12=0.3,
    Tpd0=9.9,
    H=3,
    Xd=1.2,
    Xq=0.73,
    Xpd=0.37,
    Xppd=0.18,
    Xppq=0.18,
    Xl=0.15,
    eterm=Vmag0,
    anglev0=Vang0,
    pelec=Psch,
    qelec=Qsch,
    Mbase=Mbase,
    Sbase=Sbase)
    annotation (Placement(transformation(extent={{-76,-26},{6,52}})));
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
    annotation (Placement(transformation(extent={{-90,60},{42,94}})));
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
    annotation (Placement(transformation(extent={{12,-88},{66,-32}})));
  Modelica.Blocks.Sources.Constant cte(k=0)
    annotation (Placement(transformation(extent={{-21,-83},{-11,-73}})));
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
    annotation (Placement(transformation(extent={{-76,-62},{-22,-28}})));
  PowerSystems.Connectors.PwPin p annotation (Placement(transformation(
          rotation=0, extent={{100,-10},{120,10}}), iconTransformation(
          extent={{100,-10},{120,10}})));
equation

  connect(gENSAL.p, p) annotation (Line(
      points={{-6.3,13.78},{74.1,13.78},{74.1,0},{110,0}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(gENSAL.SPEED, hYGOV.SPEED) annotation (Line(
      points={{-7.94,46.54},{14,46.54},{14,92},{-70,92},{-70,79.21},{
          -62.3625,79.21}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(gENSAL.PMECH0, hYGOV.PMECH0) annotation (Line(
      points={{-7.94,3.64},{6,4},{18,4},{18,94},{-74,94},{-74,72.07},{
          -63.1875,72.07}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(hYGOV.PMECH, gENSAL.PMECH) annotation (Line(
      points={{1.9875,78.87},{8,78.87},{8,58},{-72,58},{-72,35.62},{-63.7,
          35.62}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(gENSAL.ETERM, sCRX.ECOMP) annotation (Line(
      points={{-7.94,30.16},{4,30.16},{4,-35.64},{12.225,-35.64}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(gENSAL.XADIFD, sCRX.XADIFD) annotation (Line(
      points={{-22.7,-28.34},{-22.7,-63.64},{11.775,-63.64}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(sCRX.ETERM, gENSAL.ETERM) annotation (Line(
      points={{11.775,-72.88},{4,-72.88},{4,30.16},{-7.94,30.16}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(gENSAL.EFD0, sCRX.EFD0) annotation (Line(
      points={{-7.94,-11.96},{0,-11.96},{0,-82.68},{12.225,-82.68}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(cte.y, sCRX.VOEL) annotation (Line(
      points={{-10.5,-78},{-4,-78},{-4,-50.2},{12.225,-50.2}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(sCRX.VUEL, cte.y) annotation (Line(
      points={{12.225,-57.48},{-4,-57.48},{-4,-78},{-10.5,-78}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(sTAB2A.VOTHSG, sCRX.VOTHSG) annotation (Line(
      points={{-34.5182,-45},{-11.2591,-45},{-11.2591,-43.48},{12.225,
          -43.48}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(gENSAL.PELEC, sTAB2A.PELEC) annotation (Line(
      points={{-7.94,-4.16},{14,-4.16},{14,-26},{-6,-26},{-6,-36},{-74,-36},
          {-74,-45},{-63.9727,-45}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(sCRX.EFD, gENSAL.EFD) annotation (Line(
      points={{66.9,-59.72},{74,-59.72},{74,-92},{-78,-92},{-78,12.22},{
          -62.88,12.22}},
      color={0,0,127},
      smooth=Smooth.None));
  annotation (Icon(graphics={Ellipse(extent={{-100,-100},{101,100}},
            lineColor={0,0,255}), Line(
          points={{-76,-26},{-28,52},{27,-52},{74,23}},
          color={0,0,255},
          smooth=Smooth.Bezier)}), Diagram(coordinateSystem(
          preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
        graphics));
end Gen3_bus_6100;
