within iPSL.NonElectrical.Logical;
class Switch "Switch between signals, in Simulink.OEL"

  Modelica.Blocks.Interfaces.RealInput y annotation(Placement(transformation(extent = {{-74, 46}, {-54, 66}}), iconTransformation(extent = {{-62, -2}, {-54, 6}})));
  Modelica.Blocks.Interfaces.RealInput if_in "Field current control input " annotation(Placement(transformation(extent = {{-74, 12}, {-54, 32}}), iconTransformation(extent = {{-62, 16}, {-54, 24}})));
  Modelica.Blocks.Interfaces.RealInput V_input "Voltage control input" annotation(Placement(transformation(extent = {{-74, -22}, {-54, -2}}), iconTransformation(extent = {{-62, -18}, {-54, -10}})));
  Modelica.Blocks.Interfaces.RealOutput n1 annotation(Placement(transformation(extent = {{46, 8}, {66, 28}}), iconTransformation(extent = {{12, 0}, {20, 10}})));
equation
  if y >= 0 then
    n1 = if_in;
  else
    n1 = V_input;
  end if;
  annotation(Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics), Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics={  Rectangle(extent = {{-54, 34}, {12, -28}}, lineColor = {0, 0, 127}), Line(points = {{-54, 20}, {-36, 20}, {-8, 6}, {12, 6}}, color = {0, 0, 127}, smooth = Smooth.None), Line(points = {{-54, -14}, {-38, -14}}, color = {0, 0, 127}, smooth = Smooth.None), Line(points = {{-38, -14}, {-8, 6}}, color = {0, 0, 127}, pattern = LinePattern.Dot, smooth = Smooth.None), Text(extent = {{-22, 24}, {-4, 16}}, lineColor = {0, 0, 255}, pattern = LinePattern.Dot, fillColor = {0, 0, 255},
            fillPattern =                                                                                                   FillPattern.Solid, textString = "y => 0"), Text(extent = {{-26, -12}, {-8, -20}}, lineColor = {0, 0, 255}, pattern = LinePattern.Dot, fillColor = {0, 0, 255},
            fillPattern =                                                                                                   FillPattern.Solid, textString = "y < 0"), Text(extent = {{-56, 6}, {-38, -2}}, lineColor = {0, 0, 255}, pattern = LinePattern.Dot, fillColor = {0, 0, 255},
            fillPattern =                                                                                                   FillPattern.Solid, textString = "y")}),
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
end Switch;
