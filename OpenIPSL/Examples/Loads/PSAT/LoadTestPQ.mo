within OpenIPSL.Examples.Loads.PSAT;
model LoadTestPQ
  extends BaseClasses.LoadTestBase;
  extends Modelica.Icons.Example;
  OpenIPSL.Electrical.Loads.PSAT.PQ pQ(
    Sn=10000000,
    P_0=800000,
    Q_0=600000) annotation (Placement(transformation(origin={80,-30}, extent={{-10,-10},{10,10}})));
equation

  connect(pQ.p, pwLine3.n) annotation (Line(points={{80,-20},{80,0},{62,0},{62,-10},{59,-10}}, color={0,0,255}));
  annotation (experiment(
      StopTime=15,
      Interval=0.03,
      Tolerance=1e-05));
end LoadTestPQ;
