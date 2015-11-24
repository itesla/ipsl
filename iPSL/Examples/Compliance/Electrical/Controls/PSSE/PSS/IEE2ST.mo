within iPSL.Examples.Compliance.Electrical.Controls.PSSE.PSS;
model IEE2ST
  "Simple Machine Infinite Bus with Machine, Governor and Excitation system"
  import iPSL;

  Modelica.Blocks.Sources.Step step(
    height=0.05,
    offset=1,
    startTime=0.5)
    annotation (Placement(transformation(extent={{90,-2},{80,8}})));
  Modelica.Blocks.Sources.Step step1(
    height=-0.05,
    offset=0,
    startTime=0.7)
    annotation (Placement(transformation(extent={{90,-22},{80,-12}})));
  Modelica.Blocks.Math.Add add
    annotation (Placement(transformation(extent={{70,-8},{64,-2}})));
  Modelica.Blocks.Sources.Constant VCT(k=1)
    annotation (Placement(transformation(extent={{90,16},{80,26}})));
  iPSL.Electrical.Controls.PSSE.PSS.IEE2ST.IEE2ST iEE2ST(
    K_1=100,
    K_2=200,
    L_SMAX=10,
    L_SMIN=-10,
    V_CU=1,
    V_CL=1,
    T_1=0.01,
    T_2=0.01,
    T_3=0.2,
    T_4=0.3,
    T_5=0.4,
    T_6=0.5,
    T_7=1,
    T_8=0.1,
    T_9=0.2,
    T_10=0.3) annotation (Placement(transformation(extent={{18,-6},{-18,6}})));
equation
  connect(add.u2, step1.y) annotation (Line(points={{70.6,-6.8},{74,-6.8},{74,
          -17},{79.5,-17}}, color={0,0,127}));
  connect(add.u1, step.y) annotation (Line(points={{70.6,-3.2},{74,-3.2},{74,3},
          {79.5,3}}, color={0,0,127}));
  connect(iEE2ST.VCT, VCT.y) annotation (Line(points={{0,-6},{0,-20},{56,-20},{
          56,20},{79.5,20},{79.5,21}}, color={0,0,127}));
  connect(iEE2ST.V_S2, VCT.y) annotation (Line(points={{18,-4},{56,-4},{56,20},
          {79.5,20},{79.5,21}}, color={0,0,127}));
  connect(iEE2ST.V_S1, add.y) annotation (Line(points={{18,4},{40,4},{62,4},{62,
          -5},{63.7,-5}}, color={0,0,127}));
  annotation(__ModelicaAssociation(TestCase(shouldPass=true)),Diagram(coordinateSystem(preserveAspectRatio=false,  extent={{-100,
            -40},{100,40}})),                                                                                      Icon(coordinateSystem(extent={{-100,
            -40},{100,40}})),
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
end IEE2ST;
