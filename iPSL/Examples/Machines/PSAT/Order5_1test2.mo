within iPSL.Examples.Machines.PSAT;
model Order5_1test2
  extends Modelica.Icons.Example;

  extends iPSL.Examples.BaseTest;
  iPSL.Electrical.Machines.PSAT.Order5_Type1 order5Type1_Inputs_Outputs(
    Sn=370,
    Vn=200,
    ra=0.001,
    xd1=0.302,
    M=10,
    D=0,
    V_b=400,
    V_0=1,
    angle_0=0,
    P_0=16.0352698692006,
    Q_0=11.859436505981,
    xd=1.9,
    xq=1.7,
    xq1=0.5,
    Td10=8,
    Tq10=0.8,
    Tq20=0.02) annotation (Placement(visible = true, transformation(origin = {-42.5, -2.5}, extent = {{-12.5, -12.5}, {12.5, 12.5}}, rotation = 0)));
equation
  connect(order5Type1_Inputs_Outputs.vf0, order5Type1_Inputs_Outputs.vf) annotation(
    Line(points = {{-50, 10}, {-50, 10}, {-50, 15}, {-70, 15}, {-70, 5}, {-55, 5}, {-55, 5}}, color = {0, 0, 127}));
  connect(order5Type1_Inputs_Outputs.pm0, order5Type1_Inputs_Outputs.pm) annotation(
    Line(points = {{-52.5, -16.25}, {-52.5, -15.75}, {-70, -15.75}, {-70, -7.25}, {-54, -7.25}}, color = {0, 0, 127}));
  connect(order5Type1_Inputs_Outputs.p, bus.p) annotation(
    Line(points = {{-29, -2}, {-14.5, -2}, {-14.5, 0}, {0, 0}}, color = {0, 0, 255}));
  annotation (
    Diagram(coordinateSystem(extent = {{-148.5, -105}, {148.5, 105}}, preserveAspectRatio = false, initialScale = 0.1, grid = {5, 5})),
    experiment(StopTime=20),
    __Dymola_experimentSetupOutput,
    Documentation(revisions="<html>
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
end Order5_1test2;
