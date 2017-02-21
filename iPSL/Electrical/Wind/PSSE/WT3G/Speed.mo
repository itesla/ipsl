within iPSL.Electrical.Wind.PSSE.WT3G;

function Speed
  extends Modelica.Icons.Function;
  input Real x;
  input Real PMN "  Min limit in torque regulator (pu)";
  input Real wmin;
  input Real w20;
  input Real w40;
  input Real w60;
  input Real w100;
  input Real Pmin " Minimum power for operating at wP100 speed (pu)";
  output Real y;
protected
  parameter Real K1 = (w20 - wmin) / (0.2 - PMN);
  parameter Real K2 = (w40 - w20) / (0.4 - 0.2);
  parameter Real K3 = (w60 - w40) / (0.6 - 0.4);
  parameter Real K4 = (w100 - w60) / (Pmin - 0.6);
  Real K, x0, y0;
algorithm
  if x <= PMN then
    K := 0;
    y0 := wmin;
    x0 := PMN;
  elseif x > Pmin and x <= 0.2 then
    K := K1;
    y0 := wmin;
    x0 := PMN;
  elseif x > 0.2 and x <= 0.4 then
    K := K2;
    y0 := w20;
    x0 := 0.2;
  elseif x > 0.4 and x <= 0.6 then
    K := K3;
    y0 := w40;
    x0 := 0.4;
  elseif x > 0.6 and x <= Pmin then
    K := K4;
    y0 := w60;
    x0 := 0.6;
  else
    K := 0;
    y0 := w100;
    x0 := Pmin;
  end if;
  y := K * (x - x0) + y0 - 1;
end Speed;