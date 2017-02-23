within iPSL.Electrical.Wind.PSSE.WT4G;

model pf_Controller
  Modelica.Blocks.Math.Tan tan1 annotation(Placement(transformation(extent = {{-120, 40}, {-100, 60}})));
  Modelica.Blocks.Math.Product Qcmdn1 annotation(Placement(transformation(extent = {{-60, -10}, {-40, 10}})));
  Modelica.Blocks.Sources.Constant VAR2(k = PFA_ref) annotation(Placement(transformation(extent = {{-160, 40}, {-140, 60}})));
  NonElectrical.Continuous.SimpleLag K0(K = 1, y_start = p0, T = Tp) annotation(Placement(transformation(extent = {{-120, -10}, {-100, 10}})));
  parameter Real Tp = 0.50000E-01 " Pelec filter in fast PF controller";
  parameter Real PFA_ref = atan2(q0, p0) "PF angle reference if PFAFLG=1";
  parameter Real p0;
  parameter Real q0;
  Modelica.Blocks.Interfaces.RealInput u annotation(Placement(transformation(rotation = 0, extent = {{-214, -10}, {-194, 10}})));
  Modelica.Blocks.Interfaces.RealOutput Q_REF_PF annotation(Placement(transformation(extent = {{0, -10}, {20, 10}})));
equation
  connect(tan1.y, Qcmdn1.u1) annotation(Line(points = {{-99, 50}, {-78, 50}, {-78, 6}, {-62, 6}}, color = {0, 0, 127}));
  connect(K0.y, Qcmdn1.u2) annotation(Line(points = {{-99, 0}, {-78, 0}, {-78, -6}, {-62, -6}}, color = {0, 0, 127}));
  connect(VAR2.y, tan1.u) annotation(Line(points = {{-139, 50}, {-139, 50}, {-122, 50}}, color = {0, 0, 127}));
  connect(u, K0.u) annotation(Line(points = {{-204, 0}, {-158, 0}, {-122, 0}}, color = {0, 0, 127}));
  connect(Qcmdn1.y, Q_REF_PF) annotation(Line(points = {{-39, 0}, {10, 0}, {10, 0}}, color = {0, 0, 127}));
  annotation(Diagram(coordinateSystem(extent = {{-200, -100}, {0, 100}}, preserveAspectRatio = true), graphics = {Text(extent = {{-160, 100}, {-40, 80}}, lineColor = {255, 0, 0}, pattern = LinePattern.Dash, lineThickness = 0.5, fillColor = {0, 0, 255}, fillPattern = FillPattern.Solid, textString = "Power Factor Regulator")}), Icon(coordinateSystem(extent = {{-200, -100}, {0, 100}}, preserveAspectRatio = true), graphics = {Rectangle(extent = {{-200, 100}, {0, -100}}, lineColor = {28, 108, 200}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid), Text(extent = {{-188, 6}, {-148, -6}}, lineColor = {28, 108, 200}, textString = "P_FAREF"), Text(extent = {{-60, 6}, {-2, -6}}, lineColor = {28, 108, 200}, textString = "Q_REF_PF"), Text(extent = {{-160, 80}, {-40, 40}}, lineColor = {238, 46, 47}, textString = "PF Controller")}),  Documentation(info="<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\"><tr>
<td align=center  width=50%><p>Development level</p></td>
<td align=center width=25% bgcolor=yellow><p> 2 </p></td>
</tr> 
</table> 
<p></p> </html>"));
end pf_Controller;
