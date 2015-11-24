within iPSL.NonElectrical.Math;
model ImResetSet "The changeover of the output from 1 to 0 takes place when the 
  first input is negative or zero and the second one positive. The switch off 
  position is held has long as the first input remains negative or zero.
              2014/03/10"

  Modelica.Blocks.Interfaces.RealInput p1 annotation(Placement(transformation(extent = {{39, -10}, {59, 10}}), iconTransformation(extent = {{-61, 10}, {-41, 30}})));
  Modelica.Blocks.Interfaces.RealInput p2 annotation(Placement(transformation(extent = {{-61, -30}, {-41, -10}}), iconTransformation(extent = {{-61, -30}, {-41, -10}})));
  Modelica.Blocks.Interfaces.RealOutput n1 annotation(Placement(transformation(extent = {{-61, 10}, {-41, 30}}), iconTransformation(extent = {{39, -10}, {59, 10}})));
  parameter Real nStartValue;
  Real y(start = nStartValue);
equation
  n1 = y;
  if (p2 > 0 or y <= 0) and p1 <= 0 then
    y = 0;
  else
    y = 1;
  end if;
  annotation(Icon(graphics={  Rectangle(extent = {{-40, 40}, {40, -40}}, lineColor = {0, 0, 255}), Text(extent = {{5, 25}, {-5, 11}}, lineColor = {0, 0, 255}, textString = "S"), Text(extent = {{5, -13}, {-5, -27}}, lineColor = {0, 0, 255}, textString = "R"), Line(points = {{-40, 0}, {40, 0}}, color = {0, 0, 255}, smooth = Smooth.None), Rectangle(extent = {{32, 40}, {40, 0}}, lineColor = {0, 0, 255}, fillColor = {0, 0, 255},
            fillPattern =                                                                                                   FillPattern.Solid)}), Diagram(graphics),
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
end ImResetSet;
