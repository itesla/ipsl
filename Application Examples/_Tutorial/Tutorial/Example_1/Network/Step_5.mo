within Tutorial.Example_1.Network;
model Step_5
  OpenIPSL.Electrical.Buses.Bus B1(displayPF=false)
                                   annotation (Placement(visible=true, transformation(extent={{-92,-12},
            {-68,12}},                                                                                              rotation=0)));
  OpenIPSL.Electrical.Buses.Bus B2(displayPF=false)
                                   annotation (Placement(visible=true, transformation(extent={{-32,-12},
            {-8,12}},                                                                                              rotation=0)));
  OpenIPSL.Electrical.Buses.Bus B3(displayPF=false)
                                   annotation (Placement(visible=true, transformation(extent={{40,-12},{64,12}}, rotation=0)));
  Generator.Generator G1(
    V_0=1,
    angle_0=0.4946,
    P_0=1997.999,
    Q_0=967.92) annotation (Placement(visible=true, transformation(extent={{-120,
            -10},{-100,10}},                                                                      rotation=0)));
  OpenIPSL.Electrical.Branches.PSAT.TwoWindingTransformer twoWindingTransformer(
    Sn=2220,
    fn=60,
    x=0.15,
    r=0,
    V_b=400,
    Vn=400) annotation (Placement(visible=true, transformation(extent={{-60,-10},
            {-40,10}},                                                                      rotation=0)));
  OpenIPSL.Electrical.Branches.PwLine pwLine(
    R=0,
    G=0,
    B=0,
    X=0.5*100/2220,
    S_b=100) annotation (Placement(visible=true, transformation(extent={{10,10},
            {30,30}},                                                                    rotation=0)));
  OpenIPSL.Electrical.Buses.InfiniteBus infiniteBus(
    V_0=0.90081,
    angle_0=0,
    P_0=-1998,
    Q_0=87.066) annotation (Placement(visible=true, transformation(
        origin={90,0},
        extent={{-10,10},{10,-10}},
        rotation=180)));
  OpenIPSL.Electrical.Events.PwFault pwFault(
    R=0,
    t1=0.5,
    t2=0.57,
    X=0.01*100/2220) annotation (Placement(visible=true, transformation(extent={{10,-60},
            {30,-40}},                                                                              rotation=0)));
  OpenIPSL.Electrical.Branches.PwLine pwLine1(
    R=0,
    G=0,
    B=0,
    S_b=100,
    X=0.93*100/2220) annotation (Placement(visible=true, transformation(extent={{10,-30},
            {30,-10}},                                                                             rotation=0)));
  inner OpenIPSL.Electrical.SystemBase SysData(S_b=100, fn=60)
    annotation (Placement(visible=true, transformation(
        origin={73.3331,-80},
        extent={{-33.3331,-20},{46.6669,20}},
        rotation=0)));
equation
  connect(pwLine1.n, B3.p) annotation (Line(points={{29,-20},{42,-20},
          {42,0},{52,0}},                                                             color={0,0,255}));
  connect(B3.p, infiniteBus.p) annotation (Line(points={{52,0},{80,0}}, color={0,0,255}));
  connect(pwLine.n, B3.p) annotation (Line(points={{29,20},{42,20},{
          42,0},{52,0}},                                                           color={0,0,255}));
  connect(B2.p, pwLine.p) annotation (Line(points={{-20,0},{-20,0},{
          -10,0},{-10,20},{11,20}},                                                          color={0,0,255}));
  connect(twoWindingTransformer.n, B2.p) annotation (Line(points={{-39,0},
          {-20,0}},                                                                 color={0,0,255}));
  connect(B1.p, twoWindingTransformer.p) annotation (Line(points={{-80,0},
          {-80,0},{-61,0}},                                                                 color={0,0,255}));
  connect(G1.pwPin, B1.p) annotation (Line(points={{-99,0},{-99,0},{
          -80,0}},                                                    color={0,0,255}));
  connect(pwLine1.p, B2.p) annotation (Line(points={{11,-20},{-10,-20},
          {-10,0},{-20,0}}, color={0,0,255}));
  connect(pwFault.p, B2.p) annotation (Line(points={{8.33333,-50},{
          -10,-50},{-10,0},{-20,0}}, color={0,0,255}));
  annotation (
    Diagram(coordinateSystem(extent={{-140,-100},{120,100}}, preserveAspectRatio=false), graphics={Text(
          extent={{-106,102},{84,84}},
          lineColor={0,0,0},
          lineThickness=1,
          fillPattern=FillPattern.Solid,
          fontSize=15,
          textStyle={TextStyle.Bold},
          textString="Step 5: Connecting network components")}),
    Icon(coordinateSystem(extent={{-140,-100},{120,100}})),
    Documentation(revisions="<html>
<!--DISCLAIMER-->
<p>OpenIPSL:</p>
<p>Copyright 2016 SmarTS Lab (Sweden)</p>
<ul>
<li>SmarTS Lab, research group at KTH: <a href=\"https://www.kth.se/en\">https://www.kth.se/en</a></li>
</ul>
<p>The authors can be contacted by email: <a href=\"mailto:luigiv@kth.se\">luigiv@kth.se</a></p>

<p>This Source Code Form is subject to the terms of the Mozilla Public License, v. 2.0. </p>
<p>If a copy of the MPL was not distributed with this file, You can obtain one at <a href=\"http://mozilla.org/MPL/2.0/\"> http://mozilla.org/MPL/2.0</a>.</p>

<p></p>
<p>iPSL:</p>
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
</html>
"));
end Step_5;
