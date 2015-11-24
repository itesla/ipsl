within iPSL.NonElectrical.Continuous;
model ImSecondOrder "Second order block.
              2014/06/03"

  Modelica.Blocks.Interfaces.RealInput p1 annotation(Placement(transformation(extent = {{-61, -10}, {-41, 10}}), iconTransformation(extent = {{-61, -10}, {-41, 10}})));
  Modelica.Blocks.Interfaces.RealOutput n1(start = A0 * pStartValue) annotation(Placement(transformation(extent = {{39, -10}, {59, 10}}), iconTransformation(extent = {{39, -10}, {59, 10}})));
  Real y1(start = 0);
  Real y2(start = pStartValue);
  parameter Real A0;
  parameter Real A1;
  parameter Real A2;
  parameter Real B1;
  parameter Real B2;
  parameter Real pStartValue "Input start val";
equation
  der(y1) = 1 / B2 * ((-B1 * y1) - y2 + p1);
  der(y2) = y1;
  n1 = (A1 - A2 * B1 / B2) * y1 + (A0 - A2 / B2) * y2 + A2 / B2 * p1;
  annotation(Icon(graphics={  Rectangle(extent = {{-40, 40}, {40, -40}}, lineColor = {0, 0, 255}), Line(points = {{-24, 20}, {24, 20}}, color = {0, 0, 255}, smooth = Smooth.Bezier, thickness = 0.5), Text(extent = {{-28, 30}, {24, 22}}, lineColor = {0, 0, 255}, textString = "A0+A1s+A2s^2"), Text(extent = {{-34, 4}, {-22, -4}}, lineColor = {0, 0, 255}, textString = "A0"), Text(extent = {{-34, -4}, {-22, -12}}, lineColor = {0, 0, 255}, textString = "A1"), Text(extent = {{-34, -12}, {-22, -20}}, lineColor = {0, 0, 255}, textString = "A2"), Text(extent = {{-34, -20}, {-22, -28}}, lineColor = {0, 0, 255}, textString = "B1"), Text(extent = {{-34, -28}, {-22, -36}}, lineColor = {0, 0, 255}, textString = "B2"), Text(extent = {{-26, 16}, {26, 8}}, lineColor = {0, 0, 255}, textString = "1+B1s+B2s^2")}),
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
end ImSecondOrder;
