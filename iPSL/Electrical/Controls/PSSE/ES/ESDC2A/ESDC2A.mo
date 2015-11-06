within iPSL.Electrical.Controls.PSSE.ES.ESDC2A;
model ESDC2A
  import iPSL.NonElectrical.Functions.SE;
  iPSL.NonElectrical.Math.ImSum2 imSum2_1(
    a0=0,
    a1=1,
    a2=-1) annotation (Placement(transformation(extent={{-80,-38},{-60,-18}})));
  iPSL.NonElectrical.Math.ImSetPoint Vref(V=VREF)
    annotation (Placement(transformation(extent={{-98,-22},{-74,2}})));
  iPSL.NonElectrical.Math.ImSum3 imSum3_1(
    a0=0,
    a2=1,
    a1=-1,
    a3=1) annotation (Placement(transformation(extent={{-64,-38},{-44,-18}})));
  iPSL.NonElectrical.Math.ImSum2 imSum2_2(
    a0=0,
    a1=1,
    a2=1) annotation (Placement(transformation(extent={{-102,-62},{-82,-42}})));
  Modelica.Blocks.Interfaces.RealInput ECOMP
    "Input, generator terminal voltage"
    annotation (Placement(transformation(extent={{-100,24},{-90,36}}),
        iconTransformation(extent={{-100,24},{-90,36}})));
  Modelica.Blocks.Interfaces.RealInput VOTHSG "Upss"
    annotation (Placement(transformation(extent={{-100,2},{-90,14}}),
        iconTransformation(extent={{-100,2},{-90,14}})));
  Modelica.Blocks.Interfaces.RealInput VOEL "OEL output"
    annotation (Placement(transformation(extent={{-100,-16},{-90,-4}}),
        iconTransformation(extent={{-100,-16},{-90,-4}})));
  iPSL.NonElectrical.Continuous.ImIntegrator imIntegrator(nStartValue=vf00, K=1
        /T_E) annotation (Placement(transformation(extent={{54,-36},{74,-16}})));
  NonElectrical.Continuous.ImLimited                  imLimited_min(Ymin=1e-6, Ymax=
        999999)
    annotation (Placement(transformation(extent={{68,-36},{88,-16}})));
  iPSL.NonElectrical.Math.ImSum2 imSum2_4(
    a0=0,
    a1=1,
    a2=1) annotation (Placement(transformation(extent={{8,24},{-12,44}})));
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
parameter Real K_D=0.48 "Exciter demagnetizing factor. p.u";
parameter Real E_1=5.25 "Exciter saturation point 1 (pu)";
parameter Real E_2=7 "Exciter saturation point 2 (pu)";
parameter Real S_EE_1=0.03 "Saturation at E1";
parameter Real S_EE_2=0.1 "Saturation at E2";

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
    annotation (Placement(transformation(extent={{8,-6},{-4,6}})));
  iPSL.NonElectrical.Math.ImSum2 imSum2_3(
    a0=0,
    a2=1,
    a1=-1) annotation (Placement(transformation(extent={{38,-36},{58,-16}})));
  NonElectrical.Logical.HV_GATE
          hV_GATE
    annotation (Placement(transformation(extent={{-20,-40},{2,-20}})));
  Modelica.Blocks.Interfaces.RealInput VUEL "UEL output"
    annotation (Placement(transformation(extent={{-96,-80},{-86,-68}}),
        iconTransformation(extent={{-100,-36},{-90,-24}})));
  Modelica.Blocks.Interfaces.RealInput VT "sensed VT"
    annotation (Placement(transformation(extent={{-5,-6},{5,6}},
        rotation=270,
        origin={25,-60}),
        iconTransformation(extent={{-6,-6},{6,6}},
        rotation=90,
        origin={-10,-34})));
  iPSL.NonElectrical.Continuous.ImSimpleLag imSimpleLag(
    K=K_A,
    T=T_A,
    nStartValue=vr0)
    annotation (Placement(transformation(extent={{-12,-48},{32,-14}})));
  lmitedVT lmitedVT1(VRMAX=V_RMAX, VRMIN=V_RMIN)
    annotation (Placement(transformation(extent={{16,-66},{48,-34}})));
public
  Modelica.Blocks.Interfaces.RealInput EFD0 annotation (Placement(
        transformation(
        extent={{-7,-7},{7,7}},
        rotation=0,
        origin={-129,39}), iconTransformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={-50,-34})));
  NonElectrical.Math.ImSetPoint              imSetPoint3(V=K_E)
    annotation (Placement(transformation(extent={{70,18},{60,30}})));
  NonElectrical.Math.ImMult2              imMult2_1(
    a0=0,
    a1=1,
    a2=1) annotation (Placement(transformation(extent={{42,30},{22,50}})));
  NonElectrical.Math.ImMult2              imMult2_3(
    a0=0,
    a1=1,
    a2=1) annotation (Placement(transformation(extent={{58,12},{38,32}})));
  NonElectrical.Functions.ImSE imSE(
    SE1=S_EE_1,
    SE2=S_EE_2,
    E1=E_1,
    E2=E_2) annotation (Placement(transformation(extent={{82,38},{64,58}})));
  NonElectrical.Continuous.ImLeadLag imLeadLag(
    K=1,
    T1=T_C,
    T2=T_B,
    nStartValue=vr0/K_A)
    annotation (Placement(transformation(extent={{-44,-38},{-22,-18}})));
initial equation
  ECOMP0 = ECOMP;
  vf00 = EFD0;
  vr0 = vf00*(1+K_E+SE(vf00,S_EE_1,S_EE_2,E_1,E_2));
  VREF = vr0/K_A+ECOMP0;

equation
  connect(Vref.n1, imSum2_1.p1) annotation (Line(
      points={{-80.12,-10},{-76,-10},{-76,-26},{-75.1,-26}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(imSum2_1.n1, imSum3_1.p2) annotation (Line(
      points={{-65.1,-28},{-59.1,-28}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(VOTHSG,imSum2_2. p1) annotation (Line(
      points={{-95,8},{-106.5,8},{-106.5,-50},{-97.1,-50}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(VOEL,imSum2_2. p2) annotation (Line(
      points={{-95,-10},{-104,-10},{-104,-54},{-97.1,-54}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(imSum2_2.n1, imSum3_1.p3) annotation (Line(
      points={{-87.1,-52},{-62,-52},{-62,-31},{-59.1,-31}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(imIntegrator.n1, imLimited_min.p1) annotation (Line(
      points={{68.9,-26},{72.9,-26}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(ECOMP, imSum2_1.p2) annotation (Line(
      points={{-95,30},{-98,30},{-98,-30},{-75.1,-30}},
      color={0,0,127},
      smooth=Smooth.None));

  connect(imIntegrator.p1, imSum2_3.n1) annotation (Line(
      points={{58.9,-26},{52.9,-26}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(VUEL, hV_GATE.n2) annotation (Line(
      points={{-91,-74},{-16.7,-74},{-16.7,-32.6}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(imLimited_min.n1, EFD) annotation (Line(
      points={{82.9,-26},{98,-26},{98,0},{105,0}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(imDerivativeLag.p1, EFD) annotation (Line(
      points={{7.94,0},{105,0}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(imDerivativeLag.n1, imSum3_1.p1) annotation (Line(
      points={{-4.06,0},{-64,0},{-64,-25},{-59.1,-25}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(imSum2_4.n1, imSum2_3.p1) annotation (Line(
      points={{-6.9,34},{-8,34},{-8,8},{34,8},{34,-24},{42.9,-24}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(hV_GATE.p, imSimpleLag.p1) annotation (Line(
      points={{-2.51,-30.5},{0.745,-30.5},{0.745,-31},{3.18,-31}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(lmitedVT1.n1, imSum2_3.p2) annotation (Line(
      points={{39.84,-47.44},{42.9,-47.44},{42.9,-28}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(lmitedVT1.p2, VT) annotation (Line(
      points={{24.4,-49.36},{24.4,-56.68},{25,-56.68},{25,-60}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(imSimpleLag.n1, lmitedVT1.p1) annotation (Line(
      points={{25.4,-31},{30,-31},{30,-42},{24.4,-42},{24.4,-44.72}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(imMult2_3.n1, imSum2_4.p2) annotation (Line(
      points={{43.1,22},{16,22},{16,32},{3.1,32}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(imMult2_3.p1,imSetPoint3. n1) annotation (Line(points={{53.1,24.2},{57.55,
          24.2},{57.55,24},{62.55,24}}, color={0,0,127}));
  connect(imMult2_1.p1,imSE. VE_OUT) annotation (Line(points={{37.1,42.2},{54.55,
          42.2},{54.55,47.9},{63.55,47.9}}, color={0,0,127}));
  connect(imMult2_1.n1, imSum2_4.p1)
    annotation (Line(points={{27.1,40},{3.1,40},{3.1,36}}, color={0,0,127}));
  connect(imMult2_3.p2, EFD) annotation (Line(points={{53.1,19.8},{98,19.8},{98,
          0},{105,0}}, color={0,0,127}));
  connect(imSE.VE_IN, EFD) annotation (Line(points={{82.45,47.9},{98,47.9},{98,0},
          {105,0}}, color={0,0,127}));
  connect(imMult2_1.p2, EFD) annotation (Line(points={{37.1,37.8},{98,38},{98,0},
          {105,0}}, color={0,0,127}));
  connect(imSum3_1.n1, imLeadLag.p1)
    annotation (Line(points={{-49.1,-28},{-38.61,-28}}, color={0,0,127}));
  connect(imLeadLag.n1, hV_GATE.n1) annotation (Line(points={{-27.61,-28},{-16.7,
          -28},{-16.7,-28.2}}, color={0,0,127}));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false,extent={{-100,-40},
            {100,40}}),        graphics={
        Text(
          extent={{-94,-14},{-84,-22}},
          lineColor={0,0,255},
          textString="Vref"),
        Text(
          extent={{-86,-52},{-80,-58}},
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
          extent={{-34,-16},{-24,-22}},
          lineColor={255,0,0},
          textString="V"),
        Text(
          extent={{-22,-20},{-28,-22}},
          lineColor={255,0,0},
          textString="F"),
        Text(
          extent={{68,26},{74,20}},
          lineColor={255,0,0},
          textString="K"),
        Text(
          extent={{72,22},{76,20}},
          lineColor={255,0,0},
          textString="E")}), Icon(coordinateSystem(preserveAspectRatio=false,
          extent={{-100,-40},{100,40}}),   graphics={
        Rectangle(extent={{-100,40},{100,-40}},lineColor={0,0,255}),
        Text(
          extent={{74,4},{102,-6}},
          lineColor={0,0,255},
          textString="EFD"),
        Text(
          extent={{-42,8},{40,-12}},
          lineColor={0,0,255},
          textString="ESDC2A"),
        Text(
          extent={{-86,38},{-56,22}},
          lineColor={0,0,255},
          textString="ECOMP"),
        Text(
          extent={{-86,16},{-54,6}},
          lineColor={0,0,255},
          textString="VOTHSG"),
        Text(
          extent={{-88,-4},{-62,-14}},
          lineColor={0,0,255},
          textString="VOEL"),
        Text(
          extent={{-92,-24},{-60,-34}},
          lineColor={0,0,255},
          textString="VUEL"),
        Text(
          extent={{-66,-18},{-34,-28}},
          lineColor={0,0,255},
          textString="EFD0"),
        Text(
          extent={{-26,-18},{6,-28}},
          lineColor={0,0,255},
          textString="VT")}),
    Documentation(info="<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\">
<tr>
<td><p>Reference</p></td>
<td>ESDC2A, PSS/E Manual</td>
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
end ESDC2A;
