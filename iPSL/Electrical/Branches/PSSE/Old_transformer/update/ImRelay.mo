within iPSL.Electrical.Branches.PSSE.Old_transformer.update;
model ImRelay "input dependent output"
  Modelica.Blocks.Interfaces.RealInput p1 annotation (Placement(transformation(extent={{-54,-26},{-41,-12}}), iconTransformation(extent={{-54,-26},{-41,-12}})));
  Modelica.Blocks.Interfaces.RealInput p2 annotation (Placement(transformation(extent={{-54,18},{-41,32}}), iconTransformation(extent={{-54,18},{-41,32}})));
  Modelica.Blocks.Interfaces.RealOutput n1 annotation (Placement(transformation(extent={{39,-10},{59,10}}), iconTransformation(extent={{39,-10},{59,10}})));
  parameter Real COD=0 "Enable OLTC";
equation
  n1 = if COD > 0 then p1 else p2;
  annotation (
    Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,100}}), graphics={Rectangle(extent={{-40,40},{40,-40}}, lineColor={0,0,255}),Line(
          points={{-2,12},{14,2},{34,2}},
          color={0,0,255},
          smooth=Smooth.None),Line(
          points={{-40,24},{-14,24}},
          color={0,0,255},
          smooth=Smooth.None),Line(
          points={{-40,-20},{-14,-20}},
          color={0,0,255},
          smooth=Smooth.None),Ellipse(extent={{-14,26},{-8,20}}, lineColor={0,0,255}),Ellipse(extent={{-14,-16},{-8,-22}}, lineColor={0,0,255})}),
    Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,100}}), graphics),
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
end ImRelay;
