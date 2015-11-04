within iPSL.Electrical.Controls.Eurostag;
model AVR3 "Voltage regulator. Developed by AIA. 2013"
  parameter Real Kgain;
  parameter Real KE;
  parameter Real TE;
  parameter Real init_V1;
  parameter Real init_V2;
  iPSL.NonElectrical.Math.ImSum2 imSum2_1(
    a0=0.0,
    a1=1.0,
    a2=-1.0) annotation (Placement(transformation(extent={{-56,6},{-10,52}})));
  iPSL.NonElectrical.Math.ImGain imGain(K=Kgain)
    annotation (Placement(transformation(extent={{-18,8},{24,50}})));
  Modelica.Blocks.Interfaces.RealOutput pin_EFD annotation(Placement(transformation(extent = {{60, -10}, {79, 10}}), iconTransformation(extent = {{59, -10}, {79, 10}})));
  Modelica.Blocks.Interfaces.RealInput pin_TerminalVoltage annotation(Placement(transformation(extent = {{-61, -10}, {-41, 10}}), iconTransformation(extent = {{-61, -10}, {-41, 10}})));
  iPSL.NonElectrical.Math.ImSetPoint imSetPoint(V=init_V1)
    annotation (Placement(transformation(extent={{-94,28},{-48,70}})));
  iPSL.NonElectrical.Continuous.ImSimpleLag imSimpleLag(
    K=KE,
    T=TE,
    nStartValue=init_V2)
    annotation (Placement(transformation(extent={{10,6},{62,52}})));
equation
  connect(imGain.n1, imSimpleLag.p1) annotation(Line(points = {{13.29, 29}, {27.94, 29}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(imSimpleLag.n1, pin_EFD) annotation(Line(points={{54.2,29},{69.5,29},{
          69.5,0}},                                                                               color = {0, 0, 255}, smooth = Smooth.None));
  connect(imSum2_1.n1, imGain.p1) annotation(Line(points = {{-21.73, 29}, {-7.71, 29}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(imSum2_1.p1, imSetPoint.n1) annotation(Line(points = {{-44.73, 33.6}, {-44.73, 49}, {-59.73, 49}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(imSum2_1.p2, pin_TerminalVoltage) annotation(Line(points = {{-44.73, 24.4}, {-51, 24.4}, {-51, 0}}, color = {0, 0, 255}, smooth = Smooth.None));
  annotation(Diagram(graphics), Icon(graphics={  Rectangle(extent=  {{-40, 40}, {60, -40}}, lineColor=  {0, 0, 255}), Text(extent=  {{58, -10}, {-40, 12}}, lineColor=  {0, 0, 255}, textString=  "AVR3")}),
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
end AVR3;
