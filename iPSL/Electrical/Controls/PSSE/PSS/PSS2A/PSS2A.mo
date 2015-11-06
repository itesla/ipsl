within iPSL.Electrical.Controls.PSSE.PSS.PSS2A;
model PSS2A "IEEE Dual-Input Stabilizer Model"

parameter Real T_w1=10 "Washout 1 time constant";
parameter Real T_w2=10 "Washout 2 time constant";
parameter Real T_6=1e-9 "Lag 1 time constant";
parameter Real T_w3=10 "Washout 3 time constant";
parameter Real T_w4=1e-9 "Washout 4 time constant";
parameter Real T_7=10 "Lag 2 time constant";
parameter Real K_S2=0.99 "Lag 2 gain";
parameter Real K_S3=1 "gain";
parameter Real T_8=0.5 "Ramp-tracking filter time constant";
parameter Real T_9=0.1 "Ramp-tracking filter time constant";
parameter Real K_S1=20 "PSS gain";
parameter Real T_1=0.15
    "Leadlag1 time constant (data from IEEE std, not representive, need to be tuned following system parameters)";
parameter Real T_2=0.025 "Leadlag1 time constant";
parameter Real T_3=0.15 "Leadlag2 time constant";
parameter Real T_4=0.025 "Leadlag2 time constant";
parameter Real V_STMAX=0.1 "PSS output limiation";
parameter Real V_STMIN=-0.1 "PSS output limiation";
parameter Integer M "Ramp tracking filter coefficient";
parameter Integer N "Ramp tracking filter coefficient";

  Modelica.Blocks.Interfaces.RealInput V_S1 "PSS input signal 1"
    annotation (Placement(transformation(extent={{-144,14},{-132,26}}),
        iconTransformation(extent={{-144,14},{-132,26}})));
  iPSL.NonElectrical.Continuous.ImLeadLag Leadlag1(
    K=1,
    T1=T_1,
    T2=T_2,
    nStartValue=0)
    annotation (Placement(transformation(extent={{52,-4},{96,30}})));
  iPSL.NonElectrical.Continuous.ImLeadLag Leadlag2(
    K=1,
    T1=T_3,
    T2=T_4,
    nStartValue=0)
    annotation (Placement(transformation(extent={{82,-4},{128,30}})));
  Modelica.Blocks.Interfaces.RealOutput VOTHSG "PSS output"
    annotation (Placement(transformation(extent={{160,-6},{172,6}}),
        iconTransformation(extent={{160,-6},{172,6}})));
  iPSL.NonElectrical.Continuous.ImLimited limit(Ymin=V_STMIN, Ymax=V_STMAX)
    annotation (Placement(transformation(extent={{120,2},{142,24}})));
  Modelica.Blocks.Interfaces.RealInput V_S2 "PSS input signal 2"
    annotation (Placement(transformation(extent={{-144,-26},{-132,-14}}),
        iconTransformation(extent={{-144,-26},{-132,-14}})));
  iPSL.NonElectrical.Continuous.ImSimpleLag SimpleLag1(
    K=1,
    T=T_6,
    nStartValue=0)
    annotation (Placement(transformation(extent={{-58,-4},{-10,38}})));
  iPSL.NonElectrical.Continuous.ImSimpleLag SimpleLag2(
    K=K_S2,
    T=T_7,
    nStartValue=0)
    annotation (Placement(transformation(extent={{-60,-50},{-12,-8}})));
  iPSL.NonElectrical.Math.ImGain imGain(K=K_S3) annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-14,-18})));
  iPSL.NonElectrical.Math.ImSum2 imSum2_1(
    a0=0,
    a1=1,
    a2=1) annotation (Placement(transformation(extent={{-16,4},{4,24}})));
  iPSL.NonElectrical.Math.ImGain imGain1(K=K_S1)
    annotation (Placement(transformation(extent={{42,2},{62,22}})));
  iPSL.NonElectrical.Math.ImSum2 imSum2_2(
    a0=0,
    a1=1,
    a2=-1) annotation (Placement(transformation(extent={{28,2},{48,22}})));
  NonElectrical.Continuous.ImWashout
          washout(
    Kp=T_w1,
    Tw=T_w1,
    out0=0) annotation (Placement(transformation(extent={{-106,-2},{-74,30}})));
  NonElectrical.Continuous.ImWashout
          washouT_1(
    Kp=T_w2,
    Tw=T_w2,
    out0=0) annotation (Placement(transformation(extent={{-76,0},{-44,28}})));
  NonElectrical.Continuous.ImWashout
          washouT_2(
    Kp=T_w3,
    Tw=T_w3,
    out0=0) annotation (Placement(transformation(extent={{-108,-50},{-76,-18}})));
  NonElectrical.Continuous.ImWashout
          washouT_3(
    out0=0,
    Kp=T_w4,
    Tw=T_w4)  annotation (Placement(transformation(extent={{-78,-50},{-46,-18}})));
  NonElectrical.Continuous.ImRampTrackingFilter imRampTrackingFilter(
    T_1=0.1,
    T_2=0.2,
    startValue=0,
    M=M,
    N=N) annotation (Placement(transformation(extent={{10,8},{22,20}})));
equation
  connect(imGain.p1, SimpleLag2.n1) annotation (Line(
      points={{-14,-23.1},{-14,-29},{-19.2,-29}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(imGain.n1, imSum2_1.p2) annotation (Line(
      points={{-14,-13.1},{-14,12},{-11.1,12}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(imSum2_2.n1, imGain1.p1) annotation (Line(
      points={{42.9,12},{46.9,12}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(imSum2_2.p2, SimpleLag2.n1) annotation (Line(
      points={{32.9,10},{24,10},{24,-29},{-19.2,-29}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(limit.n1, VOTHSG) annotation (Line(
      points={{136.39,13},{137.195,13},{137.195,0},{166,0}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Leadlag1.n1, Leadlag2.p1) annotation (Line(
      points={{84.78,13},{93.27,13}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(imGain1.n1, Leadlag1.p1) annotation (Line(
      points={{56.9,12},{59.84,12},{59.84,13},{62.78,13}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(SimpleLag1.n1, imSum2_1.p1) annotation (Line(
      points={{-17.2,17},{-13.72,17},{-13.72,16},{-11.1,16}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(washout.VSI2, washouT_1.VSI1) annotation (Line(
      points={{-79.76,17.7333},{-74,17.7333},{-74,17.2667},{-72.16,17.2667}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(SimpleLag1.p1, washouT_1.VSI2) annotation (Line(
      points={{-41.44,17},{-46,17},{-46,17.2667},{-49.76,17.2667}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(washouT_2.VSI2, washouT_3.VSI1) annotation (Line(
      points={{-81.76,-30.2667},{-80,-30.2667},{-80,-30},{-78,-30},{-78,
          -30.2667},{-74.16,-30.2667}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(washouT_3.VSI2, SimpleLag2.p1) annotation (Line(
      points={{-51.76,-30.2667},{-47.88,-30.2667},{-47.88,-29},{-43.44,-29}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Leadlag2.n1, limit.p1) annotation (Line(
      points={{116.27,13},{125.39,13}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(V_S1, washout.VSI1) annotation (Line(points={{-138,20},{-102.16,20},{
          -102.16,17.7333}},
                     color={0,0,127}));
  connect(V_S2, washouT_2.VSI1) annotation (Line(points={{-138,-20},{-104.16,
          -20},{-104.16,-30.2667}},
                              color={0,0,127}));
  connect(imRampTrackingFilter.p, imSum2_1.n1)
    annotation (Line(points={{9.76,14},{4.9,14},{-1.1,14}}, color={0,0,127}));
  connect(imRampTrackingFilter.n, imSum2_2.p1) annotation (Line(points={{22.6,
          14},{26.25,14},{32.9,14}}, color={0,0,127}));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-140,
            -40},{160,40}})),             Icon(coordinateSystem(
          preserveAspectRatio=false, extent={{-140,-40},{160,40}}),   graphics={
        Rectangle(extent={{-140,40},{160,-40}},
                                              lineColor={0,0,255}),
        Text(
          extent={{-34,16},{32,-14}},
          lineColor={0,0,255},
          textString="PSS2A"),
        Text(
          extent={{-128,30},{-100,10}},
          lineColor={0,0,255},
          textString="V_S1"),
        Text(
          extent={{-128,-10},{-100,-30}},
          lineColor={0,0,255},
          textString="V_S2"),
        Text(
          extent={{100,10},{156,-10}},
          lineColor={0,0,255},
          textString="VOTHSG")}),
    Documentation(info="<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\">
<tr>
<td><p>Reference</p></td>
<td></td>
PSS2A, PSS/E Manual
</tr>
<tr>
<td><p>Last update</p></td>
<td></td>
2015-08-03
</tr>
<tr>
<td><p>Author</p></td>
<td><p>Tin Rabuzin, SmarTS Lab, KTH Royal Institute of Technology</p></td>
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
end PSS2A;
