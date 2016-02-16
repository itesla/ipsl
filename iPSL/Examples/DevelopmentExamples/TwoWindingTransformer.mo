within iPSL.Examples.DevelopmentExamples;
model TwoWindingTransformer "SMIB system with one load and GENROE model"

  iPSL.Electrical.Branches.PwLine pwLine1(
    R=0.001,
    X=0.2,
    G=0,
    B=0) annotation (Placement(transformation(extent={{40,20},{60,40}})));
  iPSL.Electrical.Branches.PwLine2Openings pwLine3(
    t2=100,
    R=0.0005,
    X=0.1,
    G=0,
    B=0,
    t1=100) annotation (Placement(transformation(extent={{20,-40},{40,-20}})));
  iPSL.Electrical.Branches.PwLine2Openings pwLine4(
    t2=100,
    t1=100,
    R=0.0005,
    X=0.1,
    G=0,
    B=0) annotation (Placement(transformation(extent={{60,-40},{80,-20}})));
  iPSL.Electrical.Machines.PSSE.GENCLS.GENCLS gENCLS(
    M_b=100,
    D=0,
    V_0=1,
    angle_0=0,
    X_d=0.2,
    H=0,
    P_0=10.0278,
    Q_0=32.05072) annotation (Placement(transformation(extent={{118,-12},{106,12}})));
  iPSL.Electrical.Loads.PSSE.Load_variation constantLoad(
    S_p(re=0.5, im=0.1),
    S_i(im=0, re=0),
    S_y(re=0, im=0),
    a(re=1, im=0),
    b(re=0, im=1),
    PQBRAK=0.7,
    d_t=0,
    d_P=0,
    t1=0,
    characteristic=2,
    V_0=0.9679495,
    angle_0=-0.5840921) annotation (Placement(transformation(extent={{-4,-52},{8,-40}})));
  iPSL.Electrical.Events.PwFault pwFault(
    t1=2,
    t2=2.15,
    R=0.1,
    X=0.1) annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=-90,
        origin={54,-58})));
  iPSL.Electrical.Machines.PSSE.GENSAL.GENSAL gENROE(
    M_b=100,
    Tpd0=5,
    D=0,
    Xppd=0.2,
    Xl=0.12,
    Xppq=0.2,
    Tppd0=0.05,
    Tppq0=0.1,
    H=4,
    Xd=1.41,
    Xq=1.35,
    Xpd=0.3,
    S10=0.1,
    S12=0.5,
    R_a=0.002,
    V_b=14.7,
    V_0=1,
    angle_0=4.747869,
    P_0=40,
    Q_0=-16.46028) annotation (Placement(transformation(extent={{-92,-20},{-58,20}})));
  iPSL.Electrical.Branches.PSSE.TwoWindingTransformer twoWindingTransformer(
    CZ=1,
    R=0.001,
    X=0.2,
    G=0,
    B=0,
    S_n=1,
    ANG1=1,
    VB1=14.7,
    VB2=130,
    t1=0.8085,
    VNOM1=20,
    t2=1.02,
    VNOM2=130,
    CW=3) annotation (Placement(transformation(extent={{-26,-4},{-14,4}})));
  iPSL.Electrical.Buses.Bus BUS01 annotation (Placement(transformation(extent={{-50,-10},{-30,10}})));
  iPSL.Electrical.Buses.Bus BUS02 annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  iPSL.Electrical.Buses.Bus BUS03 annotation (Placement(transformation(extent={{40,-40},{60,-20}})));
  iPSL.Electrical.Buses.Bus BUS1 annotation (Placement(transformation(extent={{80,-10},{100,10}})));
  inner iPSL.Electrical.SystemBase SysData(S_b=100, fn=50) annotation (Placement(transformation(extent={{-100,80},{-40,100}})));
equation
  connect(gENROE.PMECH, gENROE.PMECH0) annotation (Line(points={{-91.66,10},{-98,10},{-98,26},{-50,26},{-50,-6},{-56.64,-6}}, color={0,0,127}));
  connect(gENROE.EFD, gENROE.EFD0) annotation (Line(points={{-91.66,-10},{-98,-10},{-98,-24},{-50,-24},{-50,-14},{-56.64,-14}}, color={0,0,127}));
  connect(gENROE.p, BUS01.p) annotation (Line(points={{-56.3,0},{-40,0}}, color={0,0,255}));
  connect(BUS01.p, twoWindingTransformer.p) annotation (Line(points={{-40,0},{-27,0}}, color={0,0,255}));
  connect(twoWindingTransformer.n, BUS02.p) annotation (Line(points={{-13,0},{0,0}}, color={0,0,255}));
  connect(pwLine1.p, BUS02.p) annotation (Line(points={{43,30},{4,30},{4,0},{0,0}}, color={0,0,255}));
  connect(pwLine3.p, BUS02.p) annotation (Line(points={{23,-30},{4,-30},{4,0},{0,0}}, color={0,0,255}));
  connect(constantLoad.p, BUS02.p) annotation (Line(points={{2,-39.4},{2,0},{0,0}}, color={0,0,255}));
  connect(pwLine3.n, BUS03.p) annotation (Line(points={{37,-30},{43.5,-30},{50,-30}}, color={0,0,255}));
  connect(BUS03.p, pwLine4.p) annotation (Line(points={{50,-30},{63,-30}}, color={0,0,255}));
  connect(BUS1.p, gENCLS.p) annotation (Line(points={{90,0},{104.8,0},{104.8,-0.180432}}, color={0,0,255}));
  connect(pwLine1.n, BUS1.p) annotation (Line(points={{57,30},{86,30},{86,0},{90,0}}, color={0,0,255}));
  connect(pwLine4.n, BUS1.p) annotation (Line(points={{77,-30},{86,-30},{86,0},{90,0}}, color={0,0,255}));
  connect(pwFault.p, BUS03.p) annotation (Line(points={{54,-51},{54,-30},{50,-30}}, color={0,0,255}));
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
end TwoWindingTransformer;
