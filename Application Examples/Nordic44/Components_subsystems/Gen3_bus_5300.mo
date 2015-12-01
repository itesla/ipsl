within Nordic44.Components_subsystems;
model Gen3_bus_5300 "Configuration of synchronous generator with regulators: GENSAL, HYGOV, SCRX, STAB2A; 
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
    Tpd0=6.4,
    H=3.5,
    Xd=1.14,
    Xq=0.84,
    Xpd=0.34,
    Xppd=0.26,
    Xppq=0.26,
    Xl=0.2,
    eterm=Vmag0,
    anglev0=Vang0,
    pelec=Psch,
    qelec=Qsch,
    Mbase=Mbase,
    Sbase=Sbase)
    annotation (Placement(transformation(extent={{-66,-22},{12,56}})));
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
    annotation (Placement(transformation(extent={{-88,62},{46,96}})));
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
    annotation (Placement(transformation(extent={{12,-82},{66,-34}})));
  Modelica.Blocks.Sources.Constant cte(k=0)
    annotation (Placement(transformation(extent={{-21,-81},{-11,-71}})));
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
    annotation (Placement(transformation(extent={{-76,-58},{-18,-30}})));
  PowerSystems.Connectors.PwPin p annotation (Placement(transformation(
          rotation=0, extent={{100,-10},{120,10}}), iconTransformation(
          extent={{100,-10},{120,10}})));
equation

  connect(gENSAL.p, p) annotation (Line(
      points={{0.3,17.78},{78.1,17.78},{78.1,0},{110,0}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(gENSAL.SPEED, hYGOV.SPEED) annotation (Line(
      points={{-1.26,50.54},{20,50.54},{20,94},{-68,94},{-68,81.21},{
          -59.9438,81.21}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(gENSAL.PMECH0, hYGOV.PMECH0) annotation (Line(
      points={{-1.26,7.64},{26,7.64},{26,98},{-74,98},{-74,74.07},{-60.7813,
          74.07}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(hYGOV.PMECH, gENSAL.PMECH) annotation (Line(
      points={{5.38125,80.87},{12,80.87},{12,62},{-66,62},{-66,39.62},{
          -54.3,39.62}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(sCRX.ECOMP, gENSAL.ETERM) annotation (Line(
      points={{12.225,-37.12},{8,-37.12},{8,34.16},{-1.26,34.16}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(gENSAL.XADIFD, sCRX.XADIFD) annotation (Line(
      points={{-15.3,-24.34},{-15.3,-61.12},{11.775,-61.12}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(sCRX.ETERM, gENSAL.ETERM) annotation (Line(
      points={{11.775,-69.04},{8,-69.04},{8,34.16},{-1.26,34.16}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(gENSAL.EFD0, sCRX.EFD0) annotation (Line(
      points={{-1.26,-7.96},{4,-7.96},{4,-77.44},{12.225,-77.44}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(cte.y, sCRX.VOEL) annotation (Line(
      points={{-10.5,-76},{-2,-76},{-2,-49.6},{12.225,-49.6}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(sCRX.VUEL, cte.y) annotation (Line(
      points={{12.225,-55.84},{-2,-55.84},{-2,-76},{-10.5,-76}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(sTAB2A.VOTHSG, sCRX.VOTHSG) annotation (Line(
      points={{-31.4455,-44},{-9.61025,-44},{-9.61025,-43.84},{12.225,
          -43.84}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(gENSAL.PELEC, sTAB2A.PELEC) annotation (Line(
      points={{-1.26,-0.16},{26,-0.16},{26,-28},{-2,-28},{-2,-34},{-72,-34},
          {-72,-44},{-63.0818,-44}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(sCRX.EFD, gENSAL.EFD) annotation (Line(
      points={{66.9,-57.76},{76,-57.76},{76,-88},{-78,-88},{-78,16.22},{
          -53.52,16.22}},
      color={0,0,127},
      smooth=Smooth.None));
  annotation (Icon(graphics={Ellipse(extent={{-100,-100},{101,100}},
            lineColor={0,0,255}), Line(
          points={{-76,-26},{-28,52},{27,-52},{74,23}},
          color={0,0,255},
          smooth=Smooth.Bezier)}), Diagram(coordinateSystem(
          preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
        graphics));
end Gen3_bus_5300;
