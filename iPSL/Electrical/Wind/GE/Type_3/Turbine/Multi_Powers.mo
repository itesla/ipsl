within iPSL.Electrical.Wind.GE.Type_3.Turbine;
block Multi_Powers "Multiplexer block for four input connectors"
  extends Modelica.Blocks.Interfaces.BlockIcon;
  Modelica.Blocks.Interfaces.RealInput u1 "Input" annotation (Placement(transformation(extent={{-140,70},{-100,110}}, rotation=0)));
  Modelica.Blocks.Interfaces.RealOutput y[5] "Multiple powers of the input" annotation (Placement(transformation(extent={{100,-10},{120,10}}, rotation=0)));
protected
  Real u2;
  Real u3;
  Real u4;
equation
  u2 = u1^2;
  u3 = u1^3;
  u4 = u1^4;
  [y] = [1; u1; u2; u3; u4];
  annotation (
    Documentation(info="<HTML>
<p>
The output connector is the <b>concatenation</b> of the four input connectors.
Note, that the dimensions of the input connector signals have to be
explicitly defined via parameters n1, n2, n3 and n4.
</p>
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
</HTML>
"),
    Icon(coordinateSystem(
        preserveAspectRatio=true,
        extent={{-100,-100},{100,100}},
        grid={1,1}), graphics={
        Line(points={{8,0},{102,0}}, color={0,0,127}),
        Line(points={{-100,90},{-60,90},{-3,4}}, color={0,0,127}),
        Line(points={{-100,30},{-60,30},{-9,0}}, color={0,0,127}),
        Line(points={{-99,-30},{-59,-30},{-10,-5}}, color={0,0,127}),
        Line(points={{-100,-90},{-60,-90},{-5,-6}}, color={0,0,127}),
        Ellipse(
          extent={{-15,15},{15,-15}},
          fillColor={0,0,127},
          fillPattern=FillPattern.Solid,
          lineColor={0,0,127})}),
    Diagram(coordinateSystem(
        preserveAspectRatio=true,
        extent={{-100,-100},{100,100}},
        grid={1,1}), graphics={
        Line(points={{-100,90},{-60,90},{-3,4}}, color={0,0,255}),
        Line(points={{-100,-90},{-60,-90},{-5,-6}}, color={0,0,255}),
        Line(points={{8,0},{102,0}}, color={0,0,255}),
        Ellipse(
          extent={{-15,15},{15,-15}},
          fillColor={0,0,255},
          fillPattern=FillPattern.Solid,
          lineColor={0,0,255}),
        Line(points={{-100,30},{-60,30},{-9,0}}, color={0,0,255}),
        Line(points={{-99,-30},{-59,-30},{-10,-5}}, color={0,0,255})}));
end Multi_Powers;

