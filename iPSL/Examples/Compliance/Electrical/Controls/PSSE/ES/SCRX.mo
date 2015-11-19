within iPSL.Examples.Compliance.Electrical.Controls.PSSE.ES;
model SCRX "SMIB system with one load and GENROE model"
  import iPSL;

  Modelica.Blocks.Sources.Constant ZERO(k=0)
    annotation (Placement(transformation(extent={{70,-60},{60,-50}})));
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
  iPSL.Electrical.Controls.PSSE.ES.SCRX.SCRX sCRX(
    T_AT_B=0.1,
    T_B=10,
    K=100,
    T_E=0.05,
    E_MIN=0,
    E_MAX=10,
    C_SWITCH=0,
    r_cr_fd=1,
    V_c0=1,
    V_0=1) annotation (Placement(transformation(extent={{20,-20},{-26,18}})));
equation
  connect(add.u2, step1.y) annotation (Line(points={{60.6,-14.8},{64,-14.8},{64,
          -25},{69.5,-25}}, color={0,0,127}));
  connect(add.u1, step.y) annotation (Line(points={{60.6,-11.2},{64,-11.2},{64,
          -5},{69.5,-5}}, color={0,0,127}));
  connect(sCRX.ECOMP, add.y) annotation (Line(points={{19.8083,15.53},{44,15.53},
          {44,-13},{53.7,-13}}, color={0,0,127}));
  connect(sCRX.EFD0, EFD0.y) annotation (Line(points={{19.8083,-16.39},{30,
          -16.39},{30,29},{59.5,29}}, color={0,0,127}));
  connect(sCRX.XADIFD, XADIFD.y) annotation (Line(points={{20.1917,-3.47},{54,
          -3.47},{54,11},{59.5,11}}, color={0,0,127}));
  connect(ZERO.y, sCRX.VOTHSG) annotation (Line(points={{59.5,-55},{34,-55},{34,
          10.21},{19.8083,10.21}}, color={0,0,127}));
  connect(sCRX.VOEL, sCRX.VOTHSG) annotation (Line(points={{19.8083,5.65},{34,
          5.65},{34,10.21},{19.8083,10.21}}, color={0,0,127}));
  connect(sCRX.VUEL, sCRX.VOTHSG) annotation (Line(points={{19.8083,0.71},{34,
          0.71},{34,10.21},{19.8083,10.21}}, color={0,0,127}));
  connect(sCRX.ETERM, add.y) annotation (Line(points={{20.1917,-9.74},{44,-9.74},
          {44,-13},{53.7,-13}}, color={0,0,127}));
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
end SCRX;
