within iPSL.Electrical.Controls.PSSE.ES.ESDC1A;


model ESDC1A
  import iPSL.NonElectrical.Functions.SE;
  Modelica.Blocks.Interfaces.RealInput ECOMP "Input, generator terminal voltage" annotation (Placement(transformation(extent={{-80,22},{-70,34}}), iconTransformation(extent={{-80,22},{-70,34}})));
  Modelica.Blocks.Interfaces.RealInput VOTHSG "Upss" annotation (Placement(transformation(extent={{-80,4},{-70,16}}), iconTransformation(extent={{-80,4},{-70,16}})));
  Modelica.Blocks.Interfaces.RealInput VOEL "OEL output" annotation (Placement(transformation(extent={{-80,-16},{-70,-4}}), iconTransformation(extent={{-80,-16},{-70,-4}})));
  Modelica.Blocks.Interfaces.RealOutput EFD "Output,excitation voltage" annotation (Placement(transformation(extent={{100,-6},{110,6}}), iconTransformation(extent={{100,-6},{110,6}})));
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
  Modelica.Blocks.Continuous.Derivative imDerivativeLag(
    k=K_F,
    T=T_F1,
    y_start=0,
    initType=Modelica.Blocks.Types.Init.InitialOutput) annotation (Placement(transformation(extent={{8,-14},{-2,-4}})));
  NonElectrical.Logical.HV_GATE hV_GATE annotation (Placement(transformation(extent={{-2,-36},{14,-20}})));
  Modelica.Blocks.Interfaces.RealInput VUEL "UEL output"
    annotation (Placement(transformation(
        extent={{-5,-6},{5,6}},
        rotation=90,
        origin={-3,-56}), iconTransformation(extent={{-80,-36},{-70,-24}})));
  Modelica.Blocks.Interfaces.RealInput EFD0 annotation (Placement(transformation(
        extent={{-7,-7},{7,7}},
        rotation=0,
        origin={-79,33}), iconTransformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={-10,-34})));
  NonElectrical.Functions.ImSE imSE(
    SE1=S_EE_1,
    SE2=S_EE_2,
    E1=E_1,
    E2=E_2) annotation (Placement(transformation(extent={{72,34},{54,56}})));
  NonElectrical.Continuous.LeadLag imLeadLag(
    K=1,
    T1=T_C,
    T2=T_B,
    y_start=vr0/K_A) annotation (Placement(transformation(extent={{-22,-32},{-10,-20}})));
  Modelica.Blocks.Math.Add add(k1=-1) annotation (Placement(transformation(extent={{60,-30},{74,-16}})));
  Modelica.Blocks.Continuous.LimIntegrator limIntegrator(
    k=1/T_E,
    outMax=Modelica.Constants.inf,
    outMin=0,
    initType=Modelica.Blocks.Types.Init.InitialState,
    y_start=vf00) annotation (Placement(transformation(extent={{80,-28},{90,-18}})));
  Modelica.Blocks.Math.Add add1 annotation (Placement(transformation(extent={{2,22},{-12,36}})));
  Modelica.Blocks.Math.Product product annotation (Placement(transformation(extent={{32,32},{18,46}})));
  Modelica.Blocks.Math.Product product1 annotation (Placement(transformation(extent={{52,14},{38,28}})));
  Modelica.Blocks.Sources.Constant const(k=K_E) annotation (Placement(transformation(extent={{82,20},{70,32}})));
  Modelica.Blocks.Math.Add3 add3_1(k2=-1, k1=-1) annotation (Placement(transformation(extent={{-40,0},{-28,12}})));
  NonElectrical.Continuous.SimpleLag imLimitedSimpleLag1(
    K=1,
    T=T_R,
    y_start=ECOMP0) annotation (Placement(transformation(extent={{-64,22},{-52,34}})));
  Modelica.Blocks.Math.Add3 add3_2 annotation (Placement(transformation(extent={{-62,-4},{-52,6}})));
  Modelica.Blocks.Sources.Constant const1(k=VREF) annotation (Placement(transformation(extent={{-78,-24},{-70,-16}})));
  NonElectrical.Continuous.SimpleLagLim simpleLagLim(
    K=K_A,
    T=T_A,
    y_start=vr0,
    outMax=V_RMAX,
    outMin=V_RMIN) annotation (Placement(transformation(extent={{30,-34},{40,-24}})));
protected
  parameter Real VREF(fixed=false);
  parameter Real vf00(fixed=false) "Initial field voltage";
  parameter Real vr0(fixed=false);
  parameter Real ECOMP0(fixed=false);
initial equation
  ECOMP0 = ECOMP;
  vf00 = EFD0;
  vr0 = vf00*(1 + K_E + SE(
    vf00,
    S_EE_1,
    S_EE_2,
    E_1,
    E_2));
  VREF = vr0/K_A + ECOMP0;
equation
  connect(VUEL, hV_GATE.n2) annotation (Line(points={{-3,-56},{-3,-30.08},{0.4,-30.08}}, color={0,0,127}));
  connect(imSE.VE_IN, EFD) annotation (Line(points={{72.45,44.89},{86,44.89},{86,0},{105,0}}, color={0,0,127}));
  connect(imLeadLag.y, hV_GATE.n1) annotation (Line(points={{-9.4,-26},{0.4,-26},{0.4,-26.56}}, color={0,0,127}));
  connect(add.y, limIntegrator.u) annotation (Line(points={{74.7,-23},{74.7,-23},{79,-23}}, color={0,0,127}));
  connect(limIntegrator.y, EFD) annotation (Line(points={{90.5,-23},{94,-23},{94,0},{105,0}}, color={0,0,127}));
  connect(add1.y, add.u1) annotation (Line(points={{-12.7,29},{-20,29},{-20,2},{52,2},{52,-18},{56,-18},{56,-18.8},{58.6,-18.8}}, color={0,0,127}));
  connect(product.u1, imSE.VE_OUT) annotation (Line(points={{33.4,43.2},{43.7,43.2},{43.7,44.89},{53.55,44.89}}, color={0,0,127}));
  connect(product.u2, EFD) annotation (Line(points={{33.4,34.8},{86,34.8},{86,0},{105,0}}, color={0,0,127}));
  connect(product.y, add1.u1) annotation (Line(points={{17.3,39},{10,39},{10,33.2},{3.4,33.2}}, color={0,0,127}));
  connect(add1.u2, product1.y) annotation (Line(points={{3.4,24.8},{20.7,24.8},{20.7,21},{37.3,21}}, color={0,0,127}));
  connect(product1.u2, EFD) annotation (Line(points={{53.4,16.8},{86,16.8},{86,0},{105,0}}, color={0,0,127}));
  connect(product1.u1, const.y) annotation (Line(points={{53.4,25.2},{69.4,25.2},{69.4,26}}, color={0,0,127}));
  connect(ECOMP, imLimitedSimpleLag1.u) annotation (Line(points={{-75,28},{-70,28},{-65.2,28}}, color={0,0,127}));
  connect(imLimitedSimpleLag1.y, add3_1.u2) annotation (Line(points={{-51.4,28},{-50,28},{-50,6},{-41.2,6}}, color={0,0,127}));
  connect(imDerivativeLag.y, add3_1.u1) annotation (Line(points={{-2.5,-9},{-46,-9},{-46,10.8},{-41.2,10.8}}, color={0,0,127}));
  connect(add3_1.y, imLeadLag.u) annotation (Line(points={{-27.4,6},{-26,6},{-26,-26},{-23.2,-26}}, color={0,0,127}));
  connect(imDerivativeLag.u, EFD) annotation (Line(points={{9,-9},{86,-9},{86,0},{105,0}}, color={0,0,127}));
  connect(add3_2.y, add3_1.u3) annotation (Line(points={{-51.5,1},{-47.75,1},{-47.75,1.2},{-41.2,1.2}}, color={0,0,127}));
  connect(VOTHSG, add3_2.u1) annotation (Line(points={{-75,10},{-66,10},{-66,5},{-63,5}}, color={0,0,127}));
  connect(VOEL, add3_2.u2) annotation (Line(points={{-75,-10},{-66,-10},{-66,1},{-63,1}}, color={0,0,127}));
  connect(const1.y, add3_2.u3) annotation (Line(points={{-69.6,-20},{-63,-20},{-63,-3}}, color={0,0,127}));
  connect(hV_GATE.p, simpleLagLim.u) annotation (Line(points={{10.72,-28.4},{19.36,-28.4},{19.36,-29},{29,-29}}, color={0,0,127}));
  connect(simpleLagLim.y, add.u2) annotation (Line(points={{40.5,-29},{54,-29},{54,-27.2},{58.6,-27.2}}, color={0,0,127}));
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-80,-40},{100,40}})),
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-80,-40},{100,40}}), graphics={Rectangle(extent={{-80,40},{100,-40}}, lineColor={0,0,255}),Text(
          extent={{-68,36},{-38,20}},
          lineColor={0,0,255},
          textString="ECOMP"),Text(
          extent={{-68,14},{-36,4}},
          lineColor={0,0,255},
          textString="VOTHSG"),Text(
          extent={{-70,-6},{-44,-16}},
          lineColor={0,0,255},
          textString="VOEL"),Text(
          extent={{78,4},{100,-6}},
          lineColor={0,0,255},
          textString="EFD"),Text(
          extent={{-28,10},{36,-8}},
          lineColor={0,0,255},
          textString="ESDC1A"),Text(
          extent={{-74,-26},{-42,-36}},
          lineColor={0,0,255},
          textString="VUEL"),Text(
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
