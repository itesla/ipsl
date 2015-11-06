within iPSL.NonElectrical.Continuous;
model ImSimpleLag_varnonwindup
  "With inner integrator rate limit and changeable output limit"
  Real ylim;
  Real x;
  parameter Real T;
  parameter Real rmin "Min rate limit";
  parameter Real rmax "Max rate limit";
  parameter Real initValue "Initialized output value";
  Modelica.Blocks.Interfaces.RealInput yi annotation(Placement(transformation(extent = {{-73, -7}, {-61, 7}}), iconTransformation(extent = {{-73, -7}, {-61, 7}})));
  Modelica.Blocks.Interfaces.RealOutput yo annotation(Placement(transformation(extent = {{60, -8}, {72, 6}}), iconTransformation(extent = {{60, -8}, {72, 6}})));
  Modelica.Blocks.Interfaces.RealInput max annotation(Placement(transformation(extent = {{25, 53}, {37, 67}})));
  Modelica.Blocks.Interfaces.RealInput min annotation(Placement(transformation(extent = {{-21, -67}, {-9, -53}})));
initial equation
  x = initValue;
equation
  ylim = if yi > max then (max - x) / T elseif yi < min then (min - x) / T else (yi - x) / T;
  der(x) = if ylim > rmax then rmax elseif ylim < rmin then rmin else ylim;
  yo = if x > max then max elseif x < min then min else x;
  annotation(Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics), Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics={  Line(points=  {{-40, -60}, {-40, -60}, {0, 60}, {0, 60}}, color=  {0, 0, 255}, smooth=  Smooth.None, thickness=  0.5), Line(points=  {{-10, -60}, {10, -60}, {38, 60}, {60, 60}}, color=  {0, 0, 255}, smooth=  Smooth.None, thickness=  0.5), Rectangle(extent=  {{-60, 40}, {60, -40}}, lineColor=  {0, 0, 255}, fillColor=  {255, 255, 255},
            fillPattern=                                                                                                    FillPattern.Solid), Text(extent=  {{-6, 14}, {2, 0}}, lineColor=  {0, 0, 255}, textStyle=  {TextStyle.Bold}, textString=  "1"), Text(extent=  {{-20, 0}, {18, -16}}, lineColor=  {0, 0, 255}, textStyle=  {TextStyle.Bold}, textString=  "1+Ts"), Line(points=  {{-18, 0}, {16, 0}}, color=  {0, 0, 255}, smooth=  Smooth.Bezier)}),
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
end ImSimpleLag_varnonwindup;
