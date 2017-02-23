within iPSL.Electrical.Wind.PSSE.WT4G;

model windControlEmulator
  NonElectrical.Continuous.SimpleLag K(K = 1, T = Tfv, y_start = k0) annotation(Placement(transformation(extent = {{98, -10}, {118, 10}})));
  Modelica.Blocks.Math.Add add3(k2 = -1) annotation(Placement(transformation(extent = {{-60, -10}, {-40, 10}})));
  Modelica.Blocks.Sources.Constant VARL(k = Vref) annotation(Placement(transformation(extent = {{-92, 12}, {-72, 32}})));
  Modelica.Blocks.Math.Add add4 annotation(Placement(transformation(extent = {{38, -10}, {58, 10}})));
  Modelica.Blocks.Nonlinear.Limiter Qord1(uMin = QMN, uMax = QMX) annotation(Placement(transformation(extent = {{68, -10}, {88, 10}})));
  Modelica.Blocks.Continuous.LimIntegrator K1(outMin = -100000, outMax = -0.051730465143919, y_start = k10, k = KIV, initType = Modelica.Blocks.Types.Init.InitialOutput) annotation(Placement(transformation(extent = {{8, 10}, {28, 30}})));
  NonElectrical.Continuous.SimpleLag K8(K = Kpv, y_start = k80, T = Tv) annotation(Placement(transformation(extent = {{-22, -30}, {-2, -10}})));
  NonElectrical.Continuous.SimpleLag K8_extra(y_start = k80, K = 1, T = 0.05) annotation(Placement(transformation(extent = {{8, -30}, {28, -10}})));
  NonElectrical.Continuous.LeadLag K11(y_start = 0, T2 = 0.05, K = 1.5, T1 = 0.025, x_start = 0) annotation(Placement(transformation(extent = {{-22, 10}, {-2, 30}})));
  parameter Real Tfv "Filter time constant in voltage regulator (sec)";
  parameter Real Kpv " Proportional gain in voltage regulator (pu)";
  parameter Real KIV " Integrator gain in voltage regulator (pu)";
  parameter Real QMX " Max limit in voltage regulator (pu)";
  parameter Real QMN " Min limit in voltage regulator (pu)";
  parameter Real Tv = 0.50000E-01 " Lag time constant in WindVar controller";
  parameter Real Vref;
  parameter Real k0 "Filter in voltage regulator";
  parameter Real k10 "Integrator in voltage regulator";
  parameter Real k80 "Lag of the WindVar controller";
  Modelica.Blocks.Interfaces.RealInput V_REG annotation(Placement(transformation(rotation = 0, extent = {{-214, -10}, {-194, 10}})));
  Modelica.Blocks.Interfaces.RealOutput Q_ord annotation(Placement(transformation(extent = {{200, -10}, {220, 10}})));
equation
  connect(add4.y, Qord1.u) annotation(Line(points = {{59, 0}, {66, 0}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(Qord1.y, K.u) annotation(Line(points = {{89, 0}, {96, 0}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(K8.y, K8_extra.u) annotation(Line(points = {{-1, -20}, {6, -20}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(K11.y, K1.u) annotation(Line(points = {{-1, 20}, {6, 20}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(add3.y, K11.u) annotation(Line(points = {{-39, 0}, {-32, 0}, {-32, 20}, {-24, 20}}, color = {0, 0, 127}));
  connect(K8.u, K11.u) annotation(Line(points = {{-24, -20}, {-32, -20}, {-32, 20}, {-24, 20}}, color = {0, 0, 127}));
  connect(VARL.y, add3.u1) annotation(Line(points = {{-71, 22}, {-68, 22}, {-68, 6}, {-62, 6}}, color = {0, 0, 127}));
  connect(K8_extra.y, add4.u2) annotation(Line(points = {{29, -20}, {32, -20}, {32, -6}, {36, -6}}, color = {0, 0, 127}));
  connect(add4.u1, K1.y) annotation(Line(points = {{36, 6}, {32, 6}, {32, 20}, {29, 20}}, color = {0, 0, 127}));
  connect(V_REG, add3.u2) annotation(Line(points = {{-204, 0}, {-80, 0}, {-80, -6}, {-62, -6}}, color = {0, 0, 127}));
  connect(K.y, Q_ord) annotation(Line(points = {{119, 0}, {210, 0}}, color = {0, 0, 127}));
  annotation(Diagram(coordinateSystem(extent = {{-200, -200}, {200, 200}}, preserveAspectRatio = true), graphics = {Rectangle(extent = {{-94, 48}, {124, -42}}, lineColor = {255, 0, 0}, lineThickness = 0.5, pattern = LinePattern.Dash), Text(extent = {{-16, 46}, {46, 40}}, lineColor = {255, 0, 0}, pattern = LinePattern.Dash, lineThickness = 0.5, fillColor = {0, 0, 255}, fillPattern = FillPattern.Solid, textString = "WindControl Emulator")}), Icon(coordinateSystem(extent = {{-200, -200}, {200, 200}}, preserveAspectRatio = true), graphics = {Rectangle(extent = {{-200, 200}, {200, -200}}, lineColor = {28, 108, 200}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid), Text(extent = {{-196, 14}, {-76, -16}}, lineColor = {28, 108, 200}, textString = "V_REG"), Text(extent = {{80, 14}, {200, -16}}, lineColor = {28, 108, 200}, textString = "Q_ORD"), Text(extent = {{-172, 162}, {180, 72}}, lineColor = {180, 56, 148}, textString = "WindCONTROL Emulator")}), Documentation(info="<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\"><tr>
<td align=center  width=50%><p>Development level</p></td>
<td align=center width=25% bgcolor=yellow><p> 2 </p></td>
</tr> 
</table> 
<p></p> </html>"));
end windControlEmulator;
