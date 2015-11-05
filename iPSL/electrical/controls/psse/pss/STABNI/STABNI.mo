within iPSL.Electrical.Controls.PSSE.PSS.STABNI;
model STABNI
  parameter Real K ">= 0";
  parameter Real T_1 ">0 (s)";
  parameter Real T_2 ">=0 (S)";
  parameter Real T_0 ">0 (s)";
  parameter Real LIMIT "+- (pu)";
protected
  parameter Real PELEC0(fixed=false);

public
  Modelica.Blocks.Interfaces.RealInput PELEC annotation (Placement(
        transformation(extent={{-148,-20},{-108,20}}), iconTransformation(
          extent={{-148,-20},{-108,20}})));
  Modelica.Blocks.Interfaces.RealOutput VOTHSG annotation (Placement(
        transformation(extent={{120,-10},{140,10}}), iconTransformation(extent={
            {120,-10},{140,10}})));
protected
  NonElectrical.Continuous.ImSimpleLag imSimpleLag(
    K=K,
    T=T_2,
    nStartValue=K*PELEC0)
    annotation (Placement(transformation(extent={{-118,-24},{-70,24}})));
  NonElectrical.Continuous.ImLeadLag imLeadLag(
    K=1,
    T1=T_1,
    T2=T_0,
    nStartValue=0)
    annotation (Placement(transformation(extent={{-14,-24},{34,24}})));
  NonElectrical.Continuous.ImDerivativeLag imDerivativeLag(
    T=T_0,
    K=T_0,
    pStartValue=0)
    annotation (Placement(transformation(extent={{-80,-24},{-30,24}})));
  NonElectrical.Continuous.ImDerivativeLag imDerivativeLag1(
    T=T_0,
    K=T_0,
    pStartValue=0)
    annotation (Placement(transformation(extent={{-46,-24},{2,24}})));
  NonElectrical.Continuous.ImSimpleLag imSimpleLag1(
    K=1,
    T=T_0,
    nStartValue=0)
    annotation (Placement(transformation(extent={{14,-22},{64,22}})));
  NonElectrical.Continuous.ImLimited imLimited(Ymin=-LIMIT, Ymax=LIMIT)
    annotation (Placement(transformation(extent={{56,-22},{98,22}})));
  Modelica.Blocks.Math.Gain gain(k=-1)
    annotation (Placement(transformation(extent={{96,-10},{116,10}})));
initial equation
  PELEC0 = PELEC;

equation
  connect(PELEC, imSimpleLag.p1)
    annotation (Line(points={{-128,0},{-101.44,0}}, color={0,0,127}));
  connect(imDerivativeLag1.n1, imLeadLag.p1) annotation (Line(points={{2.24,0},
          {2.24,0},{-2.24,0}},   color={0,0,127}));
  connect(imSimpleLag.n1, imDerivativeLag.p1) annotation (Line(points={{-77.2,0},
          {-77.2,0},{-79.75,0}},  color={0,0,127}));
  connect(imDerivativeLag.n1, imDerivativeLag1.p1)
    annotation (Line(points={{-29.75,0},{-45.76,0}}, color={0,0,127}));
  connect(imLeadLag.n1, imSimpleLag1.p1)
    annotation (Line(points={{21.76,0},{31.25,0}}, color={0,0,127}));
  connect(imSimpleLag1.n1, imLimited.p1)
    annotation (Line(points={{56.5,0},{56.5,0},{66.29,0}},   color={0,0,127}));
  connect(VOTHSG, gain.y)
    annotation (Line(points={{130,0},{124,0},{117,0}}, color={0,0,127}));
  connect(imLimited.n1, gain.u)
    annotation (Line(points={{87.29,0},{90,0},{94,0}}, color={0,0,127}));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false,extent={{-120,
            -40},{120,40}})), Icon(coordinateSystem(extent={{-120,-40},
            {120,40}},
                  preserveAspectRatio=false),graphics={
        Rectangle(extent={{-120,40},{120,-40}}, lineColor={28,108,200}),
        Text(
          extent={{-64,20},{56,-20}},
          lineColor={28,108,200},
          textString="STABNI"),
        Text(
          extent={{-108,8},{-72,-10}},
          lineColor={28,108,200},
          textString="PELEC"),
        Text(
          extent={{82,10},{118,-8}},
          lineColor={28,108,200},
          textString="VOTHSG")}),
    Documentation(info="<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\">
<tr>
<td><p>Reference</p></td>
<td></td>
STABNI, PSSE Manual
</tr>
<tr>
<td><p>Last update</p></td>
<td></td>
2015-08-03
</tr>
<tr>
<td><p>Author</p></td>
<td><p>Tin Rabuzin, SmarTS Lab, KTH Royal Institute of Technology</p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p><a href=\"mailto:luigiv@kth.se\">luigiv@kth.se</a></p></td>
</tr>
</table>
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
end STABNI;
