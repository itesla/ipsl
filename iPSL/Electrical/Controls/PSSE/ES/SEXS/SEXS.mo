within iPSL.Electrical.Controls.PSSE.ES.SEXS;
model SEXS "Simplified excitation system model"
  parameter Real Ec0;
  parameter Real T_AT_B;
  parameter Real T_B;
  parameter Real K;
  parameter Real T_E;
  parameter Real E_MIN;
  parameter Real E_MAX;
  Modelica.Blocks.Interfaces.RealInput ECOMP annotation(Placement(transformation(extent = {{-102, -4}, {-92, 8}}), iconTransformation(extent={{-68,44},
            {-58,54}})));
  Modelica.Blocks.Interfaces.RealOutput EFD annotation(Placement(transformation(extent={{58,-6},
            {70,6}}),                                                                                           iconTransformation(extent={{58,-6},
            {70,6}})));
  Modelica.Blocks.Math.Add3 V_erro(k3 = 1, k1 = 1, k2 = -1) annotation(Placement(transformation(extent = {{-52, -6}, {-36, 10}})));
  NonElectrical.Continuous.ImSimpleLag_nowinduplimit
                       VR(Ymin = E_MIN, Ymax = E_MAX, T = T_E, K = K, nStartValue = Efd0) annotation(Placement(transformation(extent = {{6, -16}, {70, 22}})));
  Modelica.Blocks.Interfaces.RealInput VOTHSG(start = 0) "PSS output Upss" annotation(Placement(transformation(extent = {{-102, -14}, {-92, -4}}), iconTransformation(extent={{-68,24},
            {-58,34}})));
  Modelica.Blocks.Interfaces.RealInput VOEL "OEL output" annotation(Placement(transformation(extent = {{-102, -24}, {-92, -14}}), iconTransformation(extent={{-68,6},
            {-58,16}})));
  Modelica.Blocks.Interfaces.RealInput VUEL annotation(Placement(transformation(extent = {{-102, -34}, {-92, -24}}), iconTransformation(extent={{-68,-14},
            {-58,-4}})));
  iPSL.NonElectrical.Math.ImSum3 Vs(
    a0=0,
    a1=1,
    a2=1,
    a3=1) annotation (Placement(transformation(extent={{-82,-50},{-54,12}})));
protected
  parameter Real Efd0(fixed = false);
  //
  parameter Real VREF(fixed = false);
  //=Efd0/KA+VT0+Vs.a0 "Reference terminal voltage (pu)";
public
  iPSL.NonElectrical.Math.ImSetPoint V_REF(V=VREF)
    annotation (Placement(transformation(extent={{-82,8},{-52,28}})));
  Modelica.Blocks.Interfaces.RealInput EFD0 annotation(Placement(transformation(extent = {{-102, 10}, {-92, 24}}), iconTransformation(extent={{-68,-56},
            {-58,-46}})));
  iPSL.NonElectrical.Continuous.ImLeadLag imLeadLag(
    K=1,
    T2=T_B,
    nStartValue=Efd0/K,
    T1=T_AT_B*T_B)
    annotation (Placement(transformation(extent={{-50,-28},{34,34}})));
initial algorithm
  Efd0 := EFD0;
  VREF := Efd0 / K + Ec0 - Vs.a0;

equation
  connect(ECOMP, V_erro.u2) annotation(Line(points = {{-97, 2}, {-53.6, 2}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(VUEL, Vs.p3) annotation(Line(points = {{-97, -29}, {-97, -29.5}, {-75.14, -29.5}, {-75.14, -28.3}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(Vs.n1, V_erro.u3) annotation(Line(points = {{-61.14, -19}, {-60, -19}, {-60, -4.4}, {-53.6, -4.4}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(V_erro.u1, V_REF.n1) annotation(Line(points = {{-53.6, 8.4}, {-58, 8.4}, {-58, 18}, {-59.65, 18}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(imLeadLag.p1, V_erro.y) annotation(Line(points = {{-29.42, 3}, {-26.59, 3}, {-26.59, 2}, {-35.2, 2}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(imLeadLag.n1, VR.p1) annotation(Line(points = {{12.58, 3}, {21.68, 3}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(VOEL, Vs.p2) annotation(Line(points = {{-97, -19}, {-75.14, -19}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(VOTHSG, Vs.p1) annotation(Line(points = {{-97, -9}, {-76.5, -9}, {-76.5, -9.7}, {-75.14, -9.7}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(VR.n0, EFD) annotation(Line(points={{53.68,3},{77.84,3},{
          77.84,0},{64,0}},                                                                     color = {0, 0, 127}, smooth = Smooth.None));
  annotation(Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-120, -120}, {140, 80}}), graphics={  Text(extent=  {{-92, 26}, {-80, 16}}, lineColor=  {0, 0, 255}, textString=  "Efd0"), Text(extent=  {{-94, 4}, {-76, -14}}, lineColor=  {0, 0, 255}, textString=  "VOTHSG "), Text(extent=  {{-98, -12}, {-72, -18}}, lineColor=  {0, 0, 255}, textString=  " VOEL"), Text(extent=  {{-100, -22}, {-70, -28}}, lineColor=  {0, 0, 255}, textString=  " VUEL "), Text(extent=  {{-94, 10}, {-76, -2}}, lineColor=  {0, 0, 255}, textString=  "Ecomp
             "), Text(extent=  {{-58, 22}, {-48, 12}}, lineColor=  {0, 0, 255}, textString=  "Vref")}), Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-120, -120}, {140, 80}}), graphics={  Text(extent={{
              -22,10},{24,-12}},                                                                                                    lineColor = {0, 0, 255}, textString = "SEXS"), Rectangle(extent={{
              -60,60},{60,-60}},                                                                                                    lineColor = {0, 0, 255}), Text(extent={{
              -56,38},{-26,20}},                                                                                                    lineColor = {0, 0, 255}, textString = "VOTHSG "), Text(extent={{
              46,18},{68,6}},                                                                                                    lineColor = {0, 0, 255}, textString = "EFD"), Text(extent={{
              -68,-4},{-22,-14}},                                                                                                    lineColor = {0, 0, 255}, textString = " VUEL "), Text(extent={{
              -70,16},{-22,6}},                                                                                                    lineColor = {0, 0, 255}, textString = " VOEL"), Text(extent={{
              -56,-40},{-40,-62}},                                                                                                    lineColor = {0, 0, 255}, textString = "Efd0"), Text(extent={{
              -56,54},{-28,44}},                                                                                                    lineColor = {0, 0, 255}, textString = "ECOMP")}),
    Documentation(info="<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\">
<tr>
<td><p>Reference</p></td>
<td>PSS/E Manual</td>
</tr>
<tr>
<td><p>Last update</p></td>
<td>Unknown</td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p>Mengjia Zhang,SmarTS Lab, KTH Royal Institute of Technology</p></td>
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
end SEXS;
