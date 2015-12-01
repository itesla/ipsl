within Nordic44.Components_subsystems;
model Gen3_bus_7100 "Configuration of synchronous generator with regulators: GENSAL, HYGOV, SCRX, STAB2A; 
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
    Tpd0=5,
    Tppd0=0.06,
    Tppq0=0.1,
    H=3.2,
    Xd=0.75,
    Xq=0.5,
    Xpd=0.25,
    Xppd=0.15385,
    Xppq=0.15385,
    Xl=0.11538,
    s10=0.10239,
    s12=0.2742,
    eterm=Vmag0,
    anglev0=Vang0,
    pelec=Psch,
    qelec=Qsch,
    Mbase=Mbase,
    Sbase=Sbase)
    annotation (Placement(transformation(extent={{-66,-24},{16,52}})));
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
    At=1.01)
    annotation (Placement(transformation(extent={{-84,60},{46,94}})));
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
    annotation (Placement(transformation(extent={{20,-84},{76,-30}})));
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
    annotation (Placement(transformation(extent={{-72,-58},{-16,-30}})));
  PowerSystems.Connectors.PwPin p annotation (Placement(transformation(
          rotation=0, extent={{100,-10},{120,10}}), iconTransformation(
          extent={{100,-10},{120,10}})));
equation

  connect(gENSAL.p, p) annotation (Line(
      points={{3.7,14.76},{69.1,14.76},{69.1,0},{110,0}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(gENSAL.SPEED, hYGOV.SPEED) annotation (Line(
      points={{2.06,46.68},{10,47},{16,47},{16,93},{-62,93},{-62,79.21},{
          -56.7813,79.21}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(gENSAL.PMECH0, hYGOV.PMECH0) annotation (Line(
      points={{2.06,4.88},{12,4},{22,4},{22,96},{-66,96},{-66,72.07},{
          -57.5938,72.07}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(hYGOV.PMECH, gENSAL.PMECH) annotation (Line(
      points={{6.59375,78.87},{12,78.87},{12,58},{-66,58},{-66,36.04},{
          -53.7,36.04}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(sCRX.ECOMP, gENSAL.ETERM) annotation (Line(
      points={{20.2333,-33.51},{16,-33.51},{16,30.72},{2.06,30.72}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(gENSAL.XADIFD, sCRX.XADIFD) annotation (Line(
      points={{-12.7,-26.28},{-12.7,-60.51},{19.7667,-60.51}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(sCRX.ETERM, gENSAL.ETERM) annotation (Line(
      points={{19.7667,-69.42},{16,-69.42},{16,30.72},{2.06,30.72}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(gENSAL.EFD0, sCRX.EFD0) annotation (Line(
      points={{2.06,-10.32},{12,-10.32},{12,-78.87},{20.2333,-78.87}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(sCRX.VUEL, cte.y) annotation (Line(
      points={{20.2333,-54.57},{6,-54.57},{6,-76},{-10.5,-76}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(sCRX.VOEL, cte.y) annotation (Line(
      points={{20.2333,-47.55},{6,-47.55},{6,-76},{-10.5,-76}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(sTAB2A.VOTHSG, sCRX.VOTHSG) annotation (Line(
      points={{-28.9818,-44},{-4,-44},{-4,-41.07},{20.2333,-41.07}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(gENSAL.PELEC, sTAB2A.PELEC) annotation (Line(
      points={{2.06,-2.72},{24,-2.72},{24,-24},{6,-24},{6,-34},{-70,-34},{
          -70,-44},{-59.5273,-44}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(sCRX.EFD, gENSAL.EFD) annotation (Line(
      points={{76.9333,-56.73},{84,-56.73},{84,-90},{-76,-90},{-76,13.24},{
          -52.88,13.24}},
      color={0,0,127},
      smooth=Smooth.None));
  annotation (Icon(graphics={Ellipse(extent={{-100,-100},{101,100}},
            lineColor={0,0,255}), Line(
          points={{-76,-26},{-28,52},{27,-52},{74,23}},
          color={0,0,255},
          smooth=Smooth.Bezier)}), Diagram(coordinateSystem(
          preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
        graphics));
end Gen3_bus_7100;
