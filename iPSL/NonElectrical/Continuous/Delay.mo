within iPSL.NonElectrical.Continuous;
class Delay "Time delay"
  extends Modelica.Blocks.Interfaces.SISO(u(start=u_start));

  parameter Modelica.SIunits.Time T "Delay";
  parameter Real u_start = 1 "Input start value";
protected
  parameter Real T1 = T / 2;
  parameter Real T2 = T * T / 12;
  Real x1(start = u_start * T ^ 2 / 12);
  Real x2(start = 0);
equation
  // 2nd order Pade approximation of e^(-Ts)
  der(x1) = x2;
  der(x2) = (-12 / T ^ 2 * x1) - 6 / T * x2 + u;
  y = (-12 / T * x2) + u;
  annotation(Icon(graphics={                                                                                                    Text(extent={{
              -28,32},{12,-28}},                                                                                                    lineColor=
              {0,0,255},
            horizontalAlignment=TextAlignment.Left,                                                                                                    textStyle=
              {TextStyle.Bold},
          textString="e"),                                                                                                    Text(extent={{
              -4,52},{56,12}},                                                                                                    lineColor=
              {0,0,255},
            horizontalAlignment=TextAlignment.Left,                                                                                                    textStyle=
              {TextStyle.Bold},
          textString="-sT")}),                                                                                                    Diagram(graphics),
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
end Delay;
