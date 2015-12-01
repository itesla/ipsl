within iPSL.Electrical.Events;


model PwLineFault "Transitory short-circuit on a line at the point of location from the sending node
   given by parameter k. A fictitious node is created with where a shunt impedance is connected only 
   during a specified interval of time. Developed by AIA. 2015/03/20."
  iPSL.Connectors.PwPin p annotation(Placement(transformation));
  iPSL.Connectors.PwPin n annotation(Placement(transformation));
  parameter Real R1 "Resistance";
  parameter Real X1 "Conductance";
  parameter Real G1 "Shunt half conductance p.u.";
  parameter Real B1 "Shunt half susceptance p.u.";
  parameter Real k
    "Point of the line where the short circuit occurs (between 0.1 and 0.99)";
  parameter Real Rfault "Fault resistance";
  parameter Real Xfault "Fault reactance";
  parameter Real time_1 "Start time of the fault";
  parameter Real time_2 "End time of the fault";
  parameter Real Vo_real1 "Initial real voltage at Sending node";
  parameter Real Vo_img1 "Initial imaginary voltage at Sending node";
  parameter Real Vo_real2 "Initial real voltage at Receiving node";
  parameter Real Vo_img2 "Initial imaginay voltage at Receiving node";
  parameter Complex Z(re = R1, im = X1);
  parameter Complex Y(re = G1, im = B1);
  parameter Complex V1(re = Vo_real1, im = Vo_img1);
  parameter Complex V2(re = Vo_real2, im = Vo_img2);
  parameter Complex V0fict = ((1 - k) * V1 + k * V2) / (1 + k * (1 - k) * Z * Y);
  parameter Real V0fict_real = V0fict.re;
  parameter Real V0fict_img = V0fict.im;
  // FICTITIOUS BUS
  iPSL.Electrical.Buses.Bus FICT(V_0 = V0fict_real ^ 2 + V0fict_img ^ 2, angle_0 = atan2(V0fict_real ^ 2, V0fict_img)) annotation(Placement(transformation));
  // THE ORIGINAL LINE IS SEPARATED IN TWO PARTS
  iPSL.Electrical.Branches.PwLine_2 Line_1(R = k * R1, X = k * X1, G = k * G1, B = k * B1) annotation(Placement(transformation));
  iPSL.Electrical.Branches.PwLine_2 Line_2(R = (1 - k) * R1, X = (1 - k) * X1, G = (1 - k) * G1, B = (1 - k) * B1) annotation(Placement(transformation));
  // FAULT ADDED TO FICTITIOUS BUS
  iPSL.Electrical.Events.PwFault Fault(R = Rfault, X = Xfault, t1 = time_1, t2 = time_2) annotation(Placement(transformation));
equation
  connect(p, Line_1.p) annotation(Line);
  connect(Line_1.n, FICT.p) annotation(Line);
  connect(FICT.p, Line_2.p) annotation(Line);
  connect(Line_2.n, n) annotation(Line);
  connect(Fault.p, FICT.p) annotation(Icon(graphics = {Rectangle(extent=  {{-60, 60}, {60, -60}}, lineColor=  {0, 0, 255}), Rectangle(extent=  {{-28, 30}, {12, 10}}, lineColor=  {0, 0, 0}, fillColor=  {95, 95, 95}, fillPattern=  FillPattern.Solid), Line(points=  {{12, 20}, {26, 20}, {26, -20}}, color=  {0, 0, 255}, smooth=  Smooth.None), Line(points=  {{14, -20}, {38, -20}}, color=  {0, 0, 255}, smooth=  Smooth.None), Line(points=  {{16, -24}, {36, -24}}, color=  {0, 0, 255}, smooth=  Smooth.None), Line(points=  {{20, -28}, {34, -28}}, color=  {0, 0, 255}, smooth=  Smooth.None), Line(points=  {{22, -32}, {30, -32}}, color=  {0, 0, 255}, smooth=  Smooth.None), Rectangle(extent=  {{-38, 22}, {-28, 18}}, lineColor=  {0, 0, 0}, fillColor=  {0, 0, 0}, fillPattern=  FillPattern.Solid), Line(points=  {{-12, 38}, {-4, 20}, {-18, 20}, {-6, -2}}, color=  {255, 0, 0}, smooth=  Smooth.None, thickness=  0.5), Line(points=  {{-12, 0}, {-6, -2}, {-6, 4}}, color=  {255, 0, 0}, smooth=  Smooth.None)}), Diagram(graphics), uses(Modelica(version = "3.2")));
  annotation(Diagram(coordinateSystem(extent = {{-80, -100}, {100, 100}})), Icon(coordinateSystem(extent = {{-80, -100}, {100, 100}})), Documentation(info = "<html>
<p><br><span style=\"font-family: MS Shell Dlg 2;\">&LT;iPSL: iTesla Power System Library&GT;</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Copyright 2015 RTE (France), AIA (Spain), KTH (Sweden) and DTU (Denmark)</span></p>
<ul>
<li><span style=\"font-family: MS Shell Dlg 2;\">RTE: http://www.rte-france.com/ </span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">AIA: http://www.aia.es/en/energy/</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">KTH: https://www.kth.se/en</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">DTU:http://www.dtu.dk/english</span></li>
</ul>
<p><span style=\"font-family: MS Shell Dlg 2;\">The authors can be contacted by email: info at itesla-ipsl dot org</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">This package is part of the iTesla Power System Library (&QUOT;iPSL&QUOT;) .</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is free software: you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">You should have received a copy of the GNU Lesser General Public License along with the iPSL. If not, see &LT;http://www.gnu.org/licenses/&GT;.</span></p>
</html>"));
end PwLineFault;
