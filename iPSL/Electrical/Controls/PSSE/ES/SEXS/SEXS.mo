within iPSL.Electrical.Controls.PSSE.ES.SEXS;
model SEXS "Simplified excitation system model"
  parameter Real Ec0;
  parameter Real T_AT_B;
  parameter Real T_B;
  parameter Real K;
  parameter Real T_E;
  parameter Real E_MIN;
  parameter Real E_MAX;
  Modelica.Blocks.Interfaces.RealInput ECOMP annotation(Placement(transformation(extent = {{-102, -4}, {-92, 8}}), iconTransformation(extent={{-100,44},
            {-88,56}})));
  Modelica.Blocks.Interfaces.RealOutput EFD annotation(Placement(transformation(extent={{100,-6},
            {112,6}}),                                                                                          iconTransformation(extent={{100,-6},
            {112,6}})));
  Modelica.Blocks.Math.Add3 V_erro(k3 = 1, k1 = 1, k2 = -1) annotation(Placement(transformation(extent = {{-52, -6}, {-36, 10}})));
  Modelica.Blocks.Interfaces.RealInput VOTHSG(start = 0) "PSS output Upss" annotation(Placement(transformation(extent = {{-102, -14}, {-92, -4}}), iconTransformation(extent={{-100,24},
            {-88,36}})));
  Modelica.Blocks.Interfaces.RealInput VOEL "OEL output" annotation(Placement(transformation(extent = {{-102, -24}, {-92, -14}}), iconTransformation(extent={{-100,-6},
            {-88,6}})));
  Modelica.Blocks.Interfaces.RealInput VUEL annotation(Placement(transformation(extent = {{-102, -34}, {-92, -24}}), iconTransformation(extent={{-100,
            -36},{-88,-24}})));
protected
  parameter Real Efd0(fixed = false);
  //
  parameter Real VREF(fixed = false);
  //=Efd0/KA+VT0+Vs.a0 "Reference terminal voltage (pu)";
public
  Modelica.Blocks.Interfaces.RealInput EFD0 annotation(Placement(transformation(extent = {{-102, 10}, {-92, 24}}), iconTransformation(extent={{-100,
            -56},{-88,-44}})));
  iPSL.NonElectrical.Continuous.LeadLag imLeadLag(
    K=1,
    T2=T_B,
    y_start=Efd0/K,
    T1=T_AT_B*T_B)
    annotation (Placement(transformation(extent={{-26,-8},{-6,12}})));
  Modelica.Blocks.Sources.Constant const(k=VREF)
    annotation (Placement(transformation(extent={{-92,40},{-72,60}})));
  Modelica.Blocks.Math.Add3 add3_1
    annotation (Placement(transformation(extent={{-82,-28},{-62,-8}})));
  NonElectrical.Continuous.SimpleLagLim simpleLagLim(
    K=K,
    T=T_E,
    y_start=Efd0,
    outMax=E_MAX,
    outMin=E_MIN)
    annotation (Placement(transformation(extent={{20,-8},{40,12}})));
initial algorithm
  Efd0 := EFD0;
  VREF := Efd0 / K + Ec0 - add3_1.y;

equation
  connect(ECOMP, V_erro.u2) annotation(Line(points = {{-97, 2}, {-53.6, 2}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(V_erro.y, imLeadLag.u)
    annotation (Line(points={{-35.2,2},{-28,2}}, color={0,0,127}));
  connect(const.y, V_erro.u1) annotation (Line(points={{-71,50},{-62,50},{-62,8.4},
          {-53.6,8.4}}, color={0,0,127}));
  connect(VOTHSG, add3_1.u1) annotation (Line(points={{-97,-9},{-87.5,-9},{-87.5,
          -10},{-84,-10}}, color={0,0,127}));
  connect(VOEL, add3_1.u2) annotation (Line(points={{-97,-19},{-86.5,-19},{-86.5,
          -18},{-84,-18}}, color={0,0,127}));
  connect(VUEL, add3_1.u3) annotation (Line(points={{-97,-29},{-86.5,-29},{-86.5,
          -26},{-84,-26}}, color={0,0,127}));
  connect(add3_1.y, V_erro.u3) annotation (Line(points={{-61,-18},{-58,-18},{-58,
          -4.4},{-53.6,-4.4}}, color={0,0,127}));
  connect(imLeadLag.y, simpleLagLim.u)
    annotation (Line(points={{-5,2},{6.5,2},{18,2}}, color={0,0,127}));
  connect(simpleLagLim.y, EFD)
    annotation (Line(points={{41,2},{106,2},{106,0}}, color={0,0,127}));
  annotation(Diagram(coordinateSystem(preserveAspectRatio=false,   extent={{-100,
            -80},{100,80}}),                                                                            graphics={  Text(extent = {{-92, 26}, {-80, 16}}, lineColor = {0, 0, 255}, textString = "Efd0"), Text(extent = {{-94, 4}, {-76, -14}}, lineColor = {0, 0, 255}, textString = "VOTHSG "), Text(extent = {{-98, -12}, {-72, -18}}, lineColor = {0, 0, 255}, textString = " VOEL"), Text(extent = {{-100, -22}, {-70, -28}}, lineColor = {0, 0, 255}, textString = " VUEL "), Text(extent = {{-94, 10}, {-76, -2}}, lineColor = {0, 0, 255}, textString = "Ecomp
             "), Text(extent = {{-58, 22}, {-48, 12}}, lineColor = {0, 0, 255}, textString = "Vref")}), Icon(coordinateSystem(preserveAspectRatio=false,   extent={{-100,
            -80},{100,80}}),                                                                                                    graphics={  Text(extent={{
              -22,10},{24,-12}},                                                                                                    lineColor = {0, 0, 255}, textString = "SEXS"), Rectangle(extent={{
              -100,80},{100,-80}},                                                                                                  lineColor = {0, 0, 255}), Text(extent={{
              -84,38},{-54,20}},                                                                                                    lineColor = {0, 0, 255}, textString = "VOTHSG "), Text(extent={{
              76,6},{98,-6}},                                                                                                    lineColor = {0, 0, 255}, textString = "EFD"), Text(extent={{
              -96,-26},{-50,-36}},                                                                                                   lineColor = {0, 0, 255}, textString = " VUEL "), Text(extent={{
              -98,4},{-50,-6}},                                                                                                    lineColor = {0, 0, 255}, textString = " VOEL"), Text(extent={{
              -86,-38},{-62,-64}},                                                                                                    lineColor=
              {0,0,255},
          textString="EFD0"),                                                                                                    Text(extent={{
              -84,54},{-56,44}},                                                                                                    lineColor = {0, 0, 255}, textString = "ECOMP")}),
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
