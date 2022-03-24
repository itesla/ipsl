within OpenIPSL.Tests.Wind.GE;
model WT_Test
  extends Modelica.Icons.Example;
  OpenIPSL.Electrical.Wind.GE.Type_3.GE_WT GE_WT_init annotation (Placement(transformation(origin={80,0}, extent={{-10,-10},{10,10}})));
  OpenIPSL.Electrical.Buses.InfiniteBus infBus(angle_0=-0.000216626610049175, v_0=1.05999999985841) annotation (Placement(transformation(origin={-80.5798,-0.0297}, extent={{-10.0,-10.0},{10.0,10.0}})));
  OpenIPSL.Electrical.Branches.PwLine pwLine2(
    R=0.009,
    X=0.065,
    B=0.063,
    G=0) annotation (Placement(transformation(
        origin={-24,0},
        extent={{-10,-10},{10,10}})));
  OpenIPSL.Electrical.Branches.PwLine pwLine3(
    R=0.0006,
    X=0.0333,
    G=0,
    B=0) annotation (Placement(transformation(
        extent={{-9.99989,-9.99997},{10,9.99997}})));
  OpenIPSL.Electrical.Branches.PwLine pwLine4(
    R=0.05,
    X=0.015,
    B=0.045,
    G=0) annotation (Placement(transformation(
        origin={24,0},
        extent={{-10,-10},{10,10}})));
  OpenIPSL.Electrical.Branches.PwLine pwLine5(
    R=0.00222,
    X=0.0222,
    G=0,
    B=0) annotation (Placement(transformation(
        origin={48,0},
        extent={{-10,-10},{10,10}})));
  OpenIPSL.Electrical.Wind.WindGenerator windGenerator1 annotation (Placement(
        transformation(
        origin={60,19.493},
        extent={{-10.0,-10.0},{10.0,10.0}})));
  OpenIPSL.Electrical.Branches.PwLine pwLine1(
    R=0.013,
    X=0.13,
    G=0,
    B=0) annotation (Placement(transformation(
        origin={-48,0},
        extent={{-10,-10},{9.99998,10}})));
  OpenIPSL.Electrical.Events.PwFault pwFault1(
    R=1/99999.999,
    t1=10,
    t2=10.1,
    X=1/99999.999) annotation (Placement(transformation(
        origin={-19.9999,-30},
        extent={{-10.0001,-9.99997},{9.9999,10.0001}})));
  inner Electrical.SystemBase SysData annotation (Placement(transformation(extent={{-100,80},{-60,100}})));
equation
  connect(infBus.p, pwLine1.p) annotation (Line(
      origin={-58.0532,-0.1523},
      points={{-12.5266,0.1226},{-12.5266,0.1523},{1.0532,0.1523}},
      color={0,0,255}));
  connect(pwLine1.n, pwLine2.p) annotation (Line(
      origin={-39.5629,-0.306},
      points={{0.562881,0.306},{6.5629,0.306}},
      color={0,0,255}));
  connect(pwLine2.n, pwLine3.p) annotation (Line(
      origin={-21.1358,-0.2909},
      points={{6.1358,0.2909},{12.1359,0.2909}},
      color={0,0,255}));
  connect(windGenerator1.Vw, GE_WT_init.Wind_Speed) annotation (Line(
      origin={42.3333,12.8446},
      points={{28.6667,6.6484},{37.6667,6.6484},{37.6667,-5.04557}},
      color={0,0,127}));
  connect(pwLine5.n, GE_WT_init.pwPin1) annotation (Line(
      origin={33.3531,-0.2218},
      points={{23.6469,0.2218},{35.6469,0.2218}},
      color={0,0,255}));
  connect(pwLine4.n, pwLine5.p) annotation (Line(
      origin={15.3432,-0.2122},
      points={{17.6568,0.2122},{23.6568,0.2122}},
      color={0,0,255}));
  connect(pwLine3.n, pwLine4.p) annotation (Line(
      origin={-2.6865,-0.2942},
      points={{11.6865,0.2942},{17.6865,0.2942}},
      color={0,0,255}));
  connect(pwFault1.p, pwLine1.n) annotation (Line(points={{-31.6667,-29.9999},{-32,-29.9999},{-32,-30},{-36,-30},{-36,0},{-39,0}}, color={0,0,255}));
  annotation (experiment(StopTime=20));
end WT_Test;
