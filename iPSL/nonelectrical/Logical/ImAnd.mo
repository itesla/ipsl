within iPSL.NonElectrical.Logical;
class ImAnd "Logical 'and': p1>0 and p2>0 and p3>0 and p4>and or p5>0.
              2014/03/10"

  Modelica.Blocks.Interfaces.RealInput p1 annotation(Placement(transformation(extent = {{-54, 28}, {-41, 44}}), iconTransformation(extent = {{-54, 28}, {-41, 44}})));
  Modelica.Blocks.Interfaces.RealInput p2 annotation(Placement(transformation(extent = {{-54, 10}, {-41, 26}}), iconTransformation(extent = {{-54, 10}, {-41, 26}})));
  Modelica.Blocks.Interfaces.RealInput p3 annotation(Placement(transformation(extent = {{-54, -8}, {-41, 8}}), iconTransformation(extent = {{-54, -8}, {-41, 8}})));
  Modelica.Blocks.Interfaces.RealInput p4 annotation(Placement(transformation(extent = {{-54, -26}, {-41, -10}}), iconTransformation(extent = {{-54, -26}, {-41, -10}})));
  Modelica.Blocks.Interfaces.RealInput p5 annotation(Placement(transformation(extent = {{-54, -42}, {-41, -28}}), iconTransformation(extent = {{-54, -42}, {-41, -28}})));
  Modelica.Blocks.Interfaces.RealOutput n1 annotation(Placement(transformation(extent = {{39, -10}, {59, 10}}), iconTransformation(extent = {{39, -10}, {59, 10}})));
equation
  if p1 > 0 and p2 > 0 and p3 > 0 and p4 > 0 and p5 > 0 then
    n1 = 1;
  else
    n1 = 0;
  end if;
  annotation(Icon(graphics={  Rectangle(extent=  {{-40, 40}, {40, -40}}, lineColor=  {0, 0, 255}), Text(extent=  {{-30, 10}, {28, -10}}, lineColor=  {0, 0, 255}, textStyle=  {TextStyle.Bold}, textString=  "AND")}), Diagram(graphics),
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
end ImAnd;
