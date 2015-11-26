within iPSL.NonElectrical.Continuous;
class LeadLagLim "Lead Lag filter with a non-windup limiter"
  extends Modelica.Blocks.Interfaces.SISO(y(start=y_start));

  parameter Real K "Gain";
  parameter Real T1 "Lead time constant";
  parameter Real T2 "Lag time constant";
  parameter Real y_start "Output start value";
  parameter Real outMax "Maximum output value";
  parameter Real outMin "Minimum output value";
  Real s(start=y_start) "State variable";
protected
  parameter Boolean noLeadLag = abs(T1-T2) < Modelica.Constants.eps;
equation
  if noLeadLag then
    s = 0;
    y = K*u;
  else
    if (y > outMax) then
      der(s) = 0;
      y = outMax;
    elseif (y < outMin) then
      der(s) = 0;
      y = outMin;
      else
     T2 * der(s) =(-s)+K*u;
     T2 * y = ((-s)+K*u)*T1 + T2 * s;
    end if;
  end if;
  annotation (Icon(graphics={
    Line(points={{38,100},{58,140},{98,140}},          color={0,0,0}),
    Line(points={{-102,-140},{-62,-140},{-42,-100}},   color={0,0,0}),                             Text(extent={{
              -50,82},{70,22}},                                                                                                   lineColor=
              {0,0,255},
          textString="1+sT"),                                                                      Text(extent={{
              56,44},{76,24}},                                                                                                    lineColor=
              {0,0,255},
          textString="1"),                                                                                                    Line(points={{
              -52,0},{76,0}},                                                                                                    color = {0, 0, 255}, smooth = Smooth.Bezier, thickness = 0.5),
                                                                                                    Text(extent={{
              -50,-20},{70,-80}},                                                                                                    lineColor=
              {0,0,255},
          textString="1+sT"),                                                                      Text(extent={{
              58,-58},{78,-78}},                                                                                                  lineColor=
              {0,0,255},
          textString="2"),                                                                          Text(extent={{
              -106,28},{-46,-32}},                                                                                                   lineColor=
              {0,0,255},
          textString="K")}));
end LeadLagLim;
