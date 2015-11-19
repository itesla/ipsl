within iPSL.Examples.Compliance.Electrical.Controls.PSSE.ES;
model SEXS "SMIB system with one load and GENROE model"
  import iPSL;

  Modelica.Blocks.Sources.Constant ZERO(k=0)
    annotation (Placement(transformation(extent={{80,-52},{70,-42}})));
  Modelica.Blocks.Sources.Constant XADIFD(k=1.36722)
    annotation (Placement(transformation(extent={{70,6},{60,16}})));
  Modelica.Blocks.Sources.Constant EFD0(k=1.36722)
    annotation (Placement(transformation(extent={{70,24},{60,34}})));
  Modelica.Blocks.Sources.Step step(
    height=0.05,
    offset=1,
    startTime=0.5)
    annotation (Placement(transformation(extent={{80,-10},{70,0}})));
  Modelica.Blocks.Sources.Step step1(
    height=-0.05,
    offset=0,
    startTime=0.7)
    annotation (Placement(transformation(extent={{80,-30},{70,-20}})));
  Modelica.Blocks.Math.Add add
    annotation (Placement(transformation(extent={{60,-16},{54,-10}})));
  iPSL.Electrical.Controls.PSSE.ES.SEXS.SEXS sEXS(
    Ec0=1,
    T_AT_B=0.1,
    T_B=10,
    K=100,
    T_E=0.05,
    E_MIN=10,
    E_MAX=-10)
    annotation (Placement(transformation(extent={{38,-30},{-44,20}})));
equation
  connect(add.u2, step1.y) annotation (Line(points={{60.6,-14.8},{64,-14.8},{64,
          -25},{69.5,-25}}, color={0,0,127}));
  connect(add.u1, step.y) annotation (Line(points={{60.6,-11.2},{64,-11.2},{64,
          -5},{69.5,-5}}, color={0,0,127}));
  connect(sEXS.ECOMP, add.y) annotation (Line(points={{20.0231,12.25},{46,12.25},
          {46,-13},{53.7,-13}}, color={0,0,127}));
  connect(sEXS.VOTHSG, ZERO.y) annotation (Line(points={{20.0231,7.25},{40,7.25},
          {40,-47},{69.5,-47}}, color={0,0,127}));
  connect(sEXS.EFD0, EFD0.y) annotation (Line(points={{20.0231,-12.75},{34,
          -12.75},{34,29},{59.5,29}}, color={0,0,127}));
  connect(sEXS.VOEL, ZERO.y) annotation (Line(points={{20.0231,2.75},{40,2.75},
          {40,-47},{69.5,-47}}, color={0,0,127}));
  connect(sEXS.VUEL, ZERO.y) annotation (Line(points={{20.0231,-2.25},{40,-2.25},
          {40,-47},{69.5,-47}}, color={0,0,127}));
  annotation(__ModelicaAssociation(TestCase(shouldPass=true)),Diagram(coordinateSystem(preserveAspectRatio=false,   extent={{-80,-40},
            {80,40}})),         Documentation(info="<html>
<p><span style=\"font-family: MS Shell Dlg 2;\">&LT;iPSL: iTesla Power System Library&GT;</span></p>
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
</html>"),
    Icon(coordinateSystem(extent={{-80,-40},{80,40}})));
end SEXS;
