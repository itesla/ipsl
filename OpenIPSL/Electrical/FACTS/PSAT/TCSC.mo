within OpenIPSL.Electrical.FACTS.PSAT;
model TCSC "Thyristor Controlled Series Compensator"
  extends Essentials.pfComponent(
    final enabledisplayPF=false,
    final enableangle_0=false,
    final enablev_0=false,
    final enableQ_0=false,
    final enableP_0=false,
    final enablefn=false,
    final enableV_b=true,
    final enableS_b=true);
  OpenIPSL.Interfaces.PwPin p
    annotation (Placement(transformation(extent={{-120,-10},{-100,10}}), iconTransformation(extent={{-119,-10},{-99,10}})));
  OpenIPSL.Interfaces.PwPin n
    annotation (Placement(transformation(extent={{100,-10},{120,10}}), iconTransformation(extent={{100,-10},{120,10}})));


  parameter SI.ApparentPower Sn(displayUnit="MVA")=S_b "Power rating"
    annotation (Dialog(group="Device parameters"));
  parameter SI.Voltage Vn(displayUnit="kV")=V_b "Voltage rating"
    annotation (Dialog(group="Device parameters"));
  parameter Ctrl ctrl=Ctrl.alpha "Type of control of the TCSC";
  parameter SI.Angle alpha_max=0.85 " Maximum firing angle"
    annotation(Dialog(enable=ctrl==Ctrl.alpha));
  parameter SI.Angle alpha_min=0.7 "Minimum firing angle"
    annotation(Dialog(enable=ctrl==Ctrl.alpha));
  parameter SI.PerUnit xTCSC_max=0.05 "Maximum reactance"
    annotation(Dialog(enable=ctrl<>Ctrl.alpha));
  parameter SI.PerUnit xTCSC_min=-0.05 "Minimum reactance"
    annotation(Dialog(enable=ctrl<>Ctrl.alpha));


  parameter Real alpha_TCSCO=0.826168365308219 "Value of state variable x1"
    annotation (Dialog(group="Power flow data"));
  parameter Real x20=0.826168365308219 "Value of the state variable x2"
    annotation (Dialog(group="Power flow data"));
  parameter Real x0i=0.826168365308219 "Value of x0"
    annotation (Dialog(group="Power flow data"));
  parameter SI.PerUnit pref=0.080101913348342 "Reference power"
    annotation (Dialog(group="Power flow data"));
  parameter Real Cp=0.10 "Percentage of series compensation [%]";
  parameter SI.Time Tr=0.5 "Regulator time constant";
  parameter Real Kp=5 "Proportional gain of PI controller [pu/pu]";
  parameter Real Ki=1 "Integral gain of PI controller [pu/pu]";
  parameter Real Kr=10 "Gain of stabilizing signal [pu/pu]";
  parameter Real Vs_POD=0 "Power oscillation damper signal";
  parameter SI.PerUnit x_L=0.2 "Reactance (inductive)";
  parameter SI.PerUnit x_C=0.1 "Reactance (capacitive)";
  parameter SI.PerUnit XL=0.1 "Line reactance";
  parameter SI.PerUnit G=0 "Shunt half conductance";
  parameter SI.PerUnit B=0 "Shunt half susceptance";
  parameter SI.PerUnit rL=0.01 "Line resistance";
  SI.PerUnit vk "Bus voltage of bus k";
  SI.PerUnit vm "Bus voltage of bus m";
  SI.PerUnit pkm(start=pref) "Active power flow from bus k to m (pu)";
  SI.PerUnit b "TCSC series susceptance";
  SI.Angle alpha "TCSC firing angle";
  Real x "State representing x-tilde or alpha-tilde";
  Real x0(start=x0i);
protected
   type Ctrl = enumeration(
      alpha
    "Control using the firing angle alpha",
      xTCSC
    "Control using reactance xTCSC") "Control type of the TCSC"
      annotation (Evaluate=true);

  Real x2(start=x20);
protected
  parameter Real Vb2new=V_b*V_b;
  parameter Real Vb2old=Vn*Vn;
  parameter Real xL=x_L*(Vb2old*S_b)/(Vb2new*Sn)
    "Reactance(inductive),p.u";
  parameter Real xC=x_C*(Vb2old*S_b)/(Vb2new*Sn)
    "Reactance(capacitive),p.u";
  parameter Real X=XL*(Vb2old*S_b)/(Vb2new*Sn) "Line Reactance,p.u";
  parameter Real kx=sqrt(xC/xL);
  parameter Real XL2=(1 - Cp)*XL;
  parameter Real y=1/X;
initial equation
  alpha_TCSC = alpha_TCSCO;
equation
  vk = sqrt(p.vr^2 + p.vi^2) "Voltage magnitude of sending bus";
  vm = sqrt(n.vr^2 + n.vi^2) "Voltage magnitude of receiving bus";
  pkm = p.vr*p.ir + p.vi*p.ii "Transferred active power from k to m";
  x0 = -(Kp*(pkm - pref) - x2);
  if x1 > x1_max and der(x1) > 0 and der(x2) > 0 then
    der(x1) = 0;
    x1 = x1_max;
  elseif x1 < x1_min and der(x1) < 0 and der(x2) < 0 then
    der(x1) = 0;
    x1 = x1_min;
  else
    der(x1) = (x + Kr*Vs_POD - x1)/Tr;
  end if;
  x = Kp*(pkm - pref) + x2;
  der(x2) = -Ki*(pkm - pref);
  b = C.pi*(kx^4 - 2*kx^2 + 1)*cos(kx*(C.pi - alpha))/
        (xC*(C.pi*kx^4*cos(kx*(C.pi - alpha)))
         - C.pi*cos(kx*(C.pi - alpha)) - 2*kx^4*alpha*cos(kx*(C.pi - alpha))
         + 2*alpha*kx^2*cos(kx*(C.pi - alpha)) - kx^4*sin(2*alpha)*cos(kx*(C.pi - alpha))
         + kx^2*sin(2*alpha)*cos(kx*(C.pi - alpha)) - 4*kx^3*cos(alpha)^2*sin(kx*(C.pi - alpha))
         - 4*kx^2*cos(alpha)*sin(alpha)*cos(kx*(C.pi - alpha)));
  n.ii - B*n.vr - G*n.vi = (y + b)*(p.vr - n.vr);
  n.ir - G*n.vr + B*n.vi = (y + b)*(n.vi - p.vi);
  p.ii - B*p.vr - G*p.vi = (y + b)*(n.vr - p.vr);
  p.ir - G*p.vr + B*p.vi = (y + b)*(p.vi - n.vi);
  annotation (
    Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
            100}}), graphics={Rectangle(
          extent={{-4,46},{-4,34}},
          lineColor={0,0,255},
          fillColor={175,175,175},
          fillPattern=FillPattern.Solid),Rectangle(
          extent={{6,46},{6,34}},
          lineColor={0,0,255},
          fillColor={175,175,175},
          fillPattern=FillPattern.Solid),Line(
          points={{-60,40},{-20,40},{-4,40}},
          color={0,0,255},
          smooth=Smooth.None),Line(
          points={{-60,40},{-60,-40},{-22,-40},{-22,-40}},
          color={0,0,255},
          smooth=Smooth.None),Polygon(
          points={{4,-16},{18,-20},{4,-24},{4,-24},{4,-16}},
          lineColor={0,0,255},
          smooth=Smooth.None,
          fillColor={175,175,175},
          fillPattern=FillPattern.Solid),Polygon(
          points={{-7,4},{7,0},{-7,-4},{-7,-4},{-7,4}},
          lineColor={0,0,255},
          smooth=Smooth.None,
          fillColor={175,175,175},
          fillPattern=FillPattern.Solid,
          origin={9,-58},
          rotation=180),Line(
          points={{18,-16},{18,-24}},
          color={0,0,255},
          smooth=Smooth.None),Line(
          points={{2,-54},{2,-62}},
          color={0,0,255},
          smooth=Smooth.None),Line(
          points={{-22,-20},{-22,-58},{-22,-56}},
          color={0,0,255},
          smooth=Smooth.None),Line(
          points={{-22,-58},{2,-58},{2,-58}},
          color={0,0,255},
          smooth=Smooth.None),Line(
          points={{-22,-20},{4,-20},{4,-20}},
          color={0,0,255},
          smooth=Smooth.None),Line(
          points={{18,-20},{40,-20},{40,-58},{16,-58},{16,-58}},
          color={0,0,255},
          smooth=Smooth.None),Line(
          points={{6,40},{60,40},{60,-40},{40,-40}},
          color={0,0,255},
          smooth=Smooth.None),Line(
          points={{-100,0},{-62,0},{-60,0},{-60,0}},
          color={0,0,255},
          smooth=Smooth.None),Line(
          points={{60,0},{100,0},{100,0}},
          color={0,0,255},
          smooth=Smooth.None),Text(
          extent={{-18,68},{16,60}},
          lineColor={0,0,255},
          fillColor={175,175,175},
          fillPattern=FillPattern.Solid,
          textString="%TCSC_Alpha%")}),
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
end TCSC;
