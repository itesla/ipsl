within iPSL.Electrical.Branches;
model PwLinewithOpeningSending "Transmission Line based on the pi-equivalent circuit
              with an opening event on the sending node.
              2014/03/10"

  iPSL.Connectors.PwPin p annotation (Placement(transformation(extent={{-80,-10},
            {-60,10}}), iconTransformation(extent={{-80,-10},{-60,10}})));
  iPSL.Connectors.PwPin n annotation (Placement(transformation(extent={{60,-10},
            {80,10}}), iconTransformation(extent={{60,-10},{80,10}})));
  parameter Real R "Resistance p.u.";
  parameter Real X "Reactance p.u.";
  parameter Real G "Shunt half conductance p.u.";
  parameter Real B "Shunt half susceptance p.u.";
  parameter Real t1 "Start time of the opening";
  parameter Real t2 "End time of the opening";
  Real Zr;
  Real Zi;
equation
  Zr = R * G + X * B;
  Zi = R * B + X * G;
  if time > t1 then
    if time < t2 then
      n.vr * (2.0 * G + G * Zr - B * Zi) - n.vi * (2.0 * B + Zr * B + Zi * G) = n.ir * (1.0 + Zr) - n.ii * Zi;
      n.vr * (2.0 * B + Zr * B + Zi * G) + n.vi * (2.0 * G + G * Zr - B * Zi) = n.ir * Zi + n.ii * (1.0 + Zr);
      p.ii = 0.0;
      p.ir = 0.0;
    else
      R * (n.ir - G * n.vr + B * n.vi) - X * (n.ii - B * n.vr - G * n.vi) = n.vr - p.vr;
      R * (n.ii - B * n.vr - G * n.vi) + X * (n.ir - G * n.vr + B * n.vi) = n.vi - p.vi;
      R * (p.ir - G * p.vr + B * p.vi) - X * (p.ii - B * p.vr - G * p.vi) = p.vr - n.vr;
      R * (p.ii - B * p.vr - G * p.vi) + X * (p.ir - G * p.vr + B * p.vi) = p.vi - n.vi;
    end if;
  else
    R * (n.ir - G * n.vr + B * n.vi) - X * (n.ii - B * n.vr - G * n.vi) = n.vr - p.vr;
    R * (n.ii - B * n.vr - G * n.vi) + X * (n.ir - G * n.vr + B * n.vi) = n.vi - p.vi;
    R * (p.ir - G * p.vr + B * p.vi) - X * (p.ii - B * p.vr - G * p.vi) = p.vr - n.vr;
    R * (p.ii - B * p.vr - G * p.vi) + X * (p.ir - G * p.vr + B * p.vi) = p.vi - n.vi;
  end if;
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
end PwLinewithOpeningSending;
