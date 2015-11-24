within iPSL.NonElectrical.Continuous;
model ImSimpleLag "First order transfer function block (= 1 pole) 2014/03/10"

  input Modelica.Blocks.Interfaces.RealInput p1 annotation(Placement(transformation(extent = {{-61, -10}, {-41, 10}}), iconTransformation(extent = {{-41, -10}, {-21, 10}})));

  parameter Real K "Gain";
  parameter Real T "Lag time constant";
  parameter Real nStartValue "Output start value";
  output Modelica.Blocks.Interfaces.RealOutput n1 annotation (Placement(transformation(
          extent={{60,-10},{80,10}}), iconTransformation(extent={{60,-10},{80,10}})));
initial equation
  if not (T==0) then
  n1 = nStartValue;
  else
    n1 = p1;
  end if;
equation
  if (T==0) then
    n1=p1*K;
  else
  T * der(n1) = K * p1 - n1;
  end if;
  annotation(Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
            {100,100}}),
                  graphics={  Rectangle(extent = {{-20, 40}, {60, -40}}, lineColor = {0, 0, 255}), Text(extent = {{12, 18}, {30, 0}}, lineColor = {0, 0, 255}, textString = "K"), Text(extent = {{2, 4}, {40, -28}}, lineColor = {0, 0, 255}, textString = "1 + Ts"), Line(points = {{6, 0}, {38, 0}}, color = {0, 0, 255}, smooth = Smooth.Bezier, thickness = 0.5)}), Diagram(graphics),
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
end ImSimpleLag;
