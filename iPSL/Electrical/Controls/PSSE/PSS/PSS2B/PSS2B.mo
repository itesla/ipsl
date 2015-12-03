within iPSL.Electrical.Controls.PSSE.PSS.PSS2B;


model PSS2B
  parameter Real T_w1=10 "Washout time constant 1";
  parameter Real T_w2=10 "Washout time constant 2";
  parameter Real T_6=1e-9 "Lag time constant 6";
  parameter Real T_w3=10 "Washout time constant 3";
  parameter Real T_w4=1e-9 "Washout time constant 4";
  parameter Real T_7=10 "Lag time constant 7";
  parameter Real K_S2=0.99 "Lag gain 2, T_7/H";
  parameter Real K_S3=1 "Lag gain 3";
  parameter Real T_8=0.5 "Ramp-tracking filter time constant";
  parameter Real T_9=0.1 "Ramp-tracking filter time constant";
  parameter Real K_S1=20 "PSS gain";
  parameter Real T_1=0.15 "Lead-lag time constant 1";
  parameter Real T_2=0.025 "Lead-lag time constant 2";
  parameter Real T_3=0.15 "Lead-lag time constant 3";
  parameter Real T_4=0.025 "Lead-lag time constant 4";
  parameter Real T_10=1e-9 "Lead-lag time constant 10";
  parameter Real T_11=0.033 "Lead-lag time constant 11";
  parameter Real V_S1MAX=0.08 "PSS input 1 max. limit";
  parameter Real V_S1MIN=-0.08 "PSS input 1 min. limit";
  parameter Real V_S2MAX=1.25 "PSS input 2 max. limit";
  parameter Real V_S2MIN=-1.25 "PSS input 2 min. limit";
  parameter Real V_STMAX=0.1 "PSS output max. limit, 0.1 ~ 0.2";
  parameter Real V_STMIN=-0.1 "PSS output min. limit, -0.05 ~ -0.1";
  Modelica.Blocks.Interfaces.RealInput V_S1 "PSS input signal 1"
    annotation (Placement(transformation(extent={{-186,14},{-174,26}})));
  iPSL.NonElectrical.Continuous.LeadLag Leadlag1(
    K=1,
    T1=T_1,
    T2=T_2,
    y_start=0) annotation (Placement(transformation(extent={{60,-10},{80,10}})));
  iPSL.NonElectrical.Continuous.LeadLag Leadlag2(
    K=1,
    T1=T_3,
    T2=T_4,
    y_start=0)
    annotation (Placement(transformation(extent={{88,-10},{108,10}})));
  Modelica.Blocks.Interfaces.RealOutput VOTHSG "PSS output signal" annotation (
      Placement(transformation(extent={{180,-6},{192,6}}), iconTransformation(
          extent={{180,-6},{192,6}})));
  Modelica.Blocks.Interfaces.RealInput V_S2 "PSS input signal 2"
    annotation (Placement(transformation(extent={{-186,-26},{-174,-14}})));
  iPSL.NonElectrical.Continuous.SimpleLag SimpleLag1(
    K=1,
    T=T_6,
    y_start=0)
    annotation (Placement(transformation(extent={{-68,10},{-48,30}})));
  iPSL.NonElectrical.Continuous.SimpleLag SimpleLag2(
    K=K_S2,
    T=T_7,
    y_start=0)
    annotation (Placement(transformation(extent={{-68,-30},{-48,-10}})));
  iPSL.NonElectrical.Continuous.LeadLag Leadlag3(
    K=1,
    T1=T_10,
    T2=T_11,
    y_start=0)
    annotation (Placement(transformation(extent={{118,-10},{138,10}})));
  Modelica.Blocks.Nonlinear.Limiter limiter(uMax=V_STMAX, uMin=V_STMIN)
    annotation (Placement(transformation(extent={{148,-10},{168,10}})));
  Modelica.Blocks.Nonlinear.Limiter limiter1(uMax=V_S1MAX, uMin=V_S1MIN)
    annotation (Placement(transformation(extent={{-164,10},{-144,30}})));
  Modelica.Blocks.Nonlinear.Limiter limiter2(uMax=V_S2MAX, uMin=V_S2MIN)
    annotation (Placement(transformation(extent={{-166,-30},{-146,-10}})));
  Modelica.Blocks.Math.Add add(k2=+K_S3)
    annotation (Placement(transformation(extent={{-36,4},{-16,24}})));
  Modelica.Blocks.Math.Add add1(k2=-1)
    annotation (Placement(transformation(extent={{0,-10},{20,10}})));
  Modelica.Blocks.Math.Gain gain(k=K_S1)
    annotation (Placement(transformation(extent={{30,-10},{50,10}})));
  Modelica.Blocks.Continuous.TransferFunction Washout4(
    b={1,0},
    initType=Modelica.Blocks.Types.Init.InitialOutput,
    y_start=0,
    a={1,1/T_w4})
    annotation (Placement(transformation(extent={{-100,-30},{-80,-10}})));
  Modelica.Blocks.Continuous.TransferFunction Washout3(
    b={1,0},
    initType=Modelica.Blocks.Types.Init.InitialOutput,
    y_start=0,
    a={1,1/T_w3})
    annotation (Placement(transformation(extent={{-132,-30},{-112,-10}})));
  Modelica.Blocks.Continuous.TransferFunction Washout1(
    b={1,0},
    a={1,1/T_w1},
    initType=Modelica.Blocks.Types.Init.InitialOutput,
    y_start=0)
    annotation (Placement(transformation(extent={{-132,10},{-112,30}})));
  Modelica.Blocks.Continuous.TransferFunction Washout2(
    b={1,0},
    initType=Modelica.Blocks.Types.Init.InitialOutput,
    y_start=0,
    a={1,1/T_w2})
    annotation (Placement(transformation(extent={{-100,10},{-80,30}})));
equation
  connect(limiter.y, VOTHSG)
    annotation (Line(points={{169,0},{186,0}}, color={0,0,127}));
  connect(Leadlag3.y, limiter.u)
    annotation (Line(points={{139,0},{146,0}}, color={0,0,127}));
  connect(Leadlag2.y, Leadlag3.u)
    annotation (Line(points={{109,0},{116,0}}, color={0,0,127}));
  connect(Leadlag2.u, Leadlag1.y)
    annotation (Line(points={{86,0},{81,0}}, color={0,0,127}));
  connect(V_S2, limiter2.u)
    annotation (Line(points={{-180,-20},{-168,-20}}, color={0,0,127}));
  connect(V_S1, limiter1.u)
    annotation (Line(points={{-180,20},{-173,20},{-166,20}}, color={0,0,127}));
  connect(SimpleLag1.y, add.u1)
    annotation (Line(points={{-47,20},{-38,20}}, color={0,0,127}));
  connect(SimpleLag2.y, add.u2) annotation (Line(points={{-47,-20},{-44,-20},{-44,
          8},{-38,8}}, color={0,0,127}));
  connect(add1.u2, add.u2) annotation (Line(points={{-2,-6},{-10,-6},{-10,-20},
          {-44,-20},{-44,8},{-38,8}}, color={0,0,127}));
  connect(add.y, add1.u1) annotation (Line(points={{-15,14},{-10,14},{-10,6},{-2,
          6}}, color={0,0,127}));
  connect(add1.y, gain.u)
    annotation (Line(points={{21,0},{24.5,0},{28,0}}, color={0,0,127}));
  connect(gain.y, Leadlag1.u)
    annotation (Line(points={{51,0},{54.5,0},{58,0}}, color={0,0,127}));
  connect(Washout3.y, Washout4.u)
    annotation (Line(points={{-111,-20},{-102,-20}}, color={0,0,127}));
  connect(Washout1.y, Washout2.u)
    annotation (Line(points={{-111,20},{-111,20},{-102,20}}, color={0,0,127}));
  connect(Washout1.u, limiter1.y)
    annotation (Line(points={{-134,20},{-143,20}}, color={0,0,127}));
  connect(limiter2.y, Washout3.u)
    annotation (Line(points={{-145,-20},{-134,-20}}, color={0,0,127}));
  connect(Washout4.y, SimpleLag2.u)
    annotation (Line(points={{-79,-20},{-79,-20},{-70,-20}}, color={0,0,127}));
  connect(Washout2.y, SimpleLag1.u)
    annotation (Line(points={{-79,20},{-74,20},{-70,20}}, color={0,0,127}));
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-180,-40},{180,
            40}})),
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-180,-40},{180,40}}),
        graphics={Rectangle(extent={{-180,40},{180,-40}}, lineColor={0,0,255}),
          Text(
          extent={{-34,14},{32,-16}},
          lineColor={0,0,255},
          textString="PSS2B"),Text(
          extent={{-172,26},{-132,12}},
          lineColor={0,0,255},
          textString="V_S1"),Text(
          extent={{130,14},{176,-16}},
          lineColor={0,0,255},
          textString="VOTHSG"),Text(
          extent={{-174,-14},{-134,-28}},
          lineColor={0,0,255},
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
