within iPSL.Electrical.Branches.Simulink.LTC;
model LTC

  NonElectrical.Continuous.ImIntegratornonwindup            imLimitedIntegrator(Ymax = 1, K = 1, Ymin = -delay1, nStartValue = -delay1) annotation(Placement(transformation(extent = {{40, -6}, {98, 38}})));
  LTC_deadband deadband1(Uplim = Uplim, Downlim = Downlim) annotation(Placement(transformation(extent = {{-12, -14}, {54, 42}})));
  parameter Real Uplim = 0.01;
  parameter Real Downlim = -0.01;
  parameter Real Ymin = 0.88 "Min Ratio";
  parameter Real Ymax = 1.2 "Max Ratio";
  parameter Real delay1;
  parameter Real delay2;
  parameter Real positionNo = 33;
  parameter Real r0 = 1 "Transformer Ratio";
  LTC_switch lTC_switch annotation(Placement(transformation(extent = {{88, 6}, {108, 26}})));
  iPSL.NonElectrical.Math.ImSetPoint imSetPoint(V=0)
    annotation (Placement(transformation(extent={{62,-20},{82,0}})));
  iPSL.NonElectrical.Math.ImSum2 imSum2_1(
    a0=0,
    a1=1,
    a2=-1) annotation (Placement(transformation(extent={{-28,4},{-8,24}})));
  iPSL.NonElectrical.Math.ImSetPoint imSetPoint1(V=1)
    annotation (Placement(transformation(extent={{-46,-16},{-26,4}})));
  Modelica.Blocks.Interfaces.RealOutput r annotation(Placement(transformation(extent = {{178, 6}, {198, 26}}), iconTransformation(extent = {{78, 0}, {114, 38}})));
  LTC_lookup lTC_lookup(Uplim = Uplim, Downlim = Downlim) annotation(Placement(transformation(extent = {{-2, 42}, {42, 86}})));
  NonElectrical.Continuous.ImIntegratornonwindup            imLimitedIntegrator1(Ymin = Ymin, Ymax = Ymax, K = (Ymax - Ymin) / (positionNo * delay2), nStartValue = r0) annotation(Placement(transformation(extent = {{100, -6}, {158, 38}})));
  LTC_quantizer lTC_quantizer annotation(Placement(transformation(extent = {{150, 6}, {170, 26}})));
  Modelica.Blocks.Interfaces.RealInput u annotation(Placement(transformation(extent = {{-80, 6}, {-60, 26}}), iconTransformation(extent = {{-116, 4}, {-80, 42}})));
equation
  connect(deadband1.signal, imLimitedIntegrator.p1) annotation(Line(points = {{42.78, 16.24}, {56, 16.24}, {56, 16}, {54.21, 16}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(imSetPoint.n1, lTC_switch.Normalin) annotation(Line(points = {{76.9, -10}, {84, -10}, {84, 10.7}, {91.7, 10.7}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(imSum2_1.n1, deadband1.u) annotation(Line(points = {{-13.1, 14}, {1.2, 14}, {1.2, 16.24}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(imSum2_1.p2, imSetPoint1.n1) annotation(Line(points = {{-23.1, 12}, {-23.1, -6}, {-31.1, -6}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(lTC_lookup.out, lTC_switch.LTCin) annotation(Line(points = {{36.94, 64.22}, {84, 64.22}, {84, 20.9}, {91.6, 20.9}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(lTC_switch.r, imLimitedIntegrator1.p1) annotation(Line(points = {{105.1, 16.8}, {110, 16.8}, {110, 16}, {114.21, 16}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(r, lTC_quantizer.n) annotation(Line(points = {{188, 16}, {182, 16}, {182, 16.1}, {168.5, 16.1}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(lTC_lookup.u, imSum2_1.n1) annotation(Line(points = {{3.72, 63.78}, {-13.1, 63.78}, {-13.1, 14}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(imSum2_1.p1, u) annotation(Line(points = {{-23.1, 16}, {-70, 16}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(imLimitedIntegrator.n0, lTC_switch.Signalin) annotation (Line(
      points={{83.21,16},{91.7,16}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(imLimitedIntegrator1.n0, lTC_quantizer.p) annotation (Line(
      points={{143.21,16},{152.7,16}},
      color={0,0,127},
      smooth=Smooth.None));
  annotation(Diagram(coordinateSystem(preserveAspectRatio=true,   extent={{-100,
            -100},{200,100}}),                                                                           graphics), Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {200, 100}}), graphics={  Rectangle(extent=  {{-78, 70}, {80, -32}}, lineColor=  {0, 0, 255}, fillColor=  {255, 255, 255},
            fillPattern=                                                                                                    FillPattern.Solid), Text(extent=  {{-60, 32}, {66, -58}}, lineColor=  {0, 0, 255}, fillColor=  {255, 255, 255},
            fillPattern=                                                                                                    FillPattern.Solid, textString=  "LTC
")}),
    Documentation(info="<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\">
<tr>
<td><p>Reference</p></td>
<td>Load Tap Changer</td>
</tr>
<tr>
<td><p>Last update</p></td>
<td>2015-10-02</td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p>Le Qi, SmarTS Lab, KTH Royal Institute of Technology</p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p><a href=\"mailto:luigiv@kth.se\">luigiv@kth.se</a></p></td>
</tr>
</table>
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
end LTC;
