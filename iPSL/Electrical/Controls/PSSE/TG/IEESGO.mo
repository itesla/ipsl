within iPSL.Electrical.Controls.PSSE.TG;
model IEESGO "IEEE Standard Model for Turbine-Governor"

  input Modelica.Blocks.Interfaces.RealInput SPEED
    "Machine speed deviation from nominal (pu)"    annotation(Placement(
        transformation(extent={{-110,-10},{-102,0}}),
        iconTransformation(extent={{-66,12},{-50,28}})));
  input Modelica.Blocks.Interfaces.RealInput PMECH0
    "Initial value of turbine mechanical power (pu)"
                                                    annotation(Placement(transformation(extent = {{-110, 12}, {-102, 20}}), iconTransformation(extent={{-66,-28},
            {-50,-12}})));
  parameter Real T_1 = 0.2 "Controller lag (s)";
  parameter Real T_2 = 0 "Controller lead compensation (s)";
  parameter Real T_3 = 0.5 "Governor lag (s)";
  parameter Real T_4 = 0.12
    "Delay due to steam inlet volumes associated with steam chest and inlet piping (s)";
  parameter Real T_5 = 5 "Reheater delay including hot and cold leads (s)";
  parameter Real T_6 = 0.5
    "Delay due to IP-LP turbine, crossover pipes, and LP end hoods (s)";
  parameter Real K_1 = 20 "1/p.u. regulation ";
  parameter Real K_2 = 0.59 "Fraction ";
  parameter Real K_3 = 0.43 "Fraction ";
  parameter Real P_MAX = 0.98 "Upper power limit";
  parameter Real P_MIN = 0 "Lower power limit";
protected
  parameter Real p0(fixed = false);
public
  iPSL.NonElectrical.Continuous.ImSimpleLag imSimpleLag(
    K=K_1,
    T=T_1,
    nStartValue=0)
    annotation (Placement(transformation(extent={{-106,-28},{-58,18}})));
  iPSL.NonElectrical.Continuous.ImLeadLag imLeadLag(
    K=1,
    T1=T_2,
    T2=T_3,
    nStartValue=0)
    annotation (Placement(transformation(extent={{-68,-28},{-24,18}})));
  iPSL.NonElectrical.Math.ImSum2 imSum2_1(
    a0=0,
    a1=1,
    a2=-1) annotation (Placement(transformation(extent={{-32,-12},{-12,8}})));
  iPSL.NonElectrical.Continuous.ImLimited imLimited(Ymin=P_MIN, Ymax=P_MAX)
    annotation (Placement(transformation(extent={{-18,-12},{2,8}})));
  iPSL.NonElectrical.Continuous.ImSimpleLag imSimpleLag1(
    K=1,
    T=T_4,
    nStartValue=p0)
    annotation (Placement(transformation(extent={{-6,-12},{40,20}})));
  iPSL.NonElectrical.Continuous.ImSimpleLag imSimpleLag2(
    K=K_2,
    T=T_5,
    nStartValue=p0*K_2)
    annotation (Placement(transformation(extent={{-10,-40},{36,-8}})));
  iPSL.NonElectrical.Continuous.ImSimpleLag imSimpleLag3(
    K=K_3,
    T=T_6,
    nStartValue=p0*K_2*K_3)
    annotation (Placement(transformation(extent={{30,-40},{76,-8}})));
  iPSL.NonElectrical.Math.ImSum3 add3_2(
    a1=1 - K_2,
    a2=1 - K_3,
    a3=1,
    a0=0) annotation (Placement(transformation(extent={{74,-26},{100,10}})));
  output Modelica.Blocks.Interfaces.RealOutput PMECH
    "Turbine mechanical power (pu)"                  annotation(Placement(transformation(extent = {{100, -14}, {110, -2}}), iconTransformation(extent={{60,-10},
            {80,10}})));
initial algorithm
  p0 := PMECH0;

equation
  connect(imSimpleLag.n1, imLeadLag.p1) annotation(Line(points={{-65.2,
          -5},{-57.22,-5}},                                                                    color = {0, 0, 127}, smooth = Smooth.None));
  connect(imLeadLag.n1, imSum2_1.p2) annotation(Line(points = {{-35.22, -5}, {-29.61, -5}, {-29.61, -4}, {-27.1, -4}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(PMECH0, imSum2_1.p1) annotation(Line(points = {{-106, 16}, {-30, 16}, {-30, 0}, {-27.1, 0}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(SPEED, imSimpleLag.p1) annotation(Line(points = {{-106, -5}, {-89.44, -5}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(imSum2_1.n1, imLimited.p1) annotation(Line(points = {{-17.1, -2}, {-13.1, -2}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(imLimited.n1, imSimpleLag1.p1) annotation(Line(points={{-3.1,-2},
          {0,-2},{0,4},{9.87,4}},                                                           color = {0, 0, 127}, smooth = Smooth.None));
  connect(add3_2.n1, PMECH) annotation(Line(points={{93.37,-8},{105,
          -8}},                                                                color = {0, 0, 127}, smooth = Smooth.None));
  connect(imSimpleLag3.n1, add3_2.p3) annotation(Line(points={{69.1,-24},
          {80.37,-24},{80.37,-13.4}},                                                                        color = {0, 0, 127}, smooth = Smooth.None));
  connect(imSimpleLag2.n1, imSimpleLag3.p1) annotation(Line(points={{29.1,
          -24},{45.87,-24}},                                                                       color = {0, 0, 127}, smooth = Smooth.None));
  connect(imSimpleLag2.n1, add3_2.p2) annotation(Line(points={{29.1,-24},
          {36,-24},{36,-8},{80.37,-8}},                                                                          color = {0, 0, 127}, smooth = Smooth.None));
  connect(imSimpleLag1.n1, add3_2.p1) annotation(Line(points={{33.1,4},
          {77.62,4},{77.62,-2.6},{80.37,-2.6}},                                                                          color = {0, 0, 127}, smooth = Smooth.None));
  connect(imSimpleLag2.p1, add3_2.p1) annotation (Line(
      points={{5.87,-24},{-14,-24},{-14,-12},{32,-12},{32,-2.6},{
          80.37,-2.6}},
      color={0,0,127},
      smooth=Smooth.None));
  annotation(Diagram(coordinateSystem(preserveAspectRatio=false,  extent={{-60,-40},
            {60,40}}),                                                                                   graphics={  Text(extent={{
              -36,56},{60,4}},                                                                                                    lineColor=  {0, 0, 255}, textString=  "Pm0*(1-K_2)+Pm0*K_2*(1-K_3)+Pm0*K_3*K_2
=0+0+0+Pm0")}),
      Icon(coordinateSystem(preserveAspectRatio=false,  extent={{-60,-40},{60,
            40}}),                                                                             graphics={  Rectangle(extent={{
              -60,40},{60,-40}},                                                                                                    lineColor = {0, 0, 255}),
                                                                                          Text(extent={{
              -26,8},{26,-6}},                                                                                                    lineColor=
              {0,0,255},
          textString="IEESGO"),
        Text(
          extent={{-48,26},{-24,12}},
          lineColor={0,0,255},
          textString="SPEED"),
        Text(
          extent={{-48,-12},{-22,-28}},
          lineColor={0,0,255},
          textString="PMECH0"),
        Text(
          extent={{34,6},{56,-6}},
          lineColor={0,0,255},
          textString="PMECH")}),
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
end IEESGO;
