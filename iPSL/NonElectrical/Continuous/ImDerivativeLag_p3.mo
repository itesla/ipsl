within iPSL.NonElectrical.Continuous;
model ImDerivativeLag_p3 "Approximated derivative block"
  parameter Real Pelec0 "Input start val";
  Modelica.Blocks.Interfaces.RealInput p1(start = Pelec0) annotation(Placement(transformation(extent = {{-103, -12}, {-83, 8}}), iconTransformation(extent = {{-53, -8}, {-44, 6}})));
  Modelica.Blocks.Interfaces.RealOutput n2 annotation(Placement(transformation(extent = {{139, -12}, {159, 8}}), iconTransformation(extent = {{35, -6}, {44, 8}})));
  parameter Real K2 "Gain";
  parameter Real T2 "Lag time constant";
public
  iPSL.NonElectrical.Math.ImSum2 imSum2_1(
    a0=0,
    a1=1,
    a2=-1) annotation (Placement(transformation(
        extent={{10,12},{-10,-12}},
        rotation=180,
        origin={-18,-2})));
  iPSL.NonElectrical.Continuous.ImSimpleLag imSimpleLag(
    K=1,
    T=T2,
    nStartValue=-Pelec0*K2) annotation (Placement(transformation(
        extent={{-25,-18},{25,18}},
        rotation=0,
        origin={-47,-8})));
  iPSL.NonElectrical.Math.ImGain imGain(K=-K2) annotation (Placement(
        transformation(
        extent={{10,-11},{-10,11}},
        rotation=180,
        origin={-68,-1})));
public
  iPSL.NonElectrical.Math.ImSum2 imSum2_2(
    a0=0,
    a1=1,
    a2=-1) annotation (Placement(transformation(
        extent={{10,12},{-10,-12}},
        rotation=180,
        origin={50,-2})));
  iPSL.NonElectrical.Continuous.ImSimpleLag imSimpleLag1(
    K=1,
    T=T2,
    nStartValue=0) annotation (Placement(transformation(
        extent={{-25,-18},{25,18}},
        rotation=0,
        origin={21,-8})));
  iPSL.NonElectrical.Math.ImGain imGain1(K=K2) annotation (Placement(
        transformation(
        extent={{10,-11},{-10,11}},
        rotation=180,
        origin={0,-1})));
public
  iPSL.NonElectrical.Math.ImSum2 imSum2_3(
    a0=0,
    a1=1,
    a2=-1) annotation (Placement(transformation(
        extent={{10,12},{-10,-12}},
        rotation=180,
        origin={118,-2})));
  iPSL.NonElectrical.Continuous.ImSimpleLag imSimpleLag2(
    K=1,
    T=T2,
    nStartValue=0) annotation (Placement(transformation(
        extent={{-25,-18},{25,18}},
        rotation=0,
        origin={89,-8})));
  iPSL.NonElectrical.Math.ImGain imGain2(K=K2) annotation (Placement(
        transformation(
        extent={{10,-11},{-10,11}},
        rotation=180,
        origin={68,-1})));
equation
  connect(imSimpleLag.n1, imSum2_1.p2) annotation(Line(points={{-29.5,-8},{-28,
          -8},{-28,-4.4},{-23.1,-4.4}},                                                                                color = {0, 0, 127}, smooth = Smooth.None));
  connect(imGain.n1, imSum2_1.p1) annotation(Line(points = {{-63.1, -1}, {-59.55, -1}, {-59.55, 0.4}, {-23.1, 0.4}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(imSimpleLag.p1, imGain.n1) annotation(Line(points = {{-54.75, -8}, {-60, -8}, {-60, -1}, {-63.1, -1}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(imGain.p1, p1) annotation(Line(points = {{-73.1, -1}, {-78.55, -1}, {-78.55, -2}, {-93, -2}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(imSimpleLag1.n1, imSum2_2.p2) annotation(Line(points={{38.5,-8},{40,
          -8},{40,-4.4},{44.9,-4.4}},                                                                               color = {0, 0, 127}, smooth = Smooth.None));
  connect(imGain1.n1, imSum2_2.p1) annotation(Line(points = {{4.9, -1}, {8.45, -1}, {8.45, 0.4}, {44.9, 0.4}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(imSimpleLag1.p1, imGain1.n1) annotation(Line(points = {{13.25, -8}, {8, -8}, {8, -1}, {4.9, -1}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(imSum2_1.n1, imGain1.p1) annotation(Line(points = {{-13.1, -2}, {-8, -2}, {-8, -1}, {-5.1, -1}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(imSimpleLag2.n1, imSum2_3.p2) annotation(Line(points={{106.5,-8},{108,
          -8},{108,-4.4},{112.9,-4.4}},                                                                                 color = {0, 0, 127}, smooth = Smooth.None));
  connect(imGain2.n1, imSum2_3.p1) annotation(Line(points = {{72.9, -1}, {76.45, -1}, {76.45, 0.4}, {112.9, 0.4}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(imSimpleLag2.p1, imGain2.n1) annotation(Line(points = {{81.25, -8}, {76, -8}, {76, -1}, {72.9, -1}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(imSum2_2.n1, imGain2.p1) annotation(Line(points = {{54.9, -2}, {60, -2}, {60, -1}, {62.9, -1}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(imSum2_3.n1, n2) annotation(Line(points = {{122.9, -2}, {135.95, -2}, {135.95, -2}, {149, -2}}, color = {0, 0, 127}, smooth = Smooth.None));
  annotation(Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {140, 100}}), graphics={  Rectangle(extent = {{-40, 40}, {38, -36}}, lineColor = {0, 0, 255}), Text(extent = {{-12, 14}, {14, -4}}, lineColor = {0, 0, 255}, textString = "K2sT2"), Text(extent = {{-20, 10}, {18, -30}}, lineColor = {0, 0, 255}, textString = "1 + T2s"), Line(points = {{-14, 0}, {18, 0}}, color = {0, 0, 255}, smooth = Smooth.Bezier), Rectangle(extent = {{24, 36}, {36, 24}}, lineColor = {0, 0, 255}, fillColor = {0, 0, 255},
            fillPattern =                                                                                                   FillPattern.Solid), Text(extent = {{-18, 18}, {-34, -16}}, lineColor = {0, 0, 255}, textString = "("), Text(extent = {{18, 16}, {28, -16}}, lineColor = {0, 0, 255}, textString = ")"), Text(extent = {{24, 20}, {30, 8}}, lineColor = {0, 0, 255}, textStyle = {TextStyle.Bold}, textString = "3"), Rectangle(extent = {{-38, 0}, {-30, -2}}, lineColor = {0, 0, 255},
            fillPattern =                                                                                                   FillPattern.Solid, fillColor = {0, 0, 255})}), Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {140, 100}}), graphics),
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
end ImDerivativeLag_p3;
