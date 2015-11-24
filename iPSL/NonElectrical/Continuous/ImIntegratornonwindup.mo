within iPSL.NonElectrical.Continuous;
model ImIntegratornonwindup "Integrator with limited value of the output"

  Modelica.Blocks.Interfaces.RealInput p1 annotation(Placement(transformation(extent = {{-61, -10}, {-41, 10}}), iconTransformation(extent = {{-61, -10}, {-41, 10}})));
  Modelica.Blocks.Interfaces.RealOutput n0 annotation(Placement(transformation(extent = {{39, -10}, {59, 10}}), iconTransformation(extent = {{39, -10}, {59, 10}})));
  parameter Real Ymax "Max limit";
  parameter Real Ymin "Min limit";
  parameter Real K "Gain";
  parameter Real nStartValue "Output start value";
  Real n1;
initial algorithm
  if nStartValue >= Ymax then
    n1 := Ymax;
  elseif nStartValue <= Ymin then
    n1 := Ymin;
  else
    n1 := nStartValue;
  end if;
equation
  if n1 > Ymin and n1 < Ymax then
    der(n1) = K * p1;
  elseif n1 <= Ymin and K * p1 > 0 then
    der(n1) = K * p1;
  elseif n1 >= Ymax and K * p1 < 0 then
    der(n1) = K * p1;
  else
    der(n1) = 0;
  end if;
  if n1 <= Ymin then
    n0 = Ymin;
  elseif n1 >= Ymax then
    n0 = Ymax;
  else
    n0 = n1;
  end if;
  annotation(Icon(graphics={  Line(points = {{-14, -20}, {-2, -20}, {8, 20}, {22, 20}}, color = {0, 0, 255}, smooth = Smooth.None), Rectangle(extent = {{-40, 40}, {40, -40}}, lineColor = {0, 0, 255}), Rectangle(extent = {{-8, 16}, {14, -16}}, lineColor = {0, 0, 255},
            fillPattern =                                                                                                   FillPattern.Solid, fillColor = {215, 215, 215}), Text(extent = {{-2, 14}, {6, 0}}, lineColor = {0, 0, 255}, textString = "K", textStyle = {TextStyle.Bold}), Text(extent = {{-4, 0}, {8, -14}}, lineColor = {0, 0, 255}, textString = "s", textStyle = {TextStyle.Bold}), Line(points = {{-6, 0}, {12, 0}}, color = {0, 0, 255}, smooth = Smooth.Bezier)}), Diagram(graphics),
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
end ImIntegratornonwindup;
