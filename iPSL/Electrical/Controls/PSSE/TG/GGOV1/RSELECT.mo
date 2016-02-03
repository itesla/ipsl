within iPSL.Electrical.Controls.PSSE.TG.GGOV1;
block RSELECT "Output the minimum and the maximum element of the input vector"
  // extends Modelica.Blocks.Icons.Block;
  parameter Real Rselect;
  Modelica.Blocks.Interfaces.RealOutput y annotation (Placement(transformation(extent={{100,-12},{120,8}}, rotation=0)));
  Modelica.Blocks.Interfaces.RealInput Pelect annotation (Placement(transformation(extent={{-140,36},{-100,76}}), iconTransformation(extent={{-140,36},{-100,76}})));
  Modelica.Blocks.Interfaces.RealInput ValveStroke
    annotation (Placement(transformation(extent={{4,-80},{44,-40}}), iconTransformation(
        extent={{-20,-20},{20,20}},
        rotation=90,
        origin={8,-120})));
  Modelica.Blocks.Interfaces.RealInput GovernorOutput
    annotation (Placement(transformation(extent={{6,-136},{46,-96}}), iconTransformation(
        extent={{-20,-20},{20,20}},
        rotation=90,
        origin={84,-120})));
equation
  y = if Rselect == 1 then Pelect elseif Rselect == (-1) then ValveStroke elseif Rselect == (-2) then GovernorOutput else 0;
  annotation (
    Icon(coordinateSystem(
        preserveAspectRatio=true,
        extent={{-100,-100},{100,100}},
        initialScale=0.1), graphics={Text(
          extent={{-51,31},{51,-31}},
          lineColor={0,0,255},
          textString="Rselect
 1 -  electrical power
-1 - valve stroke
-2 - governor output
 0 - isochronous",
          horizontalAlignment=TextAlignment.Left,
          origin={-11,-1},
          rotation=270),Rectangle(extent={{-100,100},{100,-100}}, lineColor={0,0,255})}),
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
    Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,100}}), graphics={Rectangle(extent={{-100,100},{100,-100}}, lineColor={0,0,255})}));
end RSELECT;
