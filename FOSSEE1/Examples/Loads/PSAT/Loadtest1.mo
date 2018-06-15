within FOSSEE1.Examples.Loads.PSAT;
model Loadtest1 "TODO Document what this model is about"
  extends LoadTestBase;
  extends Modelica.Icons.Example;
  FOSSEE1.Loads.PSAT.ThermoStatLoad2 ThLoad(
    Sn=10,
    P_0=0.8,
    Q_0=0.6,
    V_0=0.99333) annotation (Placement(visible=true, transformation(
        origin={70,-50},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  Modelica.Blocks.Sources.Constant Tref(k=70)
    annotation (Placement(transformation(extent={{20,-40},{40,-20}})));
  Modelica.Blocks.Sources.Constant T_a(k=10)
    annotation (Placement(transformation(extent={{20,-80},{40,-60}})));
equation
  connect(T_a.y, ThLoad.t_a) annotation (Line(points={{41,-70},{50,-70},{50,-56},{58,-56}},
                                    color={0,0,127}));
  connect(Tref.y, ThLoad.t_ref) annotation (Line(points={{41,-30},{50,-30},{50,-44},{58,-44}},
                                               color={0,0,127}));
  connect(ThLoad.p, pwLine3.n) annotation (Line(points={{70,-40},{70,0},{62,0},{62,-10},{59,-10}}, color={0,0,255}));
  annotation (
    experiment(
      StopTime=200,
      Interval=0.02,
      __Dymola_fixedstepsize=1,
      __Dymola_Algorithm="Lsodar"),
    __Dymola_experimentFlags(
      Advanced(GenerateVariableDependencies=false, OutputModelicaCode=false),
      Evaluate=true,
      OutputCPUtime=false,
      OutputFlatModelica=false));
end Loadtest1;
