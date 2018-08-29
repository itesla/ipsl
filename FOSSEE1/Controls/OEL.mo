within FOSSEE1.Controls;
package OEL
model OELM
outer OpenIPSL.Electrical.SystemBase SysData;
Modelica.Blocks.Interfaces.RealInput P annotation (
    Placement(visible = true, transformation(origin = {-100, 60}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-100, 60}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
Modelica.Blocks.Interfaces.RealInput Q annotation (
    Placement(visible = true, transformation(origin={-100,0},    extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin={-100,0},    extent = {{-20, -20}, {20, 20}}, rotation = 0)));
Modelica.Blocks.Interfaces.RealInput V annotation (
    Placement(visible = true, transformation(origin = {-100, -60}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-100, -60}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
Modelica.Blocks.Math.Feedback feedback1 annotation (
    Placement(visible = true, transformation(origin = {10, 8.88178e-16}, extent = {{-16, -16}, {16, 16}}, rotation = 0)));
Modelica.Blocks.Interfaces.RealInput v_ref0 annotation (
    Placement(visible = true, transformation(origin = {0, 100}, extent = {{-20, -20}, {20, 20}}, rotation = -90), iconTransformation(origin = {0, 100}, extent = {{-20, -20}, {20, 20}}, rotation = -90)));
Modelica.Blocks.Math.Feedback feedback2 annotation (
    Placement(visible = true, transformation(origin = {74, 56}, extent = {{-16, -16}, {16, 16}}, rotation = 0)));
   parameter Modelica.SIunits.Time T0=10;
  parameter Modelica.SIunits.PerUnit xd;
  parameter Modelica.SIunits.PerUnit xq;
  parameter Modelica.SIunits.PerUnit if_lim;
  parameter Modelica.SIunits.PerUnit vOEL_max;
  parameter OpenIPSL.Types.ApparentPowerMega Sn=SysData.S_b
 annotation (Dialog(group="Machine parameters"));
  parameter OpenIPSL.Types.VoltageKilo Vn=V_b
  annotation (Dialog(group="Machine parameters"));
  parameter OpenIPSL.Types.VoltageKilo V_b=400;
  FCE fCE(xd=1, xq=1) annotation (Placement(visible=true, transformation(
          origin={-46,0},
          extent={{-14,-14},{14,14}},
          rotation=0)));
Modelica.Blocks.Continuous.LimIntegrator limIntegrator1(
 k = 10 / T0, outMax = vOEL_max, outMin = 0,strict=true)
annotation (
    Placement(visible = true, transformation(origin = {54, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
Modelica.Blocks.Sources.Constant const(k = if_lim)  annotation (
    Placement(visible = true, transformation(origin = {8, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
Modelica.Blocks.Interfaces.RealOutput v_ref annotation (
    Placement(visible = true, transformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
    connect(P, fCE.P) annotation (Line(points={{-100,60},{-74,60},{-74,8.4},{
            -60,8.4}}, color={0,0,127}));
    connect(fCE.I_field, feedback1.u1) annotation (Line(points={{-30.88,
            1.77636e-015},{-6,1.77636e-015},{-6,0},{-2.8,0}}, color={0,0,127}));
    connect(Q, fCE.Q) annotation (Line(points={{-100,0},{-68,0},{-68,
            1.77636e-015},{-60,1.77636e-015}}, color={0,0,127}));
  connect(feedback2.y, v_ref) annotation (
    Line(points={{88.4,56},{92,56},{92,0},{110,0}},        color = {0, 0, 127}));
  connect(const.y, feedback1.u2) annotation (
    Line(points={{8,-39},{10,-39},{10,-12.8},{10,-12.8}},      color = {0, 0, 127}));
  connect(feedback1.y, limIntegrator1.u) annotation (
    Line(points={{24.4,0},{42,0}},    color = {0, 0, 127}));
  connect(limIntegrator1.y, feedback2.u2) annotation (
    Line(points={{65,0},{74,0},{74,43.2}},      color = {0, 0, 127}));
  connect(v_ref0, feedback2.u1) annotation (
    Line(points={{0,100},{0,56},{61.2,56}},      color = {0, 0, 127}));

    connect(fCE.V, V) annotation (Line(points={{-60,-8.68},{-74,-8.68},{-74,-60},
            {-100,-60}}, color={0,0,127}));
end OELM;

model FCE "Field Currect Estimator"

  Modelica.Blocks.Interfaces.RealInput P annotation (
    Placement(visible = true, transformation(origin = {-100, 60}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-100, 60}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
Modelica.Blocks.Interfaces.RealInput Q annotation (
    Placement(visible = true, transformation(origin = {-100, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-100, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
Modelica.Blocks.Interfaces.RealInput V annotation (
    Placement(visible = true, transformation(origin = {-100, -62}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-100, -62}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
Modelica.Blocks.Interfaces.RealOutput I_field annotation (
    Placement(visible = true, transformation(origin = {108, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {108, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
 parameter Real xd;
  parameter Real xq;
  protected
  Real gamma_p;
  Real gamma_q;
equation
gamma_p = xq*P/V;
 gamma_q = xq*Q/V;
  I_field = sqrt((V + gamma_q)^2 + P^2) + ((xd/xq - 1)*(gamma_q*(V + gamma_q) +
    gamma_p^2)/sqrt((V + gamma_q)^2 + P^2));
end FCE;
end OEL;
