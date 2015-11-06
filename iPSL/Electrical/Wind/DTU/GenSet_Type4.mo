within iPSL.Electrical.Wind.DTU;
model GenSet_Type4 "Generator Type 4 Set Model. Developed by DTU"
  parameter Real Tg;
  parameter Real diPmax;
  parameter Real diQmin;
  parameter Real diQmax;
  parameter Real ini_iPref;
  parameter Real ini_iQref;
  Modelica.Blocks.Interfaces.RealInput iPmax annotation(Placement(transformation(extent = {{-51, 34}, {-41, 46}})));
  Modelica.Blocks.Interfaces.RealInput iPcmd annotation(Placement(transformation(extent = {{-51, 10}, {-41, 22}})));
  Modelica.Blocks.Interfaces.RealInput iQmax annotation(Placement(transformation(extent = {{-51, -46}, {-41, -34}})));
  Modelica.Blocks.Interfaces.RealInput iQcmd annotation(Placement(transformation(extent = {{-51, -22}, {-41, -10}})));
  Modelica.Blocks.Interfaces.RealOutput iPref annotation(Placement(transformation(extent = {{25, 14}, {35, 26}}), iconTransformation(extent = {{25, 14}, {35, 26}})));
  Modelica.Blocks.Interfaces.RealOutput iQref annotation(Placement(transformation(extent = {{25, -26}, {35, -14}}), iconTransformation(extent = {{25, -26}, {35, -14}})));
  iPSL.NonElectrical.Math.ImSetPoint imSetPoint(V=-999)
    annotation (Placement(transformation(extent={{-38,-2},{-18,14}})));
  iPSL.NonElectrical.Math.ImGain imGain2(K=-1)
    annotation (Placement(transformation(extent={{-28,-36},{-8,-16}})));
  iPSL.NonElectrical.Continuous.ImSimpleLag_varnonwindup imSimpleLag_varnonwindup(
    T=Tg,
    rmax=diPmax,
    initValue=ini_iPref,
    rmin=-999) annotation (Placement(transformation(extent={{-16,8},{4,28}})));
  iPSL.NonElectrical.Continuous.ImSimpleLag_varnonwindup imSimpleLag_varnonwindup1(
    T=Tg,
    rmin=diQmin,
    rmax=diQmax,
    initValue=ini_iQref)
    annotation (Placement(transformation(extent={{-12,-26},{8,-6}})));
equation
  connect(imSimpleLag_varnonwindup.yi, iPcmd) annotation(Line(points = {{-12.7, 18}, {-28, 18}, {-28, 16}, {-46, 16}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(imSimpleLag_varnonwindup.yo, iPref) annotation(Line(points = {{0.6, 17.9}, {14.3, 17.9}, {14.3, 20}, {30, 20}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(imSetPoint.n1, imSimpleLag_varnonwindup.min) annotation(Line(points = {{-23.1, 6}, {-16, 6}, {-16, 12}, {-7.5, 12}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(imSimpleLag_varnonwindup.max, iPmax) annotation(Line(points = {{-2.9, 24}, {-22, 24}, {-22, 40}, {-46, 40}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(imSimpleLag_varnonwindup1.yi, iQcmd) annotation(Line(points = {{-8.7, -16}, {-46, -16}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(imSimpleLag_varnonwindup1.yo, iQref) annotation(Line(points = {{4.6, -16.1}, {30, -16.1}, {30, -20}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(imGain2.n1, imSimpleLag_varnonwindup1.min) annotation(Line(points = {{-13.1, -26}, {-8, -26}, {-8, -22}, {-3.5, -22}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(imSimpleLag_varnonwindup1.max, imGain2.p1) annotation(Line(points = {{1.1, -10}, {-26, -10}, {-26, -26}, {-23.1, -26}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(iQmax, imGain2.p1) annotation(Line(points = {{-46, -40}, {-36, -40}, {-36, -26}, {-23.1, -26}}, color = {0, 0, 127}, smooth = Smooth.None));
  annotation(Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-55, -60}, {55, 55}}, initialScale = 0.1, grid = {2, 2}), graphics), Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-55, -60}, {55, 55}}, initialScale = 0.1, grid = {2, 2}), graphics={  Rectangle(extent=  {{-40, 40}, {26, -40}}, lineColor=  {0, 0, 255},
            lineThickness=                                                                                                    0.5), Text(extent=  {{-18, 8}, {8, -8}}, lineColor=  {0, 0, 255},
            lineThickness=                                                                                                    0.5,
            fillPattern=                                                                                                    FillPattern.Solid, textString=  "Type 4
Gen Set"),
   Text(extent=  {{-38, 36}, {-26, 30}}, lineColor=  {0, 0, 255}, textString=  "i_Pmax"), Text(extent=  {{-38, 18}, {-26, 12}}, lineColor=  {0, 0, 255}, textString=  "i_Pcmd"), Text(extent=  {{-38, -10}, {-26, -16}}, lineColor=  {0, 0, 255}, textString=  "i_Qcmd"), Text(extent=  {{-38, -32}, {-26, -38}}, lineColor=  {0, 0, 255}, textString=  "i_Qmax"), Text(extent=  {{11, 24}, {23, 18}}, lineColor=  {0, 0, 255}, textString=  "i_Pref"), Text(extent=  {{10, -17}, {22, -23}}, lineColor=  {0, 0, 255}, textString=  "i_Qref")}),
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
end GenSet_Type4;
