within iPSL.Examples.Controls.PSSE.ES;
model EXAC2 "SMIB system with one load and GENROE model"
  extends Modelica.Icons.Example;
  extends iPSL.Examples.SMIBpartial;
  iPSL.Electrical.Machines.PSSE.GENROE gENROE(
    M_b=100,
    Tpd0=5,
    Tppd0=0.07,
    Tpq0=0.9,
    Tppq0=0.09,
    H=4.28,
    D=0,
    Xd=1.84,
    Xq=1.75,
    Xpd=0.41,
    Xpq=0.6,
    Xppd=0.2,
    Xl=0.12,
    S10=0.11,
    S12=0.39,
    V_0=1,
    P_0=40,
    angle_0=4.046276,
    Q_0=5.416582,
    Xppq=0.2) annotation (Placement(transformation(extent={{-100,-20},{-60,20}})));
  iPSL.Electrical.Controls.PSSE.ES.EXAC2 eXAC2_1(
    K_B=2,
    V_RMAX=2,
    V_RMIN=2,
    K_L=2,
    K_H=2,
    V_LR=2,
    K_A=400,
    T_A=0.02,
    V_AMAX=9,
    V_AMIN=-5.34,
    T_E=0.8,
    K_F=0.03,
    T_F=1,
    K_C=0.2,
    K_D=0.48,
    K_E=1,
    E_1=5.25,
    E_2=7,
    S_EE_1=0.03,
    S_EE_2=0.1,
    T_R=0.005,
    T_B=0.005,
    T_C=0.005) annotation (Placement(visible = true, transformation(extent = {{-54, -50}, {-100, -28}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const(k=0) annotation (Placement(visible = true, transformation(origin = {-34, -30}, extent = {{-4, -4}, {4, 4}}, rotation = 180)));
equation
  connect(eXAC2_1.VOEL, const.y) annotation(    Line(points = {{-69, -49}, {-59.5, -49}, {-59.5, -61}, {-44, -61}, {-44, -30}, {-38, -30}}, color = {0, 0, 127}));
  connect(eXAC2_1.VUEL, const.y) annotation(    Line(points = {{-62, -49}, {-50, -49}, {-50, -30}, {-38, -30}}, color = {0, 0, 127}));
  connect(eXAC2_1.VOTHSG, const.y) annotation(    Line(points = {{-54, -31}, {-51.1437, -31}, {-51.1437, -30}, {-38, -30}}, color = {0, 0, 127}));
  connect(eXAC2_1.EFD, gENROE.EFD) annotation(    Line(points = {{-101, -37}, {-110, -37}, {-110, -10}, {-99.6, -10}}, color = {0, 0, 127}));
  connect(gENROE.ETERM, eXAC2_1.ECOMP) annotation(    Line(points = {{-58.4, 10}, {-46, 10}, {-46, -37}, {-54, -37}}, color = {0, 0, 127}));
  connect(gENROE.XADIFD, eXAC2_1.XADIFD) annotation(    Line(points = {{-58.4, -18}, {-50, -18}, {-50, -41}, {-54, -41}}, color = {0, 0, 127}));
  connect(gENROE.EFD0, eXAC2_1.EFD0) annotation(    Line(points = {{-58.4, -14}, {-48, -14}, {-48, -45}, {-54, -45}}, color = {0, 0, 127}));
  connect(gENROE.PMECH, gENROE.PMECH0) annotation (Line(points={{-99.6,10},{-110,10},{-110,26},{-48,26},{-48,-6},{-58.4,-6}}, color={0,0,127}));
  connect(gENROE.p, GEN1.p) annotation (Line(points={{-58,0},{-49,0},{-40,0}}, color={0,0,255}));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}})), Documentation(revisions="<html>
<!--DISCLAIMER-->
<p>Copyright 2015-2016 RTE (France), SmarTS Lab (Sweden), AIA (Spain) and DTU (Denmark)</p>
<ul>
<li>RTE: <a href=\"http://www.rte-france.com\">http://www.rte-france.com</a></li>
<li>SmarTS Lab, research group at KTH: <a href=\"https://www.kth.se/en\">https://www.kth.se/en</a></li>
<li>AIA: <a href=\"http://www.aia.es/en/energy\"> http://www.aia.es/en/energy</a></li>
<li>DTU: <a href=\"http://www.dtu.dk/english\"> http://www.dtu.dk/english</a></li>
</ul>
<p>The authors can be contacted by email: <a href=\"mailto:info@itesla-ipsl.org\">info@itesla-ipsl.org</a></p>

<p>This Source Code Form is subject to the terms of the Mozilla Public License, v. 2.0. </p>
<p>If a copy of the MPL was not distributed with this file, You can obtain one at <a href=\"http://mozilla.org/MPL/2.0/\"> http://mozilla.org/MPL/2.0</a>.</p>
</html>"));
end EXAC2;
