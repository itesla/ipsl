within iPSL.Examples.Solar.PSAT;
model SolarPQtest
  extends Modelica.Icons.Example;
  iPSL.Electrical.Solar.PSAT.ConstantPQPV.PQ1 PQ11(
    P_0=0.4,
    Q_0=0.3,
    V_0=1.00018548610126,
    angle_0=-0.0000253046024029618) annotation (Placement(visible=true, transformation(
        origin={85, 15},
        extent={{-10, -10}, {10, 10}},
        rotation=0)));
  iPSL.Electrical.Branches.PwLine pwLine1(
    B=0.001/2,
    G=0,
    R=0.01,
    X=0.1) annotation (Placement(visible=true, transformation(
        origin={-20, -5},
        extent={{-10, -10}, {10, 10}},
        rotation=0)));
  iPSL.Electrical.Events.PwFault pwFault1(
    R=20,
    X=1,
    startTime=3,
    endTime=3.1) annotation (Placement(visible=true, transformation(
        origin={70, -52.3},
        extent={{-10, -10}, {10, 10}},
        rotation=0)));
  iPSL.Electrical.Branches.PwLinewithOpeningReceiving pwLinewithOpening1(
    B=0.001/2,
    G=0,
    R=0.01,
    X=0.1,
    startTime=8,
    endTime=8.1) annotation (Placement(visible=true, transformation(
        origin={25, 0},
        extent={{-10, -10}, {10, 10}},
        rotation=0)));
  iPSL.Electrical.Branches.PwLine pwLine2(
    B=0.001/2,
    G=0,
    R=0.01,
    X=0.1) annotation (Placement(visible=true, transformation(
        origin={-20, 15},
        extent={{-10, -10}, {10, 10}},
        rotation=0)));
  iPSL.Electrical.Branches.PwLine pwLine3(
    B=0.001/2,
    G=0,
    R=0.01,
    X=0.1) annotation (Placement(visible=true, transformation(
        origin={25, -25},
        extent={{-10, -10}, {10, 10}},
        rotation=0)));
  iPSL.Electrical.Branches.PwLine pwLine4(
    B=0.001/2,
    G=0,
    R=0.01,
    X=0.1) annotation (Placement(visible=true, transformation(
        origin={25, 20},
        extent={{-10, -10}, {10, 10}},
        rotation=0)));
  iPSL.Electrical.Loads.PSAT.LOADPQ pwLoadPQ2(
    P_0=0.08,
    Q_0=0.06,
    V_0=1,
    angle_0=0) annotation (Placement(visible=true, transformation(
        origin={65, -25},
        extent={{-10, -10}, {10, 10}},
        rotation=0)));
  iPSL.Electrical.Buses.Bus bus1 annotation (Placement(visible=true, transformation(
        origin={-37.5421, 15},
        extent={{-10, -10}, {10, 10}},
        rotation=0)));
  iPSL.Electrical.Buses.Bus bus2 annotation (Placement(visible=true, transformation(
        origin={3.2757, 16.8063},
        extent={{-10, -10}, {10, 10}},
        rotation=0)));
  iPSL.Electrical.Buses.Bus bus3 annotation (Placement(visible=true, transformation(
        origin={55, 17.1033},
        extent={{-10, -10}, {10, 10}},
        rotation=0)));
  iPSL.Electrical.Buses.Bus bus4 annotation (Placement(visible=true, transformation(
        origin={46.6888, -25},
        extent={{-10, -10}, {10, 10}},
        rotation=0)));
  inner iPSL.Electrical.SystemBase SysData annotation (Placement(visible = true, transformation(extent = {{100, 55}, {125, 75}}, rotation = 0)));
  Modelica.Blocks.Sources.Step step1(height = 0.1, offset = 1, startTime = 5)  annotation(
    Placement(visible = true, transformation(origin = {-115, 15}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  iPSL.Electrical.Buses.InfiniteBus2 infiniteBus21 annotation(
    Placement(visible = true, transformation(origin = {-65, 15}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(pwLine4.p, pwLinewithOpening1.p) annotation(
    Line(points = {{13.3333, 20}, {13.3333, 12.5}, {18, 12.5}, {18, 0}}));
  connect(pwLinewithOpening1.n, pwLine4.n) annotation(
    Line(points = {{32, 0}, {32, 20}}));
  connect(infiniteBus21.p, bus1.p) annotation(
    Line(points = {{-54, 15}, {-40, 15}}, color = {0, 0, 255}));
  connect(step1.y, infiniteBus21.V) annotation(
    Line(points = {{-104, 15}, {-79, 15}, {-79, 15}, {-74, 15}, {-74, 15}}, color = {0, 0, 127}));
  connect(bus4.p, pwFault1.p) annotation(
    Line(points = {{46.6888, -25}, {46.6888, -52.3}, {58.3333, -52.3}}));
  connect(bus4.p, pwLoadPQ2.p) annotation(
    Line(points = {{46.6888, -25}, {46.6888, -14}, {65, -14}}));
  connect(pwLine3.n, bus4.p) annotation(
    Line(points = {{36.6667, -25}, {51.3555, -25}}));
  connect(PQ11.p, bus3.p) annotation(
    Line(points = {{74, 15}, {73.8291, 16.0517}, {73.8291, 16.0517}, {73.6582, 17.1034}, {66.8291, 17.1034}, {66.8291, 17.1034}, {55, 17.1033}}));
  connect(pwLine4.n, bus3.p) annotation(
    Line(points = {{36.6667, 20}, {41.6667, 20}, {41.6667, 20}, {41.6667, 20}, {41.6667, 17.1033}, {53.1667, 17.1033}, {53.1667, 17.1033}, {59.6667, 17.1033}}));
  connect(bus2.p, pwLine3.p) annotation(
    Line(points = {{3.2757, 16.8063}, {3.2757, -4.09685}, {3.2757, -4.09685}, {3.2757, -25}, {13.1378, -25}, {13.1378, -25}, {18, -25}}));
  connect(bus2.p, pwLine4.p) annotation(
    Line(points = {{3.2757, 16.8063}, {3.2757, 18.4032}, {3.2757, 18.4032}, {3.2757, 20}, {13.1378, 20}, {13.1378, 20}, {18, 20}}));
  connect(pwLine2.n, bus2.p) annotation(
    Line(points = {{-8.33333, 15}, {-0.195483, 15}, {-0.195483, 15}, {2.94237, 15}, {2.94237, 15.9032}, {7.94237, 15.9032}, {7.94237, 16.8063}}));
  connect(bus1.p, pwLine2.p) annotation(
    Line(points = {{-37.5421, 15}, {-27, 15}}));
  connect(pwLine1.n, pwLine2.n) annotation(
    Line(points = {{-8.33333, -5}, {-8.33333, 15}}));
  connect(pwLine2.p, pwLine1.p) annotation(
    Line(points = {{-31.6667, 15}, {-31.6667, -5}}));
  annotation (Diagram(coordinateSystem(
        extent={{-148.5,-105},{148.5,105}},
        preserveAspectRatio=false,
        initialScale=0.1,
        grid={5,5})), Documentation(revisions="<html>
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
end SolarPQtest;
