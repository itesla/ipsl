within iPSL.Electrical.Sensors;
class PwVoltageCurrent "Voltage sensor."
  iPSL.Connectors.PwPin p annotation (Placement(transformation(extent={{-60,-40},{-40,-20}}), iconTransformation(extent={{-60,-40},{-40,-20}})));
  iPSL.Connectors.PwPin n annotation (Placement(transformation(extent={{-10,50},{10,70}}), iconTransformation(extent={{40,20},{60,40}})));
  Modelica.Blocks.Interfaces.RealOutput Vr annotation (Placement(transformation(extent={{48,-34},{68,-14}}), iconTransformation(extent={{40,4},{50,14}})));
  Modelica.Blocks.Interfaces.RealOutput Vi annotation (Placement(transformation(extent={{48,-54},{68,-34}}), iconTransformation(extent={{40,-10},{50,0}})));
  Modelica.Blocks.Interfaces.RealOutput Ir annotation (Placement(transformation(extent={{48,-72},{68,-52}}), iconTransformation(extent={{40,-24},{50,-14}})));
  Modelica.Blocks.Interfaces.RealOutput Ii annotation (Placement(transformation(extent={{48,-88},{68,-68}}), iconTransformation(extent={{40,-40},{52,-28}})));
equation
  n.vr = p.vr;
  n.vi = p.vi;
  n.ir = -p.ir;
  n.ii = -p.ii;
  Vr = p.vr;
  Vi = p.vi;
  Ir = p.ir;
  Ii = p.ii;
  annotation (
    Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,100}}), graphics={Rectangle(extent={{-40,40},{40,-40}}, lineColor={0,0,255}),Rectangle(extent={{-30,32},{30,-32}},
          lineColor={0,0,255}),Rectangle(extent={{-20,20},{20,0}}, lineColor={0,0,255}),Text(
          extent={{-26,-12},{-6,-28}},
          lineColor={0,0,255},
          textString="U",
          textStyle={TextStyle.Bold}),Line(
          points={{0,0},{10,10}},
          color={0,0,255},
          smooth=Smooth.None),Text(
          extent={{52,12},{60,6}},
          lineColor={0,0,255},
          textString="vr"),Text(
          extent={{52,-2},{60,-8}},
          lineColor={0,0,255},
          textString="vi"),Text(
          extent={{52,-16},{60,-22}},
          lineColor={0,0,255},
          textString="Ir"),Text(
          extent={{52,-32},{60,-38}},
          lineColor={0,0,255},
          textString="Ii")}),
    Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,100}}), graphics),
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
end PwVoltageCurrent;
