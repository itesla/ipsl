within iPSL.NonElectrical.Math;
class ImSum5 "Sum of Reals.
              2014/03/10"

  Modelica.Blocks.Interfaces.RealInput p1 annotation(Placement(transformation(extent = {{-71, 34}, {-51, 54}}), iconTransformation(extent = {{-71, 34}, {-51, 54}})));
  Modelica.Blocks.Interfaces.RealInput p2 annotation(Placement(transformation(extent = {{-71, 12}, {-51, 32}}), iconTransformation(extent = {{-71, 12}, {-51, 32}})));
  Modelica.Blocks.Interfaces.RealInput p3 annotation(Placement(transformation(extent = {{-71, -10}, {-51, 10}}), iconTransformation(extent = {{-71, -10}, {-51, 10}})));
  Modelica.Blocks.Interfaces.RealInput p4 annotation(Placement(transformation(extent = {{-71, -32}, {-51, -12}}), iconTransformation(extent = {{-71, -32}, {-51, -12}})));
  Modelica.Blocks.Interfaces.RealInput p5 annotation(Placement(transformation(extent = {{-71, -54}, {-51, -34}}), iconTransformation(extent = {{-71, -54}, {-51, -34}})));
  Modelica.Blocks.Interfaces.RealOutput n1 annotation(Placement(transformation(extent = {{49, -12}, {69, 8}}), iconTransformation(extent = {{49, -12}, {69, 8}})));
  parameter Real a0 "Offset";
  parameter Real a1 "Entry 1 gain";
  parameter Real a2 "Entry 2 gain";
  parameter Real a3 "Entry 3 gain";
  parameter Real a4 "Entry 4 gain";
  parameter Real a5 "Entry 5 gain";
  parameter Boolean StartValue = false;
  parameter Real nStartValue = 0 "Output start value";
equation
  n1 = p1 * a1 + p2 * a2 + p3 * a3 + p4 * a4 + p5 * a5 + a0;
  annotation(Icon(graphics={  Rectangle(extent=  {{-50, 48}, {50, -50}}, lineColor=  {0, 0, 255}), Text(extent=  {{-10, 14}, {10, -16}}, lineColor=  {0, 0, 255}, textString=  "+", textStyle=  {TextStyle.Bold})}), Diagram(graphics),
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
end ImSum5;
