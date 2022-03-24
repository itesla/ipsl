within OpenIPSL.Tests.Loads.PSAT;
model LoadTestFreqDependent
  extends BaseClasses.LoadTestBase;
  extends Modelica.Icons.Example;
  OpenIPSL.Electrical.Loads.PSAT.FrequencyDependent frequencyDependent(
    alpha_p=0,
    beta_p=1,
    beta_q=1,
    Sn=10000000,
    angle_0=-0.00746932024404292,
    alpha_q=0,
    Tf=0.1,
    P_0=800000,
    Q_0=600000,
    v_0=0.993325452568749) annotation (Placement(transformation(origin={80,-30}, extent={{-10,-10},{10,10}})));
equation

  connect(frequencyDependent.p, pwLine3.n) annotation (Line(points={{80,-20},{80,0},{62,0},{62,-10},{59,-10}}, color={0,0,255}));
  annotation (experiment(
      StopTime=15,
      Interval=0.03,
      Tolerance=1e-05));
end LoadTestFreqDependent;
