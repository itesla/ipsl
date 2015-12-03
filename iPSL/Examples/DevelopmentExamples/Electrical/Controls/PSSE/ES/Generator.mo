within iPSL.Examples.DevelopmentExamples.Electrical.Controls.PSSE.ES;
model Generator
  iPSL.Electrical.Machines.PSSE.GENROU.GENROU generator(
    Xppd=0.2,
    Xppq=0.2,
    Xpp=0.2,
    Xl=0.12,
    V_0=1,
    V_b=100,
    M_b=100,
    Tpd0=5,
    Tppd0=0.05,
    Tppq0=0.1,
    H=4,
    D=0,
    Xd=1.41,
    Xq=1.35,
    Xpd=0.3,
    S10=0.1,
    S12=0.5,
    Xpq=0.6,
    Tpq0=0.7,
    angle_0=4.046276,
    P_0=40,
    Q_0=5.416582) annotation (Placement(transformation(extent={{-60,0},{20,80}})));
  Modelica.Blocks.Sources.Constant const5(k=0) annotation (Placement(transformation(
        extent={{5,-5},{-5,5}},
        rotation=0,
        origin={65,-60})));
  iPSL.Electrical.Controls.PSSE.ES.EXST1.EXST1 exst1 annotation (Placement(transformation(
        extent={{50,-36},{-50,36}},
        rotation=0,
        origin={-24,-52})));
  iPSL.Connectors.PwPin pwPin annotation (Placement(transformation(extent={{100,-10},{120,10}})));
equation
  connect(generator.PMECH, generator.PMECH0) annotation (Line(points={{-59.2,60},{-80,60},{-80,90},{40,90},{40,28},{23.2,28}}, color={0,0,127}));
  connect(exst1.EFD0, generator.EFD0) annotation (Line(points={{6.71429,-79.6},{6.71429,-94},{40,-94},{40,12},{23.2,12}}, color={0,0,127}));
  connect(const5.y, exst1.VOEL) annotation (Line(points={{59.5,-60},{24.8095,-60},{24.8095,-60.88}}, color={0,0,127}));
  connect(exst1.VOTHSG, exst1.VOEL) annotation (Line(points={{24.8095,-52.24},{36,-52.24},{36,-60},{24.8095,-60},{24.8095,-60.88}}, color={0,0,127}));
  connect(exst1.VUEL, exst1.VOEL) annotation (Line(points={{24.8095,-70},{36,-70},{36,-60},{24.8095,-60},{24.8095,-60.88}}, color={0,0,127}));
  connect(generator.XADIFD, exst1.XADIFD) annotation (Line(points={{23.2,4},{36,4},{36,-42.16},{24.8095,-42.16}}, color={0,0,127}));
  connect(exst1.ECOMP, generator.ETERM) annotation (Line(points={{24.8095,-23.44},{48,-23.44},{48,60},{23.2,60}}, color={0,0,127}));
  connect(exst1.ETERM, generator.ETERM) annotation (Line(points={{24.8095,-32.08},{34,-32.08},{34,-24},{48,-24},{48,60},{23.2,60}}, color={0,0,127}));
  connect(generator.p, pwPin) annotation (Line(points={{24,40},{42,40},{60,40},{60,0},{110,0}}, color={0,0,255}));
  connect(generator.EFD, generator.EFD0) annotation (Line(points={{-59.2,20},{-80,20},{-80,-4},{40,-4},{40,12},{23.2,12}}, color={0,0,127}));
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}})),
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics={Ellipse(extent={{-100,100},{100,-100}}, lineColor={28,108,200}),Line(points={{-40,-20}}, color={28,108,
          200}),Line(points={{-40,0},{-20,40},{20,-42},{40,0}}, color={28,108,200})}),
    Documentation(info="<html>
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
</html>"));
end Generator;

