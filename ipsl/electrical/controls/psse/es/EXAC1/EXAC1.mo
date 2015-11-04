within iPSL.Electrical.Controls.PSSE.ES.EXAC1;
model EXAC1

  iPSL.NonElectrical.Math.ImSum2 imSum2_1(
    a0=0,
    a1=1,
    a2=-1) annotation (Placement(transformation(extent={{-50,-38},{-30,-18}})));
  iPSL.NonElectrical.Math.ImSetPoint Vref(V=VREF)
    annotation (Placement(transformation(extent={{-68,-22},{-44,2}})));
  iPSL.NonElectrical.Math.ImSum3 imSum3_1(
    a0=0,
    a2=1,
    a1=-1,
    a3=1) annotation (Placement(transformation(extent={{-34,-38},{-14,-18}})));
  iPSL.NonElectrical.Math.ImSum2 imSum2_2(
    a0=0,
    a1=1,
    a2=1) annotation (Placement(transformation(extent={{-72,-62},{-52,-42}})));
  Modelica.Blocks.Interfaces.RealInput XADIFD "Field current" annotation (
      Placement(transformation(extent={{-104,54},{-94,66}}), iconTransformation(
          extent={{-104,54},{-94,66}})));
  Modelica.Blocks.Interfaces.RealInput ECOMP
    "Compensated generator terminal voltage" annotation (Placement(transformation(
          extent={{-104,14},{-94,26}}), iconTransformation(extent={{-104,14},{-94,
            26}})));
  Modelica.Blocks.Interfaces.RealInput VOTHSG "PSS output signal" annotation(Placement(transformation(extent={{-104,
            -26},{-94,-14}}), iconTransformation(extent={{-104,-26},{-94,-14}})));
  Modelica.Blocks.Interfaces.RealInput VOEL "OEL output" annotation(Placement(transformation(extent={{-104,
            -66},{-94,-54}}), iconTransformation(extent={{-104,-66},{-94,-54}})));
  iPSL.NonElectrical.Continuous.ImSimpleLag_nowinduplimit imLimitedSimpleLag(
    K=K_A,
    T=T_A,
    Ymin=V_RMIN,
    Ymax=V_RMAX,
    nStartValue=0)
    annotation (Placement(transformation(extent={{-22,-46},{36,-10}})));
  iPSL.NonElectrical.Continuous.ImIntegrator imIntegrator(K=1/T_E, nStartValue=
        vf00) annotation (Placement(transformation(extent={{54,-36},{74,-16}})));
  iPSL.NonElectrical.Continuous.ImLimited imLimited_min(Ymin=0.000001, Ymax=
        Modelica.Constants.inf)
    annotation (Placement(transformation(extent={{68,-36},{88,-16}})));
  iPSL.NonElectrical.Math.ImGain imGain(K=K_D)
    annotation (Placement(transformation(extent={{-80,-12},{-60,8}})));
  iPSL.NonElectrical.Math.ImDiv2 imDiv2_1(
    a0=0,
    a1=1,
    a2=1) annotation (Placement(transformation(extent={{-42,60},{-22,80}})));
  iPSL.NonElectrical.Math.ImGain imGain1(K=K_C)
    annotation (Placement(transformation(extent={{-26,60},{-6,80}})));
  NonElectrical.Nonlinear.ImRelay4
          imRelay(E1 = E_1, E2 = E_2) annotation(Placement(transformation(extent = {{90, 10}, {36, 58}})));
  iPSL.NonElectrical.Math.ImSetPoint imSetPoint(V=S_EE_1)
    annotation (Placement(transformation(extent={{98,34},{78,54}})));
  iPSL.NonElectrical.Math.ImSetPoint imSetPoint1(V=S_EE_2)
    annotation (Placement(transformation(extent={{98,22},{76,44}})));
  iPSL.NonElectrical.Math.ImSetPoint imSetPoint2(V=0)
    annotation (Placement(transformation(extent={{98,44},{78,64}})));
  iPSL.NonElectrical.Math.ImSum2 imSum2_4(
    a0=0,
    a1=1,
    a2=1) annotation (Placement(transformation(extent={{46,26},{26,46}})));
  iPSL.NonElectrical.Math.ImSetPoint imSetPoint3(V=K_E)
    annotation (Placement(transformation(extent={{68,8},{48,28}})));
  iPSL.NonElectrical.Math.ImMult2 imMult2_1(
    a0=0,
    a1=1,
    a2=1) annotation (Placement(transformation(extent={{-20,16},{-40,36}})));
  iPSL.NonElectrical.Math.ImSum2 imSum2_5(
    a0=0,
    a1=1,
    a2=1) annotation (Placement(transformation(extent={{-54,-10},{-34,10}})));
  NonElectrical.Nonlinear.ImFEX
      fEX annotation(Placement(transformation(extent = {{-12, 50}, {30, 90}})));
  iPSL.NonElectrical.Math.ImMult2 imMult2_2(
    a0=0,
    a1=1,
    a2=1) annotation (Placement(transformation(extent={{24,58},{44,78}})));
  Modelica.Blocks.Interfaces.RealOutput EFD "Excitation voltage" annotation(Placement(transformation(extent={{100,-6},
            {110,6}}), iconTransformation(extent={{100,-6},{110,6}})));
  parameter Real VREF = 1 "Reference terminal voltage (pu)";
  parameter Real T_R = 0 "Voltage input time constant (s)";
  parameter Real T_B = 0 "AVR lead-lag time constant (s)";
  parameter Real T_C = 0 "AVR lead-lag time constant (s)";
  parameter Real K_A = 400 "AVR gain (pu)";
  parameter Real T_A = 0.02 "AVR time constant (s)";
  parameter Real V_RMAX = 9 "Maximum AVR output (pu)";
  parameter Real V_RMIN = -5.43 "Minimum AVR output (pu)";
  parameter Real T_E = 0.8 "Exciter time constant (s)";
  parameter Real K_F = 0.03 "Rate feedback gain (pu)";
  parameter Real T_F = 1 "Rate feedback time const (s)";
  parameter Real K_C = 0.2 "Rectifier load factor (pu)";
  parameter Real K_D = 0.48 "Exciter demagnetizing factor (pu)";
  parameter Real K_E = 1 "Exciter field factor (pu)";
  parameter Real E_1 = 5.25 "Exciter saturation point 1 (pu)";
  parameter Real E_2 = 7 "Exciter saturation point 2 (pu)";
  parameter Real S_EE_1 = 0.03 "Saturation at E1";
  parameter Real S_EE_2 = 0.1 "Saturation at E2";
  parameter Real vf00 "Initial field voltage";
  parameter Real if00 "Initial field current";
  iPSL.NonElectrical.Continuous.ImDerivativeLag imDerivativeLag(
    K=K_F,
    T=T_F,
    pStartValue=if00*K_D + vf00)
    annotation (Placement(transformation(extent={{-40,-14},{4,16}})));
  iPSL.NonElectrical.Math.ImSum2 imSum2_3(
    a0=0,
    a2=1,
    a1=-1) annotation (Placement(transformation(extent={{38,-36},{58,-16}})));
equation
  connect(Vref.n1, imSum2_1.p1) annotation(Line(points = {{-50.12, -10}, {-46, -10}, {-46, -26}, {-45.1, -26}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(imSum2_1.n1, imSum3_1.p2) annotation(Line(points = {{-35.1, -28}, {-29.1, -28}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(VOTHSG, imSum2_2.p1) annotation(Line(points={{-99,-20},{-76.5,-20},{-76.5,
          -50},{-67.1,-50}},                                                                                    color = {0, 0, 127}, smooth = Smooth.None));
  connect(VOEL, imSum2_2.p2) annotation(Line(points={{-99,-60},{-74,-60},{-74,-54},
          {-67.1,-54}},                                                                                   color = {0, 0, 127}, smooth = Smooth.None));
  connect(imSum2_2.n1, imSum3_1.p3) annotation(Line(points = {{-57.1, -52}, {-32, -52}, {-32, -31}, {-29.1, -31}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(imIntegrator.n1, imLimited_min.p1) annotation(Line(points = {{68.9, -26}, {72.9, -26}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(XADIFD, imGain.p1) annotation (Line(
      points={{-99,60},{-92,60},{-92,-2},{-75.1,-2}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(imDiv2_1.p1, XADIFD) annotation (Line(
      points={{-37.1,72},{-82,72},{-82,60},{-99,60}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(imLimited_min.n1, imDiv2_1.p2) annotation(Line(points = {{82.9, -26}, {98, -26}, {98, 60}, {-38, 60}, {-38, 68}, {-37.1, 68}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(imDiv2_1.n1, imGain1.p1) annotation(Line(points = {{-27.1, 70}, {-21.1, 70}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(imRelay.p4, imSetPoint1.n1) annotation(Line(points = {{75.96, 31.36}, {78.98, 31.36}, {78.98, 33}, {81.61, 33}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(imSetPoint.n1, imRelay.p3) annotation(Line(points = {{83.1, 44}, {80, 44}, {80, 36.4}, {75.825, 36.4}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(imSetPoint2.n1, imRelay.p2) annotation(Line(points = {{83.1, 54}, {75.825, 54}, {75.825, 41.92}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(imRelay.n1, imSum2_4.p1) annotation(Line(points = {{49.77, 37.84}, {45.885, 37.84}, {45.885, 38}, {41.1, 38}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(imSetPoint3.n1, imSum2_4.p2) annotation(Line(points = {{53.1, 18}, {46, 18}, {46, 34}, {41.1, 34}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(imSum2_4.n1, imMult2_1.p1) annotation(Line(points = {{31.1, 36}, {28, 36}, {28, 28.2}, {-24.9, 28.2}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(imGain.n1, imSum2_5.p2) annotation(Line(points = {{-65.1, -2}, {-49.1, -2}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(imMult2_1.n1, imSum2_5.p1) annotation(Line(points = {{-34.9, 26}, {-56, 26}, {-56, 2}, {-49.1, 2}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(imRelay.p1, imLimited_min.n1) annotation(Line(points = {{75.825, 26.08}, {90, 26.08}, {90, 12}, {98, 12}, {98, -26}, {82.9, -26}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(imGain1.n1, fEX.IN) annotation(Line(points = {{-11.1, 70}, {-3.6, 70}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(fEX.FEX, imMult2_2.p1) annotation(Line(points = {{23.28, 70}, {26.09, 70}, {26.09, 70.2}, {28.9, 70.2}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(imMult2_2.p2, imLimited_min.n1) annotation(Line(points = {{28.9, 65.8}, {24, 65.8}, {24, 60}, {98, 60}, {98, -26}, {82.9, -26}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(imMult2_2.n1, EFD) annotation(Line(points={{38.9,68},{104,68},{104,0},
          {105,0}},                                                                                    color = {0, 0, 127}, smooth = Smooth.None));
  connect(imSum3_1.n1, imLimitedSimpleLag.p1) annotation(Line(points={{-19.1,
          -28},{-7.79,-28}},                                                                         color = {0, 0, 127}, smooth = Smooth.None));
  connect(ECOMP, imSum2_1.p2) annotation (Line(
      points={{-99,20},{-68,20},{-68,-30},{-45.1,-30}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(imSum2_5.n1, imDerivativeLag.p1) annotation(Line(points={{-39.1,0},{
          -32,0},{-32,1},{-39.78,1}},                                                                              color = {0, 0, 127}, smooth = Smooth.None));
  connect(imDerivativeLag.n1, imSum3_1.p1) annotation(Line(points={{4.22,1},{2,
          1},{2,-12},{-34,-12},{-34,-25},{-29.1,-25}},                                                                                    color = {0, 0, 127}, smooth = Smooth.None));
  connect(imMult2_1.p2, imDiv2_1.p2) annotation(Line(points = {{-24.9, 23.8}, {-10, 23.8}, {-10, 60}, {-38, 60}, {-38, 68}, {-37.1, 68}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(imIntegrator.p1, imSum2_3.n1) annotation(Line(points = {{58.9, -26}, {52.9, -26}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(imSum2_3.p1, imDerivativeLag.p1) annotation(Line(points={{42.9,-24},{
          28,-24},{28,12},{-34,12},{-34,1},{-39.78,1}},                                                                                   color = {0, 0, 127}, smooth = Smooth.None));
  connect(imLimitedSimpleLag.n0, imSum2_3.p2) annotation (Line(
      points={{21.21,-28},{42.9,-28}},
      color={0,0,127},
      smooth=Smooth.None));
  annotation(Diagram(coordinateSystem(preserveAspectRatio=false,  extent={{-100,
            -80},{100,80}}),                                                                           graphics={  Text(extent=  {{-64, -14}, {-54, -22}}, lineColor=  {0, 0, 255}, textString=  "Vref"), Text(extent=  {{-56, -52}, {-50, -58}}, lineColor=  {255, 0, 0}, textString=  "Vs"), Text(extent=  {{-14, 78}, {-8, 72}}, lineColor=  {255, 0, 0}, textString=  "I"), Text(extent=  {{-10, 74}, {-8, 74}}, lineColor=  {255, 0, 0}, textString=  "N"), Text(extent=  {{86, 58}, {92, 52}}, lineColor=  {255, 0, 0}, textString=  "0"), Text(extent=  {{86, 38}, {94, 30}}, lineColor=  {255, 0, 0}, textString=  "SE2"), Text(extent=  {{86, 48}, {94, 42}}, lineColor=  {255, 0, 0}, textString=  "SE1"), Text(extent=  {{84, -28}, {90, -34}}, lineColor=  {255, 0, 0}, textString=  "V"), Text(extent=  {{88, -32}, {90, -32}}, lineColor=  {255, 0, 0}, textString=  "E"), Text(extent=  {{-40, -4}, {-30, -10}}, lineColor=  {255, 0, 0}, textString=  "V"), Text(extent=  {{-36, -8}, {-28, -10}}, lineColor=  {255, 0, 0}, textString=  "FE"), Text(extent=  {{30, 2}, {40, -4}}, lineColor=  {255, 0, 0}, textString=  "V"), Text(extent=  {{42, -2}, {36, -4}}, lineColor=  {255, 0, 0}, textString=  "F"), Text(extent=  {{54, 22}, {60, 16}}, lineColor=  {255, 0, 0}, textString=  "K"), Text(extent=  {{58, 18}, {60, 18}}, lineColor=  {255, 0, 0}, textString=  "E"), Text(extent=  {{42, 44}, {48, 38}}, lineColor=  {255, 0, 0}, textString=  "S"), Text(extent=  {{46, 40}, {48, 40}}, lineColor=  {255, 0, 0}, textString=  "E")}), Icon(coordinateSystem(preserveAspectRatio=false,   extent={{-100,
            -80},{100,80}}),                                                                                                    graphics={  Rectangle(extent={{
              -100,80},{100,-80}},                                                                                                    lineColor=  {0, 0, 255}), Text(extent={{
              -92,68},{-60,52}},                                                                                                    lineColor=
              {0,0,255},
          textString="XADIFD"),                                                                                                    Text(extent={{
              -92,-12},{-56,-30}},                                                                                                    lineColor=
              {0,0,255},
          textString="VOTHSG"),                                                                                                    Text(extent={{
              -96,-56},{-64,-66}},                                                                                                    lineColor=  {0, 0, 255}, textString=  "VOEL"), Text(extent={{
              68,8},{98,-8}},                                                                                                    lineColor=  {0, 0, 255}, textString=  "EFD"), Text(extent={{
              -54,34},{52,-28}},                                                                                                    lineColor=  {0, 0, 255}, textString=  "EXAC1"),
                                                                                        Text(extent={{
              -92,26},{-60,16}},                                                                                                    lineColor=
              {0,0,255},
          textString="ECOMP")}),
    Documentation(info="<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\">
<tr>
<td><p>Reference</p></td>
<td>Excitation System (EXAC1), PSSE manual</td>
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
end EXAC1;
