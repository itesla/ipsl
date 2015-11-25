within iPSL.NonElectrical.Math;
class Min "standard component for min function"

  Modelica.Blocks.Interfaces.RealInput p1 "input1" annotation(Placement(transformation(extent = {{-70, 4}, {-50, 24}}), iconTransformation(extent = {{-70, 4}, {-50, 24}})));
  Modelica.Blocks.Interfaces.RealInput p2 "Input2" annotation(Placement(transformation(extent = {{-70, -48}, {-50, -28}}), iconTransformation(extent = {{-70, -48}, {-50, -28}})));
  Modelica.Blocks.Interfaces.RealOutput n1 "low vlaue ouput" annotation(Placement(transformation(extent = {{54, -12}, {74, 8}}), iconTransformation(extent = {{54, -12}, {74, 8}})));
equation
  if p1 > p2 then
    n1 = p2;
  else
    n1 = p1;
  end if annotation(Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics), Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics={  Rectangle(extent=  {{-48, 50}, {54, -50}}, lineColor=  {0, 0, 255}), Text(extent=  {{-26, 86}, {32, -94}}, lineColor=  {0, 0, 255}, textString=  "min")}));
  annotation(Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics),
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
end Min;
