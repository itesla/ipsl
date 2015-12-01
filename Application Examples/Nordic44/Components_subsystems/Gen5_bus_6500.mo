within Nordic44.Components_subsystems;
model Gen5_bus_6500 "Configuration of synchronous generator with regulators: GENSAL, SEXS, HYGOV;
  Nordic 44 model: Buses 5100, 5400, 5500, 6000, 6500"
  parameter Real Psch "Active power MW";
  parameter Real Qsch "Rective power MVAr";
  parameter Real Vmag0 "Voltage magnitude";
  parameter Real Vang0 "Voltage angle in degrees";
  parameter Real Sbase=Systembase "Systembase, inherited";
  parameter Real Mbase=Sbase "Machinebase";
  outer parameter Real Systembase;

public
  PowerSystems.Electrical.Machines.PSSE.GENSAL.GENSAL gENSAL(
    wbase=2*gENSAL.pi*50 "system base speed",
    Ra=0,
    Tppd0=0.05 "T''do (> 0)",
    Tppq0=0.15 "T''qo (> 0)",
    D=0 "Speed Damping",
    s10=0.1,
    s12=0.3,
    Tpd0=5.4855,
    H=3.558,
    Xd=1.0679,
    Xq=0.642,
    Xpd=0.23865,
    Xppd=0.15802,
    Xppq=0.15802,
    Xl=0.13514,
    eterm=Vmag0,
    anglev0=Vang0,
    pelec=Psch,
    qelec=Qsch,
    Mbase=Mbase,
    Sbase=Sbase)
    annotation (Placement(transformation(extent={{-64,-34},{20,46}})));
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
    annotation (Placement(transformation(extent={{-82,48},{52,94}})));
  PowerSystems.Electrical.Controls.PSSE.ES.SEXS sEXS(
    TATB_ratio=0.05,
    TB=100,
    K=200,
    TE=0.5,
    EMIN=0,
    EMAX=4,
    Ec0=Vmag0)
    annotation (Placement(transformation(extent={{2,-108},{98,-26}})));
  Modelica.Blocks.Sources.Constant cte(k=0)
    annotation (Placement(transformation(extent={{-12,-59},{-2,-49}})));
  PowerSystems.Connectors.PwPin p annotation (Placement(transformation(
          rotation=0, extent={{100,-10},{120,10}}), iconTransformation(
          extent={{100,-10},{120,10}})));
equation
  connect(cte.y, sEXS.VOEL) annotation (Line(
      points={{-1.5,-54},{8,-54},{8,-54.29},{23.0462,-54.29}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(cte.y, sEXS.VUEL) annotation (Line(
      points={{-1.5,-54},{8,-54},{8,-62.49},{23.0462,-62.49}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(cte.y, sEXS.VOTHSG) annotation (Line(
      points={{-1.5,-54},{8,-54},{8,-46.91},{23.0462,-46.91}},
      color={0,0,127},
      smooth=Smooth.None));

  connect(gENSAL.p, p) annotation (Line(
      points={{7.4,6.8},{76.1,6.8},{76.1,0},{110,0}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(gENSAL.SPEED, hYGOV.SPEED) annotation (Line(
      points={{5.72,40.4},{20,40.4},{20,92},{-60,92},{-60,73.99},{-53.9438,
          73.99}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(gENSAL.PMECH0, hYGOV.PMECH0) annotation (Line(
      points={{5.72,-3.6},{26,-3.6},{26,96},{-64,96},{-64,64.33},{-54.7813,
          64.33}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(hYGOV.PMECH, gENSAL.PMECH) annotation (Line(
      points={{11.3813,73.53},{16,73.53},{16,52},{-62,52},{-62,29.2},{-51.4,
          29.2}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(gENSAL.ETERM, sEXS.ECOMP) annotation (Line(
      points={{5.72,23.6},{17,23.6},{17,-38.71},{23.0462,-38.71}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(gENSAL.EFD0, sEXS.EFD0) annotation (Line(
      points={{5.72,-19.6},{12,-19.6},{12,-79.71},{23.0462,-79.71}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(sEXS.EFD, gENSAL.EFD) annotation (Line(
      points={{69.9385,-58.8},{76,-58.8},{76,-86},{-60,-86},{-60,5.2},{
          -50.56,5.2}},
      color={0,0,127},
      smooth=Smooth.None));
  annotation (Icon(graphics={Ellipse(extent={{-100,-100},{101,100}},
            lineColor={0,0,255}), Line(
          points={{-76,-26},{-28,52},{27,-52},{74,23}},
          color={0,0,255},
          smooth=Smooth.Bezier)}), Diagram(coordinateSystem(
          preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
        graphics));
end Gen5_bus_6500;
