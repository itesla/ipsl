within iPSL.Electrical.Controls.PSSE.TG.GGOV1;
block Min_select
  "Output the minimum and the maximum element of the input vector"
  parameter Integer nu(min = 0) = 0 "Number of input connections" annotation(Dialog(connectorSizing = true), HideResult = true);
  Modelica.Blocks.Interfaces.RealVectorInput u[nu] annotation(Placement(transformation(extent = {{-120, 70}, {-80, -70}})));
  Modelica.Blocks.Interfaces.RealOutput yMin(start = frs0) annotation(Placement(transformation(extent = {{100, -94}, {120, -74}}, rotation = 0)));
  parameter Real frs0;
equation
  yMin = min(u);
  annotation(Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}, initialScale = 0.1), graphics = {Text(extent=  {{-50, 46}, {76, -46}}, lineColor=  {0, 0, 255}, textString=  "Low value 
select"), Rectangle(extent=  {{-100, 98}, {100, -98}}, lineColor=  {0, 0, 255})}), Documentation(info = "<html>
<p>
Determines the minimum and maximum element of the input vector and
provide both values as output.
</p>
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
</html>"), Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics));
end Min_select;

