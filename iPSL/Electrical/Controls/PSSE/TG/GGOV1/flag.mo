within iPSL.Electrical.Controls.PSSE.TG.GGOV1;
block flag "Output the minimum and the maximum element of the input vector"
  parameter Real flag;
  Modelica.Blocks.Interfaces.RealOutput y annotation(Placement(transformation(extent = {{100, -12}, {120, 8}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput speed annotation(Placement(transformation(extent = {{6, -136}, {46, -96}}), iconTransformation(extent = {{-20, -20}, {20, 20}}, rotation = 0, origin = {-120, -2})));
equation
  y = if flag == 1 then speed + 1 else 1;
  annotation(Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}, initialScale = 0.1), graphics = {Text(extent=  {{-51, 31}, {51, -31}}, lineColor=  {0, 0, 255}, horizontalAlignment=  TextAlignment.Left, origin=  {1, 5}, rotation=  360, textString=  "Flag"), Rectangle(extent=  {{-98, 90}, {96, -92}}, lineColor=  {0, 0, 255})}), Documentation(info = "<html>
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
end flag;

