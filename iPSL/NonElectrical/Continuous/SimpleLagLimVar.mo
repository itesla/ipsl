within iPSL.NonElectrical.Continuous;
model SimpleLagLimVar "Integrator with a non-windup limiter"
  extends Modelica.Blocks.Interfaces.SISO(y(start=y_start));

  parameter Real K "Gain";
  parameter Modelica.SIunits.Time T "Lag time constant";
  parameter Real y_start "Output start value";

protected
  parameter Boolean zeroT = abs(T) < Modelica.Constants.eps;
public
  Modelica.Blocks.Interfaces.RealInput outMax annotation (Placement(
        transformation(extent={{98,106},{138,146}}), iconTransformation(
        extent={{-20,-20},{20,20}},
        rotation=-90,
        origin={80,140})));
  Modelica.Blocks.Interfaces.RealInput outMin annotation (Placement(
        transformation(extent={{-90,-6},{-50,34}}), iconTransformation(
        extent={{-20,-20},{20,20}},
        rotation=90,
        origin={-80,-140})));
equation
  if zeroT then
    y=u*K;
  else
    if (y>=outMax) and (((K*u-y)/T) > 0) then
      der(y) = 0;
    elseif (y<=outMin) and (((K*u-y)/T) < 0) then
      der(y) = 0;
    else
      T*der(y) = K*u - y;
    end if;
  end if;

  annotation (Documentation(info="<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\">
<tr>
<td><p>Reference</p></td>
<td>IEEE Std. 421.5-2005, Annex E</td>
</tr>
<tr>
<td><p>Last update</p></td>
<td>2015-11-25</td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p>Tin Rabuzin,SmarTS Lab, KTH Royal Institute of Technology</p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p><a href=\"mailto:luigiv@kth.se\">luigiv@kth.se</a></p></td>
</tr>
</table>
</html>"), Icon(coordinateSystem(preserveAspectRatio=true,  extent={{-100,-100},
            {100,100}}), graphics={
    Line(points={{40,100},{60,140},{100,140}},         color={0,0,0}),                             Text(extent={{
              -20,68},{20,8}},                                                                                                    lineColor=  {0, 0, 255}, textString=  "K"),
                                                                                                    Line(points={{
              -80,0},{78,0}},                                                                                                    color=  {0, 0, 255}, smooth=  Smooth.Bezier, thickness=  0.5),
                                                                                                    Text(extent={{
              -70,-20},{70,-80}},                                                                                                    lineColor=
              {0,0,255},
          textString="1 + Ts"),
    Line(points={{-100,-140},{-60,-140},{-40,-100}},   color={0,0,0})}),
    Diagram);
end SimpleLagLimVar;
