within iPSL.NonElectrical.Nonlinear;
model ImRelayOEL

  Modelica.Blocks.Interfaces.RealInput p annotation(Placement(transformation(extent = {{-92, 10}, {-72, 30}}), iconTransformation(extent = {{-92, 10}, {-72, 30}})));
  Modelica.Blocks.Interfaces.RealOutput n1 annotation(Placement(transformation(extent = {{56, 38}, {76, 58}}), iconTransformation(extent = {{58, 38}, {78, 58}})));
  Modelica.Blocks.Interfaces.RealOutput n2 annotation(Placement(transformation(extent = {{58, -34}, {78, -14}})));
  parameter Real TimeLimit "Time limit";
  discrete Real entryTime "Time instant when p>0";
  Real TotalTime "The total time of current above limit";
initial equation
  pre(entryTime) = 0;
equation
  when p > 0 then
    entryTime = time;
  end when;
  TotalTime = time - entryTime;
  if TotalTime >= TimeLimit then
    n1 = p;
    n2 = 0;
  else
    n1 = 0;
    n2 = p;
  end if;
  annotation(Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics), Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics={  Rectangle(extent = {{-72, 72}, {58, -50}}, lineColor = {0, 0, 127}), Text(extent = {{10, 66}, {54, 32}}, lineColor = {0, 0, 255}, textString = "Triggerred"), Line(points = {{-68, 20}, {-42, 20}}, color = {0, 0, 255}, smooth = Smooth.None), Line(points = {{-28, 46}, {6, 46}}, color = {0, 0, 255}, smooth = Smooth.None), Line(points = {{-42, 20}, {-26, -2}}, color = {0, 0, 255}, smooth = Smooth.None), Ellipse(extent = {{-26, -2}, {-22, -6}}, lineColor = {0, 0, 255}), Ellipse(extent = {{-32, 48}, {-28, 44}}, lineColor = {0, 0, 255}), Line(points = {{-28, -24}, {6, -24}}, color = {0, 0, 255}, smooth = Smooth.None), Ellipse(extent = {{-32, -22}, {-28, -26}}, lineColor = {0, 0, 255}), Text(extent = {{12, -8}, {56, -42}}, lineColor = {0, 0, 255}, textString = "Accepted")}),
    Documentation(info="<html>
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
end ImRelayOEL;
