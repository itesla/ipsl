within iPSL.Electrical.Sensors;
model Pw3PhaseVoltage "Voltage sensor for generator machine with internal transformer"
  parameter Real RT "Step-up trafo Resistance in Machine (pu)";
  parameter Real XT "Step-up trafo Resistance in Machine (pu)";
  parameter Real r "Step-up trafo ratio in Machine";
  iPSL.Connectors.PwPin p annotation (Placement(transformation(extent={{-60,-10},{-40,10}}), iconTransformation(extent={{-60,-10},{-40,10}})));
  Modelica.Blocks.Interfaces.RealOutput v annotation (Placement(transformation(extent={{39,-32},{59,-12}}), iconTransformation(extent={{39,-32},{59,-12}})));
  iPSL.Connectors.PwPin n annotation (Placement(transformation(extent={{40,12},{60,32}}), iconTransformation(extent={{40,12},{60,32}})));
equation
  n.vr = p.vr;
  n.vi = p.vi;
  n.ir = -p.ir;
  n.ii = -p.ii;
  v = sqrt((p.vr + RT*p.ir - XT*p.ii)*(p.vr + RT*p.ir - XT*p.ii) + (p.vi + RT*p.ii + XT*p.ir)*(p.vi + RT*p.ii + XT*p.ir))*1.0/r;
  annotation (
    Icon(graphics={Rectangle(extent={{-40,40},{40,-40}}, lineColor={0,0,255}),Rectangle(extent={{-30,32},{30,-32}}, lineColor={0,0,255}),Rectangle(extent={{-20,20},{20,0}}, lineColor={0,0,255}),Text(
          extent={{-28,-18},{28,-30}},
          lineColor={0,0,255},
          textStyle={TextStyle.Bold},
          textString="3-Phase V"),Line(
          points={{0,0},{10,10}},
          color={0,0,255},
          smooth=Smooth.None)}),
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
end Pw3PhaseVoltage;
