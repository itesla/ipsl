within FOSSEE1.Examples.Loads.PSAT;
model Loadtest2 "TODO Document what this model is about"
  extends LoadTestBase;
  extends Modelica.Icons.Example;
  FOSSEE1.Loads.PSAT.ThermostatLoad3 ThLoad(
    Sn=10,
    Q_0=0.6,
    P_0=0.8) annotation (Placement(visible=true, transformation(
        origin={70,-50},
        extent={{-10,-10},{10,10}},
        rotation=0)));
equation

  connect(ThLoad.p, pwLine3.n) annotation (Line(points={{70,-40},{70,0},{62,0},{62,-10},{59,-10}}, color={0,0,255}));
  annotation (experiment(StopTime=10));
end Loadtest2;
