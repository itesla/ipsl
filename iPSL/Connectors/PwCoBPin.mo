within iPSL.Connectors;
model PwCoBPin
  "connector for change from machine power base to system power base "
  parameter Real mbase "machine base power rating MVA";
  parameter Real Sbase "system base power rating MVA";
  parameter Real CoB = mbase / Sbase "change of base ratio";
  iPSL.Connectors.PwPin p "machine base" annotation (Placement(transformation(
          extent={{-32,-4},{-12,16}}), iconTransformation(extent={{-32,-4},{-12,
            16}})));
  iPSL.Connectors.PwPin n "system base" annotation (Placement(transformation(
          extent={{8,-4},{28,16}}), iconTransformation(extent={{8,-4},{28,16}})));
equation
  0 = n.vr - p.vr;
  // real part of the voltage
  0 = n.vi - p.vi;
  // imaginary part of the voltage
  0 = p.ir * CoB + n.ir;
  // real part of the current
  0 = p.ii * CoB + n.ii;
  // imaginary part of the current
  annotation(Icon(graphics={  Rectangle(extent=  {{-100, 98}, {100, -102}}, lineColor=  {0, 0, 255}, fillColor=  {0, 0, 255},
            fillPattern=                                                                                                    FillPattern.None)}), Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics),
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
end PwCoBPin;
