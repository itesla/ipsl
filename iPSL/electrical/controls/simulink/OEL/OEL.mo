within iPSL.Electrical.Controls.Simulink.OEL;
model OEL "OverExcitation Limiter"
  parameter Real ifd_lim "OEL parameter";
  parameter Real r "OEL parameter";
  parameter Real f "OEL parameter";
  parameter Real L1 "OEL parameter";
  parameter Real init_OEL_Timer = L1 "Initial output value";
  iPSL.NonElectrical.Math.ImSetPoint ifd_lim_value(V=ifd_lim)
    "Limitation of filed current"
    annotation (Placement(transformation(extent={{-104,-32},{-68,-2}})));
  iPSL.NonElectrical.Math.ImSum2 imSum2_1(
    a0=0,
    a1=1,
    a2=-1) annotation (Placement(transformation(extent={{-64,2},{-42,22}})));
  iPSL.NonElectrical.Logical.SaturationBlockTan block_1_1(r=r, f=f)
    annotation (Placement(transformation(extent={{-42,-16},{18,38}})));
  NonElectrical.Continuous.ImIntegratornonwindup            Timer(           K = 1, nStartValue = init_OEL_Timer,
    Ymax=10000.0,
    Ymin=L1)                                                                                                     annotation(Placement(transformation(extent = {{6, 4}, {26, 24}})));
  iPSL.NonElectrical.Math.ImGain imGain(K=-1)
    annotation (Placement(transformation(extent={{6,18},{26,38}})));
  Modelica.Blocks.Interfaces.RealInput ifd "Field current" annotation(Placement(transformation(extent = {{-94, -4}, {-76, 16}}), iconTransformation(extent = {{-94, -4}, {-76, 16}})));
  Modelica.Blocks.Interfaces.RealInput VolContinput "Voltage control input" annotation(Placement(transformation(extent = {{-94, -48}, {-76, -28}}), iconTransformation(extent = {{-94, -48}, {-76, -28}})));
  iPSL.NonElectrical.Logical.Switch switch
    annotation (Placement(transformation(extent={{18,-16},{92,42}})));
  iPSL.NonElectrical.Math.Min min1
    annotation (Placement(transformation(extent={{66,2},{86,22}})));
  Modelica.Blocks.Interfaces.RealOutput OEL_output annotation(Placement(transformation(extent = {{74, -30}, {94, -10}}), iconTransformation(extent = {{74, -30}, {94, -10}})));
equation
  connect(ifd_lim_value.n1, imSum2_1.p2) annotation(Line(points = {{-77.18, -17}, {-77.18, 0.5}, {-58.61, 0.5}, {-58.61, 10}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(imSum2_1.n1, block_1_1.p1) annotation(Line(points = {{-47.61, 12}, {-34.305, 12}, {-34.305, 11.54}, {-33, 11.54}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(block_1_1.n1, Timer.p1) annotation(Line(points = {{3, 11.27}, {6.5, 11.27}, {6.5, 14}, {10.9, 14}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(imGain.p1, imSum2_1.n1) annotation(Line(points = {{10.9, 28}, {-40, 28}, {-40, 12}, {-47.61, 12}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(ifd, imSum2_1.p1) annotation(Line(points = {{-85, 6}, {-72, 6}, {-72, 14}, {-58.61, 14}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(imGain.n1, switch.if_in) annotation(Line(points = {{20.9, 28}, {26, 28}, {26, 18.8}, {33.54, 18.8}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(VolContinput, switch.V_input) annotation(Line(points = {{-85, -38}, {25.5, -38}, {25.5, 8.94}, {33.54, 8.94}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(switch.n1, min1.p1) annotation(Line(points = {{60.92, 14.45}, {65.46, 14.45}, {65.46, 13.4}, {70, 13.4}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(VolContinput, min1.p2) annotation(Line(points = {{-85, -38}, {66, -38}, {66, 8.2}, {70, 8.2}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(min1.n1, OEL_output) annotation(Line(points = {{82.4, 11.8}, {90, 11.8}, {90, -6}, {74, -6}, {74, -20}, {84, -20}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(Timer.n0, switch.y) annotation (Line(
      points={{20.9,14},{28,14},{28,13.58},{33.54,13.58}},
      color={0,0,127},
      smooth=Smooth.None));
  annotation(Diagram(coordinateSystem(preserveAspectRatio=true,   extent={{-100,
            -100},{100,100}}),                                                                           graphics), Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics={  Rectangle(extent=  {{-74, 26}, {74, -62}}, lineColor=  {0, 0, 127}), Text(extent=  {{-84, 6}, {-36, -14}}, lineColor=  {0, 0, 255},
            fillPattern=                                                                                                    FillPattern.Solid, textString=  "ifd"), Text(extent=  {{-86, -38}, {-40, -54}}, lineColor=  {0, 0, 255},
            fillPattern=                                                                                                    FillPattern.Solid, textString=  "V"), Text(extent=  {{-52, 6}, {58, -42}}, lineColor=  {0, 0, 255},
            fillPattern=                                                                                                    FillPattern.Solid, textString=  "OEL")}),
    Documentation(info="<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\">
<tr>
<td><p>Reference</p></td>
<td>Over Excitation Limiter</td>
</tr>
<tr>
<td><p>Last update</p></td>
<td>2015-10-02</td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p>Le Qi, SmarTS Lab, KTH Royal Institute of Technology</p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p><a href=\"mailto:luigiv@kth.se\">luigiv@kth.se</a></p></td>
</tr>
</table>
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
end OEL;
