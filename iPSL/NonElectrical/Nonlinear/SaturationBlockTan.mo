within iPSL.NonElectrical.Nonlinear;


model SaturationBlockTan "Block 1 in the OEL to decide the input signal of MIN Gate"
  parameter Real r "Exiciter parameter";
  parameter Real f "Exiciter parameter";
  Modelica.Blocks.Interfaces.RealInput p1 annotation (Placement(transformation(extent={{-86,-10},{-66,10}}), iconTransformation(extent={{-80,-10},{-60,10}})));
  Modelica.Blocks.Interfaces.RealOutput n1 annotation (Placement(transformation(extent={{46,-10},{66,10}}), iconTransformation(extent={{60,-6},{72,6}})));
equation
  if p1 <= (-0.1) then
    n1 = -1;
  elseif p1 > (-0.1) and p1 < 0 then
    n1 = 0;
  else
    n1 = tan(r)*p1 + f;
  end if;
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-60,-60},{60,60}}), graphics),
    Icon(coordinateSystem(preserveAspectRatio=true, extent={{-60,-60},{60,60}}), graphics={
        Rectangle(
          extent={{-60,60},{60,-60}},
          lineColor={0,0,255},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Line(
          points={{-42,0},{36,0},{38,0},{40,0}},
          color={0,0,255},
          thickness=0.5,
          smooth=Smooth.None,
          arrow={Arrow.None,Arrow.Open}),
        Line(
          points={{0,-30},{0,36}},
          color={0,0,255},
          thickness=0.5,
          smooth=Smooth.None,
          arrow={Arrow.None,Arrow.Open}),
        Line(
          points={{0,12},{34,12}},
          color={0,0,255},
          smooth=Smooth.None),
        Text(
          extent={{22,22},{38,12}},
          lineColor={0,0,0},
          fillColor={0,0,255},
          fillPattern=FillPattern.Solid,
          textStyle={TextStyle.Italic},
          textString="r"),
        Text(
          extent={{-12,16},{4,6}},
          lineColor={0,0,0},
          fillColor={0,0,255},
          fillPattern=FillPattern.Solid,
          textString="f",
          textStyle={TextStyle.Italic}),
        Text(
          extent={{-2,0},{12,-8}},
          lineColor={0,0,0},
          fillColor={0,0,255},
          fillPattern=FillPattern.Solid,
          textString="0"),
        Text(
          extent={{-26,8},{-12,0}},
          lineColor={0,0,0},
          fillColor={0,0,255},
          fillPattern=FillPattern.Solid,
          textString="-0.1"),
        Line(
          points={{-20,-20},{-2,-20},{0,-20}},
          color={0,0,255},
          pattern=LinePattern.Dot,
          smooth=Smooth.None),
        Text(
          extent={{-2,-16},{12,-24}},
          lineColor={0,0,0},
          fillColor={0,0,255},
          fillPattern=FillPattern.Solid,
          textString="-1"),
        Line(
          points={{-34,-20},{-20,-20},{-20,0},{0,0},{0,12},{32,22}},
          color={0,0,0},
          thickness=0.5,
          smooth=Smooth.None)}),
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
end SaturationBlockTan;
