within iPSL.Electrical.Wind.PSSE.WT3G;


model speedtw
  Modelica.Blocks.Interfaces.RealOutput y annotation (Placement(transformation(extent={{98,2},{118,22}})));
  parameter Real wmin=0;
  parameter Real w20=0.2;
  parameter Real w40=0.3;
  parameter Real w60=0.4;
  parameter Real Pmin=0;
  parameter Real w100=1;
  parameter Real K1=(w20 - wmin)/(0.2 - Pmin);
  parameter Real K2=(w40 - w20)/(0.4 - 0.2);
  parameter Real K3=(w60 - w40)/(0.6 - 0.4);
  parameter Real K4=(w100 - w60)/(1 - 0.6);
  Real x0, y0;
  Real K, x, WNDSP1;

  function Speed
    extends Modelica.Icons.Function;
    input Real x;
    input Real wmin;
    input Real w20;
    input Real w40;
    input Real w60;
    input Real Pmin;
    input Real w100;
    output Real y;
  protected
    parameter Real K1=(w20 - wmin)/(0.2 - Pmin);
    parameter Real K2=(w40 - w20)/(0.4 - 0.2);
    parameter Real K3=(w60 - w40)/(0.6 - 0.4);
    parameter Real K4=(w100 - w60)/(1 - 0.6);
    Real x0, y0;
    Real K;
  algorithm
    if x >= Pmin and x < 0.2 then
      K := K1;
      y0 := wmin;
      x0 := 0.2;
    elseif x >= 0.2 and x < 0.4 then
      K := K2;
      y0 := w20;
      x0 := 0.4;
    elseif x >= 0.4 and x < 0.6 then
      K := K3;
      y0 := w40;
      x0 := 0.6;
    elseif x >= 0.6 and x < 1 then
      K := K4;
      y0 := w60;
      x0 := 0.6;
    else
      K := K4;
      y0 := w60;
      x0 := 1;
    end if;
    y := K*(x - x0) + y0;
  end Speed;
equation
  x = time;
  if x >= Pmin and x < 0.2 then
    K = K1;
    y0 = wmin;
    x0 = 0.2;
  elseif x >= 0.2 and x < 0.4 then
    K = K2;
    y0 = w20;
    x0 = 0.4;
  elseif x >= 0.4 and x < 0.6 then
    K = K3;
    y0 = w40;
    x0 = 0.6;
  elseif x >= 0.6 and x < 1 then
    K = K4;
    y0 = w60;
    x0 = 0.6;
  else
    K = K4;
    y0 = w60;
    x0 = 1;
  end if;
  y = K*(x - x0) + y0;
  WNDSP1 = Speed(
    x,
    wmin,
    w20,
    w40,
    w60,
    Pmin,
    w100);
  annotation (Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,100}}), graphics), Documentation(info="<html>
<p><br><span style=\"font-family: MS Shell Dlg 2;\">&LT;iPSL: iTesla Power System Library&GT;</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Copyright 2015 RTE (France), AIA (Spain), KTH (Sweden) and DTU (Denmark)</span></p>
<ul>
<li><span style=\"font-family: MS Shell Dlg 2;\">RTE: http://www.rte-france.com/ </span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">AIA: http://www.aia.es/en/energy/</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">KTH: https://www.kth.se/en</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">DTU:http://www.dtu.dk/english</span></li>
</ul>
<p><span style=\"font-family: MS Shell Dlg 2;\">The authors can be contacted by email: info at itesla-ipsl dot org</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">This package is part of the iTesla Power System Library (&QUOT;iPSL&QUOT;) .</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is free software: you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">You should have received a copy of the GNU Lesser General Public License along with the iPSL. If not, see &LT;http://www.gnu.org/licenses/&GT;.</span></p>
</html>"));
end speedtw;
