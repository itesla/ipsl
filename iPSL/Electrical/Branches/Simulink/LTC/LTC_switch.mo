within iPSL.Electrical.Branches.Simulink.LTC;
model LTC_switch

  Modelica.Blocks.Interfaces.RealInput Signalin annotation(Placement(transformation(extent = {{-68, -4}, {-48, 16}}), iconTransformation(extent = {{-78, -16}, {-48, 16}})));
  Modelica.Blocks.Interfaces.RealInput LTCin annotation(Placement(transformation(extent = {{-68, 46}, {-48, 66}}), iconTransformation(extent = {{-80, 32}, {-48, 66}})));
  Modelica.Blocks.Interfaces.RealInput Normalin annotation(Placement(transformation(extent = {{-68, -58}, {-48, -38}}), iconTransformation(extent = {{-78, -68}, {-48, -38}})));
  Modelica.Blocks.Interfaces.RealOutput r annotation(Placement(transformation(extent = {{54, 0}, {74, 20}}), iconTransformation(extent = {{56, -8}, {86, 24}})));
equation
  if Signalin > 0 then
    r = LTCin;
  else
    r = Normalin;
  end if;
  annotation(Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics), Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics={  Rectangle(extent=  {{-46, 94}, {56, -94}}, lineColor=  {0, 0, 255}, fillColor=  {255, 255, 255},
            fillPattern=                                                                                                    FillPattern.Solid), Line(points=  {{-46, 0}, {-32, 0}, {-32, 18}}, color=  {0, 0, 255}, smooth=  Smooth.None, thickness=  1), Line(points=  {{-32, 0}, {-32, -18}}, color=  {0, 0, 255}, smooth=  Smooth.None, thickness=  1)}),
    Documentation(info="<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\">
<tr>
<td><p>Reference</p></td>
<td>Load Tap Changer with switching</td>
</tr>
<tr>
<td><p>Last update</p></td>
<td>2015-10-02</td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p>Le Qi, SmarTS Lab, KTH Royal Institute of Technology</p></td>
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
end LTC_switch;
