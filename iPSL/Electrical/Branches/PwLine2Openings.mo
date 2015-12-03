within iPSL.Electrical.Branches;
model PwLine2Openings "Transmission Line based on the pi-equivalent circuit with an opening event on both sending and receiving end nodes"
  iPSL.Connectors.PwPin p annotation (Placement(transformation(extent={{-76,-10},{-56,10}}), iconTransformation(extent={{-80,-10},{-60,10}})));
  iPSL.Connectors.PwPin n annotation (Placement(transformation(extent={{56,-10},{76,10}}), iconTransformation(extent={{60,-10},{80,10}})));
  parameter Real R "Resistance";
  parameter Real X "Reactance";
  parameter Real G "Shunt half conductance";
  parameter Real B "Shunt half susceptance";
  parameter Real t1 "Start time of the opening";
  parameter Real t2 "End time of the opening";
  parameter Real S_b=100 "System base power (MVA)";
  Real Zr;
  Real Zi;
  Real P12;
  Real P21;
  Real Q12;
  Real Q21;
equation
  P12 = (p.vr*p.ir - p.vi*p.ii)*S_b;
  P21 = -(n.vr*n.ir - n.vi*n.ii)*S_b;
  Q12 = (p.vr*p.ii - p.vi*p.ir)*S_b;
  Q21 = -(n.vr*n.ii - n.vi*n.ir)*S_b;
  Zr = R*G + X*B;
  Zi = R*B + X*G;
  if time >= t1 then
    if time < t2 then
      p.ir = 0;
      p.ii = 0;
      n.ii = 0.0;
      n.ir = 0.0;
    else
      R*(n.ir - G*n.vr + B*n.vi) - X*(n.ii - B*n.vr - G*n.vi) = n.vr - p.vr;
      R*(n.ii - B*n.vr - G*n.vi) + X*(n.ir - G*n.vr + B*n.vi) = n.vi - p.vi;
      R*(p.ir - G*p.vr + B*p.vi) - X*(p.ii - B*p.vr - G*p.vi) = p.vr - n.vr;
      R*(p.ii - B*p.vr - G*p.vi) + X*(p.ir - G*p.vr + B*p.vi) = p.vi - n.vi;
    end if;
  else
    R*(n.ir - G*n.vr + B*n.vi) - X*(n.ii - B*n.vr - G*n.vi) = n.vr - p.vr;
    R*(n.ii - B*n.vr - G*n.vi) + X*(n.ir - G*n.vr + B*n.vi) = n.vi - p.vi;
    R*(p.ir - G*p.vr + B*p.vi) - X*(p.ii - B*p.vr - G*p.vi) = p.vr - n.vr;
    R*(p.ii - B*p.vr - G*p.vi) + X*(p.ir - G*p.vr + B*p.vi) = p.vi - n.vi;
  end if;
  annotation (
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics={Rectangle(extent={{-60,40},{60,-42}}, lineColor={0,0,255}),Rectangle(
          extent={{-40,10},{40,-10}},
          lineColor={0,0,255},
          fillColor={95,95,95},
          fillPattern=FillPattern.Solid),Line(
          points={{-38,16},{4,16},{24,30}},
          color={0,0,255},
          smooth=Smooth.None),Line(
          points={{34,18},{40,18}},
          color={0,0,255},
          smooth=Smooth.None),Ellipse(extent={{28,22},{34,16}}, lineColor={0,0,255}),Text(
          extent={{-108,86},{-20,40}},
          lineColor={238,46,47},
          textString=DynamicSelect("0.0", String(P12, significantDigits=2))),Text(
          extent={{22,86},{110,40}},
          lineColor={238,46,47},
          textString=DynamicSelect("0.0", String(P21, significantDigits=2))),Text(
          extent={{-108,-56},{-20,-102}},
          lineColor={0,255,0},
          textString=DynamicSelect("0.0", String(Q12, significantDigits=2))),Text(
          extent={{22,-56},{110,-102}},
          lineColor={0,255,0},
          textString=DynamicSelect("0.0", String(Q21, significantDigits=2))),Line(points={{-88,86},{-40,86},{-48,92}}, color={0,0,0}),Line(points={{-40,86},{-48,80}}, color={0,0,0}),Line(points={{-88,
          -54},{-40,-54},{-48,-48}}, color={0,0,0}),Line(points={{-40,-54},{-48,-60}}, color={0,0,0}),Line(points={{-80,-48},{-80,-60}}, color={0,0,0}),Line(points={{40,-54},{88,-54},{80,-48}}, color
          ={0,0,0}),Line(points={{88,-54},{80,-60}}, color={0,0,0}),Line(points={{48,-48},{48,-60}}, color={0,0,0}),Line(points={{40,86},{88,86},{80,92}}, color={0,0,0}),Line(points={{88,86},{80,80}},
          color={0,0,0})}),
    uses(PowerSystems(version="0.6"), Modelica(version="3.2.1")),
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
end PwLine2Openings;

