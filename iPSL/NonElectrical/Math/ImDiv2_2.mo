within iPSL.NonElectrical.Math;
model ImDiv2_2

  parameter Real a0 "Offset";
  parameter Real a1 "Entry 1 gain";
  parameter Real a2 "Entry 2 gain";
  //   parameter Real p1StartValue "input 1 start value";
  //   parameter Real p2StartValue "input 2 start value";
  Modelica.Blocks.Interfaces.RealInput p2 annotation(Placement(transformation(extent = {{-61, 20}, {-41, 40}}), iconTransformation(extent = {{-6, -8.5}, {6, 8.5}}, rotation = 0, origin = {-27.5, 10})));
  Modelica.Blocks.Interfaces.RealInput p1 annotation(Placement(transformation(extent = {{-61, -34}, {-41, -14}}), iconTransformation(extent = {{-5.5, -9}, {5.5, 9}}, rotation = 90, origin = {8.5, -25})));
  Modelica.Blocks.Interfaces.RealOutput n1 annotation(Placement(transformation(extent = {{59, -10}, {79, 10}}), iconTransformation(extent = {{47, 2}, {58, 20}})));
  // initial equation
  //    p1=p1StartValue;
  //    p2=p2StartValue;
equation
  n1 = p1 * a1 / (p2 * a2) + a0;
  annotation(Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = false), graphics={  Rectangle(extent = {{-32, 48}, {48, -32}}, lineColor = {0, 0, 255}), Line(points = {{-20, 22}, {8, 22}}, color = {0, 0, 255}, smooth = Smooth.None, thickness = 0.5), Text(extent = {{-10, 6}, {34, -42}}, lineColor = {0, 0, 255}, textString = "*"), Ellipse(extent = {{-10, 36}, {-2, 28}}, lineColor = {0, 0, 255},
            fillPattern =                                                                                                   FillPattern.Solid, fillColor = {0, 0, 255}), Ellipse(extent = {{-10, 10}, {-2, 18}}, lineColor = {0, 0, 255},
            fillPattern =                                                                                                   FillPattern.Solid, fillColor = {0, 0, 255})}), Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = false), graphics),
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
end ImDiv2_2;
