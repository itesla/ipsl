within iPSL.Electrical.Wind.PSSE.WT4G;

model ActivePowerController
  Modelica.Blocks.Nonlinear.VariableLimiter imLimited_max annotation(Placement(transformation(extent = {{130, 0}, {150, 20}})));
  Modelica.Blocks.Math.Division division annotation(Placement(transformation(extent = {{96, 0}, {116, 20}})));
  Modelica.Blocks.Nonlinear.Limiter imLimited_min(uMin = 0.0000001, uMax = Modelica.Constants.inf) annotation(Placement(transformation(extent = {{36, -70}, {56, -50}})));
  Modelica.Blocks.Math.Add3 add3_1(k1 = -1, k3 = -1) annotation(Placement(transformation(extent = {{-52, 4}, {-40, 16}})));
  Modelica.Blocks.Sources.Constant VAR3(k = Pref) annotation(Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 0, origin = {-94, 40})));
  Modelica.Blocks.Math.Gain gain(k = Kpp) annotation(Placement(transformation(extent = {{-12, 0}, {8, 20}})));
  Modelica.Blocks.Continuous.LimIntegrator K2(y_start = k20, outMin = dPMN, outMax = dPMX, k = KIP) annotation(Placement(transformation(extent = {{-14, 30}, {6, 50}})));
  Modelica.Blocks.Math.Add Pord(k2 = -1) annotation(Placement(transformation(extent = {{56, 0}, {76, 20}})));
  Modelica.Blocks.Math.Add Pord1 annotation(Placement(transformation(extent = {{26, 0}, {46, 20}})));
  Modelica.Blocks.Continuous.Derivative K3(k = Kf, T = Tf, x_start = k30) annotation(Placement(transformation(extent = {{10, -10}, {-10, 10}}, rotation = 0, origin = {-4, -20})));
  NonElectrical.Continuous.SimpleLag K5(K = 1, T = T_Power, y_start = k50) annotation(Placement(transformation(extent = {{-104, -10}, {-84, 10}})));
  Modelica.Blocks.Sources.Constant NoLimiMin(k = -Modelica.Constants.inf) annotation(Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 0, origin = {106, -20})));
  parameter Real Kpp " Proportional gain in torque regulator (pu)";
  parameter Real KIP " Integrator gain in torque regulator (pu)";
  parameter Real Kf "Rate feedback gain (pu)";
  parameter Real Tf "Rate feedback time constant (sec.)";
  parameter Real dPMX " Max limit in power PI controller";
  parameter Real dPMN " Min limit in power PI controller";
  parameter Real T_Power " Power filter time constant";
  parameter Real Pref = p0;
  parameter Real k20 "Integrator in active power regulator";
  parameter Real k30 "Active power regulator feedback";
  parameter Real k50 "Power filter";
  parameter Real p0;
  Modelica.Blocks.Interfaces.RealInput PELEC annotation(Placement(transformation(rotation = 0, extent = {{-220, -20}, {-180, 20}})));
  Modelica.Blocks.Interfaces.RealInput I_PMAX annotation(Placement(transformation(rotation = 270, extent = {{-20, 20}, {20, -20}}, origin = {170, 204}), iconTransformation(extent = {{-20, 20}, {20, -20}}, rotation = 270, origin = {0, 200})));
  Modelica.Blocks.Interfaces.RealOutput ipcmd annotation(Placement(transformation(rotation = 0, extent = {{200, -20}, {240, 20}}), iconTransformation(extent = {{200, -20}, {240, 20}})));
  Modelica.Blocks.Interfaces.RealInput VTERM annotation(Placement(transformation(rotation = 90, extent = {{-20, -20}, {20, 20}}, origin = {0, -200})));
equation
  connect(VAR3.y, add3_1.u1) annotation(Line(points = {{-83, 40}, {-60, 40}, {-60, 14.8}, {-53.2, 14.8}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(gain.y, Pord1.u2) annotation(Line(points = {{9, 10}, {16, 10}, {16, 4}, {24, 4}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(K3.y, add3_1.u3) annotation(Line(points = {{-15, -20}, {-60, -20}, {-60, 5.2}, {-53.2, 5.2}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(add3_1.y, K2.u) annotation(Line(points = {{-39.4, 10}, {-34, 10}, {-34, 40}, {-16, 40}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(gain.u, add3_1.y) annotation(Line(points = {{-14, 10}, {-39.4, 10}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(K5.y, add3_1.u2) annotation(Line(points = {{-83, 0}, {-64, 0}, {-64, 10}, {-53.2, 10}}, color = {0, 0, 127}));
  connect(K2.y, Pord1.u1) annotation(Line(points = {{7, 40}, {16, 40}, {16, 16}, {24, 16}}, color = {0, 0, 127}));
  connect(division.y, imLimited_max.u) annotation(Line(points = {{117, 10}, {128, 10}}, color = {0, 0, 127}));
  connect(imLimited_min.y, division.u2) annotation(Line(points = {{57, -60}, {66, -60}, {66, 4}, {94, 4}}, color = {0, 0, 127}));
  connect(NoLimiMin.y, imLimited_max.limit2) annotation(Line(points = {{117, -20}, {122, -20}, {122, 2}, {128, 2}}, color = {0, 0, 127}));
  connect(Pord.y, division.u1) annotation(Line(points = {{77, 10}, {84, 10}, {84, 16}, {94, 16}}, color = {0, 0, 127}));
  connect(Pord1.y, Pord.u2) annotation(Line(points = {{47, 10}, {50, 10}, {50, 4}, {54, 4}}, color = {0, 0, 127}));
  connect(Pord.u1, add3_1.u1) annotation(Line(points = {{54, 16}, {50, 16}, {50, 58}, {-60, 58}, {-60, 14.8}, {-53.2, 14.8}}, color = {0, 0, 127}));
  connect(K3.u, Pord.u2) annotation(Line(points = {{8, -20}, {50, -20}, {50, 4}, {54, 4}}, color = {0, 0, 127}));
  connect(PELEC, K5.u) annotation(Line(points = {{-200, 0}, {-156, 0}, {-106, 0}}, color = {0, 0, 127}));
  connect(ipcmd, imLimited_max.y) annotation(Line(points = {{220, 0}, {151, 0}, {151, 10}}, color = {0, 0, 127}));
  connect(VTERM, imLimited_min.u) annotation(Line(points = {{0, -200}, {0, -60}, {34, -60}}, color = {0, 0, 127}));
  connect(I_PMAX, imLimited_max.limit1) annotation(Line(points = {{170, 204}, {168, 204}, {168, 86}, {122, 86}, {122, 18}, {128, 18}}, color = {0, 0, 127}));
  annotation(Diagram(coordinateSystem(extent = {{-200, -200}, {200, 200}}, preserveAspectRatio = false), graphics = {Text(extent = {{-88, 16}, {-84, 14}}, lineColor = {0, 0, 255}, lineThickness = 0.5, fillColor = {0, 0, 255}, fillPattern = FillPattern.Solid, textString = "Speed"), Text(extent = {{-80, 200}, {80, 180}}, lineColor = {255, 0, 0}, pattern = LinePattern.Dash, lineThickness = 0.5, fillColor = {0, 0, 255}, fillPattern = FillPattern.Solid, textString = "Active Power Control")}), Icon(coordinateSystem(extent = {{-200, -200}, {200, 200}}, preserveAspectRatio = true), graphics = {Rectangle(extent = {{-200, 200}, {200, -200}}, lineColor = {28, 108, 200}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid), Text(extent = {{-100, 160}, {100, 0}}, lineColor = {0, 140, 72}, textString = "Active Power
PI"), Text(extent = {{-40, 180}, {40, 140}}, lineColor = {28, 108, 200}, textString = "I_PMAX"), Text(extent = {{112, 20}, {192, -20}}, lineColor = {28, 108, 200}, textString = "I_PCMD"), Text(extent = {{-40, -140}, {40, -180}}, lineColor = {28, 108, 200}, textString = "VTERM"), Text(extent = {{-174, 20}, {-94, -20}}, lineColor = {28, 108, 200}, textString = "PELEC")}),  Documentation(info="<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\"><tr>
<td align=center  width=50%><p>Development level</p></td>
<td align=center width=25% bgcolor=yellow><p> 2 </p></td>
</tr> 
</table> 
<p></p> </html>"));
end ActivePowerController;
