within iPSL.Electrical.Wind.PSSE.WT3G;
class ConstantLoad

  iPSL.Connectors.PwPin p(
    vr(start=vr0),
    vi(start=vi0),
    ir(start=ir0),
    ii(start=ii0)) annotation (Placement(transformation(extent={{-56,-10},{-36,
            10}}), iconTransformation(extent={{-80,0},{-60,20}})));
  constant Real pi = Modelica.Constants.pi;
  parameter Real v0 "initial value of bus voltage";
  parameter Real anglev0 "initial value of bus anglev in degree";
  //     parameter Real p0 "initial value of p0";
  //   parameter Real q0 "initial value of q0";
  parameter Complex S_p "Original Constant Power load in p.u.";
  parameter Complex S_i "Original Constant current load in p.u.";
  parameter Complex S_y "Original Constant shunt admittance load in p.u.";
  parameter Complex a "load transfer fraction for constant current load";
  parameter Complex b
    "load transfer fraction for constant shunt admittance load";
  parameter Real PQBRAK "Constant power characteristic threshold";
  parameter Complex S_P = Complex((1 - a.re - b.re) * S_p.re, (1 - a.im - b.im) * S_p.im);
  parameter Complex S_I = S_i + Complex(a.re * S_p.re / v0, a.im * S_p.im / v0);
  parameter Complex S_Y = S_y + Complex(b.re * S_p.re / v0 ^ 2, b.im * S_p.im / v0 ^ 2);
protected
  parameter Real anglev_rad = anglev0 * pi / 180
    "initial value of bus anglev in rad";
  parameter Real p0 = S_i.re * v0 + S_y.re * v0 ^ 2 + S_p.re;
  //should be the value before converted
  parameter Real q0 = S_i.im * v0 + S_y.im * v0 ^ 2 + S_p.im;
  parameter Real vr0 = v0 * cos(anglev_rad) "Initialitation";
  parameter Real vi0 = v0 * sin(anglev_rad) "Initialitation";
  parameter Real ir0 = (p0 * vr0 + q0 * vi0) / (vr0 ^ 2 + vi0 ^ 2)
    "Initialitation";
  parameter Real ii0 = (p0 * vi0 - q0 * vr0) / (vr0 ^ 2 + vi0 ^ 2)
    "Initialitation";
public
  Real angle(start = anglev_rad);
  //Real v(start = v0);
  Real k(start = 1);
  Real P;
  Real Q;
  Modelica.Blocks.Interfaces.RealOutput v
    annotation (Placement(transformation(extent={{40,-40},{60,-20}}),
        iconTransformation(extent={{40,-40},{60,-20}})));
equation
  if v < PQBRAK / 2 and v > 0 then
    k = 2 * (v / PQBRAK) ^ 2;
  elseif v > PQBRAK / 2 and v < PQBRAK then
    k = 1 - 2 * ((v - PQBRAK) / PQBRAK) ^ 2;
  else
    k = 1;
  end if;
  angle = atan2(p.vi, p.vr);
  v = sqrt(p.vr ^ 2 + p.vi ^ 2);
  //   k*(S_I.re*v+S_Y.re*v^2+S_P.re)=p.vr*p.ir + p.vi*p.ii;
  //   k*(S_I.im*v+S_Y.im*v^2+S_P.im)=-p.vr*p.ii + p.vi*p.ir;
  1 * (S_I.re * v + S_Y.re * v ^ 2 + S_P.re) = p.vr * p.ir + p.vi * p.ii;
  1 * (S_I.im * v + S_Y.im * v ^ 2 + S_P.im) = (-p.vr * p.ii) + p.vi * p.ir;
  P = p.vr * p.ir + p.vi * p.ii;
  Q = (-p.vr * p.ii) + p.vi * p.ir;
  annotation(Diagram(coordinateSystem(preserveAspectRatio=true, extent={{
            -100,-100},{100,100}}),
                     graphics), Icon(coordinateSystem(preserveAspectRatio=
            false, extent={{-100,-100},{100,100}}),
                                     graphics={  Rectangle(extent=  {{-60, 60}, {40, -40}}, lineColor=  {0, 0, 255}), Rectangle(extent=  {{-40, 40}, {20, -20}}, lineColor=  {0, 0, 255}), Line(points=  {{-40, 40}, {20, -20}}, color=  {0, 0, 255}, smooth=  Smooth.None), Line(points=  {{-40, -20}, {20, 40}}, color=  {0, 0, 255}, smooth=  Smooth.None)}),
    Documentation(info="<html>
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
end ConstantLoad;
