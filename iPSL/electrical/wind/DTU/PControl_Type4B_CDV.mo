within iPSL.Electrical.Wind.DTU;
model PControl_Type4B_CDV
  "Active Power Control for IEC Type4B Model. Developed by DTU"
  parameter Real w_init "Initial steady state generator speed";
  parameter Real T_Ufilt "Voltage measurement filter time constant";
  parameter Real dPmax "Wind turbine maximum power ramp rate";
  parameter Real ini_Pcmd(fixed = false) "Initial Active Power";
  parameter Real ini_Uwtt(fixed = false) "Initial Voltage Magnitude";
  parameter Real ini_iPcmd(fixed = false) "Initial Active Current Magnitude";
  parameter Real Tpord "Time constant in power order lag";
  parameter Real Tpaero "Time constant in aerodynamic power response";
  Modelica.Blocks.Interfaces.RealInput iPmax annotation(Placement(transformation(extent = {{-61, 5}, {-51, 15}}), iconTransformation(extent = {{-61, 5}, {-51, 15}})));
  Modelica.Blocks.Interfaces.RealInput Uwtt annotation(Placement(transformation(extent = {{-61, 27}, {-51, 37}}), iconTransformation(extent = {{-61, 27}, {-51, 37}})));
  Modelica.Blocks.Interfaces.RealInput w_gen annotation(Placement(transformation(extent = {{-61, -15}, {-51, -5}}), iconTransformation(extent = {{-61, -15}, {-51, -5}})));
  Modelica.Blocks.Interfaces.RealInput Pwtt_ref annotation(Placement(transformation(extent = {{-61, -37}, {-51, -27}}), iconTransformation(extent = {{-61, -37}, {-51, -27}})));
  Modelica.Blocks.Interfaces.RealOutput iPcmd annotation(Placement(transformation(extent = {{39, -5}, {49, 5}}), iconTransformation(extent = {{39, -5}, {49, 5}})));
  iPSL.NonElectrical.Continuous.ImSimpleLag imSimpleLag(
    K=1,
    T=T_Ufilt,
    nStartValue=ini_Uwtt)
    annotation (Placement(transformation(extent={{-48,21},{-8,59}})));
  iPSL.NonElectrical.Math.ImMult2 imMult2_1(
    a0=0,
    a1=1,
    a2=1) annotation (Placement(transformation(extent={{-38,14},{-18,34}})));
  iPSL.NonElectrical.Math.ImGain imGain(K=1/w_init)
    annotation (Placement(transformation(extent={{-50,-50},{-30,-30}})));
  iPSL.NonElectrical.Math.ImMult2 imMult2_2(
    a0=0,
    a1=1,
    a2=1) annotation (Placement(transformation(extent={{-28,-48},{-8,-28}})));
  iPSL.NonElectrical.Nonlinear.ImLimiter imLimiter(Ymin=0.01, Ymax=999)
    annotation (Placement(transformation(extent={{-12,30},{8,50}})));
  iPSL.NonElectrical.Math.ImSetPoint imSetPoint(V=-999)
    annotation (Placement(transformation(extent={{12,-56},{32,-36}})));
  iPSL.NonElectrical.Math.ImDiv2 imDiv2_1(
    a0=0,
    a1=1,
    a2=1,
    nStartValue=ini_iPcmd)
    annotation (Placement(transformation(extent={{6,-14},{32,14}})));
  iPSL.NonElectrical.Continuous.ImSimpleLag_varnonwindup imSimpleLag_varnonwindup(
    initValue=ini_Pcmd,
    rmin=-999,
    rmax=dPmax,
    T=Tpord) annotation (Placement(transformation(extent={{26,-52},{56,-24}})));
  iPSL.NonElectrical.Continuous.ImSimpleLag imSimpleLag1(
    K=1,
    nStartValue=ini_Pcmd,
    T=Tpaero) annotation (Placement(transformation(extent={{56,-80},{76,-60}})));
  Modelica.Blocks.Interfaces.RealOutput imPin annotation(Placement(transformation(extent = {{-5, -6}, {5, 6}}, rotation = -90, origin = {-1, -36})));
initial equation
  ini_Uwtt = Uwtt;
  ini_Pcmd = Pwtt_ref;

equation
  connect(imMult2_1.p1, Uwtt) annotation(Line(points = {{-33.1, 26.2}, {-44.55, 26.2}, {-44.55, 32}, {-56, 32}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(imMult2_1.p2, iPmax) annotation(Line(points = {{-33.1, 21.8}, {-44.55, 21.8}, {-44.55, 10}, {-56, 10}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(Uwtt, imSimpleLag.p1) annotation(Line(points = {{-56, 32}, {-46, 32}, {-46, 40}, {-34.2, 40}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(Pwtt_ref, imGain.p1) annotation(Line(points = {{-56, -32}, {-50, -32}, {-50, -40}, {-45.1, -40}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(imSimpleLag.n1, imLimiter.p1) annotation(Line(points={{-14,40},{-7.1,40}},        color = {0, 0, 127}, smooth = Smooth.None));
  connect(imLimiter.n1, imDiv2_1.p2) annotation(Line(points = {{2.9, 40}, {2, 40}, {2, -2.8}, {12.37, -2.8}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(imDiv2_1.n1, iPcmd) annotation(Line(points = {{25.37, 0.00000000000000177636}, {34.685, 0.00000000000000177636}, {34.685, 0}, {44, 0}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(iPcmd, iPcmd) annotation(Line(points = {{44, 0}, {44, 0}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(imSimpleLag_varnonwindup.yi, imMult2_2.n1) annotation(Line(points = {{30.95, -38}, {10, -38}, {10, -26}, {-8, -26}, {-8, -38}, {-13.1, -38}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(imMult2_1.n1, imSimpleLag_varnonwindup.max) annotation(Line(points = {{-23.1, 24}, {-4, 24}, {-4, -20}, {46, -20}, {46, -30}, {45.65, -30}, {45.65, -29.6}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(imSimpleLag_varnonwindup.min, imSetPoint.n1) annotation(Line(points = {{38.75, -46.4}, {26, -46.4}, {26, -46}, {26.9, -46}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(imSimpleLag_varnonwindup.yo, imDiv2_1.p1) annotation(Line(points = {{50.9, -38.14}, {62, -38.14}, {62, -12}, {8, -12}, {8, 2.8}, {12.37, 2.8}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(imSimpleLag1.p1, imDiv2_1.p1) annotation(Line(points = {{62.9, -70}, {62, -70}, {62, -38}, {60, -38}, {62, -38.14}, {62, -12}, {8, -12}, {8, 2.8}, {12.37, 2.8}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(imSimpleLag1.n1, imPin) annotation(Line(points={{73,-70},{84,-70},{84,
          -76},{-1,-76},{-1,-36}},                                                                                    color = {0, 0, 127}, smooth = Smooth.None));
  connect(imGain.n1, imMult2_2.p2) annotation(Line(points = {{-35.1, -40}, {-30, -40}, {-30, -40.2}, {-23.1, -40.2}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(imMult2_2.p1, w_gen) annotation(Line(points = {{-23.1, -35.8}, {-26, -35.8}, {-26, -36}, {-30, -36}, {-30, -10}, {-56, -10}}, color = {0, 0, 127}, smooth = Smooth.None));
  annotation(Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics), Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics={  Rectangle(extent=  {{-50, 32}, {40, -32}}, lineColor=  {0, 0, 255},
            lineThickness=                                                                                                    0.5), Text(extent=  {{-26, 14}, {18, -10}}, lineColor=  {0, 0, 255},
            lineThickness=                                                                                                    0.5,
            fillPattern=                                                                                                    FillPattern.Solid, textString=  "Type 4B
P Control"),
     Text(extent=  {{-50, 30}, {-30, 24}}, lineColor=  {0, 0, 255}, textString=  "Uwtt"), Text(extent=  {{-49, 13}, {-29, 7}}, lineColor=  {0, 0, 255}, textString=  "iPmax"), Text(extent=  {{-49, -6}, {-29, -12}}, lineColor=  {0, 0, 255}, textString=  "w_gen"), Text(extent=  {{-47, -24}, {-27, -30}}, lineColor=  {0, 0, 255}, textString=  "Pwtt_ref"), Text(extent=  {{20, 3}, {40, -3}}, lineColor=  {0, 0, 255}, textString=  "iPcmd")}),
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
end PControl_Type4B_CDV;
