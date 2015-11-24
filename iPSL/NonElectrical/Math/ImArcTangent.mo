within iPSL.NonElectrical.Math;
model ImArcTangent "Output arctan(abs(p1/p2)). Developed by AIA.
              2014/03/10"

  Modelica.Blocks.Interfaces.RealInput p1 "numerator" annotation(Placement(transformation(extent = {{-61, 10}, {-41, 30}}), iconTransformation(extent = {{-61, -30}, {-41, -10}})));
  Modelica.Blocks.Interfaces.RealInput p2 "denominator" annotation(Placement(transformation(extent = {{-61, -30}, {-41, -10}}), iconTransformation(extent = {{-61, 10}, {-41, 30}})));
  Modelica.Blocks.Interfaces.RealOutput n1 annotation(Placement(transformation(extent = {{39, -10}, {59, 10}}), iconTransformation(extent = {{39, -10}, {59, 10}})));
  Real a1;
  Real a2;
  //Real x0;
  Real x;
  parameter Real offset "offset of the arctan";
  parameter Real PI = 3.14159265;
equation
  a1 = 2 * PI * floor(offset / (2 * PI));
  a2 = offset - a1;
  //x0 = atan(abs(p1/p2));
  if p1 >= 0 and p2 > 0 then
    x = atan(abs(p1 / p2));
  elseif p1 >= 0 and p2 < 0 then
    x = PI - atan(abs(p1 / p2));
  elseif p1 < 0 and p2 > 0 then
    x = -atan(abs(p1 / p2));
  elseif p1 < 0 and p2 < 0 then
    x = -(PI - atan(abs(p1 / p2)));
  else
    x = 0;
  end if;
  if x <= a2 - PI then
    n1 = x + a1 + 2 * PI;
  elseif x > a2 + PI then
    n1 = x + a1 - 2 * PI;
  else
    n1 = x + a1;
  end if;
  annotation(Icon(graphics={  Rectangle(extent = {{-40, 40}, {40, -40}}, lineColor = {0, 0, 255}), Text(extent = {{-22, 16}, {24, -16}}, lineColor = {0, 0, 255}, textStyle = {TextStyle.Bold}, textString = "atan
(N / D)")}),
       Diagram(graphics),
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
end ImArcTangent;
