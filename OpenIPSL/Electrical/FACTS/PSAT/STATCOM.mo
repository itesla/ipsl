within OpenIPSL.Electrical.FACTS.PSAT;
model STATCOM "Static Synchronous Compensator model with equation"
  extends OpenIPSL.Electrical.Essentials.pfComponent(
    enableangle_0=true,
    enablev_0=true,
    enableV_b=true,
    enableS_b=true);
  OpenIPSL.Interfaces.PwPin p(vr(start=vr0), vi(start=vi0)) annotation (
      Placement(transformation(extent={{100,-10},{120,10}}), iconTransformation(
          extent={{100,-10},{120,10}})));

  parameter SI.ApparentPower Sn(displayUnit="MVA")=S_b "Power rating"
    annotation (Dialog(group="Device parameters"));
  parameter SI.Voltage Vn(displayUnit="kV")=V_b "Voltage rating"
    annotation (Dialog(group="Device parameters"));

   parameter SI.PerUnit Qg=0 "Reactive power injection (system base)"
    annotation (Dialog(group="Device parameters"));
  parameter Real Kr=0.1 "Regulator gain [pu/pu]"
    annotation (Dialog(group="Device parameters"));
  parameter SI.Time Tr=0.01 "Regulator time constant"
    annotation (Dialog(group="Device parameters"));
  parameter SI.PerUnit i_Max=0.7 "Maximum current (local base)"
    annotation (Dialog(group="Device parameters"));
  parameter SI.PerUnit i_Min=-0.1 "Minimum current (local base)"
    annotation (Dialog(group="Device parameters"));
  parameter SI.PerUnit v_POD=0 "Power oscillation damper signal"
    annotation (Dialog(group="Device parameters"));
  SI.PerUnit i_SH "STATCOM current";
  SI.PerUnit v(start=v_0) "Bus voltage magnitude";
  SI.PerUnit Q(start=Qg) "Injected reactive power (system base)";
protected
  parameter SI.PerUnit In=Sn/Vn "Nominal current (local base)";
  parameter SI.PerUnit I_b=S_b/V_b "Base current";
  parameter SI.PerUnit i_max=i_Max*In/I_b "Max current (system base)";
  parameter SI.PerUnit i_min=i_Min*In/I_b "Min current (system base)";
  parameter SI.PerUnit vr0=v_0*cos(angle_0rad) "Initial real voltage";
  parameter SI.PerUnit vi0=v_0*sin(angle_0rad) "Initial imaginary voltage";
  parameter SI.PerUnit u0=v_ref + v_POD - v_0 "Initial controller input";
  parameter SI.PerUnit i0=Qg/v_0 "Initial current";
  parameter SI.PerUnit v_ref=i0/Kr + v_0 - v_POD "Reference voltage";

  SI.PerUnit u(start=u0) "Controller input";
  NonElectrical.Continuous.SimpleLagLim simpleLagLim(
    K=Kr,
    T=Tr,
    y_start=i0,
    outMax=i_max,
    outMin=i_min)
    annotation (Placement(transformation(extent={{-20,-20},{20,20}})));
equation
  v = sqrt(p.vr^2 + p.vi^2);
  0 = p.vr*p.ir + p.vi*p.ii;
  -Q = p.vi*p.ir - p.vr*p.ii;
  u = v_ref + v_POD - v;
  Q = i_SH*v;
  simpleLagLim.u = u;
  simpleLagLim.y = i_SH;
  annotation (
    Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
            100}}), graphics={Rectangle(extent={{-100,100},{100,-100}},
          lineColor={28,108,200}),
                               Ellipse(
          extent={{0,30},{60,-30}},
          lineColor={0,0,255}),
                              Line(
          points={{92,0},{100,0}},
          color={0,0,255},
          smooth=Smooth.None),Line(
          points={{-90,4},{-70,4}},
          color={0,0,255}),
                         Line(
          points={{-90,-4},{-70,-4}},
          color={0,0,255}),   Line(
          points={{-52,20},{-80,20},{-80,4}},
          color={0,0,255}),   Text(
          extent={{-78,-46},{82,-86}},
          lineColor={28,108,200},
          lineThickness=0.5,
          fillColor={255,0,0},
          fillPattern=FillPattern.Solid,
          textString="%name"),
        Line(points={{-18,0},{-14,0}}, color={217,67,180}),
        Polygon(
          points={{-20,-6},{-26,4},{-14,4},{-20,-6}},
          lineColor={217,67,180},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{-40,4},{-46,-6},{-34,-6},{-40,4}},
          lineColor={217,67,180},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Line(points={{-46,4},{-34,4}}, color={217,67,180}),
        Line(points={{-26,-6},{-14,-6}}, color={217,67,180}),
        Rectangle(extent={{-40,20},{-20,-20}}, lineColor={217,67,180}),
        Line(points={{-30,20},{-30,30}}, color={217,67,180}),
        Line(points={{-30,-30},{-30,-20}}, color={217,67,180}),
        Rectangle(extent={{-52,34},{-8,-34}}, lineColor={0,0,255}),
                              Line(
          points={{-8,0},{0,0}},
          color={0,0,255},
          smooth=Smooth.None), Ellipse(
          extent={{32,28},{92,-32}},
          lineColor={0,0,255}),
        Line(points={{-80,-4},{-80,-20},{-52,-20}}, color={0,0,255})}),
    Documentation(info="<html>
<table cellspacing=\"2\" cellpadding=\"0\" border=\"1\"><tr>
<td><p>Reference</p></td>
<td><p>PSAT Manual 2.1.8</p></td>
</tr>
<tr>
<td><p>Last update</p></td>
<td><p>15/07/2015</p></td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p>MAA Murad, SmarTS Lab, KTH Royal Institute of Technology</p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p><a href=\"mailto:luigiv@kth.se\">luigiv@kth.se</a></p></td>
</tr>
</table>
</html>"));
end STATCOM;
