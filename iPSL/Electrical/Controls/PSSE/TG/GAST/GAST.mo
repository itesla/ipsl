within iPSL.Electrical.Controls.PSSE.TG.GAST;


model GAST "Gas Turbine-Governor"
  parameter Real R "Speed droop";
  parameter Real T_1 "(s)";
  parameter Real T_2 "(s)";
  parameter Real T_3 "(s)";
  parameter Real AT "Ambient temperature load limit";
  parameter Real K_T "Gain value multiplied with input signal";
  parameter Real V_MAX "Upper limits of input signals";
  parameter Real V_MIN "Lower limits of input signals";
  parameter Real D_turb "Gain value multiplied with input signal";
  Modelica.Blocks.Interfaces.RealInput SPEED "Machine electrical power (pu on M_b)" annotation (Placement(transformation(extent={{-120,30},{-80,70}}), iconTransformation(extent={{-120,30},{-80,70}})));
  Modelica.Blocks.Interfaces.RealOutput PMECH "Turbine mechanical power (pu)" annotation (Placement(transformation(extent={{100,-10},{120,10}})));
  Modelica.Blocks.Math.Add add(k1=-1) annotation (Placement(transformation(extent={{-78,-22},{-68,-12}})));
  Modelica.Blocks.Math.Add add1(k2=-1) annotation (Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=180,
        origin={25,-47})));
  Modelica.Blocks.Math.Add add2(k2=+1) annotation (Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=180,
        origin={-37,-47})));
  Modelica.Blocks.Math.Add add3(k1=-1) annotation (Placement(transformation(extent={{80,-5},{90,5}})));
  Modelica.Blocks.Math.Gain gDturb(k=D_turb) annotation (Placement(transformation(extent={{-54,55},{-44,65}})));
  Modelica.Blocks.Math.Gain gKt(k=K_T) annotation (Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=180,
        origin={-11,-45})));
  Modelica.Blocks.Math.Gain g1_R(k=1/R) annotation (Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=270,
        origin={-85,33})));
  Modelica.Blocks.Interfaces.RealInput Reference "Speed reference (pu)" annotation (Placement(transformation(extent={{-120,-70},{-80,-30}}), iconTransformation(extent={{-120,-70},{-80,-30}})));
  NonElectrical.Logical.LV_GATE lV_Gate annotation (Placement(transformation(extent={{-46,-10},{-26,10}})));
  Modelica.Blocks.Continuous.TransferFunction transferFunction1(a={T_2,1}) annotation (Placement(transformation(extent={{48,-6},{60,6}})));
  Modelica.Blocks.Continuous.TransferFunction transferFunction2(a={T_3,1}) annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=180,
        origin={54,-40})));
  Modelica.Blocks.Sources.Constant const(k=AT) annotation (Placement(transformation(extent={{-48,-94},{-28,-74}})));
  NonElectrical.Continuous.SimpleLagLim simpleLagLim(
    outMax=V_MAX,
    outMin=V_MIN,
    K=1,
    T=T_1,
    y_start=0) annotation (Placement(transformation(extent={{-4,-4},{6,6}})));
equation
  connect(SPEED, gDturb.u) annotation (Line(
      points={{-100,50},{-78,50},{-78,60},{-55,60}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(gDturb.y, add3.u1) annotation (Line(
      points={{-43.5,60},{72,60},{72,3},{79,3}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(add3.y, PMECH) annotation (Line(
      points={{90.5,0},{110,0}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(SPEED, g1_R.u) annotation (Line(
      points={{-100,50},{-85,50},{-85,39}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(g1_R.y, add.u1) annotation (Line(
      points={{-85,27.5},{-85,-14},{-79,-14}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Reference, add.u2) annotation (Line(
      points={{-100,-50},{-90,-50},{-90,-20},{-79,-20}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(add1.y, gKt.u) annotation (Line(
      points={{19.5,-47},{-5,-47},{-5,-45}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(gKt.y, add2.u2) annotation (Line(
      points={{-16.5,-45},{-31,-45},{-31,-44}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(transferFunction2.y, add1.u2) annotation (Line(
      points={{47.4,-40},{40,-40},{40,-44},{31,-44}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(transferFunction1.y, add3.u2) annotation (Line(
      points={{60.6,0},{70,0},{70,-3},{79,-3}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(transferFunction1.y, transferFunction2.u) annotation (Line(
      points={{60.6,0},{68,0},{68,-40},{61.2,-40}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(add.y, lV_Gate.n1) annotation (Line(
      points={{-67.5,-17},{-55.75,-17},{-55.75,5},{-47.25,5}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(lV_Gate.n2, add2.y) annotation (Line(
      points={{-47.25,-5},{-47.25,-25.3},{-42.5,-25.3},{-42.5,-47}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(const.y, add2.u1) annotation (Line(points={{-27,-84},{-8,-84},{-8,-50},{-31,-50}}, color={0,0,127}));
  connect(add1.u1, add2.u1) annotation (Line(points={{31,-50},{38,-50},{38,-84},{-8,-84},{-8,-50},{-31,-50}}, color={0,0,127}));
  connect(simpleLagLim.u, lV_Gate.p) annotation (Line(points={{-5,1},{-17.5,1},{-17.5,0},{-27.25,0}}, color={0,0,127}));
  connect(simpleLagLim.y, transferFunction1.u) annotation (Line(points={{6.5,1},{26.25,1},{26.25,0},{46.8,0}}, color={0,0,127}));
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}})),
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics={
        Rectangle(extent={{-100,100},{100,-100}}, lineColor={0,0,255}),
        Text(
          extent={{-90,56},{-30,44}},
          lineColor={0,0,255},
          textString="SPEED"),
        Text(
          extent={{-90,-44},{-32,-56}},
          lineColor={0,0,255},
          textString="VAR(L)"),
        Text(
          extent={{48,6},{108,-6}},
          lineColor={0,0,255},
          textString="PMECH"),
        Text(
          extent={{-40,18},{36,-18}},
          lineColor={0,0,255},
          textString="GAST")}),
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
end GAST;
