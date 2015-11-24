within iPSL.NonElectrical.Continuous;
model ImLimitedLeadLag "Nonwindup Limited Lead Lag filter.
              2014/06/03"

   Modelica.Blocks.Interfaces.RealInput p1 annotation(Placement(transformation(extent = {{-61, -10}, {-41, 10}}), iconTransformation(extent = {{-61, -10}, {-41, 10}})));
   Modelica.Blocks.Interfaces.RealOutput n1(start = nStartValue) annotation(Placement(transformation(extent={{43,-10},
            {63,10}}),                                                                                                    iconTransformation(extent={{43,-10},
            {63,10}})));
  Real y2;
  Real y1;
  parameter Real YMAX;
  parameter Real K "Gain";
  parameter Real T1 "Lead time constant";
  parameter Real T2 "Lag time constant";
  parameter Real YMIN;
  parameter Real nStartValue "Output start value";
initial equation
  y2=nStartValue;
equation
  if YMIN > y2 or YMAX < y2 then
    der(y2) = 0;
  elseif YMIN < y2 and YMAX > y2 then
    T2 * der(y2) = (-y2) + K * p1;
  elseif y2 > YMIN and K * p1 <= YMAX then
    T2 * der(y2) = (-y2) + K * p1;
  elseif y2 < YMAX and K * p1 >= YMIN then
    T2 * der(y2) = (-y2) + K * p1;
  else
    der(y2) = 0;
  end if;
  y1 = if YMIN >= y2 then YMIN elseif YMAX <= y2 then YMAX else y2;
  n1 = T1 * ((-y2 / T2) + K / T2 * p1) + y2;
  connect(n1, n1) annotation (Line(
      points={{53,0},{52,0},{52,0},{53,0}},
      color={0,0,127},
      smooth=Smooth.None));
  annotation(Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,
            -100},{100,100}}),
                  graphics={                                                                                                    Line(points={{2,
              38},{8,38},{12,54},{30,54}},                                                                                                    color = {0, 0, 255}, smooth = Smooth.None),
                              Rectangle(extent={{-48,38},{44,-42}},      lineColor = {0, 0, 255}), Line(points={{
              -28,-2},{16,-2}},                                                                                                  color = {0, 0, 255}, smooth = Smooth.Bezier, thickness = 0.5), Text(extent={{
              -26,2},{12,-30}},                                                                                                   lineColor = {0, 0, 255}, textString = "1 + T2s"),                                                                                   Text(extent={{
              -26,24},{12,-8}},                                                                                                   lineColor = {0, 0, 255}, textString = "1 + T1s"),                                                                                                   Text(extent={{
              16,64},{38,54}},                                                                                                    lineColor=
              {0,0,255},
          textString="VMAX/KR"),                                                                                                    Line(points={{
              -32,-58},{-16,-58},{-12,-42},{-6,-42}},                                                                                                    color = {0, 0, 255}, smooth = Smooth.None), Text(extent={{
              -28,-58},{-6,-68}},                                                                                                    lineColor=
              {0,0,255},
          textString="VMIN/KR")}), Documentation(info="<html>
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
end ImLimitedLeadLag;
