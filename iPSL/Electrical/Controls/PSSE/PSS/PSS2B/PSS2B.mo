within iPSL.Electrical.Controls.PSSE.PSS.PSS2B;
model PSS2B
  parameter Real T_w1 = 10 "Washout time constant 1";
  parameter Real T_w2 = 10 "Washout time constant 2";
  parameter Real T_6 = 1e-9 "Lag time constant 6";
  parameter Real T_w3 = 10 "Washout time constant 3";
  parameter Real T_w4 = 1e-9 "Washout time constant 4";
  parameter Real T_7 = 10 "Lag time constant 7";
  parameter Real K_S2 = 0.99 "Lag gain 2, T_7/H";
  parameter Real K_S3 = 1 "Lag gain 3";
  parameter Real T_8 = 0.5 "Ramp-tracking filter time constant";
  parameter Real T_9 = 0.1 "Ramp-tracking filter time constant";
  parameter Real K_S1 = 20 "PSS gain";
  parameter Real T_1 = 0.15 "Lead-lag time constant 1";
  parameter Real T_2 = 0.025 "Lead-lag time constant 2";
  parameter Real T_3 = 0.15 "Lead-lag time constant 3";
  parameter Real T_4 = 0.025 "Lead-lag time constant 4";
  parameter Real T_10 = 1e-9 "Lead-lag time constant 10";
  parameter Real T_11 = 0.033 "Lead-lag time constant 11";
  parameter Real V_S1MAX = 0.08 "PSS input 1 max. limit";
  parameter Real V_S1MIN = -0.08 "PSS input 1 min. limit";
  parameter Real V_S2MAX = 1.25 "PSS input 2 max. limit";
  parameter Real V_S2MIN = -1.25 "PSS input 2 min. limit";
  parameter Real V_STMAX = 0.1 "PSS output max. limit, 0.1 ~ 0.2";
  parameter Real V_STMIN = -0.1 "PSS output min. limit, -0.05 ~ -0.1";
  Modelica.Blocks.Interfaces.RealInput V_S1 "PSS input signal 1"
                                                               annotation(Placement(transformation(extent={{-148,16},
            {-136,28}})));
  iPSL.NonElectrical.Continuous.ImLeadLag Leadlag1(
    K=1,
    T1=T_1,
    T2=T_2,
    nStartValue=0)
    annotation (Placement(transformation(extent={{22,4},{66,38}})));
  iPSL.NonElectrical.Continuous.ImLeadLag Leadlag2(
    K=1,
    T1=T_3,
    T2=T_4,
    nStartValue=0)
    annotation (Placement(transformation(extent={{52,4},{98,38}})));
  Modelica.Blocks.Interfaces.RealOutput VOTHSG "PSS output signal"
                                                            annotation (
      Placement(transformation(extent={{140,-6},{152,6}}), iconTransformation(
          extent={{140,-6},{152,6}})));
  iPSL.NonElectrical.Continuous.ImLimited limit(Ymin=V_STMIN, Ymax=V_STMAX)
    annotation (Placement(transformation(extent={{114,8},{136,30}})));
  Modelica.Blocks.Interfaces.RealInput V_S2 "PSS input signal 2"
                                                      annotation(Placement(transformation(extent={{-148,
            -26},{-136,-14}})));
  iPSL.NonElectrical.Continuous.ImSimpleLag SimpleLag1(
    K=1,
    T=T_6,
    nStartValue=0)
    annotation (Placement(transformation(extent={{-68,4},{-20,46}})));
  iPSL.NonElectrical.Continuous.ImSimpleLag SimpleLag2(
    K=K_S2,
    T=T_7,
    nStartValue=0)
    annotation (Placement(transformation(extent={{-70,-42},{-22,0}})));
  iPSL.NonElectrical.Math.ImGain imGain(K=K_S3) annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-24,-10})));
  iPSL.NonElectrical.Math.ImSum2 imSum2_1(
    a0=0,
    a1=1,
    a2=1) annotation (Placement(transformation(extent={{-26,12},{-6,32}})));
  iPSL.NonElectrical.Math.ImGain imGain1(K=K_S1)
    annotation (Placement(transformation(extent={{12,10},{32,30}})));
  iPSL.NonElectrical.Math.ImSum2 imSum2_2(
    a0=0,
    a1=1,
    a2=-1) annotation (Placement(transformation(extent={{-2,10},{18,30}})));
  iPSL.NonElectrical.Continuous.ImLeadLag Leadlag3(
    K=1,
    T1=T_10,
    T2=T_11,
    nStartValue=0)
    annotation (Placement(transformation(extent={{82,4},{126,38}})));
  iPSL.NonElectrical.Continuous.ImLimited imLimited(Ymin=V_S1MIN, Ymax=V_S1MAX)
    annotation (Placement(transformation(extent={{-136,16},{-116,36}})));
  iPSL.NonElectrical.Continuous.ImLimited imLimited1(Ymin=V_S2MIN, Ymax=V_S2MAX)
    annotation (Placement(transformation(extent={{-136,-32},{-116,-12}})));
  NonElectrical.Continuous.ImWashout
          washout(Kp = T_w1, Tw = T_w1, out0 = 0) annotation(Placement(transformation(extent={{-116,6},
            {-84,38}})));
  NonElectrical.Continuous.ImWashout
          washout1(Kp = T_w2, Tw = T_w2, out0 = 0) annotation(Placement(transformation(extent={{-86,8},
            {-54,36}})));
  NonElectrical.Continuous.ImWashout
          washout2(Kp = T_w3, Tw = T_w3, out0 = 0) annotation(Placement(transformation(extent={{-118,
            -42},{-86,-10}})));
equation
  connect(imGain.p1, SimpleLag2.n1) annotation(Line(points={{-24,-15.1},{-24,
          -21},{-29.2,-21}},                                                                        color = {0, 0, 127}, smooth = Smooth.None));
  connect(imGain.n1, imSum2_1.p2) annotation(Line(points={{-24,-5.1},{-24,20},{-21.1,
          20}},                                                                               color = {0, 0, 127}, smooth = Smooth.None));
  connect(imSum2_2.n1, imGain1.p1) annotation(Line(points={{12.9,20},{16.9,20}},      color = {0, 0, 127}, smooth = Smooth.None));
  connect(imSum2_2.p2, SimpleLag2.n1) annotation(Line(points={{2.9,18},{-6,18},
          {-6,-21},{-29.2,-21}},                                                                                color = {0, 0, 127}, smooth = Smooth.None));
  connect(limit.n1, VOTHSG) annotation (Line(
      points={{130.39,19},{131.195,19},{131.195,0},{146,0}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Leadlag3.n1, limit.p1) annotation(Line(points={{114.78,21},{116.39,21},
          {116.39,19},{119.39,19}},                                                                                 color = {0, 0, 127}, smooth = Smooth.None));
  connect(Leadlag2.n1, Leadlag3.p1) annotation(Line(points={{86.27,21},{92.78,21}},        color = {0, 0, 127}, smooth = Smooth.None));
  connect(Leadlag1.n1, Leadlag2.p1) annotation(Line(points={{54.78,21},{63.27,21}},        color = {0, 0, 127}, smooth = Smooth.None));
  connect(imGain1.n1, Leadlag1.p1) annotation(Line(points={{26.9,20},{29.84,20},
          {29.84,21},{32.78,21}},                                                                                color = {0, 0, 127}, smooth = Smooth.None));
  connect(V_S1, imLimited.p1) annotation(Line(points={{-142,22},{-136,22},{-136,
          26},{-131.1,26}},                                                      color = {0, 0, 127}, smooth = Smooth.None));
  connect(V_S2, imLimited1.p1) annotation(Line(points={{-142,-20},{-136,-20},{-136,
          -22},{-131.1,-22}},                                                       color = {0, 0, 127}, smooth = Smooth.None));
  connect(SimpleLag1.n1, imSum2_1.p1) annotation(Line(points={{-27.2,25},{
          -23.72,25},{-23.72,24},{-21.1,24}},                                                                       color = {0, 0, 127}, smooth = Smooth.None));
  connect(imLimited.n1, washout.VSI1) annotation(Line(points={{-121.1,26},{-116,
          26},{-116,25.7333},{-112.16,25.7333}},                                                                            color = {0, 0, 127}, smooth = Smooth.None));
  connect(washout.VSI2, washout1.VSI1) annotation(Line(points={{-89.76,25.7333},
          {-84,25.7333},{-84,25.2667},{-82.16,25.2667}},                                                                                color = {0, 0, 127}, smooth = Smooth.None));
  connect(SimpleLag1.p1, washout1.VSI2) annotation(Line(points={{-51.44,25},{
          -56,25},{-56,25.2667},{-59.76,25.2667}},                                                                        color = {0, 0, 127}, smooth = Smooth.None));
  connect(imLimited1.n1, washout2.VSI1) annotation(Line(points={{-121.1,-22},{
          -118,-22},{-118,-22.2667},{-114.16,-22.2667}},                                                                          color = {0, 0, 127}, smooth = Smooth.None));
  connect(washout2.VSI2, SimpleLag2.p1) annotation(Line(points={{-91.76,
          -22.2667},{-53.44,-22.2667},{-53.44,-21}},                                                                    color = {0, 0, 127}, smooth = Smooth.None));
  connect(imSum2_1.n1, imSum2_2.p1) annotation(Line(points={{-11.1,22},{2.9,22}},      color = {0, 0, 127}, smooth = Smooth.None));
  annotation(Diagram(coordinateSystem(preserveAspectRatio=false,  extent={{-140,
            -40},{140,40}})),                                                                                      Icon(coordinateSystem(preserveAspectRatio = false, extent={{-140,
            -40},{140,40}}),                                                                                                    graphics={  Rectangle(extent={{
              -140,40},{140,-40}},                                                                                                    lineColor=  {0, 0, 255}), Text(extent={{
              -34,14},{32,-16}},                                                                                                    lineColor=  {0, 0, 255}, textString=  "PSS2B"), Text(extent={{
              -136,26},{-96,12}},                                                                                                    lineColor=
              {0,0,255},
          textString="V_S1"),                                                                                                    Text(extent={{
              90,14},{136,-16}},                                                                                                    lineColor=
              {0,0,255},
          textString="VOTHSG"),                                                                                                    Text(extent={{
              -136,-14},{-96,-28}},                                                                                                  lineColor=
              {0,0,255},
          textString="V_S2")}),
    Documentation(info="<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\">
<tr>
<td><p>Reference</p></td>
<td>IEEE Power System Stabilizer Type 2B (PSS2B), PSSE manual</td>
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
end PSS2B;
