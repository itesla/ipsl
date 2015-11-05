within iPSL.Examples.REN_Groups.Configuration.Data;
record IEEET2_data
  parameter Real J = 0.20000E-01 "Voltage input time constant (s)";
  //0
  parameter Real J1 = 200.00 "AVR gain";
  //400
  parameter Real J2 = 0.10000E-02 "AVR time constant (s)";
  parameter Real J3 = 6.0800 "Maximum AVR output (pu)";
  parameter Real J4 = -6.0800 "Minimum AVR output (pu)";
  parameter Real J5 = 1 "Exciter field gain, s";
  parameter Real J6 = 0.55000 "Exciter time constant (s)";
  parameter Real J7 = 0.60000E-01 "Rate feedback gain (pu)";
  parameter Real J8 = 0.30000 "Rate feedback time constant (s)";
  parameter Real J9 = 0.60000 "Rate feedback time constant (s)";
  parameter Real J10 = 2.8500 "Exciter saturation point 1 (pu)";
  parameter Real J11 = 0.30000 "Saturation at E1";
  parameter Real J12 = 3.8000 "Exciter saturation point 2 (pu)";
  parameter Real J13 = 0.60000 "Saturation at E2";
  annotation(Icon(graphics={  Rectangle(extent=  {{-40, 40}, {40, -40}}, lineColor=  {0, 0, 255}), Text(extent=  {{-32, 14}, {32, -10}}, lineColor=  {0, 0, 255}, textStyle=  {TextStyle.Bold}, textString=  "|x|"), Text(extent=  {{-58, 4}, {-46, -4}}, lineColor=  {255, 255, 255}, textString=  "p1")}), Diagram(graphics),
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
end IEEET2_data;
