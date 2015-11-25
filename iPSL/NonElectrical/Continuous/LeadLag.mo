within iPSL.NonElectrical.Continuous;
class LeadLag "Lead Lag filter"
  extends Modelica.Blocks.Interfaces.SISO(y(start=y_start));

  parameter Real K "Gain";
  parameter Modelica.SIunits.Time T1 "Lead time constant";
  parameter Modelica.SIunits.Time T2 "Lag time constant";
  parameter Real y_start "Output start value";

protected
  Real s(start=y_start) "State variable";
  parameter Boolean noLeadLag = abs(T1-T2) < Modelica.Constants.eps;
equation
  if noLeadLag then
    y = K * u;
    s = 0;
  else
    T2 * der(s) = K * u - s;
    T2 * y = (K * u - s)*T2*T1 + T2 * s;
  end if;

  annotation (                                                                                                    Diagram(graphics),
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
</html>"),
    Icon(graphics={                                                                                Text(extent={{
              -44,82},{76,22}},                                                                                                   lineColor=
              {0,0,255},
          textString="1+sT"),                                                                                                  Line(points={{
              -46,0},{82,0}},                                                                                                    color = {0, 0, 255}, smooth = Smooth.Bezier, thickness = 0.5),
                                                                                                    Text(extent={{
              -44,-20},{76,-80}},                                                                                                    lineColor=
              {0,0,255},
          textString="1+sT"),                                                                       Text(extent={{
              -100,28},{-40,-32}},                                                                                                   lineColor=
              {0,0,255},
          textString="K"),                                                                         Text(extent={{
              62,44},{82,24}},                                                                                                    lineColor=
              {0,0,255},
          textString="1"),                                                                         Text(extent={{
              64,-58},{84,-78}},                                                                                                  lineColor=
              {0,0,255},
          textString="2")}));
end LeadLag;
