within iPSL.Electrical.Controls.PSSE.ES.SCRX;
model SCRX "Bus Fed or Solid Fed Static Exciter"
  parameter Real V_c0 "Magnitude of the compensated generator terminal voltage"
                                                                                annotation (Dialog(group="Power flow data"));
  parameter Real V_0 "Magnitude of the generator terminal voltage" annotation (Dialog(group="Power flow data"));
  parameter Real T_AT_B;
  parameter Real T_B;
  parameter Real K;
  parameter Real T_E;
  parameter Real E_MIN;
  parameter Real E_MAX;
  parameter Real C_SWITCH;
  parameter Real r_cr_fd;
  Modelica.Blocks.Interfaces.RealInput  ETERM "Ecomp output" annotation(Placement(transformation(extent={{-114,0},
            {-104,10}}),                                                                                                    iconTransformation(extent={{-126,
            -72},{-116,-60}})));
  Modelica.Blocks.Interfaces.RealOutput  EFD annotation(Placement(transformation(extent={{116,-26},
            {132,-12}}),                                                                                         iconTransformation(extent={{116,-26},
            {132,-12}})));
  Modelica.Blocks.Math.Add3 V_erro(k3 = 1, k1 = 1, k2 = -1) annotation(Placement(transformation(extent = {{-52, -6}, {-36, 10}})));
  NonElectrical.Continuous.ImSimpleLag_nowinduplimit            VR(
    K=K,
    nStartValue=VR0,
    Ymin=E_MIN,
    Ymax=E_MAX,
    T=T_E)                                                                                                     annotation(Placement(transformation(extent = {{-8, -18}, {40, 22}})));
  Modelica.Blocks.Interfaces.RealInput  VOTHSG(start = 0) "PSS output Upss" annotation(Placement(transformation(extent = {{-114, -14}, {-104, -4}}), iconTransformation(extent={{-124,34},
            {-114,44}})));
  Modelica.Blocks.Interfaces.RealInput  VOEL "OEL output" annotation(Placement(transformation(extent = {{-114, -24}, {-104, -14}}), iconTransformation(extent={{-124,10},
            {-114,20}})));
  Modelica.Blocks.Interfaces.RealInput  VUEL "UEL output" annotation(Placement(transformation(extent = {{-114, -34}, {-104, -24}}), iconTransformation(extent={{-124,
            -16},{-114,-6}})));
  iPSL.NonElectrical.Math.ImSum3 Vs(
    a0=0,
    a1=1,
    a2=1,
    a3=1) annotation (Placement(transformation(extent={{-90,-50},{-62,12}})));
protected
  parameter Real efd0(fixed = false);
  parameter Real VR0(fixed = false);
  parameter Real VREF(fixed = false);
public
  iPSL.NonElectrical.Math.ImSetPoint V_REF(V=VREF)
    annotation (Placement(transformation(extent={{-118,34},{-92,52}})));
  Modelica.Blocks.Interfaces.RealInput  EFD0 annotation(Placement(transformation(extent = {{-114, 10}, {-104, 20}}), iconTransformation(extent={{-124,
            -108},{-114,-94}})));
  iPSL.NonElectrical.Continuous.ImLeadLag imLeadLag(
    K=1,
    nStartValue=VR0/K,
    T1=T_AT_B*T_B,
    T2=T_B) annotation (Placement(transformation(extent={{-44,-28},{10,32}})));
  iPSL.NonElectrical.Logical.NegCurLogic negCurLogic(nstartvalue=efd0, RC_rfd=
        r_cr_fd)
    annotation (Placement(transformation(extent={{46,-22},{90,22}})));
  Modelica.Blocks.Interfaces.RealInput  XADIFD annotation(Placement(transformation(extent = {{-114, -48}, {-104, -36}}), iconTransformation(extent={{-126,
            -38},{-116,-28}})));
  Modelica.Blocks.Interfaces.RealInput  ECOMP
    "Ternimal voltage of generator bus"                                                      annotation(Placement(transformation(extent = {{-114, 22}, {-104, 32}}), iconTransformation(extent={{-124,62},
            {-114,72}})));
  Switch sWITCH(switch=C_SWITCH)  annotation(Placement(transformation(extent = {{30, -8}, {56, 18}})));
  iPSL.NonElectrical.Logical.Enable SwitchFromInitialValue(Et0=V_c0)
    annotation (Placement(transformation(extent={{-42,22},{-26,32}})));
initial algorithm
  efd0 := EFD0;
  if C_SWITCH == 0 then
    VR0 := efd0 / V_0;
    VREF := VR0 / K + V_c0 - Vs.a0;
  else
    VR0 := efd0;
    VREF := VR0 / K + V_c0 - Vs.a0;
  end if;

equation
  connect(ETERM, V_erro.u2) annotation(Line(points={{-109,5},{-56,5},
          {-56,2},{-53.6,2}},                                                                        color = {0, 0, 127}, smooth = Smooth.None));
  connect(VOTHSG, Vs.p1) annotation(Line(points = {{-109, -9}, {-84.5, -9}, {-84.5, -9.7}, {-83.14, -9.7}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(VOEL, Vs.p2) annotation(Line(points = {{-109, -19}, {-83.14, -19}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(VUEL, Vs.p3) annotation(Line(points = {{-109, -29}, {-109, -29.5}, {-83.14, -29.5}, {-83.14, -28.3}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(Vs.n1, V_erro.u3) annotation(Line(points = {{-69.14, -19}, {-60, -19}, {-60, -4.4}, {-53.6, -4.4}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(imLeadLag.p1, V_erro.y) annotation(Line(points = {{-30.77, 2}, {-35.2, 2}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(imLeadLag.n1, VR.p1) annotation(Line(points = {{-3.77, 2}, {3.76, 2}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(XADIFD, negCurLogic.XadIfd) annotation(Line(points = {{-109, -42}, {35, -42}, {35, -7.92}, {53.48, -7.92}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(negCurLogic.Efd, EFD) annotation(Line(points={{83.84,
          -3.08},{94.7,-3.08},{94.7,-19},{124,-19}},                                                              color = {0, 0, 127}, smooth = Smooth.None));
  connect(sWITCH.Vd, negCurLogic.Vd) annotation(Line(points = {{49.37, 5}, {51.195, 5}, {51.195, 4.4}, {53.48, 4.4}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(SwitchFromInitialValue.n1, sWITCH.Et)
                                 annotation(Line(points = {{-26.16, 27}, {34, 27}, {34, 8.64}, {36.37, 8.64}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(ECOMP, SwitchFromInitialValue.Et)
                             annotation(Line(points = {{-109, 27}, {-40.8, 27}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(VR.n0, sWITCH.VR) annotation(Line(points = {{27.76, 2}, {32, 2}, {32, 1.36}, {36.37, 1.36}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(V_REF.n1, V_erro.u1) annotation(Line(points={{-98.63,43},
          {-53.6,43},{-53.6,8.4}},                                                                 color = {0, 0, 127}, smooth = Smooth.None));
  annotation(Placement(transformation(extent = {{-114, 44}, {-102, 58}}), iconTransformation(extent = {{-100, -50}, {-90, -40}})), Diagram(coordinateSystem(preserveAspectRatio=true,   extent={{-120,
            -120},{120,80}}),                                                                                                    graphics={  Text(extent={{
              -110,38},{-92,26}},                                                                                                    lineColor=  {0, 0, 255}, textString=  "Ecomp
             "), Text(extent={{-104,14},{-92,6}},       lineColor=  {0, 0, 255}, textString=  "Et"), Text(extent={{
              -106,6},{-86,-16}},                                                                                                    lineColor=  {0, 0, 255}, textString=  "VOTHSG "), Text(extent=  {{-108, -12}, {-82, -18}}, lineColor=  {0, 0, 255}, textString=  " VOEL"), Text(extent=  {{-110, -22}, {-80, -28}}, lineColor=  {0, 0, 255}, textString=  " VUEL "), Text(extent={{
              -102,26},{-90,12}},                                                                                                    lineColor=  {0, 0, 255}, textString=  "Efd0"), Text(extent=  {{-102, -34}, {-84, -42}}, lineColor=  {0, 0, 255}, textString=  "XadIfd"), Text(extent=  {{86, 14}, {102, 6}}, lineColor=  {0, 0, 255}, textString=  "Efd"), Text(extent=  {{-114, 52}, {-100, 46}}, lineColor=  {0, 0, 255}, textString=  "Vref")}), Icon(coordinateSystem(preserveAspectRatio=true,   extent={{-120,
            -120},{120,80}}),                                                                                                    graphics={  Rectangle(extent={{
              -120,80},{120,-120}},                                                                                                 lineColor=  {0, 0, 255}), Text(extent={{
              -114,-48},{-70,-66}},                                                                                                   lineColor=  {0, 0, 255}, textString=  "ETERM"), Text(extent={{
              -114,62},{-62,32}},                                                                                                  lineColor=  {0, 0, 255}, textString=  "VOTHSG "), Text(extent={{
              90,4},{122,-10}},                                                                                                    lineColor=  {0, 0, 255}, textString=  "EFD"), Text(extent={{
              -52,26},{60,-56}},                                                                                                    lineColor=  {0, 0, 255}, textString=  "SCRX"), Text(extent={{
              -114,-2},{-80,-16}},                                                                                                    lineColor=  {0, 0, 255}, textString=  " VUEL "), Text(extent={{
              -118,26},{-74,12}},                                                                                                   lineColor=  {0, 0, 255}, textString=  " VOEL"), Text(extent={{
              -112,-82},{-88,-106}},                                                                                                  lineColor=  {0, 0, 255}, textString=  "Efd0"), Text(extent={{
              -112,-24},{-72,-42}},                                                                                                   lineColor=  {0, 0, 255}, textString=  "XADIFD"), Text(extent={{
              -114,86},{-72,58}},                                                                                                   lineColor=  {0, 0, 255}, textString=  "ECOMP")}),
    Documentation(info="<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\">
<tr>
<td><p>Reference</p></td>
<td>PSS/E Manual</td>
</tr>
<tr>
<td><p>Last update</p></td>
<td>Unknown</td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p>Mengjia Zhang,SmarTS Lab, KTH Royal Institute of Technology</p></td>
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
end SCRX;
