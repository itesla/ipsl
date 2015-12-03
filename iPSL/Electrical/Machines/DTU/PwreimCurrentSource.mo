within iPSL.Electrical.Machines.DTU;


model PwreimCurrentSource "Developed by DTU"
  iPSL.Connectors.PwPin n annotation (Placement(transformation(extent={{60,-6},{72,6}}), iconTransformation(extent={{60,-6},{72,6}})));
  Modelica.Blocks.Interfaces.RealInput id_ref annotation (Placement(transformation(extent={{-73,33},{-61,47}})));
  Modelica.Blocks.Interfaces.RealInput iq_ref annotation (Placement(transformation(extent={{-73,-47},{-61,-33}})));
equation
  n.ir = id_ref;
  n.ii = iq_ref;
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics),
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics={
        Rectangle(extent={{-60,60},{60,-60}}, lineColor={0,0,255}),
        Ellipse(
          extent={{-22,22},{22,-20}},
          lineColor={0,0,255},
          lineThickness=0.5),
        Polygon(
          points={{0,22},{-2,16},{2,16},{0,22}},
          lineColor={0,0,255},
          lineThickness=0.5,
          smooth=Smooth.None,
          fillPattern=FillPattern.Solid,
          fillColor={0,0,255}),
        Line(
          points={{0,38},{0,-42}},
          color={0,0,255},
          thickness=0.5,
          smooth=Smooth.None),
        Text(
          extent={{-56,48},{-36,32}},
          lineColor={0,0,255},
          lineThickness=1,
          fillColor={0,0,255},
          fillPattern=FillPattern.Solid,
          textString="Ire_ref"),
        Text(
          extent={{-56,-30},{-36,-48}},
          lineColor={0,0,255},
          lineThickness=1,
          fillColor={0,0,255},
          fillPattern=FillPattern.Solid,
          textString="Iim_ref")}),
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
end PwreimCurrentSource;
