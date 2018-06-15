within FOSSEE1.Load;
model ThermostaticallyControlledLoad2
  extends OpenIPSL.Electrical.Loads.PSAT.BaseClasses.baseLoad;

 // parameter Real V_0=0.99333 "Nominal voltage, initial voltage after the power flow";
 // parameter Real P_0=0.8 "Active power rating in pu refered to the load";
 // parameter Real Q_0=0.6;
 // parameter Real kp=0.50 "Percentage of active power, %";
  parameter Real Kp=100 "Gain of proportional controller, p.u./p.u.";
  parameter Real Ki=25 "Gain of integral controller, p.u./p.u.";
  parameter Real Ti=10 "Time constant of integral controller, s";
  parameter Real T1=1200 "Time constant of thermal load, s";
  parameter Real Theta_a=10 "Ambient Temperature, F(Fahrenheit)";
  parameter Real Theta_ref=70 "Reference Temperature, F(Fahrenheit)";
  parameter Real K1=1500 "Active power gain, F(Fahrenheit)/p.u.";
  parameter Real KL=2 "Ceiling conductance output, p.u./p.u.";
  //parameter Real g0= P_0/(V_0^2);
  //parameter Real g_max=KL*g0 "Maximum conductance, P.u.";
  parameter Real g_max= 0.081078715440752;
  parameter Real theta0=70 "Initial value of state variable theta, power flow";
  parameter Real x0=0.040539357  "Initial value of state variable x, power flow";
  parameter Modelica.SIunits.PerUnit Vmax=1.2 "maximum voltage";
  parameter Modelica.SIunits.PerUnit Vmin=0.8 "minimum voltage";
  parameter Boolean forcePQ=true;

  parameter Real g0=0.040539357;
 // parameter Real p10=P0*kp;
  Real theta(start=theta0);
  Real p1;
  Real x(start=x0);
  Real g;
  Real v(start=V_0);

initial equation
g=g0;
equation

//if (theta_ref-der(theta)>g_max) and (theta_ref-der(theta)>0) then
if ((Theta_ref-theta)>g_max) then
    x=g_max;

//elseif (theta_ref-der(theta)<=0) and (der(x)<0) then
elseif (Theta_ref-theta<=0) then
 x=0;

else
  der(x)=Ki*(Theta_ref-theta)/Ti;
end if;

if (g>g_max) then
  g=g_max;
elseif (g<=0) then
 g=0;
else
 g=Kp*(Theta_ref-theta)+x;
end if;

  v=sqrt(p.vr*p.vr + p.vi*p.vi);
  der(theta)=(Theta_a-theta+K1*p1)/T1;
  p1=g*v^2/S_b;

  if forcePQ or initial() then
    P = P_0/S_b;
    Q = Q_0/S_b;

  elseif (v > Vmax) then
    // needs a better implementation
    P = P_0*V^2/(Vmax^2)/S_b;
    Q = Q_0*V^2/(Vmax^2)/S_b;

  elseif (v < Vmin) then
    P = P_0*V^2/Vmin^2/S_b;
    Q = Q_0*V^2/(Vmin^2)/S_b;
  else
    P = P_0/S_b;
    Q = Q_0/S_b;
  end if;

end ThermostaticallyControlledLoad2;
