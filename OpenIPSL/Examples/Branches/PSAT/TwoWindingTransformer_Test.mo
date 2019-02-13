within OpenIPSL.Examples.Branches.PSAT;
model TwoWindingTransformer_Test
  extends Modelica.Icons.Example;
  OpenIPSL.Electrical.Machines.PSAT.Order2 order2_1(
    Sn=100,
    D=5,
    V_0=1,
    angle_0=0,
    Vn=13800,
    V_b=13800,
    P_0=0.050249405357958,
    Q_0=0.010496891745129,
    ra=0.001,
    x1d=0.302,
    M=10) annotation (Placement(transformation(extent={{-80,-10},{-60,10}})));
  OpenIPSL.Electrical.Loads.PSAT.LOADPQ lOADPQ(Q_0=0.001, P_0=0.03) annotation (Placement(transformation(extent={{60,-30},{80,-10}})));
  OpenIPSL.Electrical.Branches.PSAT.TwoWindingTransformer twoWindingTransformer(
    Vn=13800,
    xT=0.1,
    rT=0.01,
    V_b=13800)
    annotation (Placement(transformation(extent={{-40,-10},{-20,10}})));
  OpenIPSL.Electrical.Buses.InfiniteBus infiniteBus(V_0=1, angle_0=0)
    annotation (Placement(transformation(extent={{-80,-50},{-60,-30}})));
  OpenIPSL.Electrical.Branches.PwLine pwLine1(
    R=0.01,
    X=0.1,
    G=0,
    B=0.001/2) annotation (Placement(transformation(extent={{10,0},{30,20}})));
  OpenIPSL.Electrical.Branches.PwLine pwLine2(
    R=0.01,
    X=0.1,
    G=0,
    B=0.001) annotation (Placement(transformation(extent={{10,-20},{30,0}})));
  OpenIPSL.Electrical.Buses.Bus bus1
    annotation (Placement(transformation(extent={{-60,-10},{-40,10}})));
  OpenIPSL.Electrical.Buses.Bus bus2
    annotation (Placement(transformation(extent={{-20,-10},{0,10}})));
  OpenIPSL.Electrical.Buses.Bus bus3
    annotation (Placement(transformation(extent={{40,-10},{60,10}})));
  inner OpenIPSL.Electrical.SystemBase SysData
    annotation (Placement(transformation(extent={{-100,80},{-60,100}})));
equation
  connect(infiniteBus.p, order2_1.p) annotation (Line(
      points={{-60,-40},{-55,-40},{-55,0},{-60,0}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(bus3.p,pwLine2. n) annotation (Line(
      points={{50,0},{40,0},{40,-10},{29,-10}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(twoWindingTransformer.n, bus2.p) annotation (Line(
      points={{-19,0},{-10,0}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(twoWindingTransformer.p, bus1.p) annotation (Line(
      points={{-41,0},{-50,0}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(bus1.p, order2_1.p) annotation (Line(
      points={{-50,0},{-60,0}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(bus2.p,pwLine2. p) annotation (Line(
      points={{-10,0},{6,0},{6,-10},{11,-10}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(order2_1.vf0, order2_1.vf) annotation (Line(points={{-78,11},{-78,14},{-88,14},{-88,5},{-82,5}},
                                            color={0,0,127}));
  connect(order2_1.pm, order2_1.pm0) annotation (Line(points={{-82,-5},{-88,-5},{-88,-14},{-78,-14},{-78,-11}},
                                             color={0,0,127}));
  connect(bus3.p, lOADPQ.p) annotation (Line(points={{50,0},{70,0},{70,-10}}, color={0,0,255}));
  connect(pwLine1.p, bus2.p) annotation (Line(points={{11,10},{6,10},{6,0},{-10,0}}, color={0,0,255}));
  connect(pwLine1.n, bus3.p) annotation (Line(points={{29,10},{40,10},{40,0},{50,0}}, color={0,0,255}));
end TwoWindingTransformer_Test;
