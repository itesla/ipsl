within iPSL.Electrical.Controls.PSAT.AVR;
model AVRtypeIII "PSAT AVR Type 3"
  parameter Real vref = 1 "Reference voltage (pu)";
  parameter Real V_0 = 1 "Voltage magnitude (pu)" annotation(Dialog(group="Power flow data"));
  parameter Real vfmax = 5 "Maximum field voltage (pu)";
  parameter Real vfmin = -5 "Minimum field voltage (pu)";
  parameter Real K0 = 20 "Regulator gain (p.u./p.u.)";
  parameter Real T2 = 0.1 "Regulator pole (s)";
  parameter Real T1 = 0.45 "Regulator zero (s)";
  parameter Real Te = 0.1 "Field circuit time constant (s)";
  Modelica.Blocks.Sources.Constant const(k = vref) annotation(Placement(visible = true, transformation(origin = {-137.3382, -80.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = -270)));
  Modelica.Blocks.Sources.Constant const1(k = 1) annotation(Placement(visible = true, transformation(origin = {35.0, 41.5204}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = -90)));
  Modelica.Blocks.Interfaces.RealInput v(start = 1)
    "Bus voltage magnitude (pu)"                    annotation(Placement(visible = true, transformation(origin = {-167.9721, 0.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0), iconTransformation(origin = {-120.0, 50.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput vf0 "Field voltage reference (pu)"
                                           annotation(Placement(visible = true, transformation(origin = {3.1272, -105.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = -270), iconTransformation(origin = {-120.0, -30.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput vf "Field voltage (pu)"
                                           annotation(Placement(visible = true, transformation(origin = {160.0, 0.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {110.0, 0.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
  Modelica.Blocks.Continuous.TransferFunction transferFunction2(a = {T2, 1}, b = {T1, 1}) annotation(Placement(visible = true, transformation(origin = {-17.5488, 0.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
  Modelica.Blocks.Continuous.TransferFunction transferFunction3(a = {Te, 1}, b = {1}) annotation(Placement(visible = true, transformation(origin = {90.0, -0.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain1(k = K0) annotation(Placement(visible = true, transformation(origin = {-47.4512, 0.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
  Modelica.Blocks.Nonlinear.Limiter limiter1(uMax = vfmax, uMin = vfmin) annotation(Placement(visible = true, transformation(origin = {120.0, 0.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
  Modelica.Blocks.Math.Add add1(k1 = -1) annotation(Placement(visible = true, transformation(origin = {-80.0, 0.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
  Modelica.Blocks.Math.Add add2 annotation(Placement(visible = true, transformation(origin = {15.0, -0.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
  Modelica.Blocks.Math.Product product2 annotation(Placement(visible = true, transformation(origin = {55.0, 0.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
initial equation
  vf = vf0;

equation
  connect(v, add1.u1) annotation(Line(visible = true, origin = {-112.493, 3.0}, points = {{-55.4791, -3.0}, {17.493, -3.0}, {17.493, 3.0}, {20.493, 3.0}}, color = {0, 0, 127}));
  connect(const.y, add1.u2) annotation(Line(visible = true, origin = {-122.2255, -27.0}, points = {{-15.1127, -42.0}, {-15.1127, 21.0}, {30.2255, 21.0}}, color = {0, 0, 127}));
  connect(add1.y, gain1.u) annotation(Line(visible = true, origin = {-64.2256, 0.0}, points = {{-4.7744, 0.0}, {4.7744, 0.0}}, color = {0, 0, 127}));
  connect(const1.y, product2.u1) annotation(Line(visible = true, origin = {37.6667, 14.1735}, points = {{-2.6667, 16.3469}, {-2.6667, -8.1735}, {5.3333, -8.1735}}, color = {0, 0, 127}));
  connect(limiter1.y, vf) annotation(Line(visible = true, origin = {145.5, 0.0}, points = {{-14.5, 0.0}, {14.5, 0.0}}, color = {0, 0, 127}));
  connect(add2.u2, vf0) annotation(Line(visible = true, origin = {1.8509, -56.02}, points = {{1.1491, 50.02}, {-1.8509, 50.02}, {-1.8509, -25.53}, {1.2763, -25.53}, {1.2763, -48.98}}, color = {0, 0, 127}));
  connect(add2.y, product2.u2) annotation(Line(visible = true, origin = {37.25, -3.0}, points = {{-11.25, 3.0}, {2.75, 3.0}, {2.75, -3.0}, {5.75, -3.0}}, color = {0, 0, 127}));
  connect(product2.y, transferFunction3.u) annotation(Line(visible = true, origin = {72.0, 0.0}, points = {{-6.0, 0.0}, {6.0, -0.0}}, color = {0, 0, 127}));
  connect(transferFunction2.y, add2.u1) annotation(Line(visible = true, origin = {-0.8872, 3.0}, points = {{-5.6616, -3.0}, {0.8872, -3.0}, {0.8872, 3.0}, {3.8872, 3.0}}, color = {0, 0, 127}));
  connect(gain1.y, transferFunction2.u) annotation(Line(visible = true, origin = {-33.0, 0.0}, points = {{-3.4512, -0.0}, {3.4512, 0.0}}, color = {0, 0, 127}));
  connect(transferFunction3.y, limiter1.u) annotation(Line(visible = true, origin = {104.5, -0.0}, points = {{-3.5, -0.0}, {3.5, 0.0}}, color = {0, 0, 127}));
  annotation(Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics={  Rectangle(visible = true, fillColor = {255, 255, 255}, extent = {{-100.0, -100.0}, {100.0, 100.0}}), Text(visible = true, origin = {1.5941, 2.9728},
            fillPattern =                                                                                                   FillPattern.Solid, extent = {{-31.5941, -24.9719}, {31.5941, 24.9719}}, textString = "AVRtypeIII", fontName = "Arial"), Text(visible = true, origin = {-77.3525, 52.4473},
            fillPattern =                                                                                                   FillPattern.Solid, extent = {{-17.3525, -17.5527}, {17.3525, 17.5527}}, textString = "v", fontName = "Arial"), Text(visible = true, origin = {-74.7671, -32.7013},
            fillPattern =                                                                                                   FillPattern.Solid, extent = {{-11.7427, -9.8104}, {11.7427, 9.8104}}, textString = "vf0", fontName = "Arial"), Text(visible = true, origin = {84.2416, -0.0},
            fillPattern =                                                                                                   FillPattern.Solid, extent = {{-8.7313, -11.5403}, {8.7313, 11.5403}}, textString = "vf", fontName = "Arial")}), Diagram(coordinateSystem(extent={{-148.5,
            -105},{148.5,105}},                                                                                                    preserveAspectRatio=false,  initialScale = 0.1, grid = {5, 5})),
    Documentation(info="<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\">
<tr>
<td><p>Reference</p></td>
<td><p>AVR Type III, PSAT Manual 2.1.8</p></td>
</tr>
<tr>
<td><p>Last update</p></td>
<td>September 2015</td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p>Joan Russinol, SmarTS Lab, KTH Royal Institute of Technology</p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p><a href=\"mailto:luigiv@kth.se\">luigiv@kth.se</a></p></td>
</tr>
</table>
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
end AVRtypeIII;
