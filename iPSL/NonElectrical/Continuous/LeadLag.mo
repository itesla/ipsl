within iPSL.NonElectrical.Continuous;
block LeadLag "Lead-Lag filter"
  extends Modelica.Blocks.Interfaces.SISO;
  parameter Real K "Gain";
  parameter Modelica.SIunits.Time T1 "Lead time constant";
  parameter Modelica.SIunits.Time T2 "Lag time constant";
  parameter Real y_start "Output start value" annotation (Dialog(group="Initialization"));
  parameter Real x_start=0 "Start value of state variable" annotation (Dialog(group="Initialization"));
protected
  parameter Modelica.SIunits.Time T2_dummy=if abs(T1 - T2) < Modelica.Constants.eps then 1000 else T2 "Lead time constant";
public
  Modelica.Blocks.Sources.RealExpression par1(y=T1) annotation (Placement(transformation(extent={{-80,54},{-60,74}})));
  Modelica.Blocks.Sources.RealExpression par2(y=T2) annotation (Placement(transformation(extent={{-80,34},{-60,54}})));
  Modelica.Blocks.Continuous.TransferFunction TF(
    b={K*T1,K},
    a={T2_dummy,1},
    y_start=y_start,
    initType=Modelica.Blocks.Types.Init.InitialOutput,
    x_start={x_start}) annotation (Placement(transformation(extent={{-8,-10},{12,10}})));
equation
  if (abs(par1.y - par2.y) < Modelica.Constants.eps) then
    y = K*u;
  else
    y = TF.y;
  end if;

  connect(TF.u, u) annotation (Line(points={{-10,0},{-120,0}}, color={0,0,127}));
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}})),
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
</html>"),
    Icon(graphics={Text(
          extent={{-44,82},{76,22}},
          lineColor={0,0,255},
          textString="1+sT"),Line(
          points={{-46,0},{82,0}},
          color={0,0,255},
          smooth=Smooth.Bezier,
          thickness=0.5),Text(
          extent={{-44,-20},{76,-80}},
          lineColor={0,0,255},
          textString="1+sT"),Text(
          extent={{-100,28},{-40,-32}},
          lineColor={0,0,255},
          textString="K"),Text(
          extent={{62,44},{82,24}},
          lineColor={0,0,255},
          textString="1"),Text(
          extent={{64,-58},{84,-78}},
          lineColor={0,0,255},
          textString="2")}));
end LeadLag;
