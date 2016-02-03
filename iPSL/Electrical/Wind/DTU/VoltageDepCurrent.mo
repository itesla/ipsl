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
    Documentation(info="", revisions="<!--DISCLAIMER-->
<html>
<p>Copyright 2015 RTE (France), SmarTS Lab (Sweden), AIA (Spain) and DTU (Denmark)</p>
<p>​- ​RTE: http://www.rte-france.com/</p>
<p>- SmarTS Lab, research group at KTH: https://www.kth.se/en</p>
<p>​- ​AIA: http://www.aia.es/en/energy/</p>
<p>​- ​DTU: http://www.dtu.dk/english</p>
<p>The authors can be contacted by email: info@itesla-ipsl.org </p>
<p>​</p>
<p>​​This Source Code Form is subject to the terms of the Mozilla Public License, v. 2.0. </p>
<p>If a copy of the MPL was not distributed with this file, You can obtain one at http://mozilla.org/MPL/2.0/.</p>
</html>"));
end VoltageDepCurrent;
