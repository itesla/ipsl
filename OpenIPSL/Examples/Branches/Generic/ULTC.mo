within OpenIPSL.Examples.Branches.Generic;
model ULTC "Example model to demonstrate the working of the generic ULTC"
  OpenIPSL.Electrical.Buses.Bus B1 annotation (
    Placement(transformation(extent = {{-131, -10}, {-111, 10}})));
  OpenIPSL.Electrical.Buses.Bus B2 annotation (
    Placement(transformation(extent = {{-51, -10}, {-31, 10}})));
  OpenIPSL.Electrical.Buses.Bus B3 annotation (
    Placement(transformation(extent = {{13, -10}, {33, 10}})));
  OpenIPSL.Electrical.Buses.Bus B4 annotation (
    Placement(transformation(extent = {{69, -10}, {89, 10}})));
  OpenIPSL.Electrical.Branches.PwLine pwLine4(G = 0, R = 0, X = 0.65, B = 0) annotation (
    Placement(visible = true, transformation(origin = {-84, 14}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
  OpenIPSL.Electrical.Branches.PwLine pwLine2(G = 0, R = 0, X = 0.80, B = 0) annotation (
    Placement(visible = true, transformation(origin = {50, 0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
  OpenIPSL.Electrical.Buses.InfiniteBus infiniteBus(v_0 = 1.05)  annotation (
    Placement(transformation(extent = {{-160, -10}, {-140, 10}})));
  Electrical.Branches.Generic.ULTC transformerDiscrete annotation (Placement(transformation(extent={{-20,-10},{0,10}})));
  OpenIPSL.Electrical.Branches.PwLine pwLinewith2Openings(B = 0, G = 0, R = 0, X = 0.40625, t1 = 20, t2 = 200)  annotation (
    Placement(transformation(extent = {{-94, -24}, {-74, -4}})));
  Electrical.Loads.Generic.Load_Hisken load_Hisken annotation (Placement(transformation(extent={{100,-10},{120,10}})));
  inner OpenIPSL.Electrical.SystemBase SysData annotation (
    Placement(visible = true, transformation(origin={-130,90},    extent={{-30,-10},{30,10}},      rotation = 0)));
equation
  connect(pwLine4.n, B2.p) annotation (
    Line(points={{-75,14},{-64,14},{-64,0},{-41,0}},          color = {0, 0, 255}));
  connect(pwLine4.p, B1.p) annotation (
    Line(points={{-93,14},{-106,14},{-106,0},{-121,0}},          color = {0, 0, 255}));
  connect(B3.p, pwLine2.p) annotation (
    Line(points={{23,0},{41,0}},      color = {0, 0, 255}));
  connect(pwLine2.n, B4.p) annotation (
    Line(points={{59,0},{79,0}},      color = {0, 0, 255}));
  connect(infiniteBus.p, B1.p) annotation (
    Line(points={{-140,0},{-121,0},{-121,0}},        color = {0, 0, 255}));
  connect(transformerDiscrete.n, B3.p) annotation (
    Line(points={{1,0},{12.5,0},{12.5,0},{23,0}},              color = {0, 0, 255}));
  connect(transformerDiscrete.p, B2.p) annotation (
    Line(points = {{-21, 0}, {-21, 0}, {-41, 0}}, color = {0, 0, 255}));
  connect(pwLinewith2Openings.n, B2.p) annotation (
    Line(points={{-75,-14},{-64,-14},{-64,0},{-41,0}},          color = {0, 0, 255}));
  connect(pwLinewith2Openings.p, B1.p) annotation (
    Line(points={{-93,-14},{-106,-14},{-106,0},{-121,0}},          color = {0, 0, 255}));
  connect(B4.p, load_Hisken.p) annotation (
    Line(points = {{79, 0}, {99, 0}}, color = {0, 0, 255}));
  annotation (experiment(StopTime = 350, Interval = 0.01, Tolerance = 0.0001, __Dymola_Algorithm = "Dassl"));
end ULTC;
