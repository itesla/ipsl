within iPSL.Electrical.Machines.DTU;
model PwVoltageSource "Developed by DTU"
  parameter Real R(start=0.01) "Resistance";
  parameter Real X(start=0.01) "Reactance";
  Modelica.Blocks.Interfaces.RealInput Vre_ref annotation (Placement(transformation(extent={{-72,33},{-60,47}}), iconTransformation(extent={{-72,33},{-60,47}})));
  Modelica.Blocks.Interfaces.RealInput Vim_ref annotation (Placement(transformation(extent={{-72,-47},{-60,-33}}), iconTransformation(extent={{-72,-47},{-60,-33}})));
  iPSL.Connectors.PwPin n annotation (Placement(transformation(extent={{60,-6},{74,8}})));
equation
  Vre_ref = n.vr + R*n.ir - X*n.ii;
  Vim_ref = n.vi + R*n.ii + X*n.ir;
  annotation (
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics={
        Rectangle(extent={{-60,60},{60,-60}}, lineColor={0,0,255}),
        Ellipse(
          extent={{-22,22},{22,-20}},
          lineColor={0,0,255},
          lineThickness=0.5),
        Line(
          points={{0,38},{0,22}},
          color={0,0,255},
          thickness=0.5,
          smooth=Smooth.None),
        Text(
          extent={{-56,48},{-36,32}},
          lineColor={0,0,255},
          lineThickness=1,
          fillColor={0,0,255},
          fillPattern=FillPattern.Solid,
          textString="Vre_ref"),
        Text(
          extent={{-56,-32},{-36,-48}},
          lineColor={0,0,255},
          lineThickness=1,
          fillColor={0,0,255},
          fillPattern=FillPattern.Solid,
          textString="Vim_ref"),
        Line(
          points={{0,-20},{0,-36}},
          color={0,0,255},
          thickness=0.5,
          smooth=Smooth.None),
        Line(
          points={{-4,14},{4,14}},
          color={0,0,255},
          smooth=Smooth.None,
          thickness=0.5),
        Line(
          points={{0,18},{0,10}},
          color={0,0,255},
          smooth=Smooth.None,
          thickness=0.5),
        Line(
          points={{-4,-12},{4,-12}},
          color={0,0,255},
          smooth=Smooth.None,
          thickness=0.5)}),
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics),
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
end PwVoltageSource;

