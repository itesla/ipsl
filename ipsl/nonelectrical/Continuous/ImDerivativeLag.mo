within iPSL.NonElectrical.Continuous;
class ImDerivativeLag "Approximated derivative block.
              2014/03/10"

  input Modelica.Blocks.Interfaces.RealInput p1 annotation(Placement(transformation(extent={{-109,
            -10},{-89,10}}),                                                                                    iconTransformation(extent={{-109,
            -10},{-89,10}})));
  output Modelica.Blocks.Interfaces.RealOutput n1(start = 0, fixed = true) annotation(Placement(transformation(extent={{91,-10},
            {111,10}}),                                                                                                    iconTransformation(extent={{91,-10},
            {111,10}})));
  Real y(start = K * pStartValue);
  parameter Real K "Gain";
  parameter Real T "Lag time constant";
  parameter Real pStartValue "Input start val";
equation
  //equivalent to T*der(n)=K*der(p)-n;
  T * der(y) = (-y) + K * p1;
  T * n1 = (-y) + K * p1;
  annotation(Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
            {100,100}}),
                  graphics={  Rectangle(extent={{-100,100},{100,-100}},  lineColor=  {0, 0, 255}), Text(extent={{
              -18,42},{36,-6}},                                                                                                    lineColor=  {0, 0, 255}, textString=  "Ks"), Text(extent={{
              -38,20},{60,-64}},                                                                                                    lineColor=  {0, 0, 255}, textString=  "1 + Ts"), Line(
          points={{-44,-2},{66,-2}},
          color={0,0,255},
          smooth=Smooth.Bezier,
          thickness=1),                                                                                                    Rectangle(extent={{
              84,96},{96,84}},                                                                                                    lineColor=  {0, 0, 255}, fillColor=  {0, 0, 255},
            fillPattern=                                                                                                    FillPattern.Solid)}), Diagram(graphics),
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
end ImDerivativeLag;
