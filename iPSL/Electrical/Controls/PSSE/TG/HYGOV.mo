within iPSL.Electrical.Controls.PSSE.TG;
model HYGOV

  parameter Real R = 0.05 "Permanent droop (pu)";
  parameter Real r = 0.3 "Temporary droop (pu)";
  parameter Real T_r = 5 "Governor time constant (s)";
  parameter Real T_f = 0.05 "Filter time constant (s)";
  parameter Real T_g = 0.5 "Servo time constant (s)";
  parameter Real VELM = 0.2 "Gate open/close velocity limit";
  parameter Real G_MAX = 0.9 "Maximum gate limit";
  parameter Real G_MIN = 0 "Minimum gate limit";
  parameter Real T_w = 1.25 "Water time constant (s)";
  parameter Real A_t = 1.2 "Turbine gain";
  parameter Real D_turb = 0.2 "Turbine damping";
  parameter Real q_NL = 0.08 "Water flow at no load";

  iPSL.NonElectrical.Math.ImSetPoint n_ref(V=nref)
    annotation (Placement(transformation(extent={{-100,54},{-80,76}})));
  Modelica.Blocks.Interfaces.RealInput SPEED
    "Machine speed deviation from nominal (pu)"                      annotation(Placement(transformation(extent = {{-110, 36}, {-102, 46}}), iconTransformation(extent={{-84,24},
            {-72,36}})));
  iPSL.NonElectrical.Math.ImSum2 Sum2_1(
    a1=1,
    a2=1,
    a0=0) annotation (Placement(transformation(extent={{-96,32},{-78,48}})));
  iPSL.NonElectrical.Math.ImSum2 w_erro(
    a0=0,
    a1=1,
    a2=-1) annotation (Placement(transformation(extent={{-86,46},{-70,60}})));
  iPSL.NonElectrical.Continuous.ImSimpleLag SimpleLag1(
    K=1,
    T=T_f,
    nStartValue=0)
    annotation (Placement(transformation(extent={{-82,40},{-48,66}})));
  iPSL.NonElectrical.Math.ImGain Gain3(K=R)
    annotation (Placement(transformation(extent={{-58,22},{-78,42}})));
  iPSL.NonElectrical.Math.ImGain Gain4(K=D_turb)
    annotation (Placement(transformation(extent={{-2,14},{18,32}})));
  iPSL.NonElectrical.Math.ImMult2 Mult2_2(
    a0=0,
    a1=1,
    a2=1) annotation (Placement(transformation(extent={{104,16},{124,36}})));
  iPSL.NonElectrical.Math.ImSum2 Sum2_4(
    a0=0,
    a1=-1,
    a2=1) annotation (Placement(transformation(extent={{88,42},{104,60}})));
  iPSL.NonElectrical.Math.ImSetPoint hs(V=1)
    annotation (Placement(transformation(extent={{110,30},{90,50}})));
  iPSL.NonElectrical.Continuous.ImIntegrator_varyK q(nStartValue=q0)
    annotation (Placement(transformation(extent={{98,36},{128,66}})));
  iPSL.NonElectrical.Math.ImSetPoint qNL(V=q_NL)
    annotation (Placement(transformation(extent={{150,28},{130,48}})));
  iPSL.NonElectrical.Math.ImSum2 Sum2_5(
    a0=0,
    a1=1,
    a2=-1) annotation (Placement(transformation(extent={{128,42},{146,60}})));
  iPSL.NonElectrical.Math.ImMult2 Mult2_1(
    a0=0,
    a1=1,
    a2=1) annotation (Placement(transformation(extent={{142,46},{158,62}})));
  iPSL.NonElectrical.Math.ImGain Gain6(K=A_t)
    annotation (Placement(transformation(extent={{156,44},{176,64}})));
  iPSL.NonElectrical.Math.ImSum2 Sum2_6(
    a0=0,
    a1=1,
    a2=-1) annotation (Placement(transformation(extent={{178,32},{196,50}})));
  Modelica.Blocks.Interfaces.RealOutput PMECH "Turbine mechanical power (pu)"
                                                                 annotation(Placement(transformation(extent={{80,-4},
            {90,6}}),                                                                                                    iconTransformation(extent={{80,-4},
            {88,4}})));
  iPSL.NonElectrical.Math.ImDiv2_2 Div3_1(
    a0=0,
    a1=1,
    a2=1) annotation (Placement(transformation(extent={{54,38},{80,64}})));
  iPSL.NonElectrical.Continuous.ImSimpleLag g(
    K=1,
    T=T_g,
    nStartValue=g0) "servo_motor"
    annotation (Placement(transformation(extent={{0,38},{38,68}})));
  Modelica.Blocks.Interfaces.RealInput PMECH0
    "Initial turbine mechanical power (pu)"                              annotation(Placement(transformation(extent={{-78,26},
            {-70,36}}),                                                                                                    iconTransformation(extent={{-84,-36},
            {-72,-24}})));

protected
  parameter Real h0 = 1 "water head initial value";
  // Real T_w(start=T_w);//=1.25 "Water time constant, s";
  parameter Real q0(fixed = false);
  //=Pm0/(A_t*h0)+q_NL "water flow initial value";
  parameter Real g0(fixed = false);
  //=q0/sqrt(h0) "the gate opening initial value";
  parameter Real c0(fixed = false);
  //=g0 "desired gate position";
  parameter Real e0 = 0 "initial output for the filter";
  parameter Real nref(fixed = false);
  //=R*c0 "speed reference";
  parameter Real P_m0(fixed = false);
public
  iPSL.NonElectrical.Continuous.ImSimpleLead imLead(K=r*T_r, T=T_r)
    annotation (Placement(transformation(extent={{-56,38},{-24,68}})));
  iPSL.NonElectrical.Nonlinear.ImLimiter Velocity_Limiter(Ymin=-VELM, Ymax=VELM)
    annotation (Placement(transformation(extent={{-32,40},{-8,66}})));
  iPSL.NonElectrical.Continuous.ImIntegratornonwindup Position_Limiter(
    Ymin=G_MIN,
    Ymax=G_MAX,
    K=1,
    nStartValue=c0)
    annotation (Placement(transformation(extent={{-14,42},{10,64}})));
  iPSL.NonElectrical.Math.ImMult2 h(
    a0=0,
    a1=1,
    a2=1) annotation (Placement(transformation(extent={{76,42},{88,62}})));
public
  Real G "Gate opening (pu)";
  Real c "Desired gate opening (pu)";
  Real Q "Turbine flow (pu)";
  Real H "Turbine head (pu)";
initial algorithm
  P_m0 := PMECH0;
  q0 := P_m0 / (A_t * h0) + q_NL;
  g0 := q0 / sqrt(h0);
  //
  //
  c0 := g0;
  //c0_calculation(g0,G_MIN,G_MAX);
  nref := R * c0;
  //
equation
  G =  g.n1;
  c = g.p1;
  Q = q.n1;
  H = h.n1;
  q.K = 1 / T_w;
  connect(w_erro.n1, SimpleLag1.p1) annotation(Line(points = {{-74.08, 53}, {-70.27, 53}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(Gain3.n1, Sum2_1.p2) annotation(Line(points = {{-72.9, 32}, {-92, 32}, {-92, 38.4}, {-91.59, 38.4}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(Gain4.p1, SPEED) annotation(Line(points = {{2.9, 23}, {-106, 23}, {-106, 41}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(hs.n1, Sum2_4.p2) annotation(Line(points = {{95.1, 40}, {91.92, 40}, {91.92, 49.2}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(q.n1, Sum2_5.p1) annotation(Line(points = {{120.35, 51}, {128, 51}, {128, 52.8}, {132.41, 52.8}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(Mult2_2.n1, Sum2_6.p2) annotation(Line(points = {{118.9, 26}, {176, 26}, {176, 39.2}, {182.41, 39.2}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(Sum2_6.n1, PMECH) annotation(Line(points={{191.41,41},{156,41},{156,1},
          {85,1}},                                                              color = {0, 0, 127}, smooth = Smooth.None));
  connect(qNL.n1, Sum2_5.p2) annotation(Line(points = {{135.1, 38}, {130, 38}, {130, 49.2}, {132.41, 49.2}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(Gain3.p1, g.p1) annotation(Line(points = {{-62.9, 32}, {8, 32}, {8, 53}, {13.11, 53}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(SPEED, Sum2_1.p1) annotation(Line(points = {{-106, 41}, {-94, 41}, {-94, 41.6}, {-91.59, 41.6}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(Sum2_1.n1, w_erro.p2) annotation(Line(points = {{-82.59, 40}, {-82, 40}, {-82, 51.6}, {-82.08, 51.6}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(Sum2_4.n1, q.p1) annotation(Line(points = {{99.92, 51}, {105.35, 51}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(Sum2_5.n1, Mult2_1.p2) annotation(Line(points = {{141.41, 51}, {146, 51}, {146, 52.24}, {145.92, 52.24}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(Mult2_1.n1, Gain6.p1) annotation(Line(points = {{153.92, 54}, {160.9, 54}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(Gain4.n1, Mult2_2.p2) annotation(Line(points = {{12.9, 23}, {60, 23}, {60, 23.8}, {108.9, 23.8}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(Gain6.n1, Sum2_6.p1) annotation(Line(points = {{170.9, 54}, {176, 54}, {176, 42.8}, {182.41, 42.8}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(n_ref.n1, w_erro.p1) annotation(Line(points = {{-85.1, 65}, {-84.55, 65}, {-84.55, 54.4}, {-82.08, 54.4}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(Mult2_2.p1, g.n1) annotation(Line(points={{108.9,28.2},{32.3,
          28.2},{32.3,53}},                                                                       color = {0, 0, 127}, smooth = Smooth.None));
  connect(g.n1, Div3_1.p2) annotation(Line(points={{32.3,53},{50.055,53},
          {50.055,52.3},{63.425,52.3}},                                                                          color = {0, 0, 127}, smooth = Smooth.None));
  connect(Div3_1.p1, q.n1) annotation(Line(points = {{68.105, 47.75}, {68.105, 32}, {120.35, 32}, {120.35, 51}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(SimpleLag1.n1, imLead.n1) annotation(Line(points={{-53.1,53},
          {-49.635,53},{-49.635,52.4},{-42.64,52.4}},                                                                        color = {0, 0, 127}, smooth = Smooth.None));
  connect(imLead.p1, Velocity_Limiter.p1) annotation(Line(points = {{-30.64, 52.7}, {-29.32, 52.7}, {-29.32, 53}, {-26.12, 53}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(Position_Limiter.n0, g.p1) annotation(Line(points = {{3.88, 53}, {13.11, 53}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(Position_Limiter.p1, Velocity_Limiter.n1) annotation(Line(points = {{-8.12, 53}, {-14.12, 53}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(h.p2, Div3_1.n1) annotation(Line(points = {{78.94, 49.8}, {76.225, 49.8}, {76.225, 52.43}, {73.825, 52.43}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(h.p1, Div3_1.n1) annotation(Line(points = {{78.94, 54.2}, {75.225, 54.2}, {75.225, 52.43}, {73.825, 52.43}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(h.n1, Sum2_4.p1) annotation(Line(points = {{84.94, 52}, {84.94, 52.8}, {91.92, 52.8}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(Mult2_1.p1, Sum2_4.p1) annotation(Line(points = {{145.92, 55.76}, {145.92, 64}, {88, 64}, {88, 52.8}, {91.92, 52.8}}, color = {0, 0, 127}, smooth = Smooth.None));
    annotation(Diagram(coordinateSystem(preserveAspectRatio=false,  extent={{-80,-60},
            {80,60}}),                                                                                   graphics={  Text(extent=  {{34, 58}, {42, 66}}, lineColor=  {0, 0, 255}, fillColor=  {0, 0, 255},
            fillPattern=                                                                                                    FillPattern.Solid, textString=  "g"), Text(extent=  {{120, 54}, {128, 62}}, lineColor=  {0, 0, 255}, fillColor=  {0, 0, 255},
            fillPattern=                                                                                                    FillPattern.Solid, textString=  "q"), Text(extent=  {{76, 58}, {84, 66}}, lineColor=  {0, 0, 255}, fillColor=  {0, 0, 255},
            fillPattern=                                                                                                    FillPattern.Solid, textString=  "h"), Text(extent=  {{-56, 56}, {-48, 64}}, lineColor=  {0, 0, 255}, fillColor=  {0, 0, 255},
            fillPattern=                                                                                                    FillPattern.Solid, textString=  "e"), Text(extent=  {{6, 58}, {14, 66}}, lineColor=  {0, 0, 255}, fillColor=  {0, 0, 255},
            fillPattern=                                                                                                    FillPattern.Solid, textString=  "c"), Text(extent=  {{-72, 36}, {-68, 32}}, lineColor=  {0, 0, 255}, textString=  "R", textStyle=  {TextStyle.Bold}), Text(extent=  {{2, 18}, {16, 12}}, lineColor=  {0, 0, 255}, textStyle=  {TextStyle.Bold}, textString=  "D_turb"), Text(extent=  {{-18, 68}, {6, 62}}, lineColor=  {0, 0, 255}, textString=  "position limit"), Text(extent=  {{14, 70}, {40, 62}}, lineColor=  {0, 0, 255}, textString=  "servo motor"), Rectangle(extent=  {{-100, 78}, {48, 8}}, lineColor=  {255, 128, 0}, pattern=  LinePattern.Dash,
            lineThickness=                                                                                                    1), Text(extent=  {{-56, 86}, {-12, 80}}, lineColor=  {255, 128, 0}, textStyle=  {TextStyle.Bold}, textString=  "Governor System"), Rectangle(extent=  {{60, 76}, {194, 10}}, lineColor=  {85, 170, 255}, pattern=  LinePattern.Dash,
            lineThickness=                                                                                                    1), Text(extent=  {{98, 88}, {158, 78}}, lineColor=  {85, 170, 255}, textStyle=  {TextStyle.Bold}, textString=  "Hydrauli Turbine System"), Text(extent=  {{-34, 44}, {-10, 38}}, lineColor=  {0, 0, 255}, textString=  "velocity limit"), Text(extent=  {{64, 62}, {72, 70}}, lineColor=  {0, 0, 255}, fillColor=  {0, 0, 255},
            fillPattern=                                                                                                    FillPattern.Solid, textString=  "q/g")}), Icon(coordinateSystem(extent={{-80,-60},
            {80,60}},                                                                                                    preserveAspectRatio=false),  graphics={  Text(extent={{
              -48,12},{52,-14}},                                                                                                  lineColor = {0, 0, 255},
            fillPattern =                                                                                                   FillPattern.Solid, textString = "HYGOV"), Text(extent={{
              -70,-20},{-42,-40}},                                                                                                   lineColor = {0, 0, 255},
            fillPattern =                                                                                                   FillPattern.Solid, textString = "PMECH0"), Rectangle(extent={{
              -80,60},{80,-60}},                                                                                                    lineColor = {0, 0, 255}), Text(extent={{
              -78,34},{-40,26}},                                                                                                  lineColor = {0, 0, 255}, textString = "SPEED"), Text(extent={{
              52,6},{78,-8}},                                                                                                    lineColor = {0, 0, 255}, textString = "PMECH")}),
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
end HYGOV;
