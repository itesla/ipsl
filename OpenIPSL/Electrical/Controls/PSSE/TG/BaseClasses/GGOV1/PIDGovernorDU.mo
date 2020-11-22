within OpenIPSL.Electrical.Controls.PSSE.TG.BaseClasses.GGOV1;
model PIDGovernorDU "GE GGOV General Governor Frequency Controller"
  parameter Integer Rselect=1 "Feedback signal for governor droop" annotation (Evaluate=true, choices(
      choice=1 "Electrical power",
      choice=0 "None (isochronous governor)",
      choice=-1 "Governor output (requested stroke)",
      choice=-2 "Fuel valve stroke (true stoke)"));
  parameter Types.PerUnit R=0.04 "Permanent droop";
  parameter Types.Time T_pelec=1 "Electrical power transducer time constant";
  parameter Types.PerUnit maxerr=0.05 "Maximum value for speed error signal";
  parameter Types.PerUnit minerr=-0.05 "Minimum value for speed error signal";
  parameter Types.PerUnit Kpgov=10 "Governor proportional gain";
  parameter Types.TimeAging Kigov=2 "Governor integral gain";
  parameter Types.Time Kdgov=0 "Governor derivative gain";
  parameter Types.Time Tdgov=1 "Governor derivative controller time constant";
  parameter Types.PerUnit Kturb=1.5 "Turbine gain";
  parameter Types.PerUnit Wfnl=0.2 "No load fuel flow";
  parameter Types.TimeAging Kimw=0 "Power controller (reset) gain";
  parameter Types.PerUnit db=0 "Speed governor deadband";
  parameter Types.PerUnit Dm=0 "Mechanical damping coefficient";
  Modelica.Blocks.Math.Gain KPGOV(k=Kpgov) annotation (Placement(transformation(extent={{60,16},{76,32}})));
  Modelica.Blocks.Continuous.Integrator s2(
    k=1,
    initType=Modelica.Blocks.Types.Init.InitialOutput,
    y_start=s20) annotation (Placement(transformation(
        extent={{-7,-7},{7,7}},
        rotation=180,
        origin={83,-29})));
  Modelica.Blocks.Continuous.Derivative s1(
    k=Kdgov,
    T=Tdgov,
    y_start=0,
    initType=Modelica.Blocks.Types.Init.InitialOutput) annotation (Placement(transformation(extent={{58,58},{78,78}})));
  Modelica.Blocks.Math.Add3 GovernorPID annotation (Placement(transformation(extent={{102,4},{124,26}})));
  Modelica.Blocks.Nonlinear.DeadZone deadZone(uMax=db, deadZoneAtInit=false) annotation (Placement(transformation(extent={{-14,4},{6,24}})));
  Modelica.Blocks.Nonlinear.Limiter limiterSerror(uMax=maxerr, uMin=minerr) annotation (Placement(transformation(extent={{16,4},{36,24}})));
  Modelica.Blocks.Math.Add3 add3_2(k1=-1, k3=-1) annotation (Placement(transformation(extent={{-44,8},{-32,20}})));
  Modelica.Blocks.Math.Gain r(k=R) "Permanent droop" annotation (Placement(transformation(
        extent={{-7,-7},{7,7}},
        rotation=90,
        origin={-53,-13})));
  Modelica.Blocks.Math.Add add2 annotation (Placement(transformation(extent={{-84,8},{-72,20}})));
  Modelica.Blocks.Continuous.LimIntegrator s7(
    k=Kimw,
    outMax=1.1*R,
    initType=Modelica.Blocks.Types.Init.InitialOutput,
    y_start=s70) "Power controller" annotation (Placement(transformation(
        extent={{-8,-8},{8,8}},
        rotation=90,
        origin={-92,-10})));
  Modelica.Blocks.Math.Add add3(k2=-1) annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={-92,-34})));
  OpenIPSL.NonElectrical.Continuous.SimpleLag s0(
    T=T_pelec,
    y_start=s00,
    K=1) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-116,-82})));
  Modelica.Blocks.Math.Gain KPGOV1(k=Kigov/Kpgov) annotation (Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=180,
        origin={103,-29})));
  Modelica.Blocks.Math.Add LoadlimiterPI2(k1=-1) annotation (Placement(transformation(
        extent={{-5,5},{5,-5}},
        rotation=180,
        origin={123,-29})));
  OpenIPSL.Electrical.Controls.PSSE.TG.BaseClasses.GGOV1.RSELECT rSELECT(Rselect=Rselect)
    annotation (Placement(transformation(
        extent={{-15,-22},{15,22}},
        rotation=90,
        origin={-52,-43})));
protected
  parameter Types.PerUnit Pe0(fixed=false);
  parameter Types.PerUnit Pmech0(fixed=false);
  parameter Types.PerUnit s00(fixed=false);
  parameter Types.PerUnit s20(fixed=false);
  parameter Types.PerUnit s70(fixed=false);
  parameter Types.PerUnit fsr0(fixed=false);
public
  Modelica.Blocks.Interfaces.RealInput PELEC
    "Machine electrical power (pu)"
    annotation (Placement(transformation(extent={{-182,-118},{-154,-90}}), iconTransformation(extent={{-168,-118},{-134,-84}})));
  Modelica.Blocks.Interfaces.RealInput PMW_SET
    "Supervisory Load Controller Setpoint"
    annotation (Placement(transformation(extent={{-148,-66},{-118,-36}}), iconTransformation(extent={{-168,-58},{-134,-24}})));
  Modelica.Blocks.Interfaces.RealInput P_REF annotation (Placement(transformation(extent={{-156,28},{-132,52}}), iconTransformation(extent={{-168,20},{-134,54}})));
  Modelica.Blocks.Interfaces.RealInput SPEED
    "Machine speed deviation from nominal (pu)"
    annotation (Placement(transformation(extent={{-102,28},{-76,54}}), iconTransformation(extent={{-168,74},{-134,108}})));
  Modelica.Blocks.Interfaces.RealInput VSTROKE "Valve Stroke" annotation (Placement(transformation(
        extent={{-17,-17},{17,17}},
        rotation=90,
        origin={-3,-93}), iconTransformation(
        extent={{-15,-15},{15,15}},
        rotation=90,
        origin={-29,-149})));
  Modelica.Blocks.Interfaces.RealInput GOVOUT1
    "Governor Output before Limiter"                                            annotation (Placement(transformation(
        extent={{-16,-16},{16,16}},
        rotation=90,
        origin={30,-104}),iconTransformation(
        extent={{-15,-15},{15,15}},
        rotation=90,
        origin={71,-149})));
  Modelica.Blocks.Interfaces.RealOutput FSRN annotation (Placement(transformation(extent={{136,6},{154,24}}), iconTransformation(extent={{140,-12},{164,12}})));
initial equation
  Pe0 = PELEC;
  Pmech0 = PELEC;
  s00 = Pe0;
  s20 = fsr0;
  s70 = 0;
  //assume s70=0
  fsr0 = (Pmech0 + Dm)/Kturb + Wfnl;

equation
  connect(deadZone.y, limiterSerror.u) annotation (Line(
      points={{7,14},{14,14}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(KPGOV.u, limiterSerror.y) annotation (Line(
      points={{58.4,24},{48,24},{48,14},{37,14}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(add3_2.y, deadZone.u) annotation (Line(
      points={{-31.4,14},{-16,14}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(r.y, add3_2.u3) annotation (Line(
      points={{-53,-5.3},{-53,9.2},{-45.2,9.2}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(add2.y, add3_2.u2) annotation (Line(
      points={{-71.4,14},{-45.2,14}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(s7.y, add2.u2) annotation (Line(
      points={{-92,-1.2},{-92,10.4},{-85.2,10.4}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(add3.y, s7.u) annotation (Line(
      points={{-92,-27.4},{-92,-19.6}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(s0.y, add3.u2) annotation (Line(
      points={{-105,-82},{-88,-82},{-88,-41.2},{-88.4,-41.2}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(s1.u, limiterSerror.y) annotation (Line(
      points={{56,68},{48,68},{48,14},{37,14}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(s1.y, GovernorPID.u1) annotation (Line(
      points={{79,68},{90,68},{90,23.8},{99.8,23.8}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(KPGOV.y, GovernorPID.u2) annotation (Line(
      points={{76.8,24},{80,24},{80,15},{99.8,15}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(s2.u, KPGOV1.y) annotation (Line(
      points={{91.4,-29},{97.5,-29}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(s2.y, GovernorPID.u3) annotation (Line(
      points={{75.3,-29},{66,-29},{66,-28},{56,-28},{56,6.2},{99.8,6.2}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(KPGOV1.u, LoadlimiterPI2.y) annotation (Line(
      points={{109,-29},{117.5,-29}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(LoadlimiterPI2.u1, GovernorPID.u3) annotation (Line(
      points={{129,-26},{136,-26},{136,-16},{56,-16},{56,6.2},{99.8,6.2}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(s0.y, rSELECT.Pelect) annotation (Line(
      points={{-105,-82},{-64.32,-82},{-64.32,-61}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(rSELECT.y, r.u) annotation (Line(
      points={{-51.56,-26.5},{-51.72,-26.5},{-51.72,-21.4},{-53,-21.4}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(add3.u1, PMW_SET) annotation (Line(points={{-95.6,-41.2},{-95.6,-51},{-133,-51}}, color={0,0,127}));
  connect(add2.u1, P_REF) annotation (Line(points={{-85.2,17.6},{-111.6,17.6},{-111.6,40},{-144,40}}, color={0,0,127}));
  connect(add3_2.u1, SPEED) annotation (Line(points={{-45.2,18.8},{-60,18.8},{-60,41},{-89,41}}, color={0,0,127}));
  connect(PELEC, s0.u) annotation (Line(points={{-168,-104},{-140,-104},{-140,-82},{-128,-82}}, color={0,0,127}));
  connect(VSTROKE, rSELECT.ValveStroke) annotation (Line(points={{-3,-93},{-3,-41.8},{-11,-41.8},{-25.6,-41.8}}, color={0,0,127}));
  connect(GOVOUT1, rSELECT.GovernorOutput) annotation (Line(points={{30,-104},{30,-30.4},{-25.6,-30.4}},color={0,0,127}));
  connect(FSRN, GovernorPID.y) annotation (Line(points={{145,15},{125.1,15}}, color={0,0,127}));
  connect(LoadlimiterPI2.u2, rSELECT.GovernorOutput) annotation (Line(points={{129,-32},{136,-32},{136,-60},{30,-60},{30,-30.4},{-25.6,-30.4}}, color={0,0,127}));
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-140,-140},{140,140}}), graphics={Text(
                    extent={{-108,8},{-96,0}},
                    lineColor={255,0,0},
                    textString="s7"),Text(
                    extent={{86,78},{96,70}},
                    lineColor={255,0,0},
                    textString="s1"),Text(
                    extent={{66,-34},{76,-42}},
                    lineColor={255,0,0},
                    textString="s2"),Text(
                    extent={{-102,-86},{-90,-94}},
                    lineColor={255,0,0},
                    textString="s0")}),
    Icon(coordinateSystem(extent={{-140,-140},{140,140}}, preserveAspectRatio=false), graphics={Rectangle(extent={{-140,140},{140,-140}}, lineColor={0,0,255}),Text(
                    extent={{-128,104},{-72,80}},
                    lineColor={28,108,200},
                    textString="SPEED"),Text(
                    extent={{-128,50},{-72,26}},
                    lineColor={28,108,200},
                    textString="P_REF"),Text(
                    extent={{-130,-20},{-60,-66}},
                    lineColor={28,108,200},
                    textString="PMW_SET"),Text(
                    extent={{-128,-92},{-72,-116}},
                    lineColor={28,108,200},
                    textString="PELEC"),Text(
                    extent={{90,8},{138,-10}},
                    lineColor={28,108,200},
                    textString="FSRN"),Text(
                    extent={{-64,42},{66,-40}},
                    lineColor={28,108,200},
                    textString="Governor"),Text(
                    extent={{-58,-110},{-6,-140}},
                    lineColor={28,108,200},
                    textString="VSTROKE"),Text(
                    extent={{46,-114},{100,-140}},
                    lineColor={28,108,200},
                    textString="GOVOUT1")}),
    Documentation(revisions="<html>
<!--DISCLAIMER-->
<p>OpenIPSL:</p>
<p>Copyright 2016 SmarTS Lab (Sweden)</p>
<ul>
<li>SmarTS Lab, research group at KTH: <a href=\"https://www.kth.se/en\">https://www.kth.se/en</a></li>
</ul>
<p>The authors can be contacted by email: <a href=\"mailto:luigiv@kth.se\">luigiv@kth.se</a></p>

<p>This Source Code Form is subject to the terms of the Mozilla Public License, v. 2.0. </p>
<p>If a copy of the MPL was not distributed with this file, You can obtain one at <a href=\"http://mozilla.org/MPL/2.0/\"> http://mozilla.org/MPL/2.0</a>.</p>

<p></p>
<p>iPSL:</p>
<p>Copyright 2015-2016 RTE (France), SmarTS Lab (Sweden), AIA (Spain) and DTU (Denmark)</p>
<ul>
<li>RTE: <a href=\"http://www.rte-france.com\">http://www.rte-france.com</a></li>
<li>SmarTS Lab, research group at KTH: <a href=\"https://www.kth.se/en\">https://www.kth.se/en</a></li>
<li>AIA: <a href=\"http://www.aia.es/en/energy\"> http://www.aia.es/en/energy</a></li>
<li>DTU: <a href=\"http://www.dtu.dk/english\"> http://www.dtu.dk/english</a></li>
</ul>
<p>The authors can be contacted by email: <a href=\"mailto:info@itesla-ipsl.org\">info@itesla-ipsl.org</a></p>

<p>This Source Code Form is subject to the terms of the Mozilla Public License, v. 2.0. </p>
<p>If a copy of the MPL was not distributed with this file, You can obtain one at <a href=\"http://mozilla.org/MPL/2.0/\"> http://mozilla.org/MPL/2.0</a>.</p>
</html>
"));
end PIDGovernorDU;