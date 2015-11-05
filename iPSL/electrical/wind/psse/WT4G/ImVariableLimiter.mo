within iPSL.Electrical.Wind.PSSE.WT4G;
class ImVariableLimiter "The limits should be calculated by other block"

  input Modelica.Blocks.Interfaces.RealInput p1 annotation(Placement(transformation(extent={{-61,4},
            {-41,24}}),                                                                                        iconTransformation(extent={{-61,4},
            {-41,24}})));
  input Modelica.Blocks.Interfaces.RealInput p2 annotation(Placement(transformation(extent={{-61,-26},
            {-41,-6}}),                                                                                         iconTransformation(extent={{-61,-26},
            {-41,-6}})));
  output Modelica.Blocks.Interfaces.RealOutput n1 annotation(Placement(transformation(extent = {{39, -10}, {59, 10}}), iconTransformation(extent = {{39, -10}, {59, 10}})));
equation
  n1 = if p2 > p1 then p1 else p2;
  annotation(Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,
            -100},{100,100}}),
                  graphics={  Rectangle(extent=  {{-40, 40}, {40, -40}}, lineColor=  {0, 0, 255}), Line(points={{
              -36,-60},{-6,8},{12,48},{36,48}},                                                                                                    color=  {0, 0, 255}, smooth=  Smooth.None, thickness=  0.5), Line(points={{
              24,52},{24,32}},                                                                                                    color=  {0, 0, 255}, smooth=  Smooth.None, thickness=  0.5), Line(points={{
              22,50},{24,54},{26,50}},                                                                                                    color=  {0, 0, 255}, smooth=  Smooth.None, thickness=  0.5), Line(points={{
              22,36},{24,32},{26,36}},                                                                                                    color=  {0, 0, 255}, smooth=  Smooth.None, thickness=  0.5)}),                                                                                                    Diagram(
        coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,100}}),                                                                                                    graphics),
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
end ImVariableLimiter;
