within iPSL.Electrical.Controls.PSSE.TG.GGOV1;
block flag "Output the minimum and the maximum element of the input vector"
  parameter Real flag;
  Modelica.Blocks.Interfaces.RealOutput y annotation (Placement(transformation(extent={{100,-12},{120,8}}, rotation=0)));
  Modelica.Blocks.Interfaces.RealInput speed
    annotation (Placement(transformation(extent={{6,-136},{46,-96}}), iconTransformation(
        extent={{-20,-20},{20,20}},
        rotation=0,
        origin={-120,-2})));
equation
  y = if flag == 1 then speed + 1 else 1;
  annotation (
    Icon(coordinateSystem(
        preserveAspectRatio=true,
        extent={{-100,-100},{100,100}},
        initialScale=0.1), graphics={Text(
          extent={{-51,31},{51,-31}},
          lineColor={0,0,255},
          horizontalAlignment=TextAlignment.Left,
          origin={1,5},
          rotation=360,
          textString="Flag"),Rectangle(extent={{-98,90},{96,-92}}, lineColor={0,0,255})}),
    Documentation(info="<html>
<p>
Determines the minimum and maximum element of the input vector and
provide both values as output.
</p>
</html>", revisions="<!--DISCLAIMER-->
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
    Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,100}}), graphics));
end flag;
