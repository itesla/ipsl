within iPSL.NonElectrical.Continuous;
model ImLeadLag "Lead Lag filter.
              2014/03/10"

  Modelica.Blocks.Interfaces.RealInput p1 annotation(Placement(transformation(extent = {{-61, -10}, {-41, 10}}), iconTransformation(extent = {{-61, -10}, {-41, 10}})));
  Modelica.Blocks.Interfaces.RealOutput n1 annotation(Placement(transformation(extent = {{39, -10}, {59, 10}}), iconTransformation(extent = {{39, -10}, {59, 10}})));
  Real y(fixed=false, start= nStartValue);
  parameter Real K "Gain";
  parameter Real T1 "Lead time constant";
  parameter Real T2 "Lag time constant";
  parameter Real nStartValue "Output start value";
equation
  //equivalent to n+T2*der(n)=K*p+K*T1*der(p);
  if not (T1==T2) then
  T2 * der(y) = (-y) + K * p1;
  T2 * n1 = ((-y) + K * p1) * T1 + T2 * y;
  else
    y = p1*K;
    n1 = y;
  end if;
  annotation(Icon(graphics={  Rectangle(extent = {{-40, 40}, {40, -40}}, lineColor = {0, 0, 255}), Text(extent = {{-32, 10}, {-14, -8}}, lineColor = {0, 0, 255}, textString = "K", textStyle = {TextStyle.Bold}), Text(extent = {{-24, -8}, {38, -20}}, lineColor = {0, 0, 255}, textString = "1 + T2 s", textStyle = {TextStyle.Bold}), Line(points = {{-14, 0}, {18, 0}}, color = {0, 0, 255}, smooth = Smooth.Bezier), Text(extent = {{-24, 16}, {38, 4}}, lineColor = {0, 0, 255}, textStyle = {TextStyle.Bold}, textString = "1 + T1 s")}), Diagram(graphics),
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
end ImLeadLag;
