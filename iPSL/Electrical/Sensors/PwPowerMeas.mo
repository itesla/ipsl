within iPSL.Electrical.Sensors;
model PwPowerMeas
  iPSL.Connectors.PwPin p annotation (Placement(transformation(extent={{-52,-6},{-40,6}})));
  iPSL.Connectors.PwPin n annotation (Placement(transformation(extent={{40,20},{52,32}}), iconTransformation(extent={{40,20},{52,32}})));
  Modelica.Blocks.Interfaces.RealOutput P annotation (Placement(transformation(extent={{40,-16},{50,-4}}), iconTransformation(extent={{40,-16},{50,-4}})));
  Modelica.Blocks.Interfaces.RealOutput Q annotation (Placement(transformation(extent={{40,-40},{50,-28}}), iconTransformation(extent={{40,-40},{50,-28}})));
equation
  n.vr = p.vr;
  n.vi = p.vi;
  n.ir = -p.ir;
  n.ii = -p.ii;
  -Q = (-n.vr*n.ii) + n.vi*n.ir;
  P = n.vr*n.ir + n.vi*n.ii;
  annotation (
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics={Rectangle(extent={{-40,40},{40,-40}}, lineColor={0,0,255}),Rectangle(extent={{-30,32},{30,-32}},
          lineColor={0,0,255}),Rectangle(extent={{-20,20},{20,0}}, lineColor={0,0,255}),Text(
          extent={{-20,-12},{0,-28}},
          lineColor={0,0,255},
          textStyle={TextStyle.Bold},
          textString="Q"),Line(
          points={{0,0},{10,10}},
          color={0,0,255},
          smooth=Smooth.None),Text(
          extent={{-32,-12},{-12,-28}},
          lineColor={0,0,255},
          textStyle={TextStyle.Bold},
          textString="P/")}),
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
end PwPowerMeas;
