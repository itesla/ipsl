within iPSL.NonElectrical.Nonlinear;
model ImMonostable "Temporary overshoot for a threshold. The output's changeover from 0 to 1 (switching on) takes place when the input 
              becomes greater than the threshold. The switched position is held during a time at least equal to T. Then, the changeover from 1 to 0 
              (switching off) takes place when the input once more falls (or has already fallen) below the threshold.
              2014/03/10"

  Modelica.Blocks.Interfaces.RealInput p1 annotation(Placement(transformation(extent = {{-61, -10}, {-41, 10}}), iconTransformation(extent = {{-61, -10}, {-41, 10}})));
  Modelica.Blocks.Interfaces.RealOutput n1 annotation(Placement(transformation(extent = {{39, -10}, {59, 10}}), iconTransformation(extent = {{39, -10}, {59, 10}})));
  discrete Real tau(start = -T);
  parameter Real S "Start";
  parameter Real T "Pulse period";
  Boolean mode;
  Boolean cond1;
  Boolean cond2;
equation
  cond1 = p1 > S and pre(mode) == false;
  cond2 = p1 <= S and time - pre(tau) >= T;
  when {cond1, cond2} then
    mode = not pre(mode);
    tau = time;
  end when;
  if mode then
    n1 = 1;
  else
    n1 = 0;
  end if;
  annotation(Icon(graphics={  Rectangle(extent = {{-40, 40}, {40, -40}}, lineColor = {0, 0, 255}), Text(extent = {{-40, -22}, {-22, -34}}, lineColor = {0, 0, 255}, textStyle = {TextStyle.Bold}, textString = "T"), Line(points = {{-24, 16}, {-12, 16}, {-12, 34}, {12, 34}, {12, 16}, {24, 16}}, color = {0, 0, 255}, smooth = Smooth.None), Text(extent = {{-40, -10}, {-22, -22}}, lineColor = {0, 0, 255}, textStyle = {TextStyle.Bold}, textString = "S")}), Diagram(graphics),
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
end ImMonostable;
