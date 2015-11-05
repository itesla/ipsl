within iPSL.NonElectrical.Math;
model ImDiv3 "Quotient block to the second power."

  Modelica.Blocks.Interfaces.RealInput p1 annotation(Placement(transformation(extent = {{-61, 10}, {-41, 30}}), iconTransformation(extent = {{-51, 20}, {-31, 40}})));
  Modelica.Blocks.Interfaces.RealInput p2 annotation(Placement(transformation(extent = {{39, -10}, {59, 10}}), iconTransformation(extent = {{-51, -20}, {-31, 0}})));
  Modelica.Blocks.Interfaces.RealOutput n1 annotation(Placement(transformation(extent = {{-61, -30}, {-41, -10}}), iconTransformation(extent = {{49, 0}, {69, 20}})));
  parameter Real a0 "Offset";
  parameter Real a1 "Entry 1 gain";
  parameter Real a2 "Entry 2 gain";
  parameter Real nStartValue "Output start value";
initial equation
  n1 = nStartValue;
equation
  n1 = (p1 * a1 / (p2 * a2)) ^ 2 + a0;
  annotation(Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = false), graphics={  Rectangle(extent=  {{-30, 50}, {50, -30}}, lineColor=  {0, 0, 255}), Line(points=  {{-4, 10}, {24, 10}}, color=  {0, 0, 255}, smooth=  Smooth.None, thickness=  0.5), Ellipse(extent=  {{8, 20}, {10, 18}}, lineColor=  {0, 0, 255}, fillColor=  {0, 0, 255},
            fillPattern=                                                                                                    FillPattern.Solid), Ellipse(extent=  {{8, 4}, {10, 2}}, lineColor=  {0, 0, 255}, fillColor=  {0, 0, 255},
            fillPattern=                                                                                                    FillPattern.Solid), Text(extent=  {{-8, 22}, {-14, 0}}, lineColor=  {0, 0, 255}, textString=  "("), Text(extent=  {{28, 22}, {32, 0}}, lineColor=  {0, 0, 255}, textString=  ")"), Text(extent=  {{32, 30}, {40, 16}}, lineColor=  {0, 0, 255}, textString=  "2")}), Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}})),
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
end ImDiv3;
