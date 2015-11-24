within iPSL.Electrical.Sensors;
model PwCurrent "Current sensor"

  iPSL.Connectors.PwPin p annotation (Placement(transformation(extent={{-60,-10},
            {-40,10}}), iconTransformation(extent={{-60,-10},{-40,10}})));
  iPSL.Connectors.PwPin n annotation (Placement(transformation(extent={{40,10},
            {60,30}}), iconTransformation(extent={{40,10},{60,30}})));
  Modelica.Blocks.Interfaces.RealOutput outp annotation(Placement(transformation(extent = {{39, -30}, {59, -10}}), iconTransformation(extent = {{39, -30}, {59, -10}})));
equation
  n.vr = p.vr;
  n.vi = p.vi;
  n.ir = -p.ir;
  n.ii = -p.ii;
  outp = sqrt(p.ir * p.ir + p.ii * p.ii) annotation(Icon(graphics={  Rectangle(extent = {{-40, 40}, {40, -40}}, lineColor = {0, 0, 255}), Rectangle(extent = {{-30, 32}, {30, -32}}, lineColor = {0, 0, 255}), Rectangle(extent = {{-20, 20}, {20, 0}}, lineColor = {0, 0, 255}), Text(extent = {{-26, -12}, {-6, -28}}, lineColor = {0, 0, 255}, textStyle = {TextStyle.Bold}, textString = "I"), Line(points = {{0, 0}, {10, 10}}, color = {0, 0, 255}, smooth = Smooth.None)}), Diagram(graphics));
  annotation(Icon(graphics = {Text(extent=  {{-68, 20}, {-60, 14}}, lineColor=  {0, 0, 255}, textString=  "p"), Text(extent=  {{58, 40}, {66, 34}}, lineColor=  {0, 0, 255}, textString=  "p"), Text(extent=  {{-66, 20}, {-58, 14}}, lineColor=  {0, 0, 255}, textString=  "p"), Text(extent=  {{56, 40}, {64, 34}}, lineColor=  {0, 0, 255}, textString=  "n"), Text(extent=  {{-66, 22}, {-58, 16}}, lineColor=  {0, 0, 255}, textString=  "p"), Text(extent=  {{56, 42}, {64, 36}}, lineColor=  {0, 0, 255}, textString=  "p"), Text(extent=  {{-68, 22}, {-60, 16}}, lineColor=  {0, 0, 255}, textString=  "p"), Text(extent=  {{52, -4}, {60, -10}}, lineColor=  {0, 0, 255}, textString=  "outp")}), Diagram(graphics),
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
end PwCurrent;
