within iPSL.Electrical.Controls.PSSE.ES.ST5B;
class ImLimitedSimpleLag "Simple Lag with limited value of the output.
              2014/03/10"

  input Modelica.Blocks.Interfaces.RealInput p1 annotation(Placement(transformation(extent={{-59,8},
            {-39,28}}),                                                                                         iconTransformation(extent={{-57,-10},
            {-40,10}})));
  output Modelica.Blocks.Interfaces.RealOutput n1
                                          annotation(Placement(transformation(extent = {{39, -10}, {59, 10}}), iconTransformation(extent = {{39, -10}, {59, 10}})));
  parameter Real VRMIN "Min limit";
  parameter Real VRMAX "Max limit";
  parameter Real K "Gain";
  parameter Real T "Lag Time Constant";
  parameter Real nStartValue "Output start value";
  parameter Real VT
    "Sensed Voltage Terminal, equivalent to ETERM parameter from the ES";
  Real Ymin;
  Real Ymax;
initial equation
  n1 = nStartValue;
equation
   Ymin=VRMIN*VT;
   Ymax=VRMAX*VT;
  if n1 > Ymin and n1 < Ymax then
    der(n1) = (-1 * n1 / T) + K * p1 / T;
  elseif n1 <= Ymin and K * p1 / T - n1 / T > 0 then
    der(n1) = (-1 * n1 / T) + K * p1 / T;
  elseif n1 >= Ymax and K * p1 / T - n1 / T < 0 then
    der(n1) = (-1 * n1 / T) + K * p1 / T;
  else
    der(n1) = 0;
  end if;
  annotation(Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,
            -100},{100,100}}),
                  graphics={  Rectangle(extent=  {{-40, 40}, {40, -40}}, lineColor=  {0, 0, 255}), Text(extent={{
              -6,14},{2,0}},                                                                                                    lineColor=  {0, 0, 255}, textString=  "K", textStyle=  {TextStyle.Bold}), Text(extent={{
              -16,0},{16,-12}},                                                                                                    lineColor=  {0, 0, 255}, textStyle=  {TextStyle.Bold}, textString=  "1+Ts"), Line(points={{
              -12,0},{12,0}},                                                                                                    color=  {0, 0, 255}, smooth=  Smooth.Bezier), Line(points={{
              -2,40},{10,40},{14,54},{28,54}},                                                                                                    color=  {0, 0, 255}, smooth=  Smooth.None),
                                                                                        Line(points={{
              -30,-54},{-14,-54},{-10,-40},{4,-40}},                                                                                                    color=  {0, 0, 255}, smooth=  Smooth.None),
                                                                                        Text(extent={{4,
              60},{36,54}},                                                                                                    lineColor=
              {0,0,255},                                                                                                    textStyle=
              {TextStyle.Bold},
          textString="VRMAX*VT"),                                                                                                    Text(extent={{
              -38,-54},{-4,-60}},                                                                                                    lineColor=
              {0,0,255},                                                                                                    textStyle=
              {TextStyle.Bold},
          textString="VRMIN*VT")}),                                                                                              Diagram(
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
end ImLimitedSimpleLag;
