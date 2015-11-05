within iPSL.Electrical.Controls.PSSE.ES.EXNI;
model EXNI "Bus or Solid Fed SCR Bridge Excitation System Model Type NI (NVE)"
  parameter Real Ec0 "power flow node voltage";
  parameter Real Et0 "power flow node voltage";
  parameter Real T_R = 0.60000E-01 "Voltage input time constant (s)";
  //0
  parameter Real K_A = 150.00 "AVR gain";
  //400
  parameter Real T_A = 0 "AVR time constant (s)";
  parameter Real V_RMAX = 4 "Maximum AVR output (pu)";
  parameter Real V_RMIN = -4 "Minimum AVR output (pu)";
  parameter Real K_F = 0.110000E-01 "Rate feedback gain (pu)";
  parameter Real T_F1 = 0.40000 "Rate feedback time constant (s)";
  parameter Real T_F2 = 0.70000 "Rate feedback time constant (s)";
  parameter Real SWITCH = 0;
  parameter Real r_cr_fd = 10;
protected
  parameter Real Efd0(fixed = false);
  parameter Real VR0(fixed = false);
  parameter Real VREF(fixed = false);
  iPSL.NonElectrical.Math.ImSum3 V_Erro(
    a0=0,
    a1=1,
    a2=-1,
    a3=1) annotation (Placement(transformation(extent={{-56,-4},{-30,24}})));
  iPSL.NonElectrical.Math.ImSetPoint Vref(V=VREF)
    annotation (Placement(transformation(extent={{-90,22},{-68,38}})));
  iPSL.NonElectrical.Math.ImSum2 imSum2_2(
    a0=0,
    a1=1,
    a2=-1) annotation (Placement(transformation(extent={{-28,-2},{-8,18}})));
  NonElectrical.Continuous.ImSimpleLag_nowinduplimit            VR(
    K=K_A,
    T=T_A,
    nStartValue=VR0,
    Ymin=V_RMIN,
    Ymax=V_RMAX)                                                                          annotation(Placement(transformation(extent = {{-6, -14}, {46, 30}})));
  iPSL.NonElectrical.Math.ImSum3 Vs(
    a0=0,
    a1=1,
    a2=1,
    a3=1) annotation (Placement(transformation(extent={{-78,-42},{-54,14}})));
  NonElectrical.Continuous.ImSimpleLag                        V_F2(nStartValue=0, T=T_F2,
    K=1)                                      annotation(Placement(transformation(extent = {{-2, -28}, {-46, 4}})));
public
  iPSL.NonElectrical.Math.ImSum2 imSum2_1(
    a0=0,
    a1=1,
    a2=-1) annotation (Placement(transformation(
        extent={{-9,10},{9,-10}},
        rotation=180,
        origin={-3,-12})));
  iPSL.NonElectrical.Continuous.ImSimpleLag imSimpleLag(
    T=T_F1,
    nStartValue=VR0*K_F/T_F1,
    K=1) annotation (Placement(transformation(
        extent={{19,-13},{-19,13}},
        rotation=0,
        origin={21,-21})));
  Modelica.Blocks.Interfaces.RealInput VOTHSG "PSS output Upss" annotation(Placement(transformation(extent = {{-100, -10}, {-94, -2}}), iconTransformation(extent = {{-112, -22}, {-102, -12}})));
  Modelica.Blocks.Interfaces.RealInput VOEL "OEL output" annotation(Placement(transformation(extent = {{-100, -18}, {-94, -10}}), iconTransformation(extent = {{-112, -34}, {-102, -24}})));
  Modelica.Blocks.Interfaces.RealInput VUEL annotation(Placement(transformation(extent = {{-100, -26}, {-94, -18}}), iconTransformation(extent = {{-112, -46}, {-102, -36}})));
  Modelica.Blocks.Interfaces.RealInput ECOMP(start=Ec0)
    "Input, generator terminal voltage"                                             annotation(Placement(transformation(extent = {{-100, 6}, {-92, 14}}), iconTransformation(extent = {{-112, 8}, {-102, 18}})));
public
  Modelica.Blocks.Interfaces.RealInput EFD0 "Input, generator terminal voltage"
                                                                                annotation(Placement(transformation(extent = {{-100, -36}, {-94, -28}}), iconTransformation(extent = {{-112, -8}, {-102, 2}})));
  iPSL.NonElectrical.Math.ImGain imGain(K=K_F/T_F1) annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={36,-14})));
  Modelica.Blocks.Interfaces.RealInput ETERM(start=Et0)
    "Ternimal voltage of generator bus"                                                   annotation(Placement(transformation(extent = {{-100, 38}, {-90, 48}}), iconTransformation(extent = {{-100, 34}, {-90, 44}})));
  iPSL.NonElectrical.Logical.Enable enable1(Et0=1)
    annotation (Placement(transformation(extent={{-26,38},{-10,48}})));
  iPSL.Electrical.Controls.PSSE.ES.SCRX.Switch sWITCH(switch=SWITCH)
    annotation (Placement(transformation(extent={{42,22},{70,52}})));
  Modelica.Blocks.Interfaces.RealInput XADIFD annotation(Placement(transformation(extent = {{-100, -56}, {-90, -44}}), iconTransformation(extent = {{-100, -72}, {-90, -62}})));
  iPSL.NonElectrical.Logical.NegCurLogic negCurLogic(RC_rfd=r_cr_fd,
      nstartvalue=Efd0)
    annotation (Placement(transformation(extent={{62,8},{102,46}})));
  Modelica.Blocks.Interfaces.RealOutput EFD annotation(Placement(transformation(extent = {{98, -16}, {114, -2}})));
initial algorithm
  Efd0 := EFD0;
  if SWITCH > 0 then
    VR0 := Efd0;
    VREF := VR0 / K_A + Ec0 - Vs.a0;
  else
    VR0 := Efd0 / Et0;
    VREF := VR0 / K_A + Ec0 - Vs.a0;
  end if;

equation
  connect(V_Erro.n1, imSum2_2.p1) annotation(Line(points = {{-36.63, 10}, {-23.1, 10}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(imSum2_2.n1, VR.p1) annotation(Line(points = {{-13.1, 8}, {6.74, 8}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(VOTHSG, Vs.p1) annotation(Line(points = {{-97, -6}, {-82.5, -6}, {-82.5, -5.6}, {-72.12, -5.6}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(VUEL, Vs.p3) annotation(Line(points = {{-97, -22}, {-97, -21.5}, {-72.12, -21.5}, {-72.12, -22.4}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(Vs.n1, V_Erro.p3) annotation(Line(points = {{-60.12, -14}, {-60.12, -13.5}, {-49.63, -13.5}, {-49.63, 5.8}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(VOEL, Vs.p2) annotation(Line(points = {{-97, -14}, {-72.12, -14}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(V_F2.p1, imSum2_1.n1) annotation(Line(points={{-17.18,-12},{-12,-12},
          {-12,-12},{-7.41,-12}},                                                       color = {0, 0, 127}, smooth = Smooth.None));
  connect(imSimpleLag.p1, imGain.n1) annotation(Line(points = {{26.89, -21}, {30, -21}, {30, -14}, {31.1, -14}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(imSum2_1.p1, imGain.n1) annotation(Line(points = {{1.59, -10}, {30, -10}, {30, -14}, {31.1, -14}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(imSimpleLag.n1, imSum2_1.p2) annotation(Line(points={{7.7,-21},{6,-21},
          {6,-14},{1.59,-14}},                                                                                  color = {0, 0, 127}, smooth = Smooth.None));
  connect(ECOMP, V_Erro.p2) annotation(Line(points = {{-96, 10}, {-49.63, 10}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(Vref.n1, V_Erro.p1) annotation(Line(points = {{-73.61, 30}, {-66, 30}, {-66, 14.2}, {-49.63, 14.2}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(ETERM, enable1.Et) annotation(Line(points = {{-95, 43}, {-24.8, 43}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(enable1.n1, sWITCH.Et) annotation(Line(points = {{-10.16, 43}, {22.92, 43}, {22.92, 41.2}, {48.86, 41.2}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(VR.n0, sWITCH.VR) annotation(Line(points = {{32.74, 8}, {44, 8}, {44, 32.8}, {48.86, 32.8}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(VR.n0, imGain.p1) annotation(Line(points = {{32.74, 8}, {44, 8}, {44, -14}, {41.1, -14}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(sWITCH.Vd, negCurLogic.Vd) annotation(Line(points = {{62.86, 37}, {65.425, 37}, {65.425, 30.8}, {68.8, 30.8}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(XADIFD, negCurLogic.XadIfd) annotation(Line(points = {{-95, -50}, {64, -50}, {64, 20.16}, {68.8, 20.16}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(EFD,EFD)  annotation(Line(points = {{106, -9}, {106, -9}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(negCurLogic.Efd,EFD)  annotation(Line(points = {{96.4, 24.34}, {96.4, -9.83}, {106, -9.83}, {106, -9}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(V_F2.n1, imSum2_2.p2) annotation(Line(points={{-39.4,-12},{-36,-12},{-36,
          6},{-23.1,6}},                                                                                    color = {0, 0, 127}, smooth = Smooth.None));
  annotation(Diagram(coordinateSystem(preserveAspectRatio=false,   extent={{-100,
            -100},{100,100}}),                                                                           graphics={  Text(extent=  {{-58, -8}, {-52, -14}}, lineColor=  {0, 0, 255}, textString=  "Vs"), Text(extent=  {{-84, 34}, {-76, 26}}, lineColor=  {0, 0, 255}, textString=  "Vref"), Text(extent=  {{-94, -30}, {-78, -36}}, lineColor=  {0, 0, 255}, textString=  "Efd0"), Text(extent=  {{-102, 16}, {-74, 10}}, lineColor=  {0, 0, 255}, textString=  "Ec"), Text(extent=  {{-94, 2}, {-76, -8}}, lineColor=  {0, 0, 255}, textString=  "VOTHSG"), Text(extent=  {{-96, -8}, {-74, -14}}, lineColor=  {0, 0, 255}, textString=  "VOEL"), Text(extent=  {{-96, -16}, {-74, -22}}, lineColor=  {0, 0, 255}, textString=  "VUEL"), Text(extent=  {{-92, 54}, {-80, 46}}, lineColor=  {0, 0, 255}, textString=  "Et"), Text(extent=  {{-88, -42}, {-70, -50}}, lineColor=  {0, 0, 255}, textString=  "XadIfd")}),
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
end EXNI;
