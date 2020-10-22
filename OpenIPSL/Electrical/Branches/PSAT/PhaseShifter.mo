within OpenIPSL.Electrical.Branches.PSAT;
model PhaseShifter
  parameter SI.PerUnit vk0=1 "Initial primary voltage";
  parameter SI.PerUnit vm0=1 "Initial secondary voltage";
  parameter Real Kp=0.05 "Proportional gain";
  parameter Real Ki=0.01 "Integral gain";
  parameter SI.Time Tm=0.001 "Measurement time constant";
  parameter SI.Angle alpha0=0 "Initial phase shifting angle";
  parameter SI.PerUnit pmes0=0.01 "Initial measured power flow";
  parameter SI.PerUnit pref=0.01 "Desired power flow";
  parameter SI.Angle alpha_max=C.pi/2 "Maximum phase angle";
  parameter SI.Angle alpha_min=-C.pi/2 "Minimum phase angle";

  outer SI.PerUnit pk "Actual secondary power flow";

  SI.PerUnit pmes(start=pmes0) "Measured power flow";
  SI.Angle alpha(start=alpha0) "Shifting angle";

  Interfaces.PwPin          p
    annotation (Placement(transformation(extent={{-120,-10},{-100,10}})));
  Interfaces.PwPin n annotation (Placement(transformation(extent={{100,-10},{120,10}}), iconTransformation(extent={{100,-10},{120,10}})));
equation
  if alpha > alpha_max and der(alpha) > 0 and der(pmes) > 0 then
    der(alpha) = 0;
    der(pmes) = (pk - pmes)/Tm;
    p.vr = n.vr*cos(alpha_max) - n.vi*sin(alpha_max);
    p.vi = n.vr*sin(alpha_max) + n.vi*cos(alpha_max);

  elseif alpha < alpha_min and der(alpha) < 0 and der(pmes) < 0 then
    der(alpha) = 0;
    der(pmes) = (pk - pmes)/Tm;
    p.vr = n.vr*cos(alpha_min) - n.vi*sin(alpha_min);
    p.vi = n.vr*sin(alpha_min) + n.vi*cos(alpha_min);
  else
    der(alpha) = Kp*(pk - pmes)/Tm + Ki*(pmes - pref);
    der(pmes) = (pk - pmes)/Tm;
    p.vr = n.vr*cos(alpha) - n.vi*sin(alpha);
    p.vi = n.vr*sin(alpha) + n.vi*cos(alpha);
  end if;
  p.ir + n.ir = 0;
  p.ii + n.ii = 0;

  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end PhaseShifter;
