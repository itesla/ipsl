within iPSL.Electrical.Wind.PSSE.WT3G;

model ActivePowerControl
  NonElectrical.Continuous.SimpleLag K5(K = 1, T = T_Power, y_start = k50) annotation(Placement(transformation(extent = {{-180, -70}, {-160, -50}})));
  Modelica.Blocks.Math.Add add(k2 = -1) annotation(Placement(transformation(extent = {{-140, -70}, {-120, -50}})));
  Modelica.Blocks.Continuous.Integrator K3(y_start = k30, k = KIP, initType = Modelica.Blocks.Types.Init.InitialOutput) annotation(Placement(transformation(extent = {{-100, -40}, {-80, -20}})));
  Modelica.Blocks.Math.Gain imGain(k = Kpp) annotation(Placement(transformation(extent = {{-100, -100}, {-80, -80}})));
  Modelica.Blocks.Math.Add add1 annotation(Placement(transformation(extent = {{-60, -70}, {-40, -50}})));
  Modelica.Blocks.Math.Feedback feedback annotation(Placement(transformation(extent = {{20, -70}, {40, -50}})));
  Modelica.Blocks.Nonlinear.Limiter imLimited(uMin = RPMN, uMax = RPMX) annotation(Placement(transformation(extent = {{50, -70}, {70, -50}})));
  Modelica.Blocks.Continuous.LimIntegrator K2(outMin = PMN, outMax = PMX, k = 1 / TFP, y_start = k20, initType = Modelica.Blocks.Types.Init.InitialOutput) annotation(Placement(transformation(extent = {{80, -70}, {100, -50}})));
  Modelica.Blocks.Nonlinear.Limiter imLimited_max(uMin = -Modelica.Constants.inf, uMax = IPMAX) annotation(Placement(transformation(extent = {{160, -70}, {180, -50}})));
  Modelica.Blocks.Math.Add add2 annotation(Placement(transformation(extent = {{-100, 44}, {-80, 64}})));
  Modelica.Blocks.Sources.Constant const(k = 1) annotation(Placement(transformation(extent = {{-140, 10}, {-120, 30}})));
  Modelica.Blocks.Math.Division division annotation(Placement(transformation(extent = {{120, -70}, {140, -50}})));
  Modelica.Blocks.Nonlinear.Limiter imLimited_min(uMin = 0.01, uMax = Modelica.Constants.inf) annotation(Placement(transformation(extent = {{80, -10}, {100, 10}})));
  Modelica.Blocks.Math.Product Qcmdn2 annotation(Placement(transformation(extent = {{-20, -70}, {0, -50}})));
  Modelica.Blocks.Interfaces.RealOutput WPCMND annotation(Placement(transformation(extent = {{200, -100}, {220, -80}}), iconTransformation(extent = {{-10, -10}, {10, 10}}, rotation = 270, origin = {1.77636e-015, -110})));
  parameter Real TFP = 0.50000E-01 "  Filter time constant in torque regulator";
  parameter Real Kpp = 3.0000 "  Proportional gain in torque regulator (pu) ";
  parameter Real KIP = 0.60000 " Integrator gain in torque regulator (pu)";
  parameter Real PMX = 1.1200 "  Max limit in torque regulator (pu)";
  parameter Real PMN = 0.10000 "  Min limit in torque regulator (pu)";
  parameter Real IPMAX = 1.1000 "  Max active current limit";
  parameter Real RPMX = 0.45000 "  Max power order derivative";
  parameter Real RPMN = -0.45000 "  Min power order derivative";
  parameter Real T_Power = 5.0000 "  Power filter time constant";
  parameter Real wPmin = 0.69000 "  Shaft speed at Pmin (pu)";
  parameter Real wP20 = 0.78000 "  Shaft speed at 20% rated power (pu) ";
  parameter Real wP40 = 0.98000 "  Shaft speed at 40% rated power (pu)";
  parameter Real wP60 = 1.1200 "  Shaft speed at 60% rated power (pu)";
  parameter Real Pmin = 0.74000 "  Minimum power for operating at P100 speed (pu)";
  parameter Real wP100 = 1.2000 "  Shaft speed at 100% rated power (pu)";
  parameter Real k20;
  parameter Real k30;
  parameter Real k50;
  Modelica.Blocks.Interfaces.RealInput SPEED annotation(Placement(transformation(rotation = 0, extent = {{-210, 50}, {-190, 70}}), iconTransformation(extent = {{-200, 40}, {-180, 60}})));
  Modelica.Blocks.Interfaces.RealOutput WIPCMD annotation(Placement(transformation(rotation = 0, extent = {{200, -70}, {220, -50}}), iconTransformation(extent = {{200, -10}, {220, 10}})));
  Modelica.Blocks.Interfaces.RealInput VTERM annotation(Placement(transformation(rotation = 0, extent = {{-210, -10}, {-190, 10}}), iconTransformation(extent = {{-200, -60}, {-180, -40}})));
  Modelica.Blocks.Interfaces.RealInput PELEC annotation(Placement(transformation(extent = {{-210, 80}, {-190, 100}}), iconTransformation(extent = {{-200, -10}, {-180, 10}})));
protected
  Modelica.Blocks.Interfaces.RealInput WNDSP_1 annotation(Placement(transformation(extent = {{-210, -70}, {-190, -50}})));
equation
  WNDSP_1 = Speed(PELEC, PMN, wPmin, wP20, wP40, wP60, wP100, Pmin);
  connect(imLimited_min.y, division.u2) annotation(Line(points = {{101, 0}, {112, 0}, {112, -66}, {118, -66}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(WNDSP_1, K5.u) annotation(Line(points = {{-200, -60}, {-200, -60}, {-182, -60}}, color = {0, 0, 127}));
  connect(K2.y, division.u1) annotation(Line(points = {{101, -60}, {114, -60}, {114, -54}, {118, -54}}, color = {0, 0, 127}));
  connect(division.y, imLimited_max.u) annotation(Line(points = {{141, -60}, {141, -60}, {158, -60}}, color = {0, 0, 127}));
  connect(K5.y, add.u2) annotation(Line(points = {{-159, -60}, {-152, -60}, {-152, -66}, {-142, -66}}, color = {0, 0, 127}));
  connect(add.y, K3.u) annotation(Line(points = {{-119, -60}, {-110, -60}, {-110, -30}, {-102, -30}}, color = {0, 0, 127}));
  connect(imGain.u, K3.u) annotation(Line(points = {{-102, -90}, {-110, -90}, {-110, -30}, {-102, -30}}, color = {0, 0, 127}));
  connect(K3.y, add1.u1) annotation(Line(points = {{-79, -30}, {-72, -30}, {-72, -54}, {-62, -54}}, color = {0, 0, 127}));
  connect(imGain.y, add1.u2) annotation(Line(points = {{-79, -90}, {-72, -90}, {-72, -66}, {-62, -66}}, color = {0, 0, 127}));
  connect(add1.y, Qcmdn2.u2) annotation(Line(points = {{-39, -60}, {-32, -60}, {-32, -66}, {-22, -66}}, color = {0, 0, 127}));
  connect(const.y, add2.u2) annotation(Line(points = {{-119, 20}, {-110, 20}, {-110, 48}, {-102, 48}}, color = {0, 0, 127}));
  connect(SPEED, add2.u1) annotation(Line(points = {{-200, 60}, {-102, 60}}, color = {0, 0, 127}));
  connect(add.u1, add2.u1) annotation(Line(points = {{-142, -54}, {-152, -54}, {-152, 60}, {-102, 60}}, color = {0, 0, 127}));
  connect(add2.y, Qcmdn2.u1) annotation(Line(points = {{-79, 54}, {-32, 54}, {-32, -54}, {-22, -54}}, color = {0, 0, 127}));
  connect(Qcmdn2.y, feedback.u1) annotation(Line(points = {{1, -60}, {22, -60}}, color = {0, 0, 127}));
  connect(feedback.y, imLimited.u) annotation(Line(points = {{39, -60}, {48, -60}}, color = {0, 0, 127}));
  connect(imLimited.y, K2.u) annotation(Line(points = {{71, -60}, {74.5, -60}, {78, -60}}, color = {0, 0, 127}));
  connect(feedback.u2, division.u1) annotation(Line(points = {{30, -68}, {30, -90}, {108, -90}, {108, -60}, {114, -60}, {114, -54}, {118, -54}}, color = {0, 0, 127}));
  connect(VTERM, imLimited_min.u) annotation(Line(points = {{-200, 0}, {-200, 0}, {78, 0}}, color = {0, 0, 127}));
  connect(WPCMND, division.u1) annotation(Line(points = {{210, -90}, {210, -90}, {108, -90}, {108, -60}, {114, -60}, {114, -54}, {118, -54}}, color = {0, 0, 127}));
  connect(imLimited_max.y, WIPCMD) annotation(Line(points = {{181, -60}, {210, -60}}, color = {0, 0, 127}));
  annotation(Diagram(coordinateSystem(extent = {{-200, -100}, {200, 100}}, preserveAspectRatio = true), graphics = {Text(extent = {{-60, 100}, {60, 80}}, lineColor = {255, 0, 0}, pattern = LinePattern.Dash, lineThickness = 0.5, fillColor = {0, 0, 255}, fillPattern = FillPattern.Solid, textString = "Active Power Control")}), Icon(coordinateSystem(extent = {{-200, -100}, {200, 100}}, preserveAspectRatio = true), graphics = {Rectangle(extent = {{-200, 100}, {200, -100}}, lineColor = {28, 108, 200}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid), Text(extent = {{-64, 72}, {76, 32}}, lineColor = {0, 140, 72}, textString = "Active Power
PI")}), Documentation(info="<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\"><tr>
<td align=center  width=50%><p>Development level</p></td>
<td align=center width=25% bgcolor=yellow><p> 2 </p></td>
</tr> 
</table> 
<p></p> </html>"));
end ActivePowerControl;
