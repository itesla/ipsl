within iPSL.Electrical.Wind.DTU;
model LVRT "Enables low voltage ride through signal. Developed by DTU"

  Modelica.Blocks.Interfaces.RealInput Uwtt annotation(Placement(transformation(extent = {{-51, -6}, {-41, 6}}), iconTransformation(extent = {{-51, -6}, {-41, 6}})));
  Modelica.Blocks.Interfaces.RealOutput F_LVRT annotation(Placement(transformation(extent = {{39, 14}, {49, 26}}), iconTransformation(extent = {{39, 14}, {49, 26}})));
  Modelica.Blocks.Interfaces.RealOutput Fpost annotation(Placement(transformation(extent = {{39, -26}, {49, -14}}), iconTransformation(extent = {{39, -26}, {49, -14}})));
  parameter Real Uqdip
    "Voltage threshold value for LVRT detection in Q control";
  parameter Modelica.SIunits.Time Tpost = 0
    "Length of time period where post fault reactive power is injected";
  discrete Modelica.SIunits.Time LVRTstop
    "Time instant when post fault period started";
initial equation
  F_LVRT = if Uwtt < Uqdip then 1 else 0;
  Fpost = 0;
algorithm
  when Uwtt <= Uqdip then
    F_LVRT := 1;
  elsewhen Uwtt > Uqdip then
    F_LVRT := 0;
    LVRTstop := time;
    Fpost := 1;
  end when;
  when time > LVRTstop + Tpost then
    if F_LVRT < 1 then
      Fpost := 0;
    else
      Fpost := pre(Fpost);
    end if;
  end when;
  annotation(Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics={  Rectangle(extent = {{-40, 30}, {40, -30}}, lineColor = {0, 0, 255},
            lineThickness =                                                                                                   0.5), Text(extent = {{-18, 38}, {20, 6}}, lineColor = {0, 0, 255},
            lineThickness =                                                                                                   0.5,
            fillPattern =                                                                                                   FillPattern.Solid, textString = "LVRT Mode"), Line(points = {{-26, 10}, {-10, 10}, {-10, -20}, {6, -20}, {20, 4}, {36, 4}}, color = {0, 0, 255}, smooth = Smooth.None, thickness = 0.5)}), Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics),
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
end LVRT;
