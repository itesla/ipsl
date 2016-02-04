within iPSL.Electrical.Controls.Eurostag;
class EFD1 "Generate constant signal of type Real.
                  2014/03/10"
  parameter Real V;
  Modelica.Blocks.Interfaces.RealOutput pin_EFD annotation (Placement(transformation(extent={{39,-10},{59,10}}), iconTransformation(extent={{39,-10},{59,10}})));
equation
  pin_EFD = V;
  annotation (
    Icon(graphics={Rectangle(extent={{-60,40},{40,-40}}, lineColor={0,0,255}),Text(
          extent={{-36,14},{20,-12}},
          lineColor={0,0,255},
          textStyle={TextStyle.Bold},
          textString="EFD1")}),
    Diagram(graphics),
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
end EFD1;
