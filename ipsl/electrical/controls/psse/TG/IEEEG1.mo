within iPSL.Electrical.Controls.PSSE.TG;
model IEEEG1

  Modelica.Blocks.Interfaces.RealInput SPEED_HP
    "Machine speed deviation from nominal (pu)" annotation (Placement(
        transformation(extent={{-132,4},{-122,16}}), iconTransformation(extent={
            {-152,-16},{-122,16}})));
  iPSL.NonElectrical.Continuous.ImLeadLag imLeadLag(
    K=K,
    T1=T_2,
    T2=T_1,
    nStartValue=0)
    annotation (Placement(transformation(extent={{-96,-8},{-44,30}})));
  iPSL.NonElectrical.Math.ImSum3 imSum3_1(
    a0=0,
    a2=-1,
    a1=1,
    a3=-1) annotation (Placement(transformation(extent={{-52,0},{-30,22}})));
  iPSL.NonElectrical.Math.ImGain imGain(K=1/T_3)
    annotation (Placement(transformation(extent={{-36,0},{-14,22}})));
  iPSL.NonElectrical.Continuous.ImLimited imLimited(Ymin=U_c, Ymax=U_o)
    annotation (Placement(transformation(extent={{-18,0},{2,22}})));
  NonElectrical.Continuous.ImIntegratornonwindup            imLimitedIntegrator(Ymin = P_MIN, Ymax = P_MAX, K = 1, nStartValue = P0) annotation(Placement(transformation(extent = {{0, 0}, {20, 22}})));
  iPSL.NonElectrical.Continuous.ImSimpleLag imSimpleLag(
    K=1,
    T=T_4,
    nStartValue=P0)
    annotation (Placement(transformation(extent={{6,-8},{60,30}})));
  iPSL.NonElectrical.Continuous.ImSimpleLag imSimpleLag1(
    K=1,
    T=T_5,
    nStartValue=P0)
    annotation (Placement(transformation(extent={{42,-8},{96,30}})));
  iPSL.NonElectrical.Continuous.ImSimpleLag imSimpleLag2(
    K=1,
    T=T_6,
    nStartValue=P0)
    annotation (Placement(transformation(extent={{80,-8},{134,30}})));
  iPSL.NonElectrical.Continuous.ImSimpleLag imSimpleLag3(
    K=1,
    T=T_7,
    nStartValue=P0)
    annotation (Placement(transformation(extent={{114,-8},{168,30}})));
  iPSL.NonElectrical.Math.ImGain imGain1(K=K_1) annotation (Placement(
        transformation(
        extent={{-11,-11},{11,11}},
        rotation=90,
        origin={57,35})));
  iPSL.NonElectrical.Math.ImGain imGain2(K=K_2) annotation (Placement(
        transformation(
        extent={{-11,-11},{11,11}},
        rotation=-90,
        origin={57,-15})));
  iPSL.NonElectrical.Math.ImGain imGain3(K=K_3) annotation (Placement(
        transformation(
        extent={{-11,-11},{11,11}},
        rotation=90,
        origin={93,35})));
  iPSL.NonElectrical.Math.ImGain imGain4(K=K_4) annotation (Placement(
        transformation(
        extent={{-11,-11},{11,11}},
        rotation=-90,
        origin={91,-15})));
  iPSL.NonElectrical.Math.ImGain imGain5(K=K_5) annotation (Placement(
        transformation(
        extent={{-11,-11},{11,11}},
        rotation=90,
        origin={129,35})));
  iPSL.NonElectrical.Math.ImGain imGain6(K=K_6) annotation (Placement(
        transformation(
        extent={{-11,-11},{11,11}},
        rotation=-90,
        origin={127,-15})));
  iPSL.NonElectrical.Math.ImGain imGain7(K=K_7) annotation (Placement(
        transformation(
        extent={{-11,-11},{11,11}},
        rotation=90,
        origin={165,35})));
  iPSL.NonElectrical.Math.ImGain imGain8(K=K_8) annotation (Placement(
        transformation(
        extent={{-11,-11},{11,11}},
        rotation=-90,
        origin={165,-15})));
  iPSL.NonElectrical.Math.ImSum2 imSum2_1(
    a0=0,
    a1=1,
    a2=1) annotation (Placement(transformation(extent={{98,36},{118,56}})));
  iPSL.NonElectrical.Math.ImSum2 imSum2_2(
    a0=0,
    a1=1,
    a2=1) annotation (Placement(transformation(extent={{134,36},{154,56}})));
  iPSL.NonElectrical.Math.ImSum2 imSum2_3(
    a0=0,
    a1=1,
    a2=1) annotation (Placement(transformation(extent={{166,38},{186,58}})));
  iPSL.NonElectrical.Math.ImSum2 imSum2_4(
    a0=0,
    a1=1,
    a2=1) annotation (Placement(transformation(extent={{98,-40},{118,-20}})));
  iPSL.NonElectrical.Math.ImSum2 imSum2_5(
    a0=0,
    a1=1,
    a2=1) annotation (Placement(transformation(extent={{134,-40},{154,-20}})));
  iPSL.NonElectrical.Math.ImSum2 imSum2_6(
    a0=0,
    a1=1,
    a2=1) annotation (Placement(transformation(extent={{166,-38},{186,-18}})));
  Modelica.Blocks.Interfaces.RealOutput PMECH_HP
    "Turbine mechanical power (pu)"              annotation(Placement(transformation(extent = {{184, 40}, {194, 52}}), iconTransformation(extent={{160,26},
            {188,54}})));
  Modelica.Blocks.Interfaces.RealOutput PMECH_LP
    "Turbine mechanical power (pu)"              annotation(Placement(transformation(extent = {{184, -34}, {194, -22}}), iconTransformation(extent={{160,-56},
            {188,-24}})));
  parameter Real P0 "Power reference of the governor";

  parameter Real K = 20 "Governor gain, 1/R (pu)";
  parameter Real T_1 = 1e-8 "Control time constant (s)";
  parameter Real T_2 = 1e-8 "Control time constant (s)";
  parameter Real T_3 = 0.1 "Control time constant (s)";
  parameter Real U_o = 0.1 "Max. rate if valve opening (p.u./s)";
  parameter Real U_c = -0.1 "Max. rate if valve closing (p.u./s)";
  parameter Real P_MAX = 0.903 "Max. valve position (pu)";
  parameter Real P_MIN = 0 "Min. valve position (pu)";
  parameter Real T_4 = 0.4 "HP section time constant (s)";
  parameter Real K_1 = 0.3 "Fraction of power from HP (pu)";
  parameter Real K_2 = 0;
  parameter Real T_5 = 9 "Reheat+IP time constant (s)";
  parameter Real K_3 = 0.4 "Fraction of power from IP (pu)";
  parameter Real K_4 = 0;
  parameter Real T_6 = 0.5 "Reheat+IP time constant s";
  parameter Real K_5 = 0.3 "Fraction of power from LP (pu)";
  parameter Real K_6 = 0;
  parameter Real T_7 = 1e-8 "LP section time const s";
  parameter Real K_7 = 0 "Fraction of power from IP  (pu)";
  parameter Real K_8 = 0;
  iPSL.NonElectrical.Math.ImSetPoint Pref(V=P0) "Power reference "
    annotation (Placement(transformation(extent={{-74,24},{-54,44}})));
equation
  connect(imSum3_1.n1, imGain.p1) annotation(Line(points = {{-35.61, 11}, {-30.61, 11}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(imGain.n1, imLimited.p1) annotation(Line(points = {{-19.61, 11}, {-13.1, 11}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(imLimited.n1, imLimitedIntegrator.p1) annotation(Line(points = {{-3.1, 11}, {4.9, 11}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(imSum3_1.p3, imSimpleLag.p1) annotation(Line(points = {{-46.61, 7.7}, {-50, 7.7}, {-50, -10}, {20, -10}, {20, 11}, {24.63, 11}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(imSimpleLag.n1, imSimpleLag1.p1) annotation(Line(points={{51.9,11},
          {60.63,11}},                                                                          color = {0, 0, 127}, smooth = Smooth.None));
  connect(imSimpleLag1.n1, imSimpleLag2.p1) annotation(Line(points={{87.9,11},
          {98.63,11}},                                                                           color = {0, 0, 127}, smooth = Smooth.None));
  connect(imSimpleLag2.n1, imSimpleLag3.p1) annotation(Line(points={{125.9,
          11},{132.63,11}},                                                                        color = {0, 0, 127}, smooth = Smooth.None));
  connect(imGain1.p1, imSimpleLag.n1) annotation(Line(points={{57,29.39},
          {56,29.39},{56,11},{51.9,11}},                                                                          color = {0, 0, 127}, smooth = Smooth.None));
  connect(imGain2.p1, imSimpleLag1.p1) annotation(Line(points = {{57, -9.39}, {56, -9.39}, {56, 11}, {60.63, 11}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(imGain3.p1, imSimpleLag1.n1) annotation(Line(points={{93,29.39},
          {92,29.39},{92,11},{87.9,11}},                                                                           color = {0, 0, 127}, smooth = Smooth.None));
  connect(imGain4.p1, imSimpleLag2.p1) annotation(Line(points = {{91, -9.39}, {92, -9.39}, {92, 11}, {98.63, 11}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(imGain5.p1, imSimpleLag2.n1) annotation(Line(points={{129,29.39},
          {128,29.39},{128,11},{125.9,11}},                                                                            color = {0, 0, 127}, smooth = Smooth.None));
  connect(imGain6.p1, imSimpleLag3.p1) annotation(Line(points = {{127, -9.39}, {128, -9.39}, {128, 11}, {132.63, 11}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(imGain3.n1, imSum2_1.p2) annotation(Line(points = {{93, 40.39}, {93, 44}, {102.9, 44}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(imGain1.n1, imSum2_1.p1) annotation(Line(points = {{57, 40.39}, {57, 48}, {102.9, 48}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(imSum2_1.n1, imSum2_2.p1) annotation(Line(points = {{112.9, 46}, {125.45, 46}, {125.45, 48}, {138.9, 48}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(imGain5.n1, imSum2_2.p2) annotation(Line(points = {{129, 40.39}, {129, 44}, {138.9, 44}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(imSum2_2.n1, imSum2_3.p1) annotation(Line(points = {{148.9, 46}, {160, 46}, {160, 50}, {170.9, 50}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(imGain7.p1, imSimpleLag3.n1) annotation(Line(points={{165,29.39},
          {165,19.695},{159.9,19.695},{159.9,11}},                                                                             color = {0, 0, 127}, smooth = Smooth.None));
  connect(imGain7.n1, imSum2_3.p2) annotation(Line(points = {{165, 40.39}, {165, 46}, {170.9, 46}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(imSimpleLag3.n1, imGain8.p1) annotation(Line(points={{159.9,
          11},{159.9,2},{165,2},{165,-9.39}},                                                                        color = {0, 0, 127}, smooth = Smooth.None));
  connect(imGain4.n1, imSum2_4.p1) annotation(Line(points = {{91, -20.39}, {91, -28}, {102.9, -28}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(imGain2.n1, imSum2_4.p2) annotation(Line(points = {{57, -20.39}, {57, -32}, {102.9, -32}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(imGain6.n1, imSum2_5.p1) annotation(Line(points = {{127, -20.39}, {127, -28}, {138.9, -28}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(imSum2_4.n1, imSum2_5.p2) annotation(Line(points = {{112.9, -30}, {126, -30}, {126, -32}, {138.9, -32}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(imGain8.n1, imSum2_6.p1) annotation(Line(points = {{165, -20.39}, {165, -24.195}, {170.9, -24.195}, {170.9, -26}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(imSum2_5.n1, imSum2_6.p2) annotation(Line(points = {{148.9, -30}, {170.9, -30}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(imSum2_6.n1,PMECH_LP)  annotation(Line(points = {{180.9, -28}, {189, -28}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(Pref.n1, imSum3_1.p1) annotation(Line(points = {{-59.1, 34}, {-54, 34}, {-54, 14.3}, {-46.61, 14.3}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(SPEED_HP, imLeadLag.p1) annotation (Line(
      points={{-127,10},{-83.26,10},{-83.26,11}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(imLeadLag.n1, imSum3_1.p2) annotation(Line(points = {{-57.26, 11}, {-46.61, 11}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(imSum2_3.n1,PMECH_HP)  annotation(Line(points = {{180.9, 48}, {188, 48}, {188, 46}, {189, 46}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(imLimitedIntegrator.n0, imSimpleLag.p1) annotation (Line(
      points={{14.9,11},{24.63,11}},
      color={0,0,127},
      smooth=Smooth.None));
  annotation(Diagram(coordinateSystem(extent={{-140,-80},{160,80}},        preserveAspectRatio=false)),            Icon(coordinateSystem(extent={{-140,
            -80},{160,80}},                                                                                                    preserveAspectRatio=false),   graphics={  Rectangle(extent={{
              -140,80},{160,-80}},                                                                                                    lineColor=  {0, 0, 255}), Text(extent={{
              -122,18},{-68,-18}},                                                                                                    lineColor=
              {0,0,255},
            fillPattern=FillPattern.Solid,
          textString="SPEED_HP"),                                                                                                    Text(extent={{
              84,56},{158,26}},                                                                                                    lineColor=
              {0,0,255},
            fillPattern=FillPattern.Solid,
          textString="PMECH_HP"),                                                                                                    Text(extent={{
              86,-10},{158,-48}},                                                                                                    lineColor=
              {0,0,255},
            fillPattern=FillPattern.Solid,
          textString="PMECH_LP"),                                                                                                    Text(extent={{
              -68,40},{88,-46}},                                                                                                    lineColor=  {0, 0, 255},
            fillPattern=                                                                                                    FillPattern.Solid, textString=  "IEEEG1")}),
    Documentation(info="<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\">
<tr>
<td><p>Reference</p></td>
<td>Turbine and Governor (IEEEG1), PSSE manual</td>
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
end IEEEG1;
