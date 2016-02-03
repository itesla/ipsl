within iPSL.Electrical.Controls.PSSE.ES.ST5B;
model SelectLogic "Selection of voltage signal depending on the Excitation limiters"
  Modelica.Blocks.Interfaces.RealInput V1 annotation (Placement(transformation(extent={{-138,40},{-98,80}})));
  Modelica.Blocks.Interfaces.RealInput V2 annotation (Placement(transformation(extent={{-138,-20},{-98,20}})));
  Modelica.Blocks.Interfaces.RealInput V3 annotation (Placement(transformation(extent={{-138,-80},{-98,-40}})));
  Modelica.Blocks.Interfaces.RealInput VOEL annotation (Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=270,
        origin={-60,96}), iconTransformation(
        extent={{-20,-20},{20,20}},
        rotation=270,
        origin={-60,112})));
  Modelica.Blocks.Interfaces.RealInput VUEL annotation (Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=270,
        origin={0,96}), iconTransformation(
        extent={{-20,-20},{20,20}},
        rotation=270,
        origin={0,112})));
  Modelica.Blocks.Interfaces.RealInput VERR annotation (Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=270,
        origin={60,96}), iconTransformation(
        extent={{-20,-20},{20,20}},
        rotation=270,
        origin={60,112})));
  Modelica.Blocks.Interfaces.RealOutput Vout annotation (Placement(transformation(extent={{100,10},{120,30}})));
equation
  Vout = if VOEL > 0 then V3 else if VUEL > 0 then V2 else V1;
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,100}}), graphics),
    Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,100}}), graphics={Text(
          extent={{-42,54},{38,-48}},
          lineColor={0,0,255},
          textString="Select
Logic"),Rectangle(extent={{-100,100},{100,-100}}, lineColor={0,0,255})}),
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
end SelectLogic;
