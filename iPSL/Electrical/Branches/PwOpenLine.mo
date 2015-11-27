within iPSL.Electrical.Branches;
class PwOpenLine "Transmission Line based on the pi-equivalent circuit
             open at the Receiving/Sending end. 2014/04/28"

  iPSL.Connectors.PwPin p annotation (Placement(transformation(extent={{-80,-10},
            {-60,10}}), iconTransformation(extent={{-80,-10},{-60,10}})));
  iPSL.Connectors.PwPin n annotation (Placement(transformation(extent={{60,-10},
            {80,10}}), iconTransformation(extent={{60,-10},{80,10}})));
  parameter Real R "Resistance p.u.";
  parameter Real X "Reactance p.u.";
  parameter Real G "Shunt half conductance p.u.";
  parameter Real B "Shunt half susceptance p.u.";
  parameter Boolean OpenR_end
    "Open at Receiving end (true), Open at Sending end (false)";
  Real Zr;
  Real Zi;
equation
  Zr = R * G - X * B;
  Zi = R * B + X * G;
  if OpenR_end == true then
    p.vr * (2.0 * G + G * Zr - B * Zi) - p.vi * (2.0 * B + Zr * B + Zi * G) = p.ir * (1.0 + Zr) - p.ii * Zi;
    p.vr * (2.0 * B + Zr * B + Zi * G) + p.vi * (2.0 * G + G * Zr - B * Zi) = p.ir * Zi + p.ii * (1.0 + Zr);
    n.vr - p.vr * (1.0 + Zr) + p.vi * Zi = (-p.ir * R) + p.ii * X;
    n.vi - p.vi * (1.0 + Zr) - p.vr * Zi = (-p.ir * X) - p.ii * R;
  else
    n.vr * (2.0 * G + G * Zr - B * Zi) - n.vi * (2.0 * B + Zr * B + Zi * G) = n.ir * (1.0 + Zr) - n.ii * Zi;
    n.vr * (2.0 * B + Zr * B + Zi * G) + n.vi * (2.0 * G + G * Zr - B * Zi) = n.ir * Zi + n.ii * (1.0 + Zr);
    p.vr - n.vr * (1.0 + Zr) + n.vi * Zi = (-n.ir * R) + n.ii * X;
    p.vi - n.vi * (1.0 + Zr) - n.vr * Zi = (-n.ir * X) - n.ii * R;
  end if;
  // Open at Receiving node
  // Open at Sending node
  annotation(Icon(graphics={  Rectangle(extent = {{-60, 40}, {60, -42}}, lineColor = {0, 0, 255}), Rectangle(extent = {{-40, 10}, {40, -10}}, lineColor = {0, 0, 255}, fillColor = {95, 95, 95},
            fillPattern =                                                                                                   FillPattern.Solid), Line(points = {{-38, 16}, {4, 16}, {24, 30}}, color = {0, 0, 255}, smooth = Smooth.None), Line(points = {{34, 18}, {40, 18}}, color = {0, 0, 255}, smooth = Smooth.None), Ellipse(extent = {{28, 22}, {34, 16}}, lineColor = {0, 0, 255})}), Diagram(graphics),
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
end PwOpenLine;
