within iPSL.Electrical.Branches;
model PwLine "Model for a transmission Line based on the pi-equivalent circuit.
              2013"

  iPSL.Connectors.PwPin p annotation (Placement(transformation(extent={{-80,-10},
            {-60,10}}), iconTransformation(extent={{-80,-10},{-60,10}})));
  iPSL.Connectors.PwPin n annotation (Placement(transformation(extent={{60,-10},
            {80,10}}), iconTransformation(extent={{60,-10},{80,10}})));
  parameter Real R "Resistance p.u.";
  parameter Real X "Reactance p.u.";
  parameter Real G "Shunt half conductance p.u.";
  parameter Real B "Shunt half susceptance p.u.";
  parameter Real S_b = 100 "System base power (MVA)";
  Real P12;
  Real P21;
  Real Q12;
  Real Q21;
equation
  P12 = (p.vr*p.ir-p.vi*p.ii)*S_b;
  P21 = -(n.vr*n.ir-n.vi*n.ii)*S_b;
  Q12 = (p.vr*p.ii-p.vi*p.ir)*S_b;
  Q21 = -(n.vr*n.ii-n.vi*n.ir)*S_b;
  R * (n.ir - G * n.vr + B * n.vi) - X * (n.ii - B * n.vr - G * n.vi) = n.vr - p.vr;
  R * (n.ii - B * n.vr - G * n.vi) + X * (n.ir - G * n.vr + B * n.vi) = n.vi - p.vi;
  R * (p.ir - G * p.vr + B * p.vi) - X * (p.ii - B * p.vr - G * p.vi) = p.vr - n.vr;
  R * (p.ii - B * p.vr - G * p.vi) + X * (p.ir - G * p.vr + B * p.vi) = p.vi - n.vi;
   annotation(Icon(graphics={  Rectangle(extent = {{-60, 40}, {60, -42}}, lineColor = {0, 0, 255}), Rectangle(extent = {{-40, 10}, {40, -10}}, lineColor = {0, 0, 255}, fillColor = {95, 95, 95},
            fillPattern =                                                                                                   FillPattern.Solid),
        Text(
          extent={{-106,82},{-18,36}},
          lineColor={238,46,47},
          textString=DynamicSelect("0.0", String(P12, significantDigits=2))),
        Text(
          extent={{24,82},{112,36}},
          lineColor={238,46,47},
          textString=DynamicSelect("0.0", String(P21, significantDigits=2))),
        Text(
          extent={{20,-54},{108,-100}},
          lineColor={0,255,0},
          textString=DynamicSelect("0.0", String(Q21, significantDigits=2))),
        Text(
          extent={{-108,-54},{-20,-100}},
          lineColor={0,255,0},
          textString=DynamicSelect("0.0", String(Q12, significantDigits=2))),
        Line(points={{-86,86},{-38,86},{-46,92}}, color={0,0,0}),
        Line(points={{-38,86},{-46,80}}, color={0,0,0}),
        Line(points={{42,86},{90,86},{82,92}}, color={0,0,0}),
        Line(points={{90,86},{82,80}}, color={0,0,0}),
        Line(points={{-88,-54},{-40,-54},{-48,-48}}, color={0,0,0}),
        Line(points={{-80,-48},{-80,-60}}, color={0,0,0}),
        Line(points={{-40,-54},{-48,-60}}, color={0,0,0}),
        Line(points={{48,-48},{48,-60}}, color={0,0,0}),
        Line(points={{40,-54},{88,-54},{80,-48}}, color={0,0,0}),
        Line(points={{88,-54},{80,-60}},   color={0,0,0})}),                                                                                   Diagram(graphics),
    uses(Modelica(version="3.2.1")),
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
end PwLine;
