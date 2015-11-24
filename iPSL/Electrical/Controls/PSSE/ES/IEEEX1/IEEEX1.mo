within iPSL.Electrical.Controls.PSSE.ES.IEEEX1;
model IEEEX1

  parameter Real Ec0 "power flow node voltage";
  parameter Real T_R = 1 "Voltage input time const., s";
  parameter Real K_A = 40 "AVR gain, p.u";
  parameter Real T_A = 0.04 "AVR time const., s";
  parameter Real T_B "(sec)";
   parameter Real T_C "(sec)";
  parameter Real V_RMAX = 7.3 "Max. AVR output, p.u";
  parameter Real V_RMIN = -7.3 "Min. AVR output, p.u";
  parameter Real K_E = 1 "Exciter field gain, s";
  parameter Real T_E = 0.8 "Exciter time const., s";
  parameter Real K_F = 0.03 "Rate feedback gain, p.u";
  parameter Real T_F1 = 1 "Rate feedback time const., s";
  parameter Real E_1 = 2.400 "Exciter sat. point 1, p.u";
  parameter Real S_EE_1 = 0.30000E-01 "Saturation at E1";
  parameter Real E_2 = 5.0000 "Exciter sat. point 2, p.u";
  parameter Real S_EE_2 = 0.50000 "Saturation at E2";

  Modelica.Blocks.Interfaces.RealInput VOTHSG "PSS output Upss" annotation(Placement(transformation(extent={{-138,40},
            {-132,46}}),                                                                                                    iconTransformation(extent={{-144,36},
            {-134,46}})));
  Modelica.Blocks.Interfaces.RealInput VOEL "OEL output" annotation(Placement(transformation(extent={{-134,32},
            {-128,38}}),                                                                                                    iconTransformation(extent={{-144,16},
            {-134,26}})));
  iPSL.NonElectrical.Math.ImSetPoint Vref(V=VREF)
    annotation (Placement(transformation(extent={{-124,0},{-100,16}})));
  NonElectrical.Continuous.ImSimpleLag_nowinduplimit            VR(
    K=K_A,
    T=T_A,
    nStartValue=VR0,
    Ymin=VRMIN0,
    Ymax=VRMAX0)
    annotation (Placement(transformation(extent={{-20,-24},{34,22}})));
  iPSL.NonElectrical.Continuous.ImIntegrator imIntegrator(K=1/T_E, nStartValue=
        Efd0) annotation (Placement(transformation(extent={{54,-12},{76,14}})));
  Modelica.Blocks.Interfaces.RealOutput EFD "Output,excitation voltage" annotation(Placement(transformation(extent={{120,-6},
            {130,6}}),                                                                                                    iconTransformation(extent={{120,-6},
            {130,6}})));
  NonElectrical.Functions.ImSE                       se1(
    SE1=S_EE_1,
    SE2=S_EE_2,
    E1=E_1,
    E2=E_2) annotation (Placement(transformation(
        extent={{-8,-10},{8,10}},
        rotation=180,
        origin={74,36})));
  Modelica.Blocks.Interfaces.RealInput VUEL annotation(Placement(transformation(extent={{-138,24},
            {-132,30}}),                                                                                              iconTransformation(extent={{-144,-4},
            {-134,6}})));
  Modelica.Blocks.Interfaces.RealInput ECOMP
    "Input, generator terminal voltage" annotation (Placement(transformation(
          extent={{-138,-10},{-132,-4}}), iconTransformation(extent={{-144,-24},
            {-134,-14}})));
protected
  parameter Real VRMAX0(fixed = false);
  //=7.3 "Max. AVR output, p.u";
  parameter Real VRMIN0(fixed = false);

  //=-7.3 "Min. AVR output, p.u";
  parameter Real KE0(fixed = false);
  //=1 "Exciter field gain, s"
  parameter Real VT0(fixed = false);
  //=Ec0;
  parameter Real VREF(fixed = false);
  //=VR0/KA+VT0+Vs.a0 "Reference terminal voltage, p.u";
  parameter Real Efd0(fixed = false);
  //
  parameter Real SE_Efd0(fixed = false);
  parameter Real VR0(fixed = false);

public
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
                                                                                annotation(Placement(transformation(extent={{-138,0},
            {-132,6}}),                                                                                                    iconTransformation(extent={{-144,
            -44},{-134,-34}})));
  iPSL.NonElectrical.Math.ImSum3 Vs(
    a0=0,
    a1=1,
    a2=1,
    a3=1) annotation (Placement(transformation(extent={{-110,22},{-84,50}})));
  Modelica.Blocks.Math.Add imSum2_2(k2 = -1) annotation(Placement(transformation(extent={{-94,-8},
            {-84,2}})));
  Modelica.Blocks.Math.Gain KE_EFD(k = KE0) annotation(Placement(transformation(extent = {{-4, -4}, {4, 4}}, rotation = 180, origin={56,12})));
  Modelica.Blocks.Math.Add imSum2_4 annotation(Placement(transformation(extent = {{-4, -4}, {4, 4}}, rotation = 180, origin={40,20})));
  Modelica.Blocks.Math.Product VE annotation(Placement(transformation(extent = {{-4, -4}, {4, 4}}, rotation = 180, origin={56,28})));
  Modelica.Blocks.Math.Add imSum2_3(k1 = -1) annotation(Placement(transformation(extent={{40,-4},
            {50,6}})));
  ImLeadLag_MJ_X1              imLeadLag_MJ(
    T1=T_C,
    T2=T_B,
    K=1,
    nStartValue=VR0/K_A)
    annotation (Placement(transformation(extent={{-56,-20},{-18,14}})));
  Modelica.Blocks.Math.Add3 V_Erro1(k3=-1)  annotation(Placement(transformation(extent={{-66,-8},
            {-56,2}})));

  NonElectrical.Continuous.ImSimpleLag imSimpleLag1(      K=1,
    nStartValue=Ec0,
    T=T_R)
    annotation (Placement(transformation(extent={{-130,-20},{-100,8}})));
  NonElectrical.Continuous.ImDerivativeLag imDerivativeLag(
    K=K_F,
    T=T_F1,
    pStartValue=0)
    annotation (Placement(transformation(extent={{12,-58},{-32,-18}})));
initial equation
  VT0 = Ec0;
  Efd0 = EFD0;
  SE_Efd0 = iPSL.NonElectrical.Functions.SE(
    EFD0,
    S_EE_1,
    S_EE_2,
    E_1,
    E_2);
  (VRMAX0, KE0) = ini0(V_RMAX, K_E, E_2, S_EE_2, Efd0, SE_Efd0);
  VRMIN0 = -VRMAX0;
  VR0 = Efd0 * (KE0 + SE_Efd0);
  VREF = VR0 / K_A + VT0 - Vs.n1;

equation
  connect(imIntegrator.n1, EFD) annotation(Line(points={{70.39,1},{85.95,1},{
          85.95,0},{125,0}},                                                                                  color = {0, 0, 127}, smooth = Smooth.None));
  connect(se1.VE_IN, imIntegrator.n1) annotation(Line(points={{82.4,36.1},{86,
          36.1},{86,1},{70.39,1}},                                                                                color = {0, 0, 127}, smooth = Smooth.None));
  connect(VOTHSG, Vs.p1) annotation(Line(points={{-135,43},{-116,43},{-116,40.2},
          {-103.63,40.2}},                                                                                  color = {0, 0, 127}, smooth = Smooth.None));
  connect(VOEL, Vs.p2) annotation(Line(points={{-131,35},{-119.5,35},{-119.5,36},
          {-103.63,36}},                                                                                  color = {0, 0, 127}, smooth = Smooth.None));
  connect(VUEL, Vs.p3) annotation(Line(points={{-135,27},{-119.5,27},{-119.5,
          31.8},{-103.63,31.8}},                                                                              color = {0, 0, 127}, smooth = Smooth.None));
  connect(KE_EFD.u, imIntegrator.n1) annotation(Line(points={{60.8,12},{86,12},
          {86,1},{70.39,1}},                                                                                 color = {0, 0, 127}, smooth = Smooth.None));
  connect(se1.VE_OUT, VE.u2) annotation(Line(points={{65.6,36.1},{60.8,36.1},{
          60.8,30.4}},                                                                            color = {0, 0, 127}, smooth = Smooth.None));
  connect(VE.u1, imIntegrator.n1) annotation(Line(points={{60.8,25.6},{86,25.6},
          {86,1},{70.39,1}},                                                                                  color = {0, 0, 127}, smooth = Smooth.None));
  connect(VE.y, imSum2_4.u2) annotation(Line(points={{51.6,28},{48,28},{48,22.4},
          {44.8,22.4}},                                                                                 color = {0, 0, 127}, smooth = Smooth.None));
  connect(KE_EFD.y, imSum2_4.u1) annotation(Line(points={{51.6,12},{48,12},{48,
          17.6},{44.8,17.6}},                                                                               color = {0, 0, 127}, smooth = Smooth.None));
  connect(imSum2_3.y, imIntegrator.p1) annotation(Line(points={{50.5,1},{59.39,
          1}},                                                                             color = {0, 0, 127}, smooth = Smooth.None));
  connect(VR.n0, imSum2_3.u2) annotation(Line(points={{20.23,-1},{37.115,-1},{
          37.115,-2},{39,-2}},                                                                              color = {0, 0, 127}, smooth = Smooth.None));
  connect(imSum2_4.y, imSum2_3.u1) annotation(Line(points={{35.6,20},{34,20},{
          34,4},{39,4}},                                                                              color = {0, 0, 127}, smooth = Smooth.None));
  connect(imLeadLag_MJ.n1, VR.p1) annotation (Line(
      points={{-27.69,-3},{-12,-3},{-12,-1},{-6.77,-1}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Vref.n1, imSum2_2.u1) annotation (Line(
      points={{-106.12,8},{-100,8},{-100,0},{-95,0}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(V_Erro1.y, imLeadLag_MJ.p1) annotation (Line(
      points={{-55.5,-3},{-46.69,-3}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(imSum2_2.y, V_Erro1.u2) annotation (Line(
      points={{-83.5,-3},{-67,-3}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Vs.n1, V_Erro1.u1) annotation (Line(
      points={{-90.63,36},{-78,36},{-78,1},{-67,1}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(ECOMP, imSimpleLag1.p1) annotation (Line(points={{-135,-7},{-127.5,-7},
          {-127.5,-6},{-119.65,-6}}, color={0,0,127}));
  connect(imSimpleLag1.n1, imSum2_2.u2)
    annotation (Line(points={{-104.5,-6},{-95,-6}},  color={0,0,127}));
  connect(imDerivativeLag.p1, EFD) annotation (Line(points={{11.78,-38},{86,-38},
          {86,0},{86,1},{86,0},{125,0}},         color={0,0,127}));
  connect(imDerivativeLag.n1, V_Erro1.u3) annotation (Line(points={{-32.22,-38},
          {-76,-38},{-76,-7},{-67,-7}}, color={0,0,127}));
  annotation(Diagram(coordinateSystem(preserveAspectRatio=false,   extent={{-140,
            -60},{120,60}}),                                                                             graphics={  Text(extent={{
              -90,32},{-84,26}},                                                                                                    lineColor=  {0, 0, 255}, textString=  "Vs"), Text(extent={{
              -120,18},{-108,12}},                                                                                                    lineColor=  {0, 0, 255}, textString=  "Vref"), Text(extent={{
              30,42},{58,34}},                                                                                                    lineColor=  {0, 0, 255}, textString=  "VE=SE*EFD"), Text(extent={{
              -140,16},{-124,10}},                                                                                                    lineColor=  {0, 0, 255}, textString=  "Efd0"), Text(extent={{
              -142,0},{-114,-6}},                                                                                                    lineColor=  {0, 0, 255}, textString=  "Ec")}),      Icon(coordinateSystem(preserveAspectRatio=false,   extent={{-140,
            -60},{120,60}}),                                                                                                    graphics={  Rectangle(extent={{
              -140,60},{120,-60}},                                                                                                    lineColor = {0, 0, 255}), Text(extent={{
              -136,-16},{-110,-24}},                                                                                                    lineColor = {0, 0, 255}, textString = "Ec"), Text(extent={{
              -132,46},{-108,36}},                                                                                                    lineColor = {0, 0, 255}, textString = "VOTHSG"), Text(extent={{
              -134,4},{-110,-2}},                                                                                                    lineColor = {0, 0, 255}, textString = "VUEL"), Text(extent={{
              88,8},{118,-8}},                                                                                                    lineColor = {0, 0, 255}, textString = "EFD"), Text(extent={{
              -52,34},{48,-38}},                                                                                                    lineColor=
              {0,0,255},
          textString="IEEEX1"),                                                                                                    Text(extent={{
              -140,22},{-104,16}},                                                                                                    lineColor = {0, 0, 255}, textString = "VOEL"), Text(extent={{
              -132,-34},{-108,-42}},                                                                                                    lineColor = {0, 0, 255}, textString = "Efd0")}),
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
end IEEEX1;
