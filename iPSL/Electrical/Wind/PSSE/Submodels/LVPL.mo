within iPSL.Electrical.Wind.PSSE.Submodels;
model LVPL "Low voltage power logic"
  parameter Real VLVPL1 "LVPL voltage 1 (Low voltage power logic)";
  parameter Real VLVPL2 "LVPL voltage 2";
  parameter Real GLVPL "LVPL gain";
  parameter Real K=GLVPL/(VLVPL2 - VLVPL1);
  Modelica.Blocks.Interfaces.RealInput Vt annotation (Placement(transformation(extent={{-112,-18},{-72,22}}), iconTransformation(extent={{-100,-10},{-80,10}})));
  Modelica.Blocks.Interfaces.RealOutput LVPL annotation (Placement(transformation(extent={{100,-10},{120,10}}), iconTransformation(extent={{100,-10},{120,10}})));
equation
  if Vt < VLVPL1 then
    LVPL = 0;
  elseif Vt > VLVPL2 then
    LVPL = 1e+6;
  else
    LVPL = K*(Vt - VLVPL1);
  end if;
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,100}}), graphics={Rectangle(extent={{-78,30},{92,-58}}, lineColor={0,0,255})}),
    Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,100}}), graphics={Rectangle(
          extent={{-100,100},{100,-100}},
          lineColor={0,0,255},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),Text(
          extent={{44,-40},{74,-58}},
          lineColor={0,0,255},
          lineThickness=0.5,
          fillColor={0,0,255},
          fillPattern=FillPattern.Solid,
          textString="V"),Text(
          extent={{-54,68},{-24,50}},
          lineColor={0,0,255},
          lineThickness=0.5,
          fillColor={0,0,255},
          fillPattern=FillPattern.Solid,
          textString="LVPL"),Line(
          points={{-66,20},{-54,20},{-54,20}},
          color={0,0,255},
          thickness=0.5,
          smooth=Smooth.None),Line(
          points={{-60,60},{-60,-60},{60,-60}},
          color={0,0,255},
          thickness=0.5,
          arrow={Arrow.Filled,Arrow.Filled}),Line(
          points={{-42,-60}},
          color={0,0,255},
          thickness=0.5),Line(
          points={{-40,-60},{20,20},{20,40}},
          color={0,0,255},
          thickness=0.5),Text(
          extent={{-102,22},{-72,4}},
          lineColor={0,0,255},
          lineThickness=0.5,
          fillColor={0,0,255},
          fillPattern=FillPattern.Solid,
          textString="V"),Text(
          extent={{66,8},{96,-10}},
          lineColor={0,0,255},
          lineThickness=0.5,
          fillColor={0,0,255},
          fillPattern=FillPattern.Solid,
          textString="LVLP")}),
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
end LVPL;
