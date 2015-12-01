within Nordic44.Components_subsystems;
model Load
  import PowerSystems;

  PowerSystems.Connectors.PwPin p(
    vr(start=vr0),
    vi(start=vi0),
    ir(start=ir0),
    ii(start=ii0)) annotation (Placement(transformation(extent={{-56,-10},{
            -36,10}}), iconTransformation(extent={{-80,0},{-60,20}})));
  constant Real pi=Modelica.Constants.pi;
  parameter Real v0 "initial value of bus voltage, p.u.";
  parameter Real anglev0 "initial value of bus voltage, degrees";
  parameter Complex S_p "Power in p.u. of the P part of ZIP-load";
  parameter Complex S_i "Current in p.u. of the I part of ZIP-load";
  parameter Complex S_y "Admittance?  in p.u. of the Z part of ZIP-load";
  parameter Complex a "load transfer fraction to constant current load";
  parameter Complex b
    "load transfer fraction to constant shunt admittance load";
  parameter Real PQBRAK=0.7 "Constant power characteristic threshold";

  //initialization
  parameter Real anglev_rad=anglev0*pi/180 "initial value of bus anglev in rad";
  //protected
  parameter Real p0=S_i.re*v0 + S_y.re*v0^2 + S_p.re;
  //should be the value before converted
  parameter Real q0=S_i.im*v0 + S_y.im*v0^2 + S_p.im;
  parameter Real vr0=v0*cos(anglev_rad) "Initialitation";
  parameter Real vi0=v0*sin(anglev_rad) "Initialitation";
  // new and improved:
  parameter Real loadangle=atan2(q0, p0);
  parameter Real currentmag=if p0 > 0 then p0/(v0*cos(loadangle)) elseif q0
       > 0 then q0/(v0*sin(loadangle)) else 0;
  parameter Real ir0=currentmag*cos(anglev_rad + loadangle) "Initialitation";
  parameter Real ii0=currentmag*sin(anglev_rad + loadangle) "Initialitation";

  /*parameter Real ir0=-(p0*vr0 - q0*vi0)/(vr0^2 + vi0^2) "Initialitation";
parameter Real ii0=-(p0*vi0 + q0*vr0)/(vr0^2 + vi0^2) "Initialitation";*/
  //Converting load
  parameter Complex S_P=Complex((1 - a.re - b.re)*S_p.re, (1 - a.im - b.im)
      *S_p.im);
  parameter Complex S_I=S_i + Complex(a.re*S_p.re/v0, a.im*S_p.im/v0);
  parameter Complex S_Y=S_y + Complex(b.re*S_p.re/v0^2, b.im*S_p.im/v0^2);
  //constant current load vary function when voltage is below 0.5
  parameter Real a2=1.502;
  parameter Real b2=1.769;
  //constant Power load vary function when voltage is below 0.5
  parameter Real a0=0.4881;
  // (0.4866, 0.4895)
  parameter Real a1=-0.4999;
  // (-0.5009, -0.4989)
  parameter Real b1=0.1389;
  // (0.1336, 0.1442)
  parameter Real wp=3.964;
  //(3.941, 3.988)
public
  Real v(start=v0);
  Real kP(start=1);
  Real kI(start=1);
  Real P(start=p0, fixed=false);
  Real Q(start=q0, fixed=false);
  Real anglev(start=anglev_rad);
equation
  if v < PQBRAK then
    kP = a0 + a1*cos(v*wp) + b1*sin(v*wp);
  else
    kP = 1;
  end if;

  if v < 0.5 then
    kI = a2*b2*v^(b2 - 1)*exp(-a2*v^b2);
  else
    kI = 1;
  end if;
  (kI*S_I.re*v + S_Y.re*v^2 + kP*S_P.re) = p.vr*p.ir + p.vi*p.ii;
  (kI*S_I.im*v + S_Y.im*v^2 + kP*S_P.im) = -p.vr*p.ii + p.vi*p.ir;
  P = p.vr*p.ir + p.vi*p.ii;
  Q = -p.vr*p.ii + p.vi*p.ir;
  v = sqrt(p.vr^2 + p.vi^2);
  anglev = atan2(p.vi, p.vr);
  annotation (Diagram(graphics), Icon(coordinateSystem(preserveAspectRatio=
            false, extent={{-100,-100},{100,100}}), graphics={Polygon(
          points={{-60,60},{-60,-40},{40,10},{-60,60}},
          lineColor={0,0,255},
          smooth=Smooth.None)}));
end Load;
