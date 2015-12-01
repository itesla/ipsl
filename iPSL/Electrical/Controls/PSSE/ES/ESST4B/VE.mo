within iPSL.Electrical.Controls.PSSE.ES.ESST4B;
model VE
  parameter Real KP = 6.73;
  parameter Real KI = 0.1;
  parameter Real XL = 0;
  parameter Real THETAP = 0;
  Modelica.Blocks.Interfaces.RealInput Vr annotation(Placement(transformation(extent = {{-140, 56}, {-100, 96}})));
  Modelica.Blocks.Interfaces.RealInput Vi annotation(Placement(transformation(extent = {{-140, 10}, {-100, 50}})));
  Modelica.Blocks.Interfaces.RealInput Ir annotation(Placement(transformation(extent = {{-140, -36}, {-100, 4}})));
  Modelica.Blocks.Interfaces.RealInput Ii annotation(Placement(transformation(extent = {{-140, -84}, {-100, -44}})));
  Modelica.Blocks.Interfaces.RealOutput VE annotation(Placement(transformation(extent = {{100, -18}, {140, 22}}), iconTransformation(extent = {{100, -18}, {140, 22}})));
  Real Re;
  Real Im;
  Real VE2;
protected
  parameter Real KPr = KP * cos(THETAP);
  parameter Real KPi = KP * sin(THETAP);
equation
  Re = KPr * Vr - KPi * Vi - KI * Ii - XL * (KPr * Ii + KPi * Ir);
  Im = KPr * Vi + KPi * Vr + KI * Ir + XL * (KPr * Ir - KPi * Ii);
  VE2 = Re * Re + Im * Im;
  VE = sqrt(VE2);
  annotation(Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics), Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics = {Text(extent=  {{-88, 86}, {90, -68}}, lineColor=  {0, 0, 255}, textString=  "VE=| KP*VT+j(KI+KP*XL)*IT |"), Rectangle(extent=  {{-100, 80}, {100, -84}}, lineColor=  {0, 0, 255})}), Documentation(info = "<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\">
<tr>
<td><p>Reference</p></td>
<td>PSS/E Manual</td>
</tr>
<tr>
<td><p>Last update</p></td>
<td>Unknown</td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p>Mengjia Zhang,SmarTS Lab, KTH Royal Institute of Technology</p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p><a href=\"mailto:luigiv@kth.se\">luigiv@kth.se</a></p></td>
</tr>
</table>
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
end VE;

