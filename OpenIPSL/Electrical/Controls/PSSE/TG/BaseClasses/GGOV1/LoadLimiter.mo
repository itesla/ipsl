within OpenIPSL.Electrical.Controls.PSSE.TG.BaseClasses.GGOV1;
model LoadLimiter
  "GE General GGOV1 Governor/Turbine Temperature Control"
  parameter Types.PerUnit Kturb=1.5 "Turbine gain";
  parameter Types.PerUnit Kpload=2 "Load limiter proportional gain for PI controller";
  parameter Types.TimeAging Kiload=0.67 "Load limiter integral gain for PI controller";
  parameter Types.PerUnit Dm=0 "Mechanical damping coefficient";
  parameter Types.PerUnit Wfnl=0.2 "No load fuel flow";
  Modelica.Blocks.Math.Gain KPLOAD(k=Kpload) annotation (Placement(visible = true, transformation(extent = {{-66, -60}, {-52, -46}}, rotation = 0)));
  Modelica.Blocks.Continuous.Integrator s6(
    k=1,
    y_start=s60,
    initType=Modelica.Blocks.Types.Init.InitialOutput) annotation (Placement(visible = true, transformation(origin = {-48, -30}, extent = {{6, 6}, {-6, -6}}, rotation = 180)));
  Modelica.Blocks.Math.Add LoadlimiterPI annotation (Placement(visible = true, transformation(extent = {{-28, -56}, {-12, -40}}, rotation = 0)));
  Modelica.Blocks.Math.Add add6(k1=-1) annotation (Placement(transformation(
        extent={{-8,-8},{8,8}},
        rotation=180,
        origin={36,6})));
  Modelica.Blocks.Math.Gain gain(k=1/Kturb) annotation (Placement(transformation(extent={{-28,12},{-12,28}})));
  Modelica.Blocks.Nonlinear.Limiter maxLimiter(uMax=1, uMin=-Modelica.Constants.inf) annotation (Placement(visible = true, transformation(extent = {{0, -56}, {16, -40}}, rotation = 0)));
  Modelica.Blocks.Math.Add add7 annotation (Placement(transformation(
        extent={{-9,-9},{9,9}},
        rotation=0,
        origin={25,25})));
  Modelica.Blocks.Math.Gain Gain(k=Kiload) annotation (Placement(visible = true, transformation(origin = {-68, -30}, extent = {{6, -6}, {-6, 6}}, rotation = 180)));
  Modelica.Blocks.Interfaces.RealOutput FSRT "Controller Output" annotation (Placement(transformation(extent={{34,-80},{56,-58}}), iconTransformation(extent={{100,-70},{120,-50}})));
  Modelica.Blocks.Interfaces.RealInput LDREF
    "Load Limiter reference value (pu)"
    annotation (Placement(transformation(extent={{-78,6},{-50,34}}), iconTransformation(extent={{-124,-16},{-94,14}})));
  Modelica.Blocks.Interfaces.RealInput TEXM
    "Measured Exhaust Temperature"                                         annotation (Placement(transformation(extent={{112,32},{90,54}}), iconTransformation(extent={{122,36},{94,64}})));
  Modelica.Blocks.Interfaces.RealInput PELEC
    "Machine electrical power (pu)"                                          annotation (Placement(transformation(
        extent={{-15,-15},{15,15}},
        rotation=90,
        origin={11,-95}), iconTransformation(
        extent={{-14,-14},{14,14}},
        rotation=90,
        origin={-1.77636e-015,-108})));
  Modelica.Blocks.Sources.Constant const(k=Wfnl) annotation (Placement(transformation(extent={{-28,44},{-12,60}})));
protected
  parameter Types.PerUnit Pmech0(fixed=false);
  parameter Types.PerUnit s60(fixed=false);
  parameter Types.PerUnit fsr0(fixed=false);
initial equation
  Pmech0 = PELEC;
  s60 = fsr0;
  fsr0 = (Pmech0 + Dm)/Kturb + Wfnl;

equation
  connect(gain.y, add7.u2) annotation(
    Line(points = {{-11.2, 20}, {4, 20}, {4, 19.6}, {14.2, 19.6}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(add7.y, add6.u2) annotation(
    Line(points = {{34.9, 25}, {62, 25}, {62, 10.8}, {45.6, 10.8}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(add6.y, KPLOAD.u) annotation(
    Line(points = {{27.2, 6}, {-94, 6}, {-94, -53}, {-67, -53}}, color = {0, 0, 127}));
  connect(KPLOAD.y, LoadlimiterPI.u2) annotation(
    Line(points = {{-51, -53}, {-30, -53}}, color = {0, 0, 127}));
  connect(LoadlimiterPI.y, maxLimiter.u) annotation(
    Line(points = {{-11, -48}, {-2, -48}}, color = {0, 0, 127}));
  connect(maxLimiter.y, FSRT) annotation(
    Line(points = {{17, -48}, {28, -48}, {28, -69}, {45, -69}}, color = {0, 0, 127}));
  connect(gain.u, LDREF) annotation(
    Line(points = {{-29.6, 20}, {-34.3, 20}, {-64, 20}}, color = {0, 0, 127}));
  connect(add6.u1, TEXM) annotation(
    Line(points = {{45.6, 1.2}, {80, 1.2}, {80, 43}, {101, 43}}, color = {0, 0, 127}));
  connect(const.y, add7.u1) annotation(
    Line(points = {{-11.2, 52}, {0, 52}, {0, 30.4}, {14.2, 30.4}}, color = {0, 0, 127}));
  connect(s6.u, Gain.y) annotation(
    Line(points = {{-55, -30}, {-62, -30}}, color = {0, 0, 127}));
  connect(s6.y, LoadlimiterPI.u1) annotation(
    Line(points = {{-41, -30}, {-36, -30}, {-36, -44}, {-30, -44}}, color = {0, 0, 127}));
  connect(Gain.u, add6.y) annotation(
    Line(points = {{-76, -30}, {-94, -30}, {-94, 6}, {28, 6}, {28, 6}, {28, 6}}, color = {0, 0, 127}));
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics={Text(lineColor = {255, 0, 0}, extent = {{46, 20}, {58, 12}}, textString = "tlim"),Text(lineColor = {255, 0, 0}, extent = {{-52, -4}, {-42, -12}}, textString = "s6")}),
    Icon(coordinateSystem(extent={{-100,-100},{100,100}}, preserveAspectRatio=false), graphics={Rectangle(lineColor = {0, 0, 255}, extent = {{-100, 100}, {100, -100}}),Text(lineColor = {28, 108, 200}, extent = {{-90, 12}, {-58, -10}}, textString = "LDREF"),Text(lineColor = {28, 108, 200}, extent = {{60, 62}, {92, 40}}, textString = "TEXM"),Text(lineColor = {28, 108, 200}, extent = {{68, -2}, {92, -18}}, textString = "WF"),Text(lineColor = {28, 108, 200}, extent = {{60, -50}, {92, -72}}, textString = "FSRT"),Text(lineColor = {28, 108, 200}, extent = {{-48, 14}, {50, -16}}, textString = "Load
Limiter"),Text(lineColor = {28, 108, 200}, extent = {{-16, -78}, {16, -100}}, textString = "PELEC")}),
    Documentation(info="<html>
<p>The following documentation is adapted from 
<a href=\"modelica://OpenIPSL.UsersGuide.References\">[PSSE-Models], chapter 7.12</a>:</p>
<blockquote>
<p>
Load limiter and temperature control system for the general purpose Turbine/Governor model GGOV1.
</p>
</blockquote>
</html>", revisions="<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\"><tr>
<td><p>Reference</p></td>
<td><p>PSS&reg;E Models</p></td>
</tr>
<tr>
<td><p>Last update</p></td>
<td><p>2020-11-22</p></td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p><a href=\"https://github.com/maguilerac\">@maguilerac</a></p></td>
<td><p><a href=\"https://github.com/marcelofcastro\">@marcelofcastro</a></p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p>see <a href=\"modelica://OpenIPSL.UsersGuide.Contact\">UsersGuide.Contact</a></p></td>
</tr>
</table>
</html>"));
end LoadLimiter;