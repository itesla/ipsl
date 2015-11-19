within iPSL.Examples.Compliance.Electrical.Controls.PSSE.ES;
model ESAC1A "SMIB system with one load and GENROE model"
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
  iPSL.Electrical.Controls.PSSE.ES.ESAC1A.ESAC1A eSAC1A(
    V_RMAX=6,
    V_RMIN=-6,
    V0=1) annotation (Placement(transformation(extent={{30,-12},{-40,14}})));
equation
  connect(add.u2, step1.y) annotation (Line(points={{60.6,-14.8},{64,-14.8},{64,
          -25},{69.5,-25}}, color={0,0,127}));
  connect(add.u1, step.y) annotation (Line(points={{60.6,-11.2},{64,-11.2},{64,
          -5},{69.5,-5}}, color={0,0,127}));
  connect(eSAC1A.ECOMP, add.y) annotation (Line(points={{28.9063,9.66667},{44,
          9.66667},{44,-13},{53.7,-13}}, color={0,0,127}));
  connect(eSAC1A.VOTHSG, ZERO.y) annotation (Line(points={{28.9063,-3.33333},{
          40,-3.33333},{40,-55},{59.5,-55}}, color={0,0,127}));
  connect(eSAC1A.VUEL, ZERO.y) annotation (Line(points={{21.25,-10.83},{21.25,
          -20},{40,-20},{40,-55},{59.5,-55}}, color={0,0,127}));
  connect(eSAC1A.VOEL, ZERO.y) annotation (Line(points={{8.16875,-10.895},{
          8.16875,-20},{40,-20},{40,-55},{59.5,-55}}, color={0,0,127}));
  connect(eSAC1A.XADIFD, XADIFD.y) annotation (Line(points={{-4.89063,-10.895},
          {-4.89063,-26},{48,-26},{48,11},{59.5,11}}, color={0,0,127}));
  connect(eSAC1A.EFD0, EFD0.y) annotation (Line(points={{-18.125,-10.7},{
          -18.125,-30},{52,-30},{52,29},{59.5,29}}, color={0,0,127}));
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
end ESAC1A;
