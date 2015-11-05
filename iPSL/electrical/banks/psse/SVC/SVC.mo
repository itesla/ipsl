within iPSL.Electrical.Banks.PSSE.SVC;
model SVC "On bus 10106 & 10114"

  iPSL.Connectors.PwPin VIB
    "Voltage signal connected to stepdown transformer (pu)"
    annotation (Placement(transformation(extent={{-98,-4},{-86,8}})));
  iPSL.NonElectrical.Math.ImSum2 imSum2_1(
    a0=0,
    a1=1,
    a2=-1) annotation (Placement(transformation(extent={{-58,0},{-38,20}})));
  iPSL.NonElectrical.Math.ImSetPoint imSetPoint(V=Vref)
    annotation (Placement(transformation(extent={{-80,14},{-56,36}})));
  iPSL.NonElectrical.Math.ImSum3 imSum3_1(
    a0=0,
    a1=-1,
    a2=1,
    a3=-1) annotation (Placement(transformation(extent={{-34,0},{-14,20}})));
  iPSL.NonElectrical.Math.ImSetPoint imSetPoint1(V=Bref)
    annotation (Placement(transformation(extent={{-56,14},{-34,36}})));
  iPSL.NonElectrical.Continuous.ImLeadLag imLeadLag(
    K=K,
    T1=T1,
    T2=T3,
    nStartValue=init_SVC_Leadlag)
    annotation (Placement(transformation(extent={{-22,-8},{22,26}})));
  iPSL.NonElectrical.Continuous.ImLeadLag imLeadLag1(
    K=1,
    T1=T2,
    T2=T4,
    nStartValue=init_SVC_Leadlag)
    annotation (Placement(transformation(extent={{6,-8},{50,26}})));
  iPSL.NonElectrical.Continuous.ImLimited imLimited(Ymin=Vmin, Ymax=Vmax)
    annotation (Placement(transformation(extent={{38,-2},{60,20}})));
  NonElectrical.Continuous.ImSimpleLag_nowinduplimit       imLimitedSimpleLag(K = 1, T = T5, Ymin = Mvar_C, nStartValue = init_SVC_Lag, Ymax = Mvar_R) annotation(Placement(transformation(extent = {{46, -8}, {98, 24}})));
  iPSL.Electrical.Banks.PwShunt shunt
    annotation (Placement(transformation(extent={{76,-72},{162,12}})));
  iPSL.Electrical.Banks.PSSE.SVC.ImRelay imRelay
    annotation (Placement(transformation(extent={{32,-56},{84,-6}})));
  iPSL.NonElectrical.Math.ImSetPoint Q_capacitors(V=Mvar_C) "If Verr>Vov"
    annotation (Placement(transformation(extent={{8,-30},{34,-2}})));
  iPSL.NonElectrical.Math.ImSetPoint Q_Reactors(V=Mvar_R) "If Verr<-Vov"
    annotation (Placement(transformation(extent={{8,-44},{34,-16}})));
  iPSL.NonElectrical.Math.ImGain imGain(K=1/Sbase)
    annotation (Placement(transformation(extent={{74,-36},{94,-16}})));
  parameter Real Vref "Reference voltage (pu)";
  parameter Real Bref "Reference susceptance (pu)";

  parameter Real K = 150 "Steady-state gain";
  parameter Real T1 "Time constant (s)";
  parameter Real T2 "Time constant (s)";
  parameter Real T3 "Time constant (s)";
  parameter Real T4 "Time constant (s)";
  parameter Real T5 = 0.03 "Time constant of thyristor bridge (s)";
  parameter Real Vmax;
  parameter Real Vmin;
  parameter Real Vov = 0.5 "Override voltage (pu)";
  parameter Real Sbase "Base power of the bus (MVA)";
  parameter Real init_SVC_Leadlag "Initial value";
  parameter Real init_SVC_Lag "Initial value";
  parameter Real OtherSignals;
  parameter Real Mvar_C = 100
    "Total compensation capacity of shunt capacitor, 100(10106)/200(10114) MVar";
  parameter Real Mvar_R = -50
    "Total compensation capacity of shunt reactor, MVar";
  iPSL.NonElectrical.Math.ImSetPoint imSetPoint2(V=OtherSignals)
    annotation (Placement(transformation(extent={{-40,-20},{-20,0}})));
  iPSL.Electrical.Sensors.PwVoltage pwVoltage
    annotation (Placement(transformation(extent={{-90,-14},{-58,20}})));
equation
  connect(imSetPoint.n1, imSum2_1.p1) annotation(Line(points = {{-62.12, 25}, {-58, 25}, {-58, 12}, {-53.1, 12}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(imSum2_1.n1, imSum3_1.p2) annotation(Line(points = {{-43.1, 10}, {-29.1, 10}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(imSetPoint1.n1, imSum3_1.p1) annotation(Line(points = {{-39.61, 25}, {-34, 25}, {-34, 13}, {-29.1, 13}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(imSum3_1.n1, imLeadLag.p1) annotation(Line(points = {{-19.1, 10}, {-16, 10}, {-16, 9}, {-11.22, 9}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(imLeadLag.n1, imLeadLag1.p1) annotation(Line(points = {{10.78, 9}, {16.78, 9}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(imLeadLag1.n1, imLimited.p1) annotation(Line(points = {{38.78, 9}, {43.39, 9}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(imLimited.n1, imLimitedSimpleLag.p1) annotation(Line(points = {{54.39, 9}, {57.195, 9}, {57.195, 8}, {58.74, 8}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(Q_capacitors.n1, imRelay.p3) annotation(Line(points = {{27.37, -16}, {32.51, -16}, {32.51, -28.5}, {45.65, -28.5}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(Q_Reactors.n1, imRelay.p4) annotation(Line(points = {{27.37, -30}, {30, -30}, {30, -33.75}, {45.52, -33.75}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(imRelay.p1, imSum2_1.n1) annotation(Line(points = {{45.65, -39.25}, {-40, -39.25}, {-40, 10}, {-43.1, 10}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(imRelay.n1, imGain.p1) annotation(Line(points={{70.74,-27},{71.37,-27},
          {71.37,-26},{78.9,-26}},                                                                                 color = {0, 0, 127}, smooth = Smooth.None));
  connect(imGain.n1, shunt.Q) annotation(Line(points={{88.9,-26},{92.415,-26},{
          92.415,-26.22},{97.93,-26.22}},                                                                               color = {0, 0, 127}, smooth = Smooth.None));
  connect(imSetPoint2.n1, imSum3_1.p3) annotation(Line(points = {{-25.1, -10}, {-22, -10}, {-22, -2}, {-36, -2}, {-36, 7}, {-29.1, 7}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(VIB, pwVoltage.p) annotation(Line(points = {{-92, 2}, {-87, 2}, {-87, 3}, {-82, 3}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(pwVoltage.v, imSum2_1.p2) annotation(Line(points = {{-66.16, -2.1}, {-58, -2.1}, {-58, 8}, {-53.1, 8}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(shunt.p, VIB) annotation(Line(points = {{119, -8.16}, {119, 52}, {-92, 52}, {-92, 2}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(imLimitedSimpleLag.n0, imRelay.p2) annotation (Line(
      points={{84.74,8},{92,8},{92,-16},{45.65,-16},{45.65,-22.75}},
      color={0,0,127},
      smooth=Smooth.None));
  annotation(Diagram(coordinateSystem(preserveAspectRatio=true,   extent={{-100,
            -100},{140,100}}),                                                                           graphics={  Text(extent=  {{-44, 16}, {-34, 12}}, lineColor=  {255, 0, 0}, textString=  "Verr"), Text(extent=  {{-40, -16}, {-14, -20}}, lineColor=  {255, 0, 0}, textString=  "Other signals"), Text(extent=  {{-82, 28}, {-58, 24}}, lineColor=  {255, 0, 0}, textString=  "Vref"), Text(extent=  {{-58, 28}, {-34, 24}}, lineColor=  {255, 0, 0}, textString=  "Bref"), Text(extent=  {{-14, -12}, {12, -20}}, lineColor=  {255, 0, 0}, textString=  "Verr>Vov"), Text(extent=  {{-14, -24}, {12, -34}}, lineColor=  {255, 0, 0}, textString=  "Verr<-Vov"), Text(extent=  {{-80, -4}, {-68, -10}}, lineColor=  {255, 0, 0}, textString=  "|VB|")}), Icon(coordinateSystem(extent = {{-100, -100}, {140, 100}}, preserveAspectRatio = false), graphics={  Line(points=  {{-88, 0}, {-60, 0}}, color=  {0, 0, 255}, smooth=  Smooth.None, thickness=  0.5), Line(points=  {{-60, 16}, {-60, -18}}, color=  {0, 0, 255}, smooth=  Smooth.None, thickness=  0.5), Line(points=  {{-44, 20}, {-48, 16}, {-52, 10}, {-54, 2}, {-54, -4}, {-52, -10}, {-50, -14}, {-46, -20}, {-44, -20}}, color=  {0, 0, 255}, smooth=  Smooth.Bezier, thickness=  0.5), Rectangle(extent=  {{-86, 34}, {-14, -34}}, lineColor=  {0, 0, 255}), Text(extent=  {{-40, -18}, {-14, -40}}, lineColor=  {0, 0, 255}, fillColor=  {0, 0, 255},
            fillPattern=                                                                                                    FillPattern.Solid, textString=  "SVC")}),
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
end SVC;
