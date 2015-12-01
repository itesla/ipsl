within Nordic44.Components_subsystems;
model Gen3_bus_3115 "Configuration of synchronous generator with regulators: GENSAL, HYGOV, SCRX, STAB2A; 
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
    D=0 "Speed Damping",
    Tpd0=7.57,
    Tppd0=0.045,
    Tppq0=0.1,
    H=4.741,
    Xd=0.946,
    Xq=0.565,
    Xpd=0.29,
    Xppd=0.23,
    Xppq=0.23,
    Xl=0.11077,
    s10=0.10239,
    s12=0.2742,
    eterm=Vmag0,
    anglev0=Vang0,
    pelec=Psch,
    qelec=Qsch,
    Mbase=Mbase,
    Sbase=Sbase)
    annotation (Placement(transformation(extent={{-66,-28},{10,56}})));
  PowerSystems.Electrical.Controls.PSSE.TG.HYGOV hYGOV(
    R=0.06 "Permanent droop, p.u",
    r=0.4 "Temporary droop, p.u",
    Tr=5 "Governor time constant, s",
    Tf=0.05 "Filter time constant, s",
    Tg=0.2 "Servo time constant, s",
    Gmax=1 "Maximum gate limit, p.u",
    Gmin=0 "Minimum gate limit, p.u",
    Tw=1 "Water time constant, s",
    Dturb=0.5 "Turbine damping, p.u",
    qnl=0.1 "Water flow at no load. p.u",
    VELM=0.1,
    At=1.0577)
    annotation (Placement(transformation(extent={{-90,58},{44,96}})));
  PowerSystems.Electrical.Controls.PSSE.ES.SCRX.SCRX sCRX(
    TB=13 "TB (sec)",
    TE=0.05 "TE (sec)",
    EMIN=0 "EMIN (pu on EFD base)",
    EMAX=4 "EMAX (pu on EFD base)",
    CSWITCH=0 "Cswitch",
    RC_rfd=0 "rc/rfd",
    TATB_ratio=0.25385,
    K=31,
    Ec0=Vmag0,
    Et0=Vmag0)
    annotation (Placement(transformation(extent={{12,-84},{66,-30}})));
  Modelica.Blocks.Sources.Constant cte(k=0)
    annotation (Placement(transformation(extent={{-27,-81},{-17,-71}})));
  PowerSystems.Electrical.Controls.PSSE.PSS.STAB2A.STAB2A sTAB2A(
    K2=1 "fraction ",
    T2=4.5 "controller lead compensation (s)",
    T3=2 "governor lag (s)",
    K5=1,
    T5=0.01,
    K3=0.87,
    K4=0.087,
    H_LIM=0.04,
    PELEC0=Psch/Mbase)
    annotation (Placement(transformation(extent={{-73,-63},{-15,-31}})));
  PowerSystems.Connectors.PwPin p annotation (Placement(transformation(
          rotation=0, extent={{100,-10},{120,10}}), iconTransformation(
          extent={{100,-10},{120,10}})));
equation

  connect(gENSAL.p, p) annotation (Line(
      points={{-1.4,14.84},{66.1,14.84},{66.1,0},{110,0}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(gENSAL.SPEED, hYGOV.SPEED) annotation (Line(
      points={{-2.92,50.12},{6,50},{14,50},{14,94},{-70,94},{-70,79.47},{
          -61.9438,79.47}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(gENSAL.PMECH0, hYGOV.PMECH0) annotation (Line(
      points={{-2.92,3.92},{8,4},{18,4},{18,98},{-76,98},{-76,71.49},{
          -62.7813,71.49}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(hYGOV.PMECH, gENSAL.PMECH) annotation (Line(
      points={{3.38125,79.09},{8,79.09},{8,60},{-70,60},{-70,38.36},{-54.6,
          38.36}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(sCRX.ECOMP, gENSAL.ETERM) annotation (Line(
      points={{12.225,-33.51},{6,-33.51},{6,32.48},{-2.92,32.48}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(gENSAL.XADIFD, sCRX.XADIFD) annotation (Line(
      points={{-16.6,-30.52},{-16.6,-60.51},{11.775,-60.51}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(sCRX.ETERM, gENSAL.ETERM) annotation (Line(
      points={{11.775,-69.42},{6,-69.42},{6,32.48},{-2.92,32.48}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(gENSAL.EFD0, sCRX.EFD0) annotation (Line(
      points={{-2.92,-12.88},{2,-12.88},{2,-78.87},{12.225,-78.87}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(sCRX.VOEL, cte.y) annotation (Line(
      points={{12.225,-47.55},{-4,-47.55},{-4,-76},{-16.5,-76}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(sCRX.VUEL, cte.y) annotation (Line(
      points={{12.225,-54.57},{-4,-54.57},{-4,-76},{-16.5,-76}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(sTAB2A.VOTHSG, sCRX.VOTHSG) annotation (Line(
      points={{-28.4455,-47},{-10.6103,-47},{-10.6103,-41.07},{12.225,
          -41.07}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(gENSAL.PELEC, sTAB2A.PELEC) annotation (Line(
      points={{-2.92,-4.48},{16,-4.48},{16,-24},{-2,-24},{-2,-36},{-74,-36},
          {-74,-47},{-60.0818,-47}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(sCRX.EFD, gENSAL.EFD) annotation (Line(
      points={{66.9,-56.73},{74,-56.73},{74,-88},{-78,-88},{-78,13.16},{
          -53.84,13.16}},
      color={0,0,127},
      smooth=Smooth.None));
  annotation (Icon(graphics={Ellipse(extent={{-100,-100},{101,100}},
            lineColor={0,0,255}), Line(
          points={{-76,-26},{-28,52},{27,-52},{74,23}},
          color={0,0,255},
          smooth=Smooth.Bezier)}), Diagram(coordinateSystem(
          preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
        graphics));
end Gen3_bus_3115;
