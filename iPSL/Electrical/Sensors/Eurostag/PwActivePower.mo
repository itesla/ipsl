within iPSL.Electrical.Sensors.Eurostag;
model PwActivePower "Active Power sensor. This model has been built assuming that the three 
  non-Fortescue phases are identical and thus the only non-zero component 
  for the Fortescue sequence is the positive. The output is the 3-phase active
   power which is equal to the positive sequence active power.Developed by AIA. 2014/03/10"

  parameter String UNIT = "SNREF";
  parameter Real SNREF = 100;
  parameter Real SN = 1150;
  parameter Real PN = 1000;
  parameter Real PNALT = 1100;
  parameter Real QNALT = sqrt(SN * SN - PN * PN);
  parameter Real PUI = if UNIT == "MW" then 1 elseif UNIT == "SNREF" then SNREF
   elseif UNIT == "SN" then SN
   elseif UNIT == "PN" then PN
   elseif UNIT == "PNALT" then PNALT else QNALT;
  iPSL.Connectors.PwPin p annotation (Placement(transformation(extent={{-60,-10},
            {-40,10}}), iconTransformation(extent={{-60,-10},{-40,10}})));
  Modelica.Blocks.Interfaces.RealOutput sortie annotation(Placement(transformation(extent = {{39, -32}, {59, -12}}), iconTransformation(extent = {{39, -32}, {59, -12}})));
  iPSL.Connectors.PwPin n annotation (Placement(transformation(extent={{40,12},
            {60,32}}), iconTransformation(extent={{40,12},{60,32}})));
equation
  n.vr = p.vr;
  n.vi = p.vi;
  n.ir = -p.ir;
  n.ii = -p.ii;
  sortie = (p.vr * p.ir + p.vi * p.ii) * SNREF / PUI;
  annotation(Icon(graphics={  Rectangle(extent=  {{-40, 40}, {40, -40}}, lineColor=  {0, 0, 255}), Rectangle(extent=  {{-30, 32}, {30, -32}}, lineColor=  {0, 0, 255}), Rectangle(extent=  {{-20, 20}, {20, 0}}, lineColor=  {0, 0, 255}), Text(extent=  {{-26, -12}, {-6, -28}}, lineColor=  {0, 0, 255}, textStyle=  {TextStyle.Bold}, textString=  "P"), Line(points=  {{0, 0}, {10, 10}}, color=  {0, 0, 255}, smooth=  Smooth.None)}), Diagram(graphics),
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
end PwActivePower;
