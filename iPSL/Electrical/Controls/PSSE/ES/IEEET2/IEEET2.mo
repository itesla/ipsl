within iPSL.Electrical.Controls.PSSE.ES.IEEET2;
model IEEET2 "IEEE Type 2 excitation system"

  parameter Real V_0 "Voltage magnitude at the generator terminal (pu)" annotation (Dialog(group="Power flow data"));
  parameter Real T_R = 0.02 "Voltage input time constant (s)";
  parameter Real K_A = 200.0 "AVR gain";
  parameter Real T_A = 0.001 "AVR time constant (s)";
  parameter Real V_RMAX = 6.08 "Maximum AVR output (pu)";
  parameter Real V_RMIN = -6.08 "Minimum AVR output (pu)";
  parameter Real K_E = 1 "Exciter field gain";
  parameter Real T_E = 0.55 "Exciter time constant s";
  parameter Real K_F = 0.06 "Rate feedback gain (pu)";
  parameter Real T_F1 = 0.3 "Rate feedback time constant (s)";
  parameter Real T_F2 = 0.6 "Rate feedback time constant (s)";
  parameter Real E_1 = 2.85 "Exciter saturation point 1 (pu)";
  parameter Real S_EE_1 = 0.3 "Saturation at E_1";
  parameter Real E_2 = 3.8 "Exciter saturation point 2 (pu)";
  parameter Real S_EE_2 = 0.6 "Saturation at E_2";
  //0.47
  Modelica.Blocks.Interfaces.RealInput VOTHSG "PSS output Upss" annotation(Placement(transformation(extent = {{-110, -20}, {-104, -12}}), iconTransformation(extent={{-126,30},
            {-106,50}})));
  Modelica.Blocks.Interfaces.RealInput VOEL "OEL output" annotation(Placement(transformation(extent = {{-110, -28}, {-104, -20}}), iconTransformation(extent={{-126,
            -10},{-106,10}})));
  iPSL.NonElectrical.Math.ImSum3 V_Erro(
    a0=0,
    a1=1,
    a2=-1,
    a3=1) annotation (Placement(transformation(extent={{-56,-14},{-30,14}})));
  iPSL.NonElectrical.Math.ImSetPoint Vref(V=VREF)
    annotation (Placement(transformation(extent={{-100,12},{-78,28}})));
  iPSL.NonElectrical.Math.ImSum2 imSum2_2(
    a0=0,
    a1=1,
    a2=-1) annotation (Placement(transformation(extent={{-38,-12},{-18,8}})));
  NonElectrical.Continuous.ImSimpleLag_nowinduplimit            VR(                nStartValue = VR0, Ymin = VRMIN0, Ymax = VRMAX0,
    K=K_A,
    T=T_A)                                                                                                     annotation(Placement(transformation(extent = {{-16, -24}, {36, 20}})));
  iPSL.NonElectrical.Math.ImSum2 imSum2_3(
    a0=0,
    a1=-1,
    a2=1) annotation (Placement(transformation(extent={{52,-10},{72,10}})));
  iPSL.NonElectrical.Continuous.ImIntegrator imIntegrator(nStartValue=Efd0, K=1
        /T_E) annotation (Placement(transformation(extent={{64,-14},{90,14}})));
  Modelica.Blocks.Interfaces.RealOutput EFD(start = Efd0)
    "Output,excitation voltage"                                                       annotation(Placement(transformation(extent = {{100, -6}, {110, 6}}), iconTransformation(extent={{120,-10},
            {138,10}})));
  iPSL.NonElectrical.Math.ImGain KE_EFD(K=K_E)
    annotation (Placement(transformation(extent={{82,2},{62,22}})));
  iPSL.NonElectrical.Math.ImSum2 imSum2_4(
    a0=0,
    a1=1,
    a2=1) annotation (Placement(transformation(extent={{66,4},{46,24}})));
  Modelica.Blocks.Interfaces.RealInput VUEL annotation(Placement(transformation(extent={{-112,
            -38},{-106,-30}}),iconTransformation(extent={{-126,
            -50},{-106,-30}})));
  iPSL.NonElectrical.Math.ImSum3 Vs(
    a0=0,
    a1=1,
    a2=1,
    a3=1) annotation (Placement(transformation(extent={{-78,-52},{-54,4}})));

  function ini0
    input Real VRMAX;
    input Real KE;
    input Real E2;
    input Real SE2;
    input Real Efd0;
    input Real SE_Efd0;
    output Real[2, 1] ini_0;
  protected
    Real Vrmax;
    Real Ke;
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
    ini_0 := [Ke; Vrmax];
  end ini0;

  NonElectrical.Continuous.ImSimpleLag                  V_F2(nStartValue = 0,
    K=1,
    T=T_F2)                                                                            annotation(Placement(transformation(extent = {{4, -44}, {-44, 0}})));
  Modelica.Blocks.Interfaces.RealInput EFD0 "Input, generator terminal voltage"
                                                                                annotation(Placement(transformation(extent = {{-110, -46}, {-104, -38}}), iconTransformation(extent={{-126,
            -90},{-106,-70}})));
  iPSL.NonElectrical.Math.ImSum2 imSum2_1(
    a0=0,
    a1=1,
    a2=-1) annotation (Placement(transformation(
        extent={{-9,10},{9,-10}},
        rotation=180,
        origin={3,-22})));
  iPSL.NonElectrical.Continuous.ImSimpleLag imSimpleLag(
    K=1,
    T=T_F1,
    nStartValue=VR0*K_F/T_F1) annotation (Placement(transformation(
        extent={{23,-18},{-23,18}},
        rotation=0,
        origin={29,-36})));
  iPSL.NonElectrical.Math.ImGain imGain(K=K_F/T_F1) annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={48,-24})));
  iPSL.NonElectrical.Math.ImMult2 VE(
    a0=0,
    a1=1,
    a2=1) annotation (Placement(transformation(extent={{80,14},{60,34}})));
  NonElectrical.Functions.ImSE                       se1(
    SE1=S_EE_1,
    SE2=S_EE_2,
    E1=E_1,
    E2=E_2)                                                                                      annotation(Placement(transformation(extent = {{-8, -9}, {8, 9}}, rotation = 180, origin = {90, 33})));
  Modelica.Blocks.Interfaces.RealInput ECOMP
    "Input, generator terminal voltage"                                             annotation(Placement(visible = true, transformation(origin = {-106, 0}, extent = {{-4, -4}, {4, 4}}, rotation = 0), iconTransformation(origin={-116,80},    extent={{-10,-10},
            {10,10}},                                                                                                  rotation = 0)));
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
  parameter Real[2, 1] ini_0(fixed = false);
public
  NonElectrical.Continuous.ImSimpleLag imSimpleLag1(
    K=1,
    nStartValue=VT0,
    T=T_R)
          annotation (Placement(transformation(extent={{-94,-16},{-58,16}})));
initial algorithm
  VT0 := V_0;
  Efd0 := EFD0;
  SE_Efd0 := NonElectrical.Functions.SE(Efd0, S_EE_1, S_EE_2, E_1, E_2);
  ini_0 := ini0(V_RMAX, K_E, E_2, S_EE_2, Efd0, SE_Efd0);
  KE0 := ini_0[1, 1];
  VRMAX0 := ini_0[2, 1];
  VRMIN0 := -ini_0[2, 1];
  VR0 := Efd0 * (KE0 + SE_Efd0);
  VREF := VR0 / K_A + VT0 - Vs.a0;

equation
  connect(V_Erro.n1, imSum2_2.p1) annotation(Line(points = {{-36.63, 0}, {-33.1, 0}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(imSum2_2.n1, VR.p1) annotation(Line(points = {{-23.1, -2}, {-3.26, -2}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(imIntegrator.n1, EFD) annotation(Line(points = {{83.37, 0.00000000000000177636}, {92.95, 0.00000000000000177636}, {92.95, 0}, {105, 0}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(KE_EFD.n1, imSum2_4.p2) annotation(Line(points = {{67.1, 12}, {61.1, 12}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(imSum2_4.n1, imSum2_3.p1) annotation(Line(points = {{51.1, 14}, {50, 14}, {50, 2}, {56.9, 2}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(VOTHSG, Vs.p1) annotation(Line(points = {{-107, -16}, {-82.5, -16}, {-82.5, -15.6}, {-72.12, -15.6}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(VUEL, Vs.p3) annotation(Line(points={{-109,-34},{-109,-31.5},{-72.12,-31.5},
          {-72.12,-32.4}},                                                                                      color = {0, 0, 127}, smooth = Smooth.None));
  connect(Vs.n1, V_Erro.p3) annotation(Line(points = {{-60.12, -24}, {-60.12, -23.5}, {-49.63, -23.5}, {-49.63, -4.2}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(V_F2.n1, imSum2_2.p2) annotation(Line(points={{-36.8,-22},
          {-33.1,-22},{-33.1,-4}},                                                                   color = {0, 0, 127}, smooth = Smooth.None));
  connect(imSum2_3.n1, imIntegrator.p1) annotation(Line(points = {{66.9, 0}, {70.37, 0}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(VOEL, Vs.p2) annotation(Line(points = {{-107, -24}, {-72.12, -24}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(KE_EFD.p1, EFD) annotation(Line(points = {{77.1, 12}, {100, 12}, {100, 0}, {105, 0}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(V_F2.p1, imSum2_1.n1) annotation(Line(points={{-12.56,-22},{-1.41,-22}},     color = {0, 0, 127}, smooth = Smooth.None));
  connect(imSimpleLag.p1, imGain.n1) annotation(Line(points = {{36.13, -36}, {42, -36}, {42, -24}, {43.1, -24}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(imGain.p1, imSum2_3.p2) annotation(Line(points = {{53.1, -24}, {56, -24}, {56, -2}, {56.9, -2}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(VR.n0, imSum2_3.p2) annotation(Line(points = {{22.74, -2}, {56.9, -2}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(imSum2_1.p1, imGain.n1) annotation(Line(points = {{7.59, -20}, {42, -20}, {42, -24}, {43.1, -24}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(imSimpleLag.n1, imSum2_1.p2) annotation(Line(points={{12.9,
          -36},{10,-36},{10,-24},{7.59,-24}},                                                                      color = {0, 0, 127}, smooth = Smooth.None));
  connect(VE.n1, imSum2_4.p1) annotation(Line(points = {{65.1, 24}, {62, 24}, {62, 16}, {61.1, 16}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(se1.VE_OUT, VE.p1) annotation(Line(points = {{81.6, 33.09}, {75.525, 33.09}, {75.525, 26.2}, {75.1, 26.2}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(VE.p2, EFD) annotation(Line(points = {{75.1, 21.8}, {98, 21.8}, {98, 0}, {105, 0}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(se1.VE_IN, KE_EFD.p1) annotation(Line(points = {{98.4, 33.09}, {98, 33.09}, {98, 12}, {77.1, 12}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(Vref.n1, V_Erro.p1) annotation(Line(points = {{-83.61, 20}, {-66, 20}, {-66, 4.2}, {-49.63, 4.2}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(ECOMP, imSimpleLag1.p1)
    annotation (Line(points={{-106,0},{-94,0},{-81.58,0}}, color={0,0,127}));
  connect(V_Erro.p2, imSimpleLag1.n1) annotation (Line(points={{-49.63,
          1.77636e-015},{-56,1.77636e-015},{-56,0},{-63.4,0}}, color={0,0,127}));
  annotation(Diagram(coordinateSystem(preserveAspectRatio = false, extent={{-120,
            -100},{120,100}}),                                                                          graphics={  Text(extent=  {{-58, -18}, {-52, -24}}, lineColor=  {0, 0, 255}, textString=  "Vs"), Text(extent=  {{-94, 24}, {-86, 16}}, lineColor=  {0, 0, 255}, textString=  "Vref"), Text(extent=  {{-104, -40}, {-88, -46}}, lineColor=  {0, 0, 255}, textString=  "Efd0"), Text(extent=  {{-112, 6}, {-84, 0}}, lineColor=  {0, 0, 255}, textString=  "Ec"), Text(extent=  {{-104, -8}, {-86, -18}}, lineColor=  {0, 0, 255}, textString=  "VOTHSG"), Text(extent=  {{-106, -18}, {-84, -24}}, lineColor=  {0, 0, 255}, textString=  "VOEL"), Text(extent=  {{-106, -26}, {-84, -32}}, lineColor=  {0, 0, 255}, textString=  "VUEL"), Text(extent=  {{44, 34}, {76, 28}}, lineColor=  {0, 0, 255}, textString=  "VE=SE*EFD")}), Icon(coordinateSystem(preserveAspectRatio=false,   extent={{-120,
            -100},{120,100}}),                                                                                                   graphics={  Text(extent={{
              100,8},{118,-8}},                                                                                                  lineColor = {0, 0, 255}, textString = "EFD"), Text(extent={{
              -38,14},{44,-18}},                                                                                                   lineColor = {0, 0, 255}, textString = "IEEET2"), Text(extent={{
              -102,-74},{-78,-86}},                                                                                                   lineColor=
              {0,0,255},
          textString="EFD0"),                                                                                                    Rectangle(extent={{
              -120,100},{120,-100}},
                                  lineColor={0,0,255}),                                                                                                    Text(extent={{
              -98,46},{-60,34}},                                                                                                    lineColor = {0, 0, 255}, textString = "VOTHSG "), Text(extent={{
              -102,-32},{-74,-48}},                                                                                                lineColor = {0, 0, 255}, textString = " VUEL "), Text(extent={{
              -102,6},{-72,-8}},                                                                                                    lineColor = {0, 0, 255}, textString = " VOEL"), Text(extent={{
              -100,84},{-68,74}},                                                                                                   lineColor = {0, 0, 255}, textString = "ECOMP")}),
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
end IEEET2;
