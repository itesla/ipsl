within iPSL.Electrical.Controls.PSSE.OEL;
model OEL

  Modelica.Blocks.Interfaces.RealInput IFD "Field current" annotation(Placement(transformation(extent = {{-84, 32}, {-74, 44}}), iconTransformation(extent = {{-72, 32}, {-82, 44}})));
  iPSL.NonElectrical.Math.ImSum2 imSum2_1(
    a0=0,
    a1=1,
    a2=-1) annotation (Placement(transformation(extent={{-66,30},{-46,50}})));
  iPSL.NonElectrical.Math.ImSetPoint IFDSetpoint(V=IFDdes)
    annotation (Placement(transformation(extent={{-78,48},{-58,68}})));
  iPSL.NonElectrical.Continuous.ImIntegratornonwindup imLimitedIntegrator(
    Ymin=Vmin,
    Ymax=Vmax,
    K=KMX,
    nStartValue=0)
    annotation (Placement(transformation(extent={{-10,44},{26,80}})));
  Modelica.Blocks.Interfaces.RealOutput VOEL "OEL output" annotation(Placement(transformation(extent = {{72, 32}, {82, 44}}), iconTransformation(extent = {{72, 32}, {82, 44}})));
  parameter Real IFD1 = 1.1 "Low OEL limit (pu)";
  parameter Real IFD2 = 1.2 "Medium OEL limit (pu)";
  parameter Real IFD3 = 1.5 "High OEL limit (pu)";
  parameter Real TIME1 = 60 "Timing for low OEL (s)";
  parameter Real TIME2 = 30 "Timimg for medium OEL (s)";
  parameter Real TIME3 = 15 "Timing for high OEL (s)";
  parameter Real IFDdes = 1 "IFD setpoint (pu)";
  parameter Real Vmax = 0 "Max. OEL output (pu)";
  parameter Real Vmin = -0.05 "Min. OEL output (pu)";
  parameter Real KMX = 1 "Control constant";
  iPSL.NonElectrical.Logical.IF_comparisor compasitor(
    HighCurrentLimit=IFD3,
    MediumCurrentLimit=IFD2,
    LowCurrentLimit=IFD1)
    annotation (Placement(transformation(extent={{-52,18},{-12,58}})));
  iPSL.NonElectrical.Continuous.ImIntegratornonwindup imLimitedIntegrator1(
    Ymin=Vmin,
    Ymax=Vmax,
    K=KMX,
    nStartValue=6)
    annotation (Placement(transformation(extent={{-10,24},{26,60}})));
  iPSL.NonElectrical.Continuous.ImIntegratornonwindup imLimitedIntegrator2(
    Ymin=Vmin,
    Ymax=Vmax,
    K=KMX,
    nStartValue=6)
    annotation (Placement(transformation(extent={{-10,4},{26,40}})));
  iPSL.NonElectrical.Continuous.ImIntegratornonwindup imLimitedIntegrator3(
    Ymin=Vmin,
    Ymax=Vmax,
    K=KMX,
    nStartValue=7.5)
    annotation (Placement(transformation(extent={{-10,-14},{26,22}})));
  iPSL.NonElectrical.Math.ImSum4 imSum4_1(
    a0=0,
    a1=1,
    a2=1,
    a3=1,
    a4=1) annotation (Placement(transformation(extent={{22,14},{68,62}})));
equation
  connect(IFDSetpoint.n1, imSum2_1.p1) annotation(Line(points = {{-63.1, 58}, {-62, 58}, {-62, 42}, {-61.1, 42}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(IFD, imSum2_1.p2) annotation(Line(points = {{-79, 38}, {-61.1, 38}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(imSum2_1.n1, compasitor.p) annotation(Line(points = {{-51.1, 40}, {-48, 40}, {-48, 40.8}, {-46.8, 40.8}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(compasitor.n1, imLimitedIntegrator.p1) annotation(Line(points = {{-20.4, 48.8}, {-11.2, 48.8}, {-11.2, 62}, {-1.18, 62}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(compasitor.n2, imLimitedIntegrator1.p1) annotation(Line(points = {{-20.4, 42}, {-1.18, 42}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(compasitor.n3, imLimitedIntegrator2.p1) annotation(Line(points = {{-20.4, 34.4}, {-8, 34.4}, {-8, 22}, {-1.18, 22}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(compasitor.n4, imLimitedIntegrator3.p1) annotation(Line(points = {{-20.4, 28}, {-18, 28}, {-18, 4}, {-1.18, 4}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(imSum4_1.n1, VOEL) annotation(Line(points = {{56.27, 38}, {77, 38}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(imLimitedIntegrator1.n0, imSum4_1.p2) annotation (Line(
      points={{16.82,42},{26,42},{26,39.92},{33.27,39.92}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(imLimitedIntegrator.n0, imSum4_1.p1) annotation (Line(
      points={{16.82,62},{22,62},{22,50},{33.27,50},{33.27,45.68}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(imLimitedIntegrator2.n0, imSum4_1.p3) annotation (Line(
      points={{16.82,22},{20,22},{20,34},{33.27,34},{33.27,34.64}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(imLimitedIntegrator3.n0, imSum4_1.p4) annotation (Line(
      points={{16.82,4},{28,4},{28,29.36},{33.27,29.36}},
      color={0,0,127},
      smooth=Smooth.None));
  annotation(Diagram(coordinateSystem(preserveAspectRatio=false,  extent={{-100,
            -20},{100,80}})),                                                                                     Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -20}, {100, 80}}), graphics={  Rectangle(extent=  {{-72, 68}, {72, 4}}, lineColor=  {0, 0, 255}), Text(extent=  {{-36, 54}, {38, 26}}, lineColor=  {0, 0, 255}, textString=  "OEL"), Text(extent=  {{-70, 42}, {-46, 32}}, lineColor=  {0, 0, 255}, textString=  "IFD/EFD"), Text(extent=  {{54, 42}, {72, 34}}, lineColor=  {0, 0, 255}, textString=  "VOEL")}),
    Documentation(info="<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\">
<tr>
<td><p>Reference</p></td>
<td>Over Excitation Limiter, PSSE manual</td>
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
