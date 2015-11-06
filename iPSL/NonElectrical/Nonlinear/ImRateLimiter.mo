within iPSL.NonElectrical.Nonlinear;
model ImRateLimiter

  Modelica.Blocks.Interfaces.RealInput p annotation(Placement(transformation(extent = {{-46, -5}, {-40, 5}}), iconTransformation(extent = {{-46, -5}, {-40, 5}})));
  iPSL.NonElectrical.Math.ImSum2 imSum2_1(
    a0=0,
    a1=1,
    a2=-1) annotation (Placement(transformation(extent={{-52,-14},{-28,14}})));
  Modelica.Blocks.Interfaces.RealOutput n annotation(Placement(transformation(extent = {{40, -5}, {46, 5}}), iconTransformation(extent = {{40, -5}, {46, 5}})));
  iPSL.NonElectrical.Math.ImGain imGain(K=1000)
    annotation (Placement(transformation(extent={{-28,-10},{-8,10}})));
  parameter Real dmax;
  parameter Real dmin;
  iPSL.NonElectrical.Nonlinear.ImLimiter imLimiter(Ymin=dmin, Ymax=dmax)
    annotation (Placement(transformation(extent={{-8,-10},{12,10}})));
  parameter Real ini_integrator(fixed = false);
  iPSL.NonElectrical.Continuous.ImIntegrator imIntegrator(K=1, nStartValue=
        ini_integrator)
    annotation (Placement(transformation(extent={{14,-10},{34,10}})));
initial equation
  ini_integrator = p;

equation
  connect(p, imSum2_1.p1) annotation(Line(points = {{-43, 0}, {-62, 0}, {-62, 2.8}, {-46.12, 2.8}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(imIntegrator.n1, n) annotation(Line(points = {{28.9, 0}, {43, 0}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(imIntegrator.n1, imSum2_1.p2) annotation(Line(points = {{28.9, 0}, {40, 0}, {40, -20}, {-54, -20}, {-54, -2.8}, {-46.12, -2.8}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(imSum2_1.n1, imGain.p1) annotation(Line(points = {{-34.12, 0.00000000000000177636}, {-28.61, 0.00000000000000177636}, {-28.61, 0}, {-23.1, 0}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(imGain.n1, imLimiter.p1) annotation(Line(points = {{-13.1, 0}, {-3.1, 0}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(imLimiter.n1, imIntegrator.p1) annotation(Line(points = {{6.9, 0}, {18.9, 0}}, color = {0, 0, 127}, smooth = Smooth.None));
  annotation(Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics), Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics={  Rectangle(extent=  {{-40, 40}, {40, -40}}, lineColor=  {0, 0, 255}), Line(points=  {{-20, -20}, {-20, -20}, {20, 20}, {20, 20}}, color=  {0, 0, 255}, smooth=  Smooth.None, thickness=  0.5), Line(points=  {{0, 20}, {0, -20}}, color=  {0, 0, 255}, smooth=  Smooth.None), Line(points=  {{-20, 0}, {20, 0}}, color=  {0, 0, 255}, smooth=  Smooth.None)}),
    Documentation(info="<html>
<p><br><span style=\"font-family: MS Shell Dlg 2;\">&LT;iPSL: iTesla Power System Library&GT;</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Copyright 2015 RTE (France), AIA (Spain), KTH (Sweden) and DTU (Denmark)</span></p>
<ul>
<li><span style=\"font-family: MS Shell Dlg 2;\">RTE: http://www.rte-france.com/ </span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">AIA: http://www.aia.es/en/energy/</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">KTH: https://www.kth.se/en</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">DTU:http://www.dtu.dk/english</span></li>
</ul>
<p><span style=\"font-family: MS Shell Dlg 2;\">The authors can be contacted by email: info at itesla-ipsl dot org</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">This package is part of the iTesla Power System Library (&QUOT;iPSL&QUOT;) .</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is free software: you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">You should have received a copy of the GNU Lesser General Public License along with the iPSL. If not, see &LT;http://www.gnu.org/licenses/&GT;.</span></p>
</html>"));
end ImRateLimiter;
