within iPSL.NonElectrical.Logical;
model NegCurLogic
  Modelica.Blocks.Interfaces.RealInput Vd(start=nstartvalue) annotation (
      Placement(transformation(extent={{-76,10},{-56,30}}), iconTransformation(
          extent={{-80,10},{-60,30}})));
  Modelica.Blocks.Interfaces.RealOutput Efd(start=nstartvalue) annotation (
      Placement(transformation(extent={{62,-24},{82,-4}}), iconTransformation(
          extent={{60,-10},{80,10}})));
  Modelica.Blocks.Interfaces.RealInput XadIfd(start=nstartvalue) annotation (
      Placement(transformation(extent={{-76,-46},{-56,-26}}),
        iconTransformation(extent={{-80,-30},{-60,-10}})));
  parameter Real RC_rfd;
  parameter Real nstartvalue;
  Real Crowbar_V;
equation
  Efd = if XadIfd < 0 then Crowbar_V else Vd;
  Crowbar_V = if RC_rfd == 0 then 0 else (-1)*RC_rfd*XadIfd;
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-60,-40},{60,40}}),
        graphics),
    Icon(coordinateSystem(preserveAspectRatio=true, extent={{-60,-40},{60,40}}),
        graphics={Rectangle(
          extent={{-60,40},{60,-40}},
          lineColor={0,0,255},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),Text(
          extent={{-52,46},{54,-42}},
          lineColor={0,0,255},
          textString="Negative Current Logic")}),
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
end NegCurLogic;

