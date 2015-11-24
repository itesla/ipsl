within iPSL.NonElectrical.Math;
model ImSum4 "Sum of Reals"

  Modelica.Blocks.Interfaces.RealInput p1 annotation(Placement(transformation(extent = {{39, -10}, {59, 10}}), iconTransformation(extent = {{-61, 22}, {-41, 42}})));
  Modelica.Blocks.Interfaces.RealInput p2 annotation(Placement(transformation(extent = {{-61, -2}, {-41, 18}}), iconTransformation(extent = {{-61, -2}, {-41, 18}})));
  Modelica.Blocks.Interfaces.RealOutput n1 annotation(Placement(transformation(extent = {{-61, 20}, {-41, 40}}), iconTransformation(extent = {{39, -10}, {59, 10}})));
  parameter Real a0 "Offset";
  parameter Real a1 "Entry 1 gain";
  parameter Real a2 "Entry 2 gain";
  parameter Real a3 "Entry 3 gain";
  parameter Real a4 "Entry 4 gain";
  Modelica.Blocks.Interfaces.RealInput p3 annotation(Placement(transformation(extent = {{-61, -24}, {-41, -4}}), iconTransformation(extent = {{-61, -24}, {-41, -4}})));
  Modelica.Blocks.Interfaces.RealInput p4 annotation(Placement(transformation(extent = {{-61, -48}, {-41, -28}}), iconTransformation(extent = {{-61, -46}, {-41, -26}})));
equation
  n1 = p1 * a1 + p2 * a2 + p3 * a3 + p4 * a4 + a0;
  annotation(Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics={  Rectangle(extent = {{-40, 40}, {40, -40}}, lineColor = {0, 0, 255}), Text(extent = {{-10, 16}, {10, -14}}, lineColor = {0, 0, 255}, textString = "+", textStyle = {TextStyle.Bold})}), Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics),
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
end ImSum4;
