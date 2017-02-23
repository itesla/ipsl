within OpenIPSL.Electrical.Buses;
model Bus "Bus model
              2014/03/10"

  OpenIPSL.Interfaces.PwPin p(vr(start=V_0*cos(angle_0*Modelica.Constants.pi
          /180)), vi(start=V_0*sin(angle_0*Modelica.Constants.pi/180)))
    annotation (Placement(
      visible=true,
      transformation(
        origin={0,0},
        extent={{-10.0,-10.0},{10.0,10.0}},
        rotation=0),
      iconTransformation(
        origin={0,0},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  Real V(start=V_0) "Bus voltage magnitude (pu)";
  Modelica.SIunits.Conversions.NonSIunits.Angle_deg angle(start=angle_0) "Bus voltage angle";
  parameter Real V_0=1 "Initial voltage magnitude (pu)"
    annotation (Dialog(group="Power flow data"));
  parameter Modelica.SIunits.Conversions.NonSIunits.Angle_deg angle_0=0 "Initial voltage angle"
    annotation (Dialog(group="Power flow data"));
equation
  V = sqrt(p.vr^2 + p.vi^2);
  angle = atan2(p.vi, p.vr)*180/Modelica.Constants.pi;
  p.ir = 0;
  p.ii = 0;
  annotation (
    Icon(graphics={
        Rectangle(
          visible=true,
          fillPattern=FillPattern.Solid,
          extent={{-10,-100},{10,100}}),
        Text(
          visible=true,
          origin={-0.02605,120.133},
          fillPattern=FillPattern.Solid,
          extent={{-100,-20},{100,20}},
          textString="%name"),
        Text(
          origin={0,-120},
          extent={{-60,-20},{60,20}},
          lineColor={170,0,0},
          textString=DynamicSelect("Vpu", String(V, significantDigits=3))),
        Text(
          origin={0,-160},
          extent={{-60,-20},{60,20}},
          lineColor={170,0,0},
          textString=DynamicSelect("Angle", String(angle, significantDigits=3)+"deg"))}));
end Bus;
