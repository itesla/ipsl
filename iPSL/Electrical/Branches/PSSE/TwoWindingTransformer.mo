within iPSL.Electrical.Branches.PSSE;
model TwoWindingTransformer "Static Two-winding transformer according to PSS/E, without phase shift"
  iPSL.Connectors.PwPin p annotation (Placement(transformation(extent={{-80,-8},{-60,12}}), iconTransformation(extent={{-80,-8},{-60,12}})));
  iPSL.Connectors.PwPin n annotation (Placement(transformation(extent={{60,-8},{80,12}}), iconTransformation(extent={{60,-8},{80,12}})));
  parameter Real R "Resistance p.u.";
  parameter Real X "Reactance p.u.";
  parameter Real G "Shunt conductance p.u.";
  parameter Real B "Shunt susceptance p.u.";
  parameter Real t1 "Primary winding tap ratio";
  parameter Real t2 "Secondary winding tap ratio";
  parameter Boolean PrimaryOnFromSide "Is the primary winding on the From-side?";
protected
  parameter Real t=if PrimaryOnFromSide then t1/t2 else t2/t1;
  parameter Real x=if t1 >= t2 then t2 else t1;
  parameter Real Req=R*x*x;
  parameter Real Xeq=X*x*x;
equation
  p.ir = 1/(Req*Req + Xeq*Xeq)*(Req*(t*t*p.vr - t*n.vr) + Xeq*(t*t*p.vi - t*n.vi));
  p.ii = 1/(Req*Req + Xeq*Xeq)*(Req*(t*t*p.vi - t*n.vi) - Xeq*(t*t*p.vr - t*n.vr));
  n.ir = (-1/t*(1/(Req*Req + Xeq*Xeq)*(Req*(t*t*p.vr - t*n.vr) + Xeq*(t*t*p.vi - t*n.vi)))) + G*n.vr - B*n.vi;
  n.ii = (-1/t*(1/(Req*Req + Xeq*Xeq)*(Req*(t*t*p.vi - t*n.vi) - Xeq*(t*t*p.vr - t*n.vr)))) + G*n.vi + B*n.vr;
  annotation (
    Icon(graphics={
        Rectangle(extent={{-60,40},{60,-40}}, lineColor={0,0,255}),
        Ellipse(
          extent={{-26,16},{6,-16}},
          lineColor={0,0,255},
          lineThickness=1),
        Ellipse(
          extent={{-8,16},{24,-16}},
          lineColor={0,0,255},
          lineThickness=1),
        Line(
          points={{-42,0},{-26,0}},
          color={0,0,255},
          thickness=1,
          smooth=Smooth.None),
        Line(
          points={{24,0},{40,0}},
          color={0,0,255},
          thickness=1,
          smooth=Smooth.None)}),
    Diagram(graphics),
    Documentation(info="<html>
<p><br><span style=\"font-family: MS Shell Dlg 2;\">&LT;iPSL: iTesla Power System Library&GT;</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Copyright 2015 RTE (France), AIA (Spain), KTH (Sweden) and DTU (Denmark)</span></p>
<ul>
<li><span style=\"font-family: MS Shell Dlg 2;\">RTE: http://www.rte-france.com/ </span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">AIA: http://www.aia.es/en/energy/</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">KTH: https://www.kth.se/en</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">DTU:http://www.dtu.dk/english</span></li>
</ul>
<p><span style=\"font-family: MS Shell Dlg 2;\">The authors can be contacted by email: info at itesla-ipsl dot org</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">This package is part of the iTesla Power System Library (&QUOT;iPSL&QUOT;) .</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is free software: you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">You should have received a copy of the GNU Lesser General Public License along with the iPSL. If not, see &LT;http://www.gnu.org/licenses/&GT;.</span></p>
</html>"));
end TwoWindingTransformer;

