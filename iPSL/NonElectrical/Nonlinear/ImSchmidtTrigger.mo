within iPSL.NonElectrical.Nonlinear;
model ImSchmidtTrigger "Switching with hysteresis. 2014/03/10"

  Modelica.Blocks.Interfaces.RealInput p1 annotation(Placement(transformation(extent = {{-61, -10}, {-41, 10}}), iconTransformation(extent = {{-61, -10}, {-41, 10}})));
  Modelica.Blocks.Interfaces.RealOutput n1 annotation(Placement(transformation(extent = {{39, -10}, {59, 10}}), iconTransformation(extent = {{39, -10}, {59, 10}})));
  parameter Real XMAX;
  parameter Real XMIN;
  parameter Real initValue;
  Real y(start = initValue);
equation
  if p1 - XMAX + y * (XMAX - XMIN) <= 0 then
    y = 0;
  else
    y = 1;
  end if;
  n1 = y;
  //assert(XMIN > XMAX, "XMIN must be smaller than XMAX");
  annotation(Diagram(graphics), Icon(graphics={  Rectangle(extent=  {{-40, 40}, {40, -40}}, lineColor=  {0, 0, 255}), Line(points=  {{-24, 12}, {6, 12}}, color=  {0, 0, 255}, smooth=  Smooth.None), Line(points=  {{6, 12}, {6, 24}, {6, 24}}, color=  {0, 0, 255}, smooth=  Smooth.None), Line(points=  {{-4, 12}, {-4, 24}}, color=  {0, 0, 255}, smooth=  Smooth.None), Line(points=  {{-4, 24}, {24, 24}}, color=  {0, 0, 255}, smooth=  Smooth.None), Line(points=  {{-6, 20}, {-4, 18}, {-2, 20}}, color=  {0, 0, 255}, smooth=  Smooth.None), Line(points=  {{6, 20}, {4, 18}, {6, 20}, {8, 18}}, color=  {0, 0, 255}, smooth=  Smooth.None), Line(points=  {{36, -4}, {30, -4}, {30, -14}, {26, -14}, {24, -14}}, color=  {0, 0, 255}, smooth=  Smooth.None), Line(points=  {{36, -22}, {30, -22}, {30, -32}, {26, -32}, {24, -32}}, color=  {0, 0, 255}, smooth=  Smooth.None), Line(points=  {{30, -8}, {28, -10}, {30, -8}, {32, -10}}, color=  {0, 0, 255}, smooth=  Smooth.None), Line(points=  {{30, -26}, {28, -28}, {30, -26}, {32, -28}}, color=  {0, 0, 255}, smooth=  Smooth.None)}),
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
end ImSchmidtTrigger;
