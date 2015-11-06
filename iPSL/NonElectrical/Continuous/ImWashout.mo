within iPSL.NonElectrical.Continuous;
model ImWashout
  parameter Real Kp;
  parameter Real Tw;
  parameter Real out0;
  iPSL.NonElectrical.Math.ImGain imGain(K=Kp/Tw)
    annotation (Placement(transformation(extent={{-84,46},{-64,66}})));
  iPSL.NonElectrical.Continuous.ImSimpleLag imSimpleLag(
    K=1,
    T=Tw,
    nStartValue=out0)
    annotation (Placement(transformation(extent={{-74,38},{-38,72}})));
  iPSL.NonElectrical.Math.ImSum2 imSum2_1(
    a0=0,
    a1=-1,
    a2=1) annotation (Placement(transformation(extent={{-44,44},{-24,64}})));
  Modelica.Blocks.Interfaces.RealInput VSI1 "Delta_omega (pu)"
    annotation (Placement(transformation(extent={{-94,48},{-82,60}}),
        iconTransformation(extent={{-94,48},{-82,60}})));
  Modelica.Blocks.Interfaces.RealOutput VSI2 "Delta_omega (pu)"
    annotation (Placement(transformation(extent={{-24,48},{-12,60}})));
equation
  connect(imGain.n1,imSimpleLag. p1) annotation (Line(
      points={{-69.1,56},{-62,56},{-62,55},{-61.58,55}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(imSimpleLag.n1,imSum2_1. p1) annotation (Line(
      points={{-43.4,55},{-40,55},{-40,56},{-39.1,56}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(imSum2_1.p2,imSimpleLag. p1) annotation (Line(
      points={{-39.1,52},{-42,52},{-42,40},{-62,40},{-62,55},{-61.58,55}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(imGain.p1, VSI1) annotation (Line(
      points={{-79.1,56},{-84,56},{-84,54},{-88,54}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(imSum2_1.n1, VSI2) annotation (Line(
      points={{-29.1,54},{-18,54}},
      color={0,0,127},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(extent={{-100,-20},{0,100}}), graphics),
      Icon(coordinateSystem(extent={{-100,-20},{0,100}}, preserveAspectRatio=true),
        graphics={Rectangle(extent={{-82,80},{-24,22}}, lineColor={0,0,255}),
          Text(
          extent={{-74,74},{-30,26}},
          lineColor={0,0,255},
          textString="Washout")}),
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
end ImWashout;
