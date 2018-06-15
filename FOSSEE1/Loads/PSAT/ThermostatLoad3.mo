within FOSSEE1.Loads.PSAT;
model ThermostatLoad3
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
  parameter Real K1=100 "Active power gain, F(Fahrenheit)/p.u.";
  parameter Real KL=2 "Ceiling conductance output, p.u./p.u.";
  //parameter Real g0= P_0/(V_0^2);
  parameter Real g_max=KL*g0 "Maximum conductance, P.u.";
  parameter Real theta0=70 "Initial value of state variable theta, power flow";
  parameter Real x0=0.040539357  "Initial value of state variable x, power flow";
  parameter Real g0=0.040539357;
  // parameter Real p10=P_0*kp;
  Real theta;
  Real x(  start= x0);
  Real g;
  Real v( start= V_0);
initial equation
g=g0;
equation
if der(Theta_ref- theta)  > g_max and (Theta_ref- theta)>0 then
  v=sqrt(p.vr*p.vr + p.vi*p.vi);
  der(theta)=(Theta_a-theta+K1*P)/T1;
  der(x)=0;
  g=g_max;
  P=g*v^2/S_b;
  Q=Q_0/S_b;
elseif (der(Theta_ref-theta)) <= 0 then
  v=sqrt(p.vr*p.vr + p.vi*p.vi);
  der(theta)=(Theta_a-theta+K1*P)/T1;
  der(x)=0;
  g=0;
  P=P_0/S_b;
  Q=Q_0/S_b;
else
  v=sqrt(p.vr*p.vr + p.vi*p.vi);
  der(theta)=(Theta_a-theta+K1*P)/T1;
  der(x)=Ki*(Theta_ref-theta)/Ti;
  g=Kp*(Theta_ref-theta)+x;
  P=g*v^2/S_b;
  Q=(Q_0)/S_b;
end if;
end ThermostatLoad3;
