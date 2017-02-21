within iPSL.Examples.Controls.PSSE.ES;
model ESST4B "SMIB model example of GENROU with Excitation System ESST4B"
  extends iPSL.Examples.SMIBpartial;
  extends Modelica.Icons.VariantsPackage;// must run in MODELICA
  iPSL.Electrical.Machines.PSSE.GENROU generator(
    Xppd=0.2,
    Xppq=0.2,
    Xpp=0.2,
    Xl=0.12,
    V_0=1,
    P_0=100*0.399999529123306,
    angle_0=4.04626655578613,
    Q_0=100*0.0541657134890556,
    M_b=100,
    Tpd0=5,
    Tppd0=0.50000E-01,
    Tppq0=0.1,
    H=4.0000,
    D=0,
    Xd=1.41,
    Xq=1.3500,
    Xpd=0.3,
    S10=0.1,
    S12=0.5,
    Xpq=0.6,
    Tpq0=0.7) annotation (Placement(transformation(extent={{-120,-16},{-92,18}})));
  Modelica.Blocks.Sources.Constant const(k=0) annotation (Placement(transformation(
        extent={{-4,-4},{4,4}},
        rotation=0,
        origin={-98,-52})));
  Modelica.Blocks.Sources.Constant const2(k=0) annotation (Placement(transformation(extent={{-110,166},{-94,182}})));
  Modelica.Blocks.Sources.Constant const5(k=0) annotation (Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=0,
        origin={-97,-37})));
  iPSL.Electrical.Controls.PSSE.ES.ESST4B eSST4B annotation (Placement(visible = true, transformation(origin = {-64, -6}, extent = {{-14, -10}, {14, 10}}, rotation = 0)));
  inner Electrical.SystemBase SysData annotation (Placement(transformation(extent={{-100,80},{-40,100}})));
  Modelica.Blocks.Sources.Constant const1(k=Modelica.Constants.inf) annotation (Placement(transformation(extent={{-40,-48},{-56,-32}})));
equation
  connect(const1.y, eSST4B.VOEL) annotation(
    Line(points = {{-56.8, -40}, {-69, -40}, {-69, -15}}, color = {0, 0, 127}));
  connect(eSST4B.Bus, GEN1.p) annotation(
    Line(points = {{-52, 3}, {-47.5818, 3}, {-47.5818, 0}, {-40, 0}}, color = {0, 0, 255}));
  connect(generator.PELEC, eSST4B.ECOMP) annotation(
    Line(points = {{-90.88, -7.5}, {-68, -7.5}, {-68, -4}, {-78, -4}}, color = {0, 0, 127}));
  connect(generator.XADIFD, eSST4B.XADIFD) annotation(
    Line(points = {{-90.88, -14.3}, {-90.88, -20}, {-94, -20}, {-94, -8}, {-78, -8}}, color = {0, 0, 127}));
  connect(eSST4B.EFD, generator.EFD) annotation(
    Line(points = {{-49, -4}, {-48, -4}, {-48, -24}, {-124, -24}, {-124, -7.5}, {-119.72, -7.5}}, color = {0, 0, 127}));
  connect(const5.y, eSST4B.VUEL) annotation(
    Line(points = {{-91.5, -37}, {-82, -37}, {-82, -17}, {-78.5, -17}, {-78.5, -15}, {-73, -15}}, color = {0, 0, 127}));
  connect(generator.EFD0, eSST4B.EFD0) annotation(
    Line(points = {{-90.88, -10.9}, {-90, -10.9}, {-90, -11}, {-78, -11}}, color = {0, 0, 127}));
  connect(const.y, eSST4B.VOTHSG) annotation(
    Line(points = {{-93.6, -52}, {-86, -52}, {-86, 1}, {-78, 1}}, color = {0, 0, 127}));
  connect(generator.p, eSST4B.Gen_terminal) annotation(
    Line(points = {{-90.6, 1}, {-66.7, 1}, {-66.7, 3}, {-76, 3}}, color = {0, 0, 255}));
  connect(generator.PMECH0, generator.PMECH) annotation (Line(
      points = {{-90.88, -4.1}, {-64, -4.1}, {-64, 32}, {-102, 32}, {-102, 9.5}, {-119.72, 9.5}},
      color={0,0,127}));
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
end ESST4B;
