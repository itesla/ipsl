within OpenIPSL.Electrical.Controls.PSSE.TG.BaseClasses.GGOV1;
model LoadLimiter
  "GE General GGOV Governor/Turbine Temperature Control"
  parameter Types.PerUnit Kturb=1.5 "Turbine gain";
  parameter Types.PerUnit Kpload=2 "Load limiter proportional gain for PI controller";
  parameter Types.TimeAging Kiload=0.67 "Load limiter integral gain for PI controller";
  parameter Types.PerUnit Dm=0 "Mechanical damping coefficient";
  parameter Types.PerUnit Wfnl=0.2 "No load fuel flow";
  Modelica.Blocks.Math.Gain KPLOAD(k=Kpload) annotation (Placement(transformation(extent={{-86,-60},{-72,-46}})));
  Modelica.Blocks.Continuous.Integrator s6(
    k=1,
    y_start=s60,
    initType=Modelica.Blocks.Types.Init.InitialState) annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=180,
        origin={-48,-22})));
  Modelica.Blocks.Math.Add LoadlimiterPI annotation (Placement(transformation(extent={{-58,-56},{-42,-40}})));
  Modelica.Blocks.Math.Add add6(k1=-1) annotation (Placement(transformation(
        extent={{-8,-8},{8,8}},
        rotation=180,
        origin={36,6})));
  Modelica.Blocks.Math.Gain gain(k=1/Kturb) annotation (Placement(transformation(extent={{-28,12},{-12,28}})));
  Modelica.Blocks.Nonlinear.Limiter maxLimiter(uMax=1, uMin=-Modelica.Constants.inf) annotation (Placement(transformation(extent={{-16,-56},{0,-40}})));
  Modelica.Blocks.Math.Add add7 annotation (Placement(transformation(
        extent={{-9,-9},{9,9}},
        rotation=0,
        origin={25,25})));
  Modelica.Blocks.Math.Gain Gain(k=Kiload/Kpload) annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=180,
        origin={-28,-22})));
  Modelica.Blocks.Math.Add LoadlimiterPI1(k2=-1) annotation (Placement(transformation(
        extent={{-6,6},{6,-6}},
        rotation=180,
        origin={-4,-22})));
protected
  parameter Types.PerUnit Pmech0(fixed=false);
  parameter Types.PerUnit s60(fixed=false);
  parameter Types.PerUnit fsr0(fixed=false);
public
  Modelica.Blocks.Interfaces.RealOutput FSRT "Controller Output" annotation (Placement(transformation(extent={{34,-80},{56,-58}}), iconTransformation(extent={{100,-70},{120,-50}})));
  Modelica.Blocks.Interfaces.RealInput LDREF
    "Load Limiter reference value (pu)"
    annotation (Placement(transformation(extent={{-78,6},{-50,34}}), iconTransformation(extent={{-124,-16},{-94,14}})));
  Modelica.Blocks.Interfaces.RealInput TEXM
    "Measured Exhaust Temperature"                                         annotation (Placement(transformation(extent={{112,32},{90,54}}), iconTransformation(extent={{122,36},{94,64}})));
  Modelica.Blocks.Interfaces.RealInput WF
    "Fuel flow (Governor output)"                                       annotation (Placement(transformation(extent={{86,-42},{62,-18}}), iconTransformation(extent={{120,-24},{92,4}})));
  Modelica.Blocks.Interfaces.RealInput PELEC
    "Machine electrical power (pu)"                                          annotation (Placement(transformation(
        extent={{-15,-15},{15,15}},
        rotation=90,
        origin={11,-95}), iconTransformation(
        extent={{-14,-14},{14,14}},
        rotation=90,
        origin={-1.77636e-015,-108})));
  Modelica.Blocks.Sources.Constant const(k=Wfnl) annotation (Placement(transformation(extent={{-28,44},{-12,60}})));
initial equation
  Pmech0 = PELEC;
  s60 = fsr0;
  fsr0 = (Pmech0 + Dm)/Kturb + Wfnl;

equation
  connect(gain.y, add7.u2) annotation (Line(
      points={{-11.2,20},{4,20},{4,19.6},{14.2,19.6}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(add7.y, add6.u2) annotation (Line(
      points={{34.9,25},{62,25},{62,10.8},{45.6,10.8}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(add6.y, KPLOAD.u) annotation (Line(
      points={{27.2,6},{-94,6},{-94,-53},{-87.4,-53}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(LoadlimiterPI1.y, Gain.u) annotation (Line(
      points={{-10.6,-22},{-20.8,-22}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Gain.y, s6.u) annotation (Line(
      points={{-34.6,-22},{-40.8,-22}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(KPLOAD.y, LoadlimiterPI.u2) annotation (Line(
      points={{-71.3,-53},{-68,-53},{-68,-52.8},{-59.6,-52.8}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(s6.y, LoadlimiterPI.u1) annotation (Line(
      points={{-54.6,-22},{-74,-22},{-74,-43.2},{-59.6,-43.2}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(LoadlimiterPI.y, maxLimiter.u) annotation (Line(
      points={{-41.2,-48},{-17.6,-48}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(LoadlimiterPI1.u2, LoadlimiterPI.u1)
    annotation (Line(
      points={{3.2,-25.6},{16,-25.6},{16,-34},{-74,-34},{-74,-43.2},{-59.6,-43.2}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(maxLimiter.y, FSRT) annotation (Line(points={{0.8,-48},{28,-48},{28,-69},{45,-69}}, color={0,0,127}));
  connect(gain.u, LDREF) annotation (Line(points={{-29.6,20},{-34.3,20},{-64,20}}, color={0,0,127}));
  connect(LoadlimiterPI1.u1, WF) annotation (Line(points={{3.2,-18.4},{40,-18.4},{40,-30},{74,-30}}, color={0,0,127}));
  connect(add6.u1, TEXM) annotation (Line(points={{45.6,1.2},{80,1.2},{80,43},{101,43}}, color={0,0,127}));
  connect(const.y, add7.u1) annotation (Line(points={{-11.2,52},{0,52},{0,30.4},{14.2,30.4}}, color={0,0,127}));
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics={Text(
                    extent={{46,20},{58,12}},
                    lineColor={255,0,0},
                    textString="tlim"),Text(
                    extent={{-52,-4},{-42,-12}},
                    lineColor={255,0,0},
                    textString="s6")}),
    Icon(coordinateSystem(extent={{-100,-100},{100,100}}, preserveAspectRatio=false), graphics={Rectangle(extent={{-100,100},{100,-100}}, lineColor={0,0,255}),Text(
                    extent={{-90,12},{-58,-10}},
                    lineColor={28,108,200},
                    textString="LDREF"),Text(
                    extent={{60,62},{92,40}},
                    lineColor={28,108,200},
                    textString="TEXM"),Text(
                    extent={{68,-2},{92,-18}},
                    lineColor={28,108,200},
                    textString="WF"),Text(
                    extent={{60,-50},{92,-72}},
                    lineColor={28,108,200},
                    textString="FSRT"),Text(
                    extent={{-48,14},{50,-16}},
                    lineColor={28,108,200},
                    textString="Load
Limiter"),Text(               extent={{-16,-78},{16,-100}},
                    lineColor={28,108,200},
                    textString="PELEC")}),
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
end LoadLimiter;