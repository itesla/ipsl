within iPSL.NonElectrical.Logical;
model LV_GATE

  Modelica.Blocks.Interfaces.RealInput n1
    annotation (Placement(transformation(extent={{-86,-2},{-46,38}}),
        iconTransformation(extent={{-80,8},{-60,28}})));
  Modelica.Blocks.Interfaces.RealOutput p
    annotation (Placement(transformation(extent={{48,-18},{68,2}}),
        iconTransformation(extent={{46,-18},{72,8}})));
  Modelica.Blocks.Interfaces.RealInput n2
    annotation (Placement(transformation(extent={{-86,-50},{-46,-10}}),
        iconTransformation(extent={{-80,-36},{-60,-16}})));
equation
  p = if (n1 > n2)  then n2
 else
     n1;
  annotation (Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,
            -100},{100,100}}), graphics), Icon(coordinateSystem(
          preserveAspectRatio=true, extent={{-100,-100},{100,100}}), graphics={
          Polygon(
          points={{-60,30},{-60,-40},{6,-40},{70,-6},{6,30},{-60,30}},
          lineColor={0,0,255},
          smooth=Smooth.None), Text(
          extent={{-44,6},{18,-22}},
          lineColor={0,0,255},
          textString="LV
Gate")}),
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
end LV_GATE;
