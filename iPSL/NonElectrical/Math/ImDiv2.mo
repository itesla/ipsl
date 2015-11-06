within iPSL.NonElectrical.Math;
class ImDiv2 "Quotient block.
              2014/03/10"

  Modelica.Blocks.Interfaces.RealInput p1 annotation(Placement(transformation(extent = {{-61, 10}, {-41, 30}}), iconTransformation(extent = {{-61, 10}, {-41, 30}})));
  Modelica.Blocks.Interfaces.RealInput p2 annotation(Placement(transformation(extent = {{39, -10}, {59, 10}}), iconTransformation(extent = {{-61, -30}, {-41, -10}})));
  Modelica.Blocks.Interfaces.RealOutput n1(start = nStartValue) annotation(Placement(transformation(extent = {{-61, -30}, {-41, -10}}), iconTransformation(extent = {{39, -10}, {59, 10}})));
  parameter Real a0 "Offset";
  parameter Real a1 "Entry 1 gain";
  parameter Real a2 "Entry 2 gain";
  parameter Boolean StartValue = false;
  parameter Real nStartValue = 0 "Output start value";
equation
  if p2 > 0 or p2 < 0 then
    n1 = p1 * a1 / (p2 * a2) + a0;
  else
    n1 = 1000000;
  end if;
  annotation(Icon(graphics={  Rectangle(extent=  {{-40, 40}, {40, -40}}, lineColor=  {0, 0, 255}), Line(points=  {{-14, 0}, {14, 0}}, color=  {0, 0, 255}, smooth=  Smooth.None, thickness=  1), Ellipse(extent=  {{-2, 10}, {2, 6}}, lineColor=  {0, 0, 255}, fillColor=  {0, 0, 255},
            fillPattern=                                                                                                    FillPattern.Solid), Ellipse(extent=  {{-2, -6}, {2, -10}}, lineColor=  {0, 0, 255}, fillColor=  {0, 0, 255},
            fillPattern=                                                                                                    FillPattern.Solid)}), Diagram(graphics),
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
end ImDiv2;
