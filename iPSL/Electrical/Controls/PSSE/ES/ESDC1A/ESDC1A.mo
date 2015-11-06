within iPSL.Electrical.Controls.PSSE.ES.ESDC1A;
model ESDC1A
  import iPSL.NonElectrical.Functions.SE;

  iPSL.NonElectrical.Math.ImSum2 imSum2_1(
    a0=0,
    a1=1,
    a2=-1) annotation (Placement(transformation(extent={{-66,-36},{-46,-16}})));
  iPSL.NonElectrical.Math.ImSetPoint Vref(V=VREF)
    annotation (Placement(transformation(extent={{-84,-20},{-60,4}})));
  iPSL.NonElectrical.Math.ImSum3 imSum3_1(
    a0=0,
    a2=1,
    a1=-1,
    a3=1) annotation (Placement(transformation(extent={{-50,-36},{-30,-16}})));
  iPSL.NonElectrical.Math.ImSum2 imSum2_2(
    a0=0,
    a1=1,
    a2=1) annotation (Placement(transformation(extent={{-88,-60},{-68,-40}})));
  Modelica.Blocks.Interfaces.RealInput ECOMP
    "Input, generator terminal voltage"
    annotation (Placement(transformation(extent={{-80,22},{-70,34}}),
        iconTransformation(extent={{-80,22},{-70,34}})));
  Modelica.Blocks.Interfaces.RealInput VOTHSG "Upss"
    annotation (Placement(transformation(extent={{-80,4},{-70,16}}),
        iconTransformation(extent={{-80,4},{-70,16}})));
  Modelica.Blocks.Interfaces.RealInput VOEL "OEL output"
    annotation (Placement(transformation(extent={{-80,-16},{-70,-4}}),
        iconTransformation(extent={{-80,-16},{-70,-4}})));
  NonElectrical.Continuous.ImSimpleLag_nowinduplimit       imLimitedSimpleLag(
    Ymin=V_RMIN,
    Ymax=V_RMAX,
    K=K_A,
    T=T_A,
    nStartValue=vr0)
    annotation (Placement(transformation(extent={{10,-42},{38,-14}})));
  iPSL.NonElectrical.Continuous.ImIntegrator imIntegrator(nStartValue=vf00, K=1
        /T_E) annotation (Placement(transformation(extent={{54,-36},{74,-16}})));
  NonElectrical.Continuous.ImLimited                  imLimited_min(Ymin=1e-6, Ymax=
        1e10)
    annotation (Placement(transformation(extent={{68,-36},{88,-16}})));
  iPSL.NonElectrical.Math.ImSum2 imSum2_4(
    a0=0,
    a1=1,
    a2=1) annotation (Placement(transformation(extent={{8,24},{-12,44}})));
  iPSL.NonElectrical.Math.ImSetPoint imSetPoint3(V=K_E)
    annotation (Placement(transformation(extent={{60,14},{50,26}})));
  iPSL.NonElectrical.Math.ImMult2 imMult2_1(
    a0=0,
    a1=1,
    a2=1) annotation (Placement(transformation(extent={{32,26},{12,46}})));
  Modelica.Blocks.Interfaces.RealOutput EFD "Output,excitation voltage"
    annotation (Placement(transformation(extent={{100,-6},{110,6}}),
        iconTransformation(extent={{100,-6},{110,6}})));
parameter Real T_R=0 "Voltage input time constant (s)";
parameter Real K_A=400 "AVR gain";
parameter Real T_A=0.02 "AVR time constant (s)";
parameter Real T_B=0 "AVR lead-lag time constant (s)";
parameter Real T_C=0 "AVR lead-lag time constant (s)";
parameter Real V_RMAX=9 "Maximum AVR output (pu)";
parameter Real V_RMIN=-5.43 "Minimum AVR output (pu)";
parameter Real K_E=1 "Exciter field factor (pu)";
parameter Real T_E=0.8 "Exciter time constant (s)";
parameter Real K_F=0.03 "Rate feedback gain (pu)";
parameter Real T_F1=1 "Rate feedback time constant (s)";
parameter Real K_C=0.2 "Rectifier load factor (pu)";
parameter Real K_D=0.48 "Exciter demagnetizing factor (pu)";
parameter Real E_1=5.25 "Exciter saturation point 1 (pu)";
parameter Real E_2=7 "Exciter saturation point 2 (pu)";
parameter Real S_EE_1=0.03 "Saturation at E_1";
parameter Real S_EE_2=0.1 "Saturation at E_2";

protected
  parameter Real VREF(fixed=false);
parameter Real vf00(fixed=false) "Initial field voltage";
parameter Real vr0(fixed=false);
parameter Real ECOMP0(fixed=false);
public
  iPSL.NonElectrical.Continuous.ImDerivativeLag imDerivativeLag(
    K=K_F,
    T=T_F1,
    pStartValue=0)
    annotation (Placement(transformation(extent={{8,-14},{-2,-4}})));
  iPSL.NonElectrical.Math.ImSum2 imSum2_3(
    a0=0,
    a2=1,
    a1=-1) annotation (Placement(transformation(extent={{38,-36},{58,-16}})));
  NonElectrical.Logical.HV_GATE
          hV_GATE
    annotation (Placement(transformation(extent={{-2,-36},{14,-20}})));
  Modelica.Blocks.Interfaces.RealInput VUEL "UEL output"
    annotation (Placement(transformation(extent={{-5,-6},{5,6}},
        rotation=90,
        origin={-3,-56}),
        iconTransformation(extent={{-80,-36},{-70,-24}})));
  iPSL.NonElectrical.Math.ImMult2 imMult2_3(
    a0=0,
    a1=1,
    a2=1) annotation (Placement(transformation(extent={{48,8},{28,28}})));
public
  Modelica.Blocks.Interfaces.RealInput EFD0 annotation (Placement(
        transformation(
        extent={{-7,-7},{7,7}},
        rotation=0,
        origin={-79,33}),  iconTransformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={-10,-34})));
  NonElectrical.Functions.ImSE imSE(
    SE1=S_EE_1,
    SE2=S_EE_2,
    E1=E_1,
    E2=E_2) annotation (Placement(transformation(extent={{72,34},{54,54}})));
  NonElectrical.Continuous.ImLeadLag imLeadLag(
    K=1,
    T1=T_C,
    T2=T_B,
    nStartValue=vr0/K_A)
    annotation (Placement(transformation(extent={{-32,-36},{-10,-16}})));
initial equation
  ECOMP0 = ECOMP;
  vf00 = EFD0;
  vr0 = vf00*(1+K_E+SE(vf00,S_EE_1,S_EE_2,E_1,E_2));
  VREF = vr0/K_A+ECOMP0;

equation
  connect(Vref.n1, imSum2_1.p1) annotation (Line(
      points={{-66.12,-8},{-62,-8},{-62,-24},{-61.1,-24}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(imSum2_1.n1, imSum3_1.p2) annotation (Line(
      points={{-51.1,-26},{-45.1,-26}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(VOTHSG,imSum2_2. p1) annotation (Line(
      points={{-75,10},{-80,10},{-80,-48},{-83.1,-48}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(VOEL,imSum2_2. p2) annotation (Line(
      points={{-75,-10},{-90,-10},{-90,-52},{-83.1,-52}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(imSum2_2.n1, imSum3_1.p3) annotation (Line(
      points={{-73.1,-50},{-48,-50},{-48,-29},{-45.1,-29}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(imIntegrator.n1, imLimited_min.p1) annotation (Line(
      points={{68.9,-26},{72.9,-26}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(ECOMP, imSum2_1.p2) annotation (Line(
      points={{-75,28},{-68,28},{-68,-28},{-61.1,-28}},
      color={0,0,127},
      smooth=Smooth.None));

  connect(imIntegrator.p1, imSum2_3.n1) annotation (Line(
      points={{58.9,-26},{52.9,-26}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(imLimited_min.n1, EFD) annotation (Line(
      points={{82.9,-26},{96,-26},{96,0},{105,0}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(imMult2_3.p2, EFD) annotation (Line(
      points={{43.1,15.8},{86,15.8},{86,0},{105,0}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(imMult2_3.n1, imSum2_4.p2) annotation (Line(
      points={{33.1,18},{6,18},{6,32},{3.1,32}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(imDerivativeLag.p1, EFD) annotation (Line(
      points={{7.95,-9},{86,-9},{86,0},{105,0}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(imDerivativeLag.n1, imSum3_1.p1) annotation (Line(
      points={{-2.05,-9},{-48,-9},{-48,-23},{-45.1,-23}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(imSum2_4.n1, imSum2_3.p1) annotation (Line(
      points={{-6.9,34},{-8,34},{-8,8},{34,8},{34,-24},{42.9,-24}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(imLimitedSimpleLag.n0, imSum2_3.p2) annotation (Line(
      points={{30.86,-28},{42.9,-28}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(VUEL, hV_GATE.n2) annotation (Line(points={{-3,-56},{-3,-30.08},{0.4,-30.08}},
                   color={0,0,127}));
  connect(imMult2_3.p1, imSetPoint3.n1) annotation (Line(points={{43.1,20.2},{47.55,
          20.2},{47.55,20},{52.55,20}}, color={0,0,127}));
  connect(imMult2_1.p1, imSE.VE_OUT) annotation (Line(points={{27.1,38.2},{44.55,
          38.2},{44.55,43.9},{53.55,43.9}}, color={0,0,127}));
  connect(imMult2_1.p2, EFD) annotation (Line(points={{27.1,33.8},{86,33.8},{86,
          0},{105,0}}, color={0,0,127}));
  connect(imSE.VE_IN, EFD) annotation (Line(points={{72.45,43.9},{86,43.9},{86,0},
          {105,0}}, color={0,0,127}));
  connect(imMult2_1.n1, imSum2_4.p1)
    annotation (Line(points={{17.1,36},{3.1,36},{3.1,36}}, color={0,0,127}));
  connect(hV_GATE.p, imLimitedSimpleLag.p1) annotation (Line(points={{10.72,-28.4},
          {13.36,-28.4},{13.36,-28},{16.86,-28}}, color={0,0,127}));
  connect(imLeadLag.n1, hV_GATE.n1) annotation (Line(points={{-15.61,-26},{-7.06,
          -26},{-7.06,-26.56},{0.4,-26.56}}, color={0,0,127}));
  connect(imSum3_1.n1, imLeadLag.p1)
    annotation (Line(points={{-35.1,-26},{-26.61,-26}}, color={0,0,127}));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false,extent={{-80,-40},
            {100,40}}),        graphics={
        Text(
          extent={{-78,-12},{-68,-20}},
          lineColor={0,0,255},
          textString="VREF"),
        Text(
          extent={{-72,-50},{-66,-56}},
          lineColor={255,0,0},
          textString="Vs"),
        Text(
          extent={{32,-28},{42,-34}},
          lineColor={255,0,0},
          textString="V"),
        Text(
          extent={{36,-32},{44,-34}},
          lineColor={255,0,0},
          textString="R"),
        Text(
          extent={{-50,-14},{-40,-20}},
          lineColor={255,0,0},
          textString="V"),
        Text(
          extent={{-38,-18},{-44,-20}},
          lineColor={255,0,0},
          textString="F"),
        Text(
          extent={{58,22},{64,16}},
          lineColor={255,0,0},
          textString="K"),
        Text(
          extent={{62,18},{66,16}},
          lineColor={255,0,0},
          textString="E")}), Icon(coordinateSystem(preserveAspectRatio=false,
          extent={{-80,-40},{100,40}}),    graphics={
        Rectangle(extent={{-80,40},{100,-40}}, lineColor={0,0,255}),
        Text(
          extent={{-68,36},{-38,20}},
          lineColor={0,0,255},
          textString="ECOMP"),
        Text(
          extent={{-68,14},{-36,4}},
          lineColor={0,0,255},
          textString="VOTHSG"),
        Text(
          extent={{-70,-6},{-44,-16}},
          lineColor={0,0,255},
          textString="VOEL"),
        Text(
          extent={{78,4},{100,-6}},
          lineColor={0,0,255},
          textString="EFD"),
        Text(
          extent={{-28,10},{36,-8}},
          lineColor={0,0,255},
          textString="ESDC1A"),
        Text(
          extent={{-74,-26},{-42,-36}},
          lineColor={0,0,255},
          textString="VUEL"),
        Text(
          extent={{-26,-18},{6,-28}},
          lineColor={0,0,255},
          textString="EFD0")}),
    Documentation(info="<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\">
<tr>
<td><p>Reference</p></td>
<td>ESDC1A, PSS/E Manual</td>
</tr>
<tr>
<td><p>Last update</p></td>
<td>Major change - 2015-10-31</td>
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
<p><span style=\"font-family: MS Shell Dlg 2;\">The authors can be contacted by email: info at ipsl dot org</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">This package is part of the iTesla Power System Library (&QUOT;iPSL&QUOT;) .</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is free software: you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">You should have received a copy of the GNU Lesser General Public License along with the iPSL. If not, see &LT;http://www.gnu.org/licenses/&GT;.</span></p>
</html>"));
end ESDC1A;
