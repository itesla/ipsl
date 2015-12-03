within iPSL.Electrical.Wind.DTU;
model VoltageDepCurrent "Part of the Q Control, to generate voltage dependent current. Developed by DTU"
  Modelica.Blocks.Interfaces.RealInput Uwtt annotation (Placement(transformation(extent={{-60,-6},{-48,6}}), iconTransformation(extent={{-60,-6},{-48,6}})));
  Modelica.Blocks.Interfaces.RealOutput iqv annotation (Placement(transformation(extent={{47,-6},{59,6}}), iconTransformation(extent={{47,-6},{59,6}})));
  parameter Real Udb1 "voltage dead band lower limit";
  parameter Real Udb2 "voltage dead band upper limit";
  parameter Real Kqv;
  parameter Real Uini(fixed=false) "initial voltage";
initial equation
  Uini = Uwtt;
equation
  iqv = if Uwtt < Uini - Udb1 then Kqv*(Uwtt - Uini + Udb1) elseif Uwtt > Uini + Udb2 then Kqv*(Uwtt - Uini - Udb2) else 0;
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics),
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics={Rectangle(
          extent={{-48,30},{48,-28}},
          lineColor={0,0,255},
          lineThickness=0.5),Line(
          points={{-10,20},{-10,-20}},
          color={0,0,255},
          smooth=Smooth.None),Line(
          points={{-30,0},{10,0}},
          color={0,0,255},
          smooth=Smooth.None),Line(
          points={{-26,-10},{-20,0},{0,0},{6,10}},
          color={0,0,255},
          thickness=0.5,
          smooth=Smooth.None),Text(
          extent={{16,6},{34,-6}},
          lineColor={0,0,255},
          lineThickness=0.5,
          fillPattern=FillPattern.Solid,
          textString="Kqv")}),
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
end VoltageDepCurrent;

