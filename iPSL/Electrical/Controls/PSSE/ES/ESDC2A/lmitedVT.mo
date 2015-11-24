within iPSL.Electrical.Controls.PSSE.ES.ESDC2A;
model lmitedVT "input dependent output"

  Modelica.Blocks.Interfaces.RealInput p1
           annotation (Placement(transformation(extent={{-54,26},{-41,40}}),
        iconTransformation(extent={{-54,26},{-41,40}})));
  Modelica.Blocks.Interfaces.RealInput p2
           annotation (Placement(transformation(extent={{-54,-2},{-41,12}}),
        iconTransformation(extent={{-54,-4},{-41,12}})));
  Modelica.Blocks.Interfaces.RealOutput n1
          annotation (Placement(transformation(extent={{39,6},{59,26}}),
        iconTransformation(extent={{39,6},{59,26}})));
parameter Real VRMAX "p.u";
parameter Real VRMIN "p.u";
equation
  n1 = if (p1 < VRMIN*p2)  then VRMIN*p2
 elseif
     (p1 > VRMAX*p2) then VRMAX*p2
 else
     p1;
  annotation (                               Icon(coordinateSystem(
          preserveAspectRatio=true, extent={{-100,-100},{100,100}}),
                                                  graphics={
        Rectangle(extent={{-40,40},{40,-10}}, lineColor={0,0,255}),
        Text(
          extent={{-40,8},{-14,-8}},
          lineColor={0,0,255},
          textString="VT"),
        Text(
          extent={{16,24},{42,8}},
          lineColor={0,0,255},
          textString="VR")}), Diagram(coordinateSystem(preserveAspectRatio=true,
          extent={{-100,-100},{100,100}}),
                                      graphics),
    Documentation(info="<html>
<p><br><span style=\"font-family: MS Shell Dlg 2;\">&LT;iPSL: iTesla Power System Library&GT;</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Copyright 2015 RTE (France), AIA (Spain), KTH (Sweden) and DTU (Denmark)</span></p>
<ul>
<li><span style=\"font-family: MS Shell Dlg 2;\">RTE: http://www.rte-france.com/ </span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">AIA: http://www.aia.es/en/energy/</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">KTH: https://www.kth.se/en</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">DTU:http://www.dtu.dk/english</span></li>
</ul>
<p><span style=\"font-family: MS Shell Dlg 2;\">The authors can be contacted by email: info at ipsl dot org</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">This package is part of the iTesla Power System Library (&QUOT;iPSL&QUOT;) .</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is free software: you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">You should have received a copy of the GNU Lesser General Public License along with the iPSL. If not, see &LT;http://www.gnu.org/licenses/&GT;.</span></p>
</html>"));
end lmitedVT;
