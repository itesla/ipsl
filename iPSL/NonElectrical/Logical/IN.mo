within iPSL.NonElectrical.Logical;
class IN "Quotient block.
              2014/03/10"

  Modelica.Blocks.Interfaces.RealInput IFD annotation (Placement(transformation(
          extent={{-61,-36},{-41,-16}}),
                                       iconTransformation(extent={{-61,-36},
            {-41,-16}})));
  Modelica.Blocks.Interfaces.RealOutput I_N
                                          annotation (Placement(transformation(
          extent={{39,-10},{59,10}}), iconTransformation(extent={{39,-10},{59,10}})));
  Modelica.Blocks.Interfaces.RealInput VE(start = nStartValue) annotation(Placement(transformation(extent={{39,-12},
            {59,8}}),                                                                                                    iconTransformation(extent={{-61,14},
            {-41,34}})));
  parameter Real KC;
  parameter Real nStartValue = 0 "Output start value";
equation
  if VE > 0 or VE < 0 then
    I_N = IFD * KC / VE;
  else
    I_N = 1000000;
  end if;
  annotation(Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},
            {100,100}}),
                  graphics={  Rectangle(extent=  {{-40, 40}, {40, -40}}, lineColor=  {0, 0, 255}), Line(points={{
              -22,0},{22,0}},                                                                                                    color=  {0, 0, 255}, smooth=  Smooth.None, thickness=  1,
          origin={0,2},
          rotation=90),
        Text(
          extent={{-33,35},{33,-35}},
          lineColor={0,0,255},
          textString="KC_IFD
  VE",    origin={-1,-3},
          rotation=270)}),                                                                                                    Diagram(
        coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,100}}),                                                                      graphics),
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
end IN;
