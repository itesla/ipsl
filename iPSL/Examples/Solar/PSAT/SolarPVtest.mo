within iPSL.Examples.Solar.PSAT;

model SolarPVtest
  extends Modelica.Icons.Example;
  iPSL.Electrical.Branches.PwLine pwLine1(B = 0.001 / 2, G = 0, R = 0.01, X = 0.1) annotation(
    Placement(visible = true, transformation(origin = {-15, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  iPSL.Electrical.Events.PwFault pwFault1(R = 20, X = 1, startTime = 3, endTime = 3.1) annotation(
    Placement(visible = true, transformation(origin = {75, -52.3}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  iPSL.Electrical.Branches.PwLinewithOpeningReceiving pwLinewithOpening1(B = 0.001 / 2, G = 0, R = 0.01, X = 0.1, startTime = 8, endTime = 8.1) annotation(
    Placement(visible = true, transformation(origin = {30, 5}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  iPSL.Electrical.Branches.PwLine pwLine2(B = 0.001 / 2, G = 0, R = 0.01, X = 0.1) annotation(
    Placement(visible = true, transformation(origin = {-15, 15}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  iPSL.Electrical.Branches.PwLine pwLine3(B = 0.001 / 2, G = 0, R = 0.01, X = 0.1) annotation(
    Placement(visible = true, transformation(origin = {30, -25}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  iPSL.Electrical.Branches.PwLine pwLine4(B = 0.001 / 2, G = 0, R = 0.01, X = 0.1) annotation(
    Placement(visible = true, transformation(origin = {30, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  iPSL.Electrical.Loads.PSAT.LOADPQ pwLoadPQ2(P_0 = 0.08, Q_0 = 0.06, V_0 = 1, angle_0 = 0) annotation(
    Placement(visible = true, transformation(origin = {70, -25}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  iPSL.Electrical.Buses.Bus bus1 annotation(
    Placement(visible = true, transformation(origin = {-32.5421, 15}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  iPSL.Electrical.Buses.Bus bus2 annotation(
    Placement(visible = true, transformation(origin = {8.2757, 16.8063}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  iPSL.Electrical.Buses.Bus bus3 annotation(
    Placement(visible = true, transformation(origin = {60, 17.1033}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  iPSL.Electrical.Buses.Bus bus4 annotation(
    Placement(visible = true, transformation(origin = {51.6888, -25}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  iPSL.Electrical.Solar.PSAT.ConstantPQPV.PV1 PV11(Q_0 = 0.283430554716626, angle_0 = -0.00000839852213846341, V_0 = 1.00002, vref = 1.00002, P_0 = 0.4) annotation(
    Placement(visible = true, transformation(origin = {85, 17.1033}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner iPSL.Electrical.SystemBase SysData annotation(
    Placement(visible = true, transformation(extent = {{110, 55}, {135, 75}}, rotation = 0)));
  iPSL.Electrical.Buses.InfiniteBus2 infiniteBus21 annotation(
    Placement(visible = true, transformation(origin = {-70, 15}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Step step1(height = 0.01, offset = 1, startTime = 5) annotation(
    Placement(visible = true, transformation(origin = {-110, 15}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(pwLine1.n, pwLine2.n) annotation(
    Line(points = {{-3, -10}, {-3, 5}, {-8.33333, 5}, {-8.33333, 10}, {-8.33333, 10}, {-8.33333, 15}}));
  connect(pwLine2.p, pwLine1.p) annotation(
    Line(points = {{-26.6667, 15}, {-26.6667, 10}, {-21.6667, 10}, {-21.6667, 5}, {-26.6667, 5}, {-26.6667, -2.5}, {-27, -2.5}, {-27, -10}}));
  connect(step1.y, infiniteBus21.V) annotation(
    Line(points = {{-99, 15}, {-79, 15}, {-79, 15}, {-79, 15}, {-79, 15}, {-79, 15}}, color = {0, 0, 127}));
  connect(infiniteBus21.p, bus1.p) annotation(
    Line(points = {{-59, 15}, {-49, 15}, {-49, 15}, {-34, 15}, {-34, 15}, {-34, 15}}, color = {0, 0, 255}));
  connect(bus3.p, PV11.p) annotation(
    Line(points = {{60, 17.1033}, {74, 17.1033}}));
  connect(bus4.p, pwFault1.p) annotation(
    Line(points = {{51.6888, -25}, {51.6888, -38.65}, {51.6888, -38.65}, {51.6888, -52.3}, {60.0111, -52.3}, {60.0111, -52.3}, {63.3333, -52.3}}));
  connect(bus4.p, pwLoadPQ2.p) annotation(
    Line(points = {{51.6888, -25}, {51.6888, -14}, {70, -14}}));
  connect(pwLine3.n, bus4.p) annotation(
    Line(points = {{41.6667, -25}, {56.3555, -25}}));
  connect(pwLine4.n, bus3.p) annotation(
    Line(points = {{41.6667, 20}, {44.1667, 20}, {44.1667, 20}, {46.6667, 20}, {46.6667, 17.1033}, {64.6667, 17.1033}}));
  connect(bus2.p, pwLine3.p) annotation(
    Line(points = {{8.2757, 16.8063}, {8.2757, -4.09685}, {8.2757, -4.09685}, {8.2757, -25}, {18.1378, -25}, {18.1378, -25}, {23, -25}}));
  connect(bus2.p, pwLine4.p) annotation(
    Line(points = {{8.2757, 16.8063}, {8.2757, 18.4032}, {8.2757, 18.4032}, {8.2757, 20}, {18.1378, 20}, {18.1378, 20}, {23, 20}}));
  connect(pwLine2.n, bus2.p) annotation(
    Line(points = {{-3.33333, 15}, {4.80452, 15}, {4.80452, 15}, {7.94237, 15}, {7.94237, 15.9032}, {12.9424, 15.9032}, {12.9424, 16.8063}}));
  connect(bus1.p, pwLine2.p) annotation(
    Line(points = {{-32.5421, 15}, {-22, 15}}));
  connect(pwLinewithOpening1.n, pwLine4.n) annotation(
    Line(points = {{37, 5}, {37, 20}}));
  connect(pwLine4.p, pwLinewithOpening1.p) annotation(
    Line(points = {{18.3333, 20}, {18.3333, 5}}));
  annotation(
    Diagram(coordinateSystem(extent = {{-148.5, -105}, {148.5, 105}}, preserveAspectRatio = false, initialScale = 0.1, grid = {5, 5}), graphics = {Text(origin = {-15, 34.1417}, fillPattern = FillPattern.Solid, extent = {{-35, -5.8583}, {35, 5.8583}}, textString = "SystemSbase=100 MVA", fontName = "Arial")}),
    Documentation(revisions = "<html>
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
end SolarPVtest;
