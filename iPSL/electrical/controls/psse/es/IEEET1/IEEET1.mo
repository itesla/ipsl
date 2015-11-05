within iPSL.Electrical.Controls.PSSE.ES.IEEET1;
model IEEET1 "IEEE Type 1 excitation system"
  // "DC excitation systems in PSS/E libraryIt uses DC machines (with parallel or
  // independent self excitation) for
  // electromechanical amplification of control
  // signals and generation of field current for
  // rotor circuit of synchronous generator
  // 
  // Special DC machines (amplidynes) are
  // common
  // 
  // Used widely during 50’s and 60’s and now
  // considered as obsolete"
  import iPSL.NonElectrical.Functions.SE;
  parameter Real V_0 "Voltage magnitude at the generator terminal (pu)" annotation (Dialog(group="Power flow data"));
  //
  parameter Real T_R = 1 "Voltage input time constant (s)";
  //0
  parameter Real K_A = 40 "AVR gain";
  //400
  parameter Real T_A = 0.04 "AVR time constant (s)";
  parameter Real V_RMAX = 7.3 "Maximum AVR output (pu)";
  parameter Real V_RMIN = -7.3 "Minimum AVR output (pu)";
  parameter Real K_E = 1 "Exciter field gain, s";
  parameter Real T_E = 0.8 "Exciter time constant (s)";
  parameter Real K_F = 0.03 "Rate feedback gain (pu)";
  parameter Real T_F = 1 "Rate feedback time constant (s)";
  parameter Real E_1 = 2.400 "Exciter saturation point 1 (pu)";
  parameter Real S_EE_1 = 0.30000E-01 "Saturation at E1";
  parameter Real E_2 = 5.0000 "Exciter saturation point 2 (pu)";
  parameter Real S_EE_2 = 0.50000 "Saturation at E2";
  Modelica.Blocks.Interfaces.RealInput VOTHSG "PSS output Upss" annotation(Placement(transformation(extent = {{-106, -14}, {-100, -8}}), iconTransformation(extent={{-146,70},
            {-126,90}})));
  Modelica.Blocks.Interfaces.RealInput VOEL "OEL output" annotation(Placement(transformation(extent = {{-106, -22}, {-100, -16}}), iconTransformation(extent={{-146,30},
            {-126,50}})));
  iPSL.NonElectrical.Math.ImSetPoint Vref(V=VREF)
    annotation (Placement(transformation(extent={{-82,8},{-58,24}})));
  NonElectrical.Continuous.ImSimpleLag_nowinduplimit
                VR(                nStartValue = VR0, Ymin = VRMIN0, Ymax = VRMAX0,
    K=K_A,
    T=T_A)                                                                          annotation(Placement(transformation(extent = {{-28, -26}, {26, 20}})));
  iPSL.NonElectrical.Continuous.ImIntegrator imIntegrator(nStartValue=Efd0, K=1
        /T_E) annotation (Placement(transformation(extent={{34,-14},{56,12}})));
  Modelica.Blocks.Interfaces.RealOutput EFD "Output,excitation voltage" annotation(Placement(transformation(extent = {{76, -28}, {86, -16}}), iconTransformation(extent={{120,-6},
            {130,6}})));
  NonElectrical.Functions.ImSE
     se1(
    SE1=S_EE_1,
    SE2=S_EE_2,
    E1=E_1,
    E2=E_2)                                      annotation(Placement(transformation(extent = {{-8, -10}, {8, 10}}, rotation = 180, origin = {54, 34})));
  Modelica.Blocks.Interfaces.RealInput VUEL annotation(Placement(transformation(extent = {{-106, -30}, {-100, -24}}), iconTransformation(extent={{-146,
            -10},{-126,10}})));
  Modelica.Blocks.Interfaces.RealInput EC "Input, generator terminal voltage" annotation(Placement(transformation(extent = {{-106, 0}, {-100, 6}}), iconTransformation(extent={{-146,
            -50},{-126,-30}})));
protected
  parameter Real VRMAX0(fixed = false);
  //=7.3 "Maximum AVR output (pu)";
  parameter Real VRMIN0(fixed = false);
  //=-7.3 "Minimum AVR output (pu)";
  parameter Real KE0(fixed = false);
  //=1 "Exciter field gain, s"
  parameter Real VT0(fixed = false);
  //=Ec0;
  parameter Real VREF(fixed = false);
  //=VR0/KA+VT0+Vs.a0 "Reference terminal voltage (pu)";
  parameter Real Efd0(fixed = false);
  //
  parameter Real SE_Efd0(fixed = false);
  parameter Real VR0(fixed = false);

  function ini0
    input Real VRMAX;
    input Real KE;
    input Real E2;
    input Real SE2;
    input Real Efd0;
    input Real SE_Efd0;
    output Real Vrmax;
    output Real Ke;
  algorithm
    Vrmax := if VRMAX == 0 and KE > 0 then (SE2 + KE) * E2 else SE2 * E2;
    if VRMAX > 0 then
      Vrmax := VRMAX;
    end if;
    if KE == 0 then
      Ke := Vrmax / (10 * Efd0) - SE_Efd0;
    else
      Ke := KE;
    end if;
  end ini0;

  Modelica.Blocks.Interfaces.RealInput EFD0 "Input, generator terminal voltage"
                                                                                annotation(Placement(transformation(extent = {{-106, 10}, {-100, 16}}), iconTransformation(extent={{-146,
            -90},{-126,-70}})));
  iPSL.NonElectrical.Continuous.ImSimpleLag imSimpleLag(
    K=1,
    T=T_F,
    nStartValue=Efd0*K_F/T_F) annotation (Placement(transformation(
        extent={{23,-18},{-23,18}},
        rotation=0,
        origin={9,-50})));
  Modelica.Blocks.Math.Add3 V_Erro(k2 = -1) annotation(Placement(transformation(extent = {{-48, -2}, {-38, 8}})));
  iPSL.NonElectrical.Math.ImSum3 Vs(
    a0=0,
    a1=1,
    a2=1,
    a3=1) annotation (Placement(transformation(extent={{-78,-32},{-52,-4}})));
  Modelica.Blocks.Math.Add imSum2_2(k2 = -1) annotation(Placement(transformation(extent = {{-32, -8}, {-22, 2}})));
  Modelica.Blocks.Math.Add imSum2_1(k1 = -1, k2 = +1) annotation(Placement(transformation(extent = {{-5, -5}, {5, 5}}, rotation = 180, origin = {-29, -27})));
  Modelica.Blocks.Math.Gain imGain(k=K_F/T_F)   annotation(Placement(transformation(extent = {{-5, -5}, {5, 5}}, rotation = 180, origin = {39, -31})));
  Modelica.Blocks.Math.Gain KE_EFD(k = KE0) annotation(Placement(transformation(extent = {{-4, -4}, {4, 4}}, rotation = 180, origin = {36, 10})));
  Modelica.Blocks.Math.Add imSum2_4 annotation(Placement(transformation(extent = {{-4, -4}, {4, 4}}, rotation = 180, origin = {20, 18})));
  Modelica.Blocks.Math.Product VE annotation(Placement(transformation(extent = {{-4, -4}, {4, 4}}, rotation = 180, origin = {36, 26})));
  Modelica.Blocks.Math.Add imSum2_3(k1 = -1) annotation(Placement(transformation(extent = {{20, -6}, {30, 4}})));
  NonElectrical.Continuous.ImSimpleLag imSimpleLag1(
    K=1,
    nStartValue=VT0,
    T=T_R)
    annotation (Placement(transformation(extent={{-98,-16},{-58,22}})));
initial equation
  VT0 = V_0;
  Efd0 = EFD0;
  SE_Efd0 = SE(EFD0, S_EE_1, S_EE_2, E_1, E_2);
  (VRMAX0, KE0) = ini0(V_RMAX, K_E, E_2, S_EE_2, Efd0, SE_Efd0);
  VRMIN0 = -VRMAX0;
  VR0 = Efd0 * (KE0 + SE_Efd0);
  VREF = VR0 / K_A + VT0 + Vs.a0;

equation
  connect(imIntegrator.n1, EFD) annotation(Line(points = {{50.39, -1}, {65.95, -1}, {65.95, -22}, {81, -22}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(se1.VE_IN, imIntegrator.n1) annotation(Line(points = {{62.4, 34.1}, {66, 34.1}, {66, -1}, {50.39, -1}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(V_Erro.u1, Vref.n1) annotation(Line(points = {{-49, 7}, {-60, 7}, {-60, 16}, {-64.12, 16}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(VOTHSG, Vs.p1) annotation(Line(points = {{-103, -11}, {-84, -11}, {-84, -13.8}, {-71.63, -13.8}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(VOEL, Vs.p2) annotation(Line(points = {{-103, -19}, {-87.5, -19}, {-87.5, -18}, {-71.63, -18}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(VUEL, Vs.p3) annotation(Line(points = {{-103, -27}, {-87.5, -27}, {-87.5, -22.2}, {-71.63, -22.2}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(Vs.n1, V_Erro.u3) annotation(Line(points = {{-58.63, -18}, {-56, -18}, {-56, -1}, {-49, -1}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(imSum2_2.y, VR.p1) annotation(Line(points = {{-21.5, -3}, {-14.77, -3}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(V_Erro.y, imSum2_2.u1) annotation(Line(points = {{-37.5, 3}, {-35.75, 3}, {-35.75, 0}, {-33, 0}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(imSum2_1.y, imSum2_2.u2) annotation(Line(points = {{-34.5, -27}, {-40, -27}, {-40, -6}, {-33, -6}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(imGain.u, EFD) annotation(Line(points={{45,-31},{52,-31},{52,-32},{66,
          -32},{66,-22},{81,-22}},                                                                                                    color = {0, 0, 127}, smooth = Smooth.None));
  connect(imGain.y, imSimpleLag.p1) annotation(Line(points = {{33.5, -31}, {24, -31}, {24, -50}, {16.13, -50}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(KE_EFD.u, imIntegrator.n1) annotation(Line(points = {{40.8, 10}, {66, 10}, {66, -1}, {50.39, -1}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(se1.VE_OUT, VE.u2) annotation(Line(points = {{45.6, 34.1}, {40.8, 34.1}, {40.8, 28.4}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(VE.u1, imIntegrator.n1) annotation(Line(points = {{40.8, 23.6}, {66, 23.6}, {66, -1}, {50.39, -1}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(VE.y, imSum2_4.u2) annotation(Line(points = {{31.6, 26}, {28, 26}, {28, 20.4}, {24.8, 20.4}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(KE_EFD.y, imSum2_4.u1) annotation(Line(points = {{31.6, 10}, {28, 10}, {28, 15.6}, {24.8, 15.6}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(imSum2_3.y, imIntegrator.p1) annotation(Line(points = {{30.5, -1}, {39.39, -1}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(VR.n0, imSum2_3.u2) annotation(Line(points = {{12.23, -3}, {17.115, -3}, {17.115, -4}, {19, -4}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(imSum2_4.y, imSum2_3.u1) annotation(Line(points = {{15.6, 18}, {14, 18}, {14, 2}, {19, 2}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(imSum2_1.u2, imSimpleLag.p1) annotation(Line(points = {{-23, -24}, {24, -24}, {24, -50}, {16.13, -50}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(imSum2_1.u1, imSimpleLag.n1) annotation(Line(points={{-23,-30},
          {-14,-30},{-14,-50},{-7.1,-50}},                                                                          color = {0, 0, 127}, smooth = Smooth.None));
  connect(EC, imSimpleLag1.p1)
    annotation (Line(points={{-103,3},{-93.5,3},{-84.2,3}}, color={0,0,127}));
  connect(imSimpleLag1.n1, V_Erro.u2)
    annotation (Line(points={{-64,3},{-64,3},{-49,3}}, color={0,0,127}));
  annotation(Diagram(coordinateSystem(preserveAspectRatio=false,   extent={{-140,
            -100},{120,100}}),                                                                           graphics={  Text(extent=  {{-58, -22}, {-52, -28}}, lineColor=  {0, 0, 255}, textString=  "Vs"), Text(extent=  {{-78, 26}, {-66, 20}}, lineColor=  {0, 0, 255}, textString=  "Vref"), Text(extent=  {{10, 40}, {38, 32}}, lineColor=  {0, 0, 255}, textString=  "VE=SE*EFD"), Text(extent=  {{-108, 26}, {-92, 20}}, lineColor=  {0, 0, 255}, textString=  "Efd0"), Text(extent=  {{-110, 10}, {-82, 4}}, lineColor=  {0, 0, 255}, textString=  "Ec"), Text(extent=  {{-102, -20}, {-80, -26}}, lineColor=  {0, 0, 255}, textString=  "VUEL"), Text(extent=  {{-102, -12}, {-80, -18}}, lineColor=  {0, 0, 255}, textString=  "VOEL"), Text(extent=  {{-100, -2}, {-82, -12}}, lineColor=  {0, 0, 255}, textString=  "VOTHSG")}), Icon(coordinateSystem(preserveAspectRatio=false,   extent={{-140,
            -100},{120,100}}),                                                                                                    graphics={  Rectangle(extent={{
              -140,100},{120,-100}},                                                                                                    lineColor=  {0, 0, 255}), Text(extent={{
              -126,-36},{-68,-62}},                                                                                                    lineColor=
              {0,0,255},
          textString="ECOMP
"),                                                                                        Text(extent={{
              -124,92},{-60,68}},                                                                                                    lineColor=  {0, 0, 255}, textString=  "VOTHSG"), Text(extent={{
              -130,8},{-80,-8}},                                                                                                    lineColor=  {0, 0, 255}, textString=  "VUEL"), Text(extent={{
              88,8},{118,-8}},                                                                                                    lineColor=  {0, 0, 255}, textString=  "EFD"), Text(extent={{
              -46,36},{54,-36}},                                                                                                    lineColor=  {0, 0, 255}, textString=  "IEEET1"), Text(extent={{
              -126,48},{-84,32}},                                                                                                    lineColor=  {0, 0, 255}, textString=  "VOEL"), Text(extent={{
              -132,-72},{-76,-88}},                                                                                                    lineColor=
              {0,0,255},
          textString="EFD0")}),
    Documentation(info="<html>
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
end IEEET1;
