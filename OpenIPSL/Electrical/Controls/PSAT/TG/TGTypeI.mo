within OpenIPSL.Electrical.Controls.PSAT.TG;
model TGTypeI
  Modelica.Blocks.Interfaces.RealInput w "Rotor speed (pu)" annotation (
      Placement(transformation(extent={{-140,-20},{-100,20}})));
  Modelica.Blocks.Interfaces.RealOutput pm "Mechanical power (pu)" annotation (
      Placement(transformation(extent={{100,-10},{120,10}})));
  parameter Real wref=1 "Speed reference (pu)";
  parameter Real pref "Active power reference (pu)";
  parameter Real R "Droop (pu)";
  parameter Real pmax "Maximum turbine output (pu)";
  parameter Real pmin "Minimum turbine output (pu)";
  parameter Real Ts "Governor time constant (s)";
  parameter Real Tc "Servo time constant (s)";
  parameter Real T3 "Transient gain time constant (s)";
  parameter Real T4 "Power fraction time constant (s)";
  parameter Real T5 "Reheat time constant (s)";
  Real pin "Turbine output (pu)";
protected
  parameter Real pin0=pref "Initialization";
  parameter Real xg10=pin0 "Initialization";
  parameter Real xg20=(1 - T3/Tc)*xg10 "Initialization";
  parameter Real xg30=(1 - T4/T5)*(xg20 + T3*xg10/Tc) "Initialization";
  Real pinstar;
  Real xg1(start=xg10, fixed=true);
  Real xg2(start=xg20, fixed=true);
  Real xg3(start=xg30, fixed=true);
equation
  pinstar = pref + (wref - w)/R;
  if pinstar >= pmin and pinstar <= pmax then
    pin = pinstar;
  elseif pinstar > pmax then
    pin = pmax;
  else
    pin = pmin;
  end if;
  der(xg1) = (pin - xg1)/Ts;
  der(xg2) = ((1 - T3/Tc)*xg1 - xg2)/Tc;
  der(xg3) = ((1 - T4/T5)*(xg2 + T3*xg1/Tc) - xg3)/T5;
  pm = xg3 + (xg2 + T3*xg1/Tc)*T4/T5;
  annotation (
    Icon(graphics={ Text(
          extent={{-100,10},{-60,-10}},
          lineColor={0,0,0},
          textString="w"),Text(
          extent={{60,10},{100,-10}},
          lineColor={0,0,0},
          textString="pm"),
       Text(
          extent={{-60,0},{60,-80}},
          lineColor={0,0,255},
          textString="TGTypeI"),
        Rectangle(extent={{-100,100},{100,-100}}, lineColor={0,0,0}),
        Text(
          extent={{-80,80},{80,20}},
          lineColor={0,0,0},
          textString="%name")}),
    Documentation(info="<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\">
<tr>
<td><p>Reference</p></td>
<td>Turbine and Governor - control scheme Type I</td>
</tr>
<tr>
<td><p>Last update</p></td>
<td>2015-10-02</td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p>Le Qi, SmarTS Lab, KTH Royal Institute of Technology</p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p><a href=\"mailto:luigiv@kth.se\">luigiv@kth.se</a></p></td>
</tr>
</table>
</html>"));
end TGTypeI;
