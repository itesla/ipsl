within iPSL.Electrical.Wind.DTU;
model LVRT "Enables low voltage ride through signal. Developed by DTU"
  Modelica.Blocks.Interfaces.RealInput Uwtt annotation (Placement(transformation(extent={{-51,-6},{-41,6}}), iconTransformation(extent={{-51,-6},{-41,6}})));
  Modelica.Blocks.Interfaces.RealOutput F_LVRT annotation (Placement(transformation(extent={{39,14},{49,26}}), iconTransformation(extent={{39,14},{49,26}})));
  Modelica.Blocks.Interfaces.RealOutput Fpost annotation (Placement(transformation(extent={{39,-26},{49,-14}}), iconTransformation(extent={{39,-26},{49,-14}})));
  parameter Real Uqdip "Voltage threshold value for LVRT detection in Q control";
  parameter Modelica.SIunits.Time Tpost=0 "Length of time period where post fault reactive power is injected";
  discrete Modelica.SIunits.Time LVRTstop "Time instant when post fault period started";
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
  annotation (
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics={Rectangle(
          extent={{-40,30},{40,-30}},
          lineColor={0,0,255},
          lineThickness=0.5),Text(
          extent={{-18,38},{20,6}},
          lineColor={0,0,255},
          lineThickness=0.5,
          fillPattern=FillPattern.Solid,
          textString="LVRT Mode"),Line(
          points={{-26,10},{-10,10},{-10,-20},{6,-20},{20,4},{36,4}},
          color={0,0,255},
          smooth=Smooth.None,
          thickness=0.5)}),
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics),
    Documentation(revisions="<!--DISCLAIMER-->
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
end LVRT;
