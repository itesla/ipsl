within iPSL.Electrical.Sensors;
class PwVoltage "Voltage sensor."
  iPSL.Connectors.PwPin p annotation (Placement(transformation(extent={{-60,-10},{-40,10}}), iconTransformation(extent={{-60,-10},{-40,10}})));
  Modelica.Blocks.Interfaces.RealOutput vr annotation (Placement(transformation(extent={{39,20},{59,40}}), iconTransformation(extent={{39,20},{59,40}})));
  Modelica.Blocks.Interfaces.RealOutput vi annotation (Placement(transformation(extent={{39,-10},{59,10}}), iconTransformation(extent={{39,-10},{59,10}})));
  Modelica.Blocks.Interfaces.RealOutput v annotation (Placement(transformation(extent={{39,-40},{59,-20}}), iconTransformation(extent={{39,-40},{59,-20}})));
equation
  p.ir = 0;
  p.ii = 0;
  vr = p.vr;
  vi = p.vi;
  v = sqrt(p.vr*p.vr + p.vi*p.vi);
  annotation (
    Icon(graphics={Rectangle(extent={{-40,40},{40,-40}}, lineColor={0,0,255}),Rectangle(extent={{-30,32},{30,-32}}, lineColor={0,0,255}),Rectangle(extent={{-20,20},{20,0}}, lineColor={0,0,255}),Text(
          extent={{-26,-12},{-6,-28}},
          lineColor={0,0,255},
          textString="U",
          textStyle={TextStyle.Bold}),Line(
          points={{0,0},{10,10}},
          color={0,0,255},
          smooth=Smooth.None),Text(
          extent={{52,44},{60,38}},
          lineColor={0,0,255},
          textString="vr"),Text(
          extent={{52,14},{60,8}},
          lineColor={0,0,255},
          textString="vi"),Text(
          extent={{52,-16},{60,-22}},
          lineColor={0,0,255},
          textString="v")}),
    Diagram(graphics),
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
end PwVoltage;
