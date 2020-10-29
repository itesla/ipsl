within OpenIPSL.Electrical.FACTS.PSAT;
model STATCOM "Static Synchronous Compensator model with equation"
  OpenIPSL.Interfaces.PwPin p(vr(start=vr0), vi(start=vi0)) annotation (
      Placement(transformation(extent={{100,-10},{120,10}}), iconTransformation(
          extent={{100,-10},{120,10}})));
  parameter SI.ApparentPower(displayUnit="MVA") Sb=100 "System base power"
    annotation (Dialog(group="Power flow data"));
  parameter SI.Voltage Vbus=400000 "Bus nominal voltage"
    annotation (Dialog(group="Power flow data"));
  parameter SI.ApparentPower Sn=100 "Power rating (MVA)"
    annotation (Dialog(group="Power flow data"));
  parameter SI.Voltage Vn=400000 "Voltage rating (V)"
    annotation (Dialog(group="Power flow data"));
  parameter SI.Frequency fn=50 "Frequency rating (Hz)"
    annotation (Dialog(group="Power flow data"));
  parameter SI.PerUnit V_0=1 "Voltage magnitude (pu)"
    annotation (Dialog(group="Power flow data"));
  parameter SI.Conversions.NonSIunits.Angle_deg angle_0=-0.000213067852480 "Voltage angle (deg.)"
    annotation (Dialog(group="Power flow data"));
  parameter SI.PerUnit Qg=0.139557595258338 "Reactive power injection(p.u.)"
    annotation (Dialog(group="Power flow data"));
  //parameter Real v_ref=1.002791151905167 "Reference voltage of the STATCOM regulator (pu)" annotation(Dialog(group="Power flow data"));
  parameter Real Kr=50 "Regulator gain (p.u./p.u.)";
  parameter SI.PerUnit Tr=0.01 "Regulator time constant (s)";
  parameter SI.PerUnit i_Max=0.7 "Maximum current (pu)";
  parameter SI.PerUnit i_Min=-0.1 "Minimum current (pu)";
  parameter SI.PerUnit v_POD=0 "Power oscillation damper signal";
  SI.PerUnit i_SH "STATCOM current (pu)";
  SI.PerUnit v(start=V_0) "Bus voltage magnitude (pu)";
  SI.PerUnit Q(start=Qg) "Injected reactive power (pu)";
protected
  parameter Real Iold=Sn/Vn;
  parameter Real Inew=Sb/Vbus;
  parameter SI.PerUnit i_max=i_Max*Iold/Inew;
  parameter SI.PerUnit i_min=i_Min*Iold/Inew;
  parameter SI.PerUnit vr0=V_0*cos(angle_0/180*pi) "Initialitation";
  parameter SI.PerUnit vi0=V_0*sin(angle_0/180*pi) "Initialitation";
  parameter SI.PerUnit uo=v_ref + v_POD - V_0 "Initialization";
  parameter SI.PerUnit io=Qg/V_0 "Initialization";
  parameter SI.PerUnit v_ref=io/Kr + V_0 - v_POD "Initialization";
  //parameter Real vmin=v_ref + v_POD - i_max/Kr;
  //parameter Real vmax=v_ref + v_POD - i_min/Kr;
  //parameter Real umax=i_max/Kr;
  //parameter Real umin=i_min/Kr;
  Real u(start=uo);
  NonElectrical.Continuous.SimpleLagLim simpleLagLim(
    K=Kr,
    T=Tr,
    y_start=io,
    outMax=i_Max,
    outMin=i_Min)
    annotation (Placement(transformation(extent={{-10,-8},{10,12}})));
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
          lineColor={0,0,255}),Ellipse(
          extent={{-2,22},{48,-22}},
          lineColor={0,0,0},
          fillColor={215,215,215},
          fillPattern=FillPattern.Solid),Ellipse(
          extent={{34,24},{84,-20}},
          lineColor={0,0,0},
          fillPattern=FillPattern.Solid,
          fillColor={215,215,215}),Line(
          points={{-38,0},{-2,0},{-2,0}},
          color={0,0,255},
          smooth=Smooth.None),Line(
          points={{84,2},{100,2},{100,2}},
          color={0,0,255},
          smooth=Smooth.None),Line(
          points={{-90,6},{-82,6},{-76,6}},
          color={255,0,0},
          smooth=Smooth.None,
          thickness=0.5),Line(
          points={{-90,-6},{-82,-6},{-76,-6}},
          color={255,0,0},
          smooth=Smooth.None,
          thickness=0.5),Line(
          points={{-38,0},{-46,0},{-46,0}},
          color={0,0,255},
          smooth=Smooth.None),Line(
          points={{-84,6},{-84,26},{-46,26},{-46,-24},{-82,-24},{-84,-24},{-84,
            -6},{-84,-6}},
          color={255,0,0},
          thickness=0.5,
          smooth=Smooth.None),Text(
          extent={{-34,-38},{24,-68}},
          lineColor={0,0,0},
          lineThickness=0.5,
          fillColor={255,0,0},
          fillPattern=FillPattern.Solid,
          textString="%Name")}),
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
