within iPSL.Examples.Compliance.Electrical.Controls.PSSE.ES;
model EXAC2 "SMIB system with one load and GENROE model"

   iPSL.Electrical.Controls.PSSE.ES.EXAC2.EXAC2 eXAC2_1(
    K_B=2,
    V_RMAX=2,
    V_RMIN=2,
    K_L=2,
    K_H=2,
    V_LR=2)
    annotation (Placement(transformation(extent={{20,-20},{-66,20}})));
  Modelica.Blocks.Sources.Constant ZERO(k=0)
    annotation (Placement(transformation(extent={{70,-36},{60,-26}})));
  Modelica.Blocks.Sources.Constant XADIFD(k=1.3788)
    annotation (Placement(transformation(extent={{70,6},{60,16}})));
  Modelica.Blocks.Sources.Constant EFD0(k=1.43412)
    annotation (Placement(transformation(extent={{70,24},{60,34}})));
  Modelica.Blocks.Sources.Step step(
    height=0.05,
    offset=1,
    startTime=0.5)
    annotation (Placement(transformation(extent={{70,-16},{60,-6}})));
equation
  connect(EFD0.y, eXAC2_1.EFD0) annotation (Line(points={{59.5,29},{40,29},{40,
          15},{19.4625,15}}, color={0,0,127}));
  connect(XADIFD.y, eXAC2_1.XADIFD) annotation (Line(points={{59.5,11},{40,11},
          {40,10},{19.7312,10}}, color={0,0,127}));
  connect(ZERO.y, eXAC2_1.VUEL) annotation (Line(points={{59.5,-31},{46,-31},{
          46,-30},{32,-30},{32,-10},{19.4625,-10}}, color={0,0,127}));
  connect(eXAC2_1.VOTHSG, eXAC2_1.VUEL) annotation (Line(points={{19.4625,-5},{
          32,-5},{32,-10},{19.4625,-10}}, color={0,0,127}));
  connect(eXAC2_1.VOEL, eXAC2_1.VUEL) annotation (Line(points={{19.4625,-15},{
          32,-15},{32,-10},{19.4625,-10}}, color={0,0,127}));
  connect(eXAC2_1.ECOMP, step.y) annotation (Line(points={{19.4625,5},{40,5},{
          40,-11},{59.5,-11}}, color={0,0,127}));
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
end EXAC2;
