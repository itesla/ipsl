within iPSL.NonElectrical.Math;
model ImMax "Maximum selector Block.
              2014/03/28"

  Modelica.Blocks.Interfaces.RealInput p1 annotation(Placement(transformation(extent = {{-71, 34}, {-51, 54}}), iconTransformation(extent = {{-71, 34}, {-51, 54}})));
  Modelica.Blocks.Interfaces.RealInput p2 annotation(Placement(transformation(extent = {{-71, 12}, {-51, 32}}), iconTransformation(extent = {{-71, 12}, {-51, 32}})));
  Modelica.Blocks.Interfaces.RealInput p3 annotation(Placement(transformation(extent = {{-71, -10}, {-51, 10}}), iconTransformation(extent = {{-71, -10}, {-51, 10}})));
  Modelica.Blocks.Interfaces.RealInput p4 annotation(Placement(transformation(extent = {{-71, -32}, {-51, -12}}), iconTransformation(extent = {{-71, -32}, {-51, -12}})));
  Modelica.Blocks.Interfaces.RealInput p5 annotation(Placement(transformation(extent = {{-71, -54}, {-51, -34}}), iconTransformation(extent = {{-71, -54}, {-51, -34}})));
  Modelica.Blocks.Interfaces.RealOutput n1 annotation(Placement(transformation(extent = {{49, -12}, {69, 8}}), iconTransformation(extent = {{49, -12}, {69, 8}})));
equation
  if p1 >= p2 and p1 >= p3 and p1 >= p4 and p1 >= p5 then
    n1 = p1;
  elseif p2 >= p1 and p2 >= p3 and p2 >= p4 and p2 >= p5 then
    n1 = p2;
  elseif p3 >= p1 and p3 >= p2 and p3 >= p4 and p3 >= p5 then
    n1 = p3;
  elseif p4 >= p1 and p4 >= p2 and p4 >= p3 and p4 >= p5 then
    n1 = p4;
  else
    n1 = p5;
  end if;
  annotation(Icon(graphics={  Rectangle(extent = {{-50, 48}, {50, -50}}, lineColor = {0, 0, 255}), Text(extent = {{-10, 14}, {10, -16}}, lineColor = {0, 0, 255}, textStyle = {TextStyle.Bold}, textString = "x")}), Diagram(graphics),
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
end ImMax;
