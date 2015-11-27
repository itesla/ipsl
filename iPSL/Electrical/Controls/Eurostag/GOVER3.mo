within iPSL.Electrical.Controls.Eurostag;
model GOVER3 "Voltage governor. Developed by AIA. 2013"
  parameter Real init_V1;
  parameter Real init_V2;
  parameter Real init_V3;
  parameter Real init_V4;
  parameter Real init_V5;
  parameter Real init_V6;
  parameter Real init_V7;
  parameter Real T5;
  parameter Real PN;
  Modelica.Blocks.Sources.Constant imSetPoint1(k=init_V1)
    annotation (Placement(transformation(extent={{-24,20},{-4,40}})));
  iPSL.NonElectrical.Continuous.LeadLag imLeadLag(
    y_start=init_V2,
    K=25.0,
    T1=4.0,
    T2=1.0) annotation (Placement(transformation(extent={{-24,52},{-4,72}})));
  Modelica.Blocks.Interfaces.RealInput pin_OMEGA annotation(Placement(transformation(extent = {{-61, -10}, {-41, 10}}), iconTransformation(extent = {{-61, -10}, {-41, 10}})));
  Modelica.Blocks.Interfaces.RealOutput pin_CM annotation(Placement(transformation(extent = {{59, -11}, {78, 11}}), iconTransformation(extent = {{59, -10}, {80, 10}})));
  Modelica.Blocks.Nonlinear.Limiter imLimiter(uMin=0.0, uMax=1.05)
    annotation (Placement(transformation(extent={{46,50},{66,70}})));
  iPSL.NonElectrical.Continuous.SimpleLag imSimpleLag(
    K=1.0,
    T=0.1,
    y_start=init_V3)
    annotation (Placement(transformation(extent={{80,50},{100,70}})));
  iPSL.NonElectrical.Continuous.SimpleLag imSimpleLag1(
    K=1.0,
    T=0.5,
    y_start=init_V4)
    annotation (Placement(transformation(extent={{0,-50},{20,-30}})));
  iPSL.NonElectrical.Continuous.LeadLag imLeadLag1(
    K=1.0,
    T2=T5,
    y_start=init_V5,
    T1=0.3*T5)
    annotation (Placement(transformation(extent={{40,-50},{60,-30}})));
  Modelica.Blocks.Math.Add add(k2=1/PN)
    annotation (Placement(transformation(extent={{16,50},{36,70}})));
  Modelica.Blocks.Math.Division division
    annotation (Placement(transformation(extent={{80,-56},{100,-36}})));
  Modelica.Blocks.Math.Add add1(k2=-1)
    annotation (Placement(transformation(extent={{-60,52},{-40,72}})));
  Modelica.Blocks.Sources.Constant const(k=1)
    annotation (Placement(transformation(extent={{-100,60},{-80,80}})));
equation
  connect(imLeadLag.y, add.u1)
    annotation (Line(points={{-3,62},{4,62},{4,66},{14,66}}, color={0,0,127}));
  connect(imSetPoint1.y, add.u2)
    annotation (Line(points={{-3,30},{4,30},{4,54},{14,54}}, color={0,0,127}));
  connect(add.y, imLimiter.u)
    annotation (Line(points={{37,60},{40.5,60},{44,60}}, color={0,0,127}));
  connect(imLimiter.y, imSimpleLag.u)
    annotation (Line(points={{67,60},{72.5,60},{78,60}}, color={0,0,127}));
  connect(imSimpleLag1.u, imSimpleLag.y) annotation (Line(points={{-2,-40},{-2,
          -40},{-20,-40},{-20,0},{20,0},{20,20},{120,20},{120,60},{101,60}},
        color={0,0,127}));
  connect(imSimpleLag1.y, imLeadLag1.u)
    annotation (Line(points={{21,-40},{29.5,-40},{38,-40}}, color={0,0,127}));
  connect(imLeadLag1.y, division.u1)
    annotation (Line(points={{61,-40},{70,-40},{78,-40}}, color={0,0,127}));
  connect(division.u2, pin_OMEGA) annotation (Line(points={{78,-52},{66,-52},{
          66,-60},{-60,-60},{-60,0},{-51,0}}, color={0,0,127}));
  connect(const.y, add1.u1) annotation (Line(points={{-79,70},{-70,70},{-70,68},
          {-62,68}}, color={0,0,127}));
  connect(add1.u2, pin_OMEGA) annotation (Line(points={{-62,56},{-72,56},{-72,0},
          {-51,0}}, color={0,0,127}));
  connect(division.y, pin_CM) annotation (Line(points={{101,-46},{112,-46},{112,
          0},{68.5,0}}, color={0,0,127}));
  connect(add1.y, imLeadLag.u)
    annotation (Line(points={{-39,62},{-26,62}}, color={0,0,127}));
  annotation(Diagram(coordinateSystem(extent={{-120,-100},{180,100}},      preserveAspectRatio=false)),            Icon(coordinateSystem(extent = {{-120, -100}, {180, 100}}, preserveAspectRatio = true), graphics={  Rectangle(extent=  {{-40, 40}, {60, -40}}, lineColor=  {0, 0, 255}), Text(extent=  {{-20, -6}, {38, 8}}, lineColor=  {0, 0, 255}, textString=  "GOVER3")}),
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
end GOVER3;
