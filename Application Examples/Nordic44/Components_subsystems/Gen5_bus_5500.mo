within Nordic44.Components_subsystems;
model Gen5_bus_5500 "Configuration of synchronous generator with regulators: GENSAL, SEXS, HYGOV;
  Nordic 44 model: Buses 5100, 5400, 5500, 6000, 6500"
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
    Tpd0=7.198,
    H=3,
    Xd=1.2364,
    Xq=0.65567,
    Xpd=0.37415,
    Xppd=0.22825,
    Xppq=0.22825,
    Xl=0.16194,
    eterm=Vmag0,
    anglev0=Vang0,
    pelec=Psch,
    qelec=Qsch,
    Mbase=Mbase,
    Sbase=Sbase)
    annotation (Placement(transformation(extent={{-56,-38},{18,36}})));
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
    annotation (Placement(transformation(extent={{-80,39},{48,71}})));
  PowerSystems.Electrical.Controls.PSSE.ES.SEXS sEXS(
    TATB_ratio=0.05,
    TB=100,
    K=200,
    TE=0.5,
    EMIN=0,
    EMAX=4,
    Ec0=Vmag0)
    annotation (Placement(transformation(extent={{-2,-96},{94,-32}})));
  Modelica.Blocks.Sources.Constant cte(k=0)
    annotation (Placement(transformation(extent={{-13,-59},{-3,-49}})));
  PowerSystems.Connectors.PwPin p annotation (Placement(transformation(
          rotation=0, extent={{100,-10},{120,10}}), iconTransformation(
          extent={{100,-10},{120,10}})));
equation
  connect(cte.y, sEXS.VOEL) annotation (Line(
      points={{-2.5,-54},{6,-54},{6,-54.08},{19.0462,-54.08}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(cte.y, sEXS.VUEL) annotation (Line(
      points={{-2.5,-54},{6,-54},{6,-60.48},{19.0462,-60.48}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(cte.y, sEXS.VOTHSG) annotation (Line(
      points={{-2.5,-54},{6,-54},{6,-48.32},{19.0462,-48.32}},
      color={0,0,127},
      smooth=Smooth.None));

  connect(gENSAL.p, p) annotation (Line(
      points={{6.9,-0.26},{74.1,-0.26},{74.1,0},{110,0}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(gENSAL.SPEED, hYGOV.SPEED) annotation (Line(
      points={{5.42,30.82},{20,30.82},{20,74},{-60,74},{-60,57.08},{-53.2,
          57.08}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(gENSAL.PMECH0, hYGOV.PMECH0) annotation (Line(
      points={{5.42,-9.88},{28,-9.88},{28,77},{-68,77},{-68,50.36},{-54,
          50.36}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(hYGOV.PMECH, gENSAL.PMECH) annotation (Line(
      points={{9.2,56.76},{16,56.76},{16,40},{-52,40},{-52,20.46},{-44.9,
          20.46}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(gENSAL.ETERM, sEXS.ECOMP) annotation (Line(
      points={{5.42,15.28},{14,15.28},{14,-41.92},{19.0462,-41.92}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(gENSAL.EFD0, sEXS.EFD0) annotation (Line(
      points={{5.42,-24.68},{11,-24.68},{11,-73.92},{19.0462,-73.92}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(sEXS.EFD, gENSAL.EFD) annotation (Line(
      points={{65.9385,-57.6},{72,-57.6},{72,-84},{-54,-84},{-54,-1.74},{
          -44.16,-1.74}},
      color={0,0,127},
      smooth=Smooth.None));
  annotation (Icon(graphics={Ellipse(extent={{-100,-100},{101,100}},
            lineColor={0,0,255}), Line(
          points={{-76,-26},{-28,52},{27,-52},{74,23}},
          color={0,0,255},
          smooth=Smooth.Bezier)}), Diagram(coordinateSystem(
          preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
        graphics));
end Gen5_bus_5500;
