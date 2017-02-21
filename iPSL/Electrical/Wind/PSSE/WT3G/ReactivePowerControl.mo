within iPSL.Electrical.Wind.PSSE.WT3G;

model ReactivePowerControl
  NonElectrical.Continuous.SimpleLag K4(K = 1, T = TRV, y_start = k40) annotation(Placement(transformation(extent = {{-98, -10}, {-78, 10}})));
  NonElectrical.Continuous.SimpleLag K8(K = Kpv, T = Tv, y_start = k80) annotation(Placement(transformation(extent = {{34, -40}, {54, -20}})));
  NonElectrical.Continuous.SimpleLag K(K = 1, T = Tfv, y_start = k0) annotation(Placement(transformation(extent = {{160, -10}, {180, 10}})));
  Modelica.Blocks.Math.Gain XC(k = Xc) "Line drop compensation reactance (pu)" annotation(Placement(transformation(extent = {{-180, -30}, {-160, -10}})));
  Modelica.Blocks.Math.Add add3(k2 = -1) annotation(Placement(transformation(extent = {{-48, -10}, {-28, 10}})));
  Modelica.Blocks.Sources.Constant VARL(k = Vref) annotation(Placement(transformation(extent = {{-98, 40}, {-78, 60}})));
  Modelica.Blocks.Math.Gain portion(k = 1 / Fn) "Line drop compensation reactance (pu)" annotation(Placement(transformation(extent = {{-18, -10}, {2, 10}})));
  NonElectrical.Continuous.SimpleLag K1(y_start = k10, K = KIV, T = Tv) annotation(Placement(transformation(extent = {{54, 20}, {74, 40}})));
  Modelica.Blocks.Math.Add add4 annotation(Placement(transformation(extent = {{94, -10}, {114, 10}})));
  Modelica.Blocks.Math.Add add5(k2 = -1) annotation(Placement(transformation(extent = {{-138, -10}, {-118, 10}})));
  Modelica.Blocks.Nonlinear.Limiter Qord1(uMin = QMN, uMax = QMX) annotation(Placement(transformation(extent = {{128, -10}, {148, 10}})));
  NonElectrical.Continuous.SimpleLag K10(T = Tv, y_start = k80, K = 1) annotation(Placement(transformation(extent = {{22, 20}, {42, 40}})));
  parameter Real Tfv = 0.15000 "Filter time constant in voltage regulator (sec)";
  parameter Real Kpv = 18.000 "  Proportional gain in voltage regulator (pu)";
  parameter Real KIV = 5.0000 "  Integrator gain in voltage regulator (pu)";
  parameter Real Xc = 0.0000 "  Line drop compensation reactance (pu)";
  parameter Real QMX = 0.29600 "  Max limit in voltage regulator (pu)";
  parameter Real QMN = -0.43600 "  Min limit in voltage regulator (pu)";
  parameter Real TRV = 0.50000E-01 " Voltage sensor time constant";
  parameter Real Tv = 0.50000E-01 "  Lag time constant in WindVar controller";
  parameter Real Fn = 1.0000 "  A portion of online wind turbines";
  parameter Real Vref " Remote bus ref voltage";
  parameter Real k0;
  parameter Real k10;
  parameter Real k40;
  parameter Real k80;
  Modelica.Blocks.Interfaces.RealInput ITERM annotation(Placement(transformation(rotation = 0, extent = {{-210.5, -30}, {-189.5, -10}}), iconTransformation(extent = {{-200, 30}, {-180, 50}})));
  Modelica.Blocks.Interfaces.RealInput VTERM annotation(Placement(transformation(rotation = 0, extent = {{-210.5, -4}, {-190, 16}}), iconTransformation(extent = {{-200, -50}, {-180, -30}})));
  Modelica.Blocks.Interfaces.RealOutput Q_ord annotation(Placement(transformation(extent = {{200, -10}, {220, 10}}), iconTransformation(extent = {{200, -10}, {220, 10}})));
equation
  connect(VARL.y, add3.u1) annotation(Line(points = {{-77, 50}, {-54, 50}, {-54, 6}, {-50, 6}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(XC.y, add5.u2) annotation(Line(points = {{-159, -20}, {-144, -20}, {-144, -6}, {-140, -6}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(add3.y, portion.u) annotation(Line(points = {{-27, 0}, {-20, 0}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(add5.y, K4.u) annotation(Line(points = {{-117, 0}, {-100, 0}}, color = {0, 0, 127}));
  connect(K4.y, add3.u2) annotation(Line(points = {{-77, 0}, {-54, 0}, {-54, -6}, {-50, -6}}, color = {0, 0, 127}));
  connect(Qord1.y, K.u) annotation(Line(points = {{149, 0}, {158, 0}}, color = {0, 0, 127}));
  connect(VTERM, add5.u1) annotation(Line(points = {{-200.25, 6}, {-200.25, 6}, {-140, 6}}, color = {0, 0, 127}));
  connect(add4.y, Qord1.u) annotation(Line(points = {{115, 0}, {120, 0}, {126, 0}}, color = {0, 0, 127}));
  connect(K1.y, add4.u1) annotation(Line(points = {{75, 30}, {82, 30}, {82, 6}, {92, 6}}, color = {0, 0, 127}));
  connect(K10.y, K1.u) annotation(Line(points = {{43, 30}, {47.5, 30}, {52, 30}}, color = {0, 0, 127}));
  connect(K8.y, add4.u2) annotation(Line(points = {{55, -30}, {82, -30}, {82, -6}, {92, -6}}, color = {0, 0, 127}));
  connect(portion.y, K10.u) annotation(Line(points = {{3, 0}, {12, 0}, {12, 30}, {20, 30}}, color = {0, 0, 127}));
  connect(K8.u, K10.u) annotation(Line(points = {{32, -30}, {12, -30}, {12, 30}, {20, 30}}, color = {0, 0, 127}));
  connect(ITERM, XC.u) annotation(Line(points = {{-200, -20}, {-182, -20}}, color = {0, 0, 127}));
  connect(K.y, Q_ord) annotation(Line(points = {{181, 0}, {210, 0}}, color = {0, 0, 127}));
  annotation(Diagram(coordinateSystem(extent = {{-200, -80}, {200, 80}}, preserveAspectRatio = true), graphics = {Text(extent = {{136, 8}, {156, 4}}, lineColor = {255, 0, 0}, textString = "K
"), Text(extent = {{-60, 80}, {60, 60}}, lineColor = {255, 0, 0}, pattern = LinePattern.Dash, lineThickness = 0.5, fillColor = {0, 0, 255}, fillPattern = FillPattern.Solid, textString = "Reactive Power Control"), Text(extent = {{18, 26}, {38, 22}}, lineColor = {255, 0, 0}, textString = "K+1
")}), Icon(coordinateSystem(extent = {{-200, -80}, {200, 80}}, preserveAspectRatio = true), graphics = {Rectangle(extent = {{-200, 80}, {200, -80}}, lineColor = {28, 108, 200}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid), Text(extent = {{-120, 80}, {122, 50}}, lineColor = {180, 56, 148}, textString = "Reactive Power Control"), Text(extent = {{-176, 50}, {-116, 30}}, lineColor = {28, 108, 200}, textString = "ITERM"), Text(extent = {{130, 10}, {194, -10}}, lineColor = {28, 108, 200}, textString = "Q_ORD"), Text(extent = {{-176, -32}, {-116, -52}}, lineColor = {28, 108, 200}, textString = "VTERM")}));
end ReactivePowerControl;