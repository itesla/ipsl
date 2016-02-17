within iPSL.Examples.Controls.PSSE.ES;
model ST5B "SMIB system with one load and GENROE model"
  import iPSL;
  iPSL.Electrical.Branches.PwLine pwLine(
    R=0.001,
    X=0.2,
    G=0,
    B=0) annotation (Placement(transformation(extent={{-26,0},{-6,20}})));
  iPSL.Electrical.Branches.PwLine pwLine1(
    R=0.001,
    X=0.2,
    G=0,
    B=0) annotation (Placement(transformation(extent={{26,14},{46,34}})));
  iPSL.Electrical.Branches.PwLine2Openings pwLine3(
    t2=100,
    R=0.0005,
    X=0.1,
    G=0,
    B=0,
    t1=100) annotation (Placement(transformation(extent={{16,-20},{36,0}})));
  iPSL.Electrical.Branches.PwLine2Openings pwLine4(
    t2=100,
    t1=100,
    R=0.0005,
    X=0.1,
    G=0,
    B=0) annotation (Placement(transformation(extent={{42,-20},{62,0}})));
  iPSL.Electrical.Machines.PSSE.GENCLS.GENCLS gENCLS(
    M_b=100,
    D=0,
    V_0=1,
    angle_0=0,
    X_d=0.2,
    P_0=10.01711,
    Q_0=8.006544,
    H=0) annotation (Placement(transformation(extent={{108,0},{86,22}})));
  iPSL.Electrical.Loads.PSSE.Load_variation constantLoad(
    PQBRAK=0.7,
    d_t=0,
    d_P=0,
    V_0=0.9919935,
    angle_0=-0.5762684,
    t1=0,
    P_0=50,
    Q_0=10) annotation (Placement(transformation(extent={{8,-50},{30,-26}})));
  iPSL.Electrical.Events.PwFault pwFault(
    R=0,
    X=0,
    t1=2,
    t2=2.15) annotation (Placement(transformation(extent={{56,-38},{76,-16}})));
  iPSL.Electrical.Controls.PSSE.ES.ST5B.ST5B sT5B(
    T_R=0,
    T_C1=0.8,
    T_B1=6,
    T_C2=0.08,
    T_B2=0.01,
    T_UC1=2,
    T_UB1=10,
    T_UC2=0.1,
    T_UB2=0.05,
    T_OC1=0.1,
    T_OB1=2,
    T_OC2=0.08,
    T_OB2=0.08,
    K_C=0.004,
    T_1=0.001,
    K_R=200,
    V_RMAX=5,
    V_RMIN=-4) annotation (Placement(transformation(extent={{-64,-66},{-124,-34}})));
  Modelica.Blocks.Sources.Constant PSS_off(k=0) annotation (Placement(transformation(extent={{-140,-92},{-128,-80}})));
  Modelica.Blocks.Sources.Constant VOEL(k=100) annotation (Placement(transformation(extent={{-140,-112},{-128,-100}})));
  Modelica.Blocks.Sources.Constant VUEL(k=-100) annotation (Placement(transformation(extent={{-140,-132},{-128,-120}})));
  iPSL.Electrical.Machines.PSSE.GENROE.GENROE gENROE(
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
    Xppq=0.2) annotation (Placement(transformation(extent={{-112,-10},{-72,30}})));
equation
  connect(pwLine.n, pwLine1.p) annotation (Line(
      points={{-9,10},{3.5,10},{3.5,24},{29,24}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pwLine1.n, gENCLS.p) annotation (Line(
      points={{43,24},{74,24},{74,10.8346},{83.8,10.8346}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pwLine3.p, pwLine.n) annotation (Line(
      points={{19,-10},{2.5,-10},{2.5,10},{-9,10}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pwLine3.n, pwLine4.p) annotation (Line(
      points={{33,-10},{45,-10}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pwLine4.n, gENCLS.p) annotation (Line(
      points={{59,-10},{74,-10},{74,10.8346},{83.8,10.8346}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(constantLoad.p, pwLine3.p) annotation (Line(
      points={{19,-24.8},{19,-10}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pwFault.p, pwLine4.p) annotation (Line(
      points={{54.3333,-27},{54.3333,-25.5},{45,-25.5},{45,-10}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(sT5B.ETERM, sT5B.ECOMP) annotation (Line(points={{-65,-46},{-50,-46},{-50,-38},{-65,-38}}, color={0,0,127}));
  connect(PSS_off.y, sT5B.VOTHSG) annotation (Line(points={{-127.4,-86},{-97,-86},{-97,-64.6667}}, color={0,0,127}));
  connect(VOEL.y, sT5B.VOEL) annotation (Line(points={{-127.4,-106},{-89,-106},{-89,-64.6667}}, color={0,0,127}));
  connect(VUEL.y, sT5B.VUEL) annotation (Line(points={{-127.4,-126},{-81,-126},{-81,-64.6667}}, color={0,0,127}));
  connect(gENROE.p, pwLine.p) annotation (Line(points={{-70,10},{-23,10},{-23,10}}, color={0,0,255}));
  connect(gENROE.ETERM, sT5B.ECOMP) annotation (Line(points={{-70.4,20},{-50,20},{-50,-38},{-65,-38}}, color={0,0,127}));
  connect(sT5B.XADIFD, gENROE.XADIFD) annotation (Line(points={{-65,-54},{-60,-54},{-60,-8},{-70.4,-8}}, color={0,0,127}));
  connect(sT5B.EFD0, gENROE.EFD0) annotation (Line(points={{-65,-62},{-56,-62},{-56,-4},{-70.4,-4}}, color={0,0,127}));
  connect(sT5B.EFD, gENROE.EFD) annotation (Line(points={{-125,-50},{-128,-50},{-128,0},{-111.6,0}}, color={0,0,127}));
  connect(gENROE.PMECH, gENROE.PMECH0) annotation (Line(points={{-111.6,20},{-128,20},{-128,40},{-60,40},{-60,4},{-70.4,4}}, color={0,0,127}));
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
end ST5B;
