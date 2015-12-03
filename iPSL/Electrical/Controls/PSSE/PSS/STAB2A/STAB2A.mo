within iPSL.Electrical.Controls.PSSE.PSS.STAB2A;


model STAB2A "Models STAB2A, STAB3, and STAB4 are special representations of specific types of supplementary
  stabilizing units. Both produce a supplementary signal by introducing phase-lead into a signal
  proportional to electrical power output measured at the generator terminals."
  //parameter Real PELEC0= 1;
  parameter Real K_2=1;
  parameter Real T_2=1;
  parameter Real K_3=1;
  parameter Real T_3=1;
  parameter Real K_4=1;
  parameter Real K_5=1;
  parameter Real T_5=1;
  parameter Real H_LIM=5;
  input Modelica.Blocks.Interfaces.RealInput PELEC "Machine electrical power (pu)" annotation (Placement(transformation(extent={{-109,-6},{-98,10}}), iconTransformation(extent={{-107,-10},{-87,10}})));
  output Modelica.Blocks.Interfaces.RealOutput VOTHSG "PSS output signal" annotation (Placement(transformation(extent={{120,-10},{140,10}}), iconTransformation(extent={{120,-10},{140,10}})));
  Modelica.Blocks.Continuous.TransferFunction transferFunction(
    b={-K_2*T_2,0},
    a={T_2,1},
    initType=Modelica.Blocks.Types.Init.SteadyState) annotation (Placement(transformation(extent={{-90,-8},{-70,12}})));
  Modelica.Blocks.Continuous.TransferFunction transferFunction1(
    a={T_2,1},
    initType=Modelica.Blocks.Types.Init.SteadyState,
    b={K_2*T_2,0}) annotation (Placement(transformation(extent={{-62,-8},{-42,12}})));
  Modelica.Blocks.Continuous.TransferFunction transferFunction2(
    a={T_2,1},
    initType=Modelica.Blocks.Types.Init.SteadyState,
    b={K_2*T_2,0}) annotation (Placement(transformation(extent={{-34,-8},{-14,12}})));
  Modelica.Blocks.Continuous.TransferFunction transferFunction3(
    initType=Modelica.Blocks.Types.Init.SteadyState,
    b={K_3},
    a={T_3,1}) annotation (Placement(transformation(extent={{-4,-2},{16,18}})));
  Modelica.Blocks.Continuous.TransferFunction transferFunction4(
    initType=Modelica.Blocks.Types.Init.SteadyState,
    b={K_5},
    a={T_5,1}) annotation (Placement(transformation(extent={{42,-10},{62,10}})));
  Modelica.Blocks.Continuous.TransferFunction transferFunction5(
    initType=Modelica.Blocks.Types.Init.SteadyState,
    b={K_5},
    a={T_5,1}) annotation (Placement(transformation(extent={{70,-10},{90,10}})));
  Modelica.Blocks.Math.Gain K(k=K_4) annotation (Placement(transformation(extent={{0,-26},{14,-12}})));
  Modelica.Blocks.Math.Add add annotation (Placement(transformation(extent={{26,-4},{34,4}})));
  Modelica.Blocks.Nonlinear.Limiter limiter(uMax=H_LIM, uMin=-H_LIM) annotation (Placement(transformation(extent={{98,-10},{118,10}})));
equation
  connect(PELEC, transferFunction.u) annotation (Line(
      points={{-103.5,2},{-103.5,1},{-92,1},{-92,2}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(transferFunction.y, transferFunction1.u) annotation (Line(
      points={{-69,2},{-64,2}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(transferFunction1.y, transferFunction2.u) annotation (Line(
      points={{-41,2},{-36,2}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(transferFunction2.y, transferFunction3.u) annotation (Line(
      points={{-13,2},{-10,2},{-10,8},{-6,8}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(transferFunction4.y, transferFunction5.u) annotation (Line(
      points={{63,0},{68,0}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(K.u, transferFunction2.y) annotation (Line(
      points={{-1.4,-19},{-10,-19},{-10,2},{-13,2}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(add.y, transferFunction4.u) annotation (Line(
      points={{34.4,0},{40,0}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(transferFunction3.y, add.u1) annotation (Line(
      points={{17,8},{20,8},{20,2.4},{25.2,2.4}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(K.y, add.u2) annotation (Line(
      points={{14.7,-19},{20,-19},{20,-2.4},{25.2,-2.4}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(transferFunction5.y, limiter.u) annotation (Line(points={{91,0},{96,0}}, color={0,0,127}));
  connect(VOTHSG, limiter.y) annotation (Line(points={{130,0},{119,0}}, color={0,0,127}));
  annotation (
    Diagram(coordinateSystem(
        preserveAspectRatio=false,
        extent={{-100,-40},{120,40}},
        grid={2,2})),
    Icon(coordinateSystem(
        preserveAspectRatio=false,
        extent={{-100,-40},{120,40}},
        grid={2,2}), graphics={
        Rectangle(extent={{-100,40},{120,-40}}, lineColor={0,0,255}),
        Text(
          extent={{-34,24},{34,-24}},
          lineColor={0,0,255},
          textString="STAB2A"),
        Text(
          extent={{72,16},{116,-18}},
          lineColor={0,0,255},
          textString="VOTHSG"),
        Text(
          extent={{-86,16},{-48,-16}},
          lineColor={0,0,255},
          textString="PELEC")}),
    Documentation(info="<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\">
<tr>
<td><p>Reference</p></td>
<td>PSS/E Manual</td>
</tr>
<tr>
<td><p>Last update</p></td>
<td>Unknown</td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p>Mengjia Zhang,SmarTS Lab, KTH Royal Institute of Technology</p></td>
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
end STAB2A;
