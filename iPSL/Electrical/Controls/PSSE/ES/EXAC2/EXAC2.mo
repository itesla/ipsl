within iPSL.Electrical.Controls.PSSE.ES.EXAC2;
model EXAC2 "IEEE Type AC2 Excitation System"
  import iPSL.NonElectrical.Functions.SE;
  iPSL.NonElectrical.Math.ImSum2 imSum2_1(
    a0=0,
    a1=1,
    a2=-1) annotation (Placement(transformation(extent={{-102,-38},{-82,-18}})));
  iPSL.NonElectrical.Math.ImSetPoint Vref(V=VREF)
    annotation (Placement(transformation(extent={{-128,-26},{-106,-6}})));
  iPSL.NonElectrical.Math.ImSum3 imSum3_1(
    a0=0,
    a2=1,
    a1=-1,
    a3=1) annotation (Placement(transformation(extent={{-82,-38},{-62,-18}})));
  Modelica.Blocks.Interfaces.RealInput XADIFD "Machine field current (pu)"
    annotation (Placement(transformation(extent={{-166,34},{-154,46}}),
        iconTransformation(extent={{-164,34},{-154,46}})));
  Modelica.Blocks.Interfaces.RealInput ECOMP
    "Voltage regultor compensated voltage (pu)"
    annotation (Placement(transformation(extent={{-164,14},{-152,26}}),
        iconTransformation(extent={{-164,14},{-152,26}})));
  Modelica.Blocks.Interfaces.RealInput VOTHSG "Stabilizer signal (pu)"
                                                     annotation(Placement(transformation(extent={{-164,
            -26},{-152,-14}}), iconTransformation(extent={{-164,-26},{-152,-14}})));
  Modelica.Blocks.Interfaces.RealInput VOEL
    "Maximum excitation limiter signal (pu)"             annotation(Placement(transformation(extent={{-164,
            -66},{-152,-54}}), iconTransformation(extent={{-164,-66},{-152,-54}})));
  iPSL.NonElectrical.Continuous.ImSimpleLag_nowinduplimit imLimitedSimpleLag(
    Ymin=V_AMIN,
    Ymax=V_AMAX,
    K=K_A,
    T=T_A,
    nStartValue=VA0)
    annotation (Placement(transformation(extent={{-48,-44},{-12,-12}})));
  iPSL.NonElectrical.Continuous.ImIntegrator imIntegrator(K=1/T_E, nStartValue=
        VE0) annotation (Placement(transformation(extent={{92,-36},{112,-16}})));
  iPSL.NonElectrical.Continuous.ImLimited imLimited_min(Ymin=0.000001, Ymax=
        Modelica.Constants.inf)
    annotation (Placement(transformation(extent={{106,-36},{126,-16}})));
  iPSL.NonElectrical.Math.ImGain imGain(K=K_D) annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={38,26})));
  iPSL.NonElectrical.Math.ImDiv2 imDiv2_1(
    a0=0,
    a1=1,
    a2=1) annotation (Placement(transformation(extent={{122,40},{102,60}})));
  iPSL.NonElectrical.Math.ImGain imGain1(K=K_C)
    annotation (Placement(transformation(extent={{104,40},{84,60}})));
  iPSL.NonElectrical.Math.ImSum2 imSum2_4(
    a0=0,
    a1=1,
    a2=1) annotation (Placement(transformation(extent={{62,4},{42,24}})));
  iPSL.NonElectrical.Math.ImSum2 imSum2_5(
    a0=0,
    a1=1,
    a2=1) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={14,20})));
  NonElectrical.Nonlinear.ImFEX
      fEX annotation(Placement(transformation(extent={{88,38},{58,62}})));
  iPSL.NonElectrical.Math.ImMult2 imMult2_2(
    a0=0,
    a1=1,
    a2=1) annotation (Placement(transformation(extent={{138,-10},{158,10}})));
  Modelica.Blocks.Interfaces.RealOutput EFD "Generator main field voltage (pu)"
                                                                        annotation(Placement(transformation(extent={{160,-6},
            {170,6}})));
  parameter Real VREF = 1 "Reference terminal voltage (pu)";

  parameter Real T_R = 0 "Voltage input time constant (s)";
  parameter Real T_B = 0 "AVR lead-lag time constant (s)";
  parameter Real T_C = 0 "AVR lead-lag time constant (s)";
  parameter Real K_A = 400 "AVR gain";
  parameter Real T_A = 0.02 "AVR time constant (s)";
  parameter Real V_AMAX = 9 "Maximum AVR output (pu)";
  parameter Real V_AMIN = -5.43 "Minimum AVR output (pu)";
  parameter Real K_B;
  parameter Real V_RMAX;
  parameter Real V_RMIN;
  parameter Real T_E = 0.8 "Exciter time constant (s)";
  parameter Real K_L;
  parameter Real K_H;
  parameter Real K_F = 0.03 "Rate feedback gain (pu)";
  parameter Real T_F = 1 "Rate feedback time constant (s)";
  parameter Real K_C = 0.2 "Rectifier load factor (pu)";
  parameter Real K_D = 0.48 "Exciter demagnetizing factor (pu)";
  parameter Real K_E = 1 "Exciter field factor (pu)";
  parameter Real V_LR "Limit value of excitation voltage (pu)";
  parameter Real E_1 = 5.25 "Exciter saturation point 1 (pu)";
  parameter Real E_2 = 7 "Exciter saturation point 2 (pu)";
  parameter Real S_EE_1 = 0.03 "Saturation factor at E1";
  parameter Real S_EE_2 = 0.1 "Saturation factor at E2";

  iPSL.NonElectrical.Continuous.ImDerivativeLag imDerivativeLag(
    K=K_F,
    T=T_F,
    pStartValue=0) annotation (Placement(transformation(
        extent={{7,-6},{-7,6}},
        rotation=0,
        origin={-59,0})));
  iPSL.NonElectrical.Math.ImSum2 imSum2_3(
    a0=0,
    a2=1,
    a1=-1) annotation (Placement(transformation(extent={{-10,-36},{10,-16}})));
  NonElectrical.Continuous.ImSimpleLag imSimpleLag(K=1, T=T_R,
    nStartValue=EC0)
    annotation (Placement(transformation(extent={{-132,-40},{-108,-20}})));
  Modelica.Blocks.Interfaces.RealInput VUEL
    "Minimum excitation limiter signal (pu)"
    annotation (Placement(transformation(extent={{-164,-46},{-152,-34}}),
        iconTransformation(extent={{-164,-46},{-152,-34}})));
  NonElectrical.Continuous.ImLeadLag imLeadLag(
    K=1,
    T1=T_C,
    T2=T_B,
    nStartValue=VA0/K_A)
            annotation (Placement(transformation(extent={{-70,-44},{-36,-12}})));
  Modelica.Blocks.Math.Gain gain(k=K_H) annotation (Placement(transformation(
        extent={{-4,-4},{4,4}},
        rotation=270,
        origin={-40,-4})));
  NonElectrical.Logical.LV_GATE lV_GATE
    annotation (Placement(transformation(extent={{10,-38},{30,-18}})));
  Modelica.Blocks.Math.Gain gain1(k=K_B)
    annotation (Placement(transformation(extent={{42,-32},{52,-22}})));
  Modelica.Blocks.Nonlinear.Limiter limiter(uMax=V_RMAX, uMin=V_RMIN)
    annotation (Placement(transformation(extent={{62,-32},{72,-22}})));
  iPSL.NonElectrical.Math.ImSum2 imSum2_7(
    a0=0,
    a1=-1,
    a2=1) annotation (Placement(transformation(extent={{74,-36},{94,-16}})));
  iPSL.NonElectrical.Math.ImSum3 imSum3_2(
    a0=0,
    a2=1,
    a1=-1,
    a3=1) annotation (Placement(transformation(extent={{-134,-70},{-114,-50}})));
  NonElectrical.Functions.ImSE imSE(
    SE1=S_EE_1,
    SE2=S_EE_2,
    E1=E_1,
    E2=E_2) annotation (Placement(transformation(extent={{92,14},{72,34}})));
  Modelica.Blocks.Math.Gain gain2(k=K_E)
    annotation (Placement(transformation(extent={{86,0},{78,8}})));
  iPSL.NonElectrical.Math.ImSum2 imSum2_2(
    a0=0,
    a2=1,
    a1=-1) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-16,-2})));
  iPSL.NonElectrical.Math.ImSetPoint Vref1(V=V_LR) annotation (Placement(
        transformation(
        extent={{-9.5,-12.5},{9.5,12.5}},
        rotation=270,
        origin={-18.5,49.5})));
  Modelica.Blocks.Interfaces.RealInput EFD0
    "Initial value of generator main field voltage (pu)"
    annotation (Placement(transformation(extent={{-164,54},{-152,66}}),
        iconTransformation(extent={{-164,54},{-152,66}})));
protected
  parameter Real EC0(fixed=false);
  parameter Real VA0(fixed=false);
  parameter Real VR0(fixed=false);
  parameter Real VFE0(fixed=false);
  parameter Real Efd0(fixed=false);
  parameter Real Ifd0(fixed=false);
  parameter Real VE0(fixed=false);
initial equation
  Efd0 = EFD0;
  Ifd0 = XADIFD;
  // Finding initial value of excitation voltage, VE0, via going through conditions of FEX function
  if (Ifd0 <= 0) then
    VE0 = Efd0;
  elseif ((K_C*Ifd0/(Efd0 + 0.577*K_C*Ifd0)) <= 0.433) then
    VE0 = Efd0 + 0.577*K_C*Ifd0;
  elseif ((K_C*Ifd0/sqrt((Efd0^2 + (K_C*Ifd0)^2)/0.75)) > 0.433) and ((K_C*Ifd0/sqrt((Efd0^2 + (K_C*Ifd0)^2)/0.75) < 0.75)) then
    VE0 =  sqrt((Efd0^2 + (K_C*Ifd0)^2)/0.75);
  else
    VE0 = (Efd0+1.732*K_C*Ifd0)/1.732;
  end if;
  // Case IN>0 not checked because it will be resolved in the next iteration
  VFE0 = VE0*(SE(VE0,S_EE_1,S_EE_2,E_1,E_2) + K_E) + Ifd0*K_D;
  VR0 = VFE0;
  VA0 = VR0/K_B+VFE0*K_H;
  EC0 = ECOMP;

equation
  connect(Vref.n1, imSum2_1.p1) annotation(Line(points={{-111.61,-16},{-104,-16},
          {-104,-26},{-97.1,-26}},                                                                              color = {0, 0, 127}, smooth = Smooth.None));
  connect(imSum2_1.n1, imSum3_1.p2) annotation(Line(points={{-87.1,-28},{-77.1,
          -28}},                                                                           color = {0, 0, 127}, smooth = Smooth.None));
  connect(imIntegrator.n1, imLimited_min.p1) annotation(Line(points={{106.9,-26},
          {110.9,-26}},                                                                           color = {0, 0, 127}, smooth = Smooth.None));
  connect(imLimitedSimpleLag.n0, imSum2_3.p2) annotation (Line(
      points={{-21.18,-28},{-5.1,-28}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(ECOMP, imSimpleLag.p1) annotation (Line(points={{-158,20},{-140,20},{
          -140,-30},{-123.72,-30}},
                             color={0,0,127}));
  connect(imSum2_1.p2, imSimpleLag.n1)
    annotation (Line(points={{-97.1,-30},{-111.6,-30}},
                                                     color={0,0,127}));
  connect(imLimitedSimpleLag.p1, imLeadLag.n1)
    annotation (Line(points={{-39.18,-28},{-39.18,-28},{-44.67,-28}},
                                                             color={0,0,127}));
  connect(imSum3_1.n1, imLeadLag.p1) annotation (Line(points={{-67.1,-28},{-64,
          -28},{-61.67,-28}},
                         color={0,0,127}));
  connect(imSum2_3.n1, lV_GATE.n1) annotation (Line(points={{4.9,-26},{12,-26},
          {12,-26.2},{13,-26.2}}, color={0,0,127}));
  connect(lV_GATE.p, gain1.u) annotation (Line(points={{25.9,-28.5},{40,-28.5},
          {40,-27},{41,-27}},color={0,0,127}));
  connect(gain1.y, limiter.u)
    annotation (Line(points={{52.5,-27},{61,-27}},   color={0,0,127}));
  connect(imIntegrator.p1, imSum2_7.n1) annotation (Line(points={{96.9,-26},{92,
          -26},{88.9,-26}},  color={0,0,127}));
  connect(limiter.y, imSum2_7.p2) annotation (Line(points={{72.5,-27},{76,-27},
          {76,-28},{78.9,-28}},   color={0,0,127}));
  connect(VOTHSG, imSum3_2.p1) annotation (Line(points={{-158,-20},{-156,-20},{
          -156,-57},{-129.1,-57}},
                             color={0,0,127}));
  connect(VUEL, imSum3_2.p2) annotation (Line(points={{-158,-40},{-144,-40},{
          -144,-60},{-129.1,-60}},
                 color={0,0,127}));
  connect(VOEL, imSum3_2.p3) annotation (Line(points={{-158,-60},{-156,-60},{
          -156,-63},{-129.1,-63}},
                             color={0,0,127}));
  connect(imSum3_2.n1, imSum3_1.p3) annotation (Line(points={{-119.1,-60},{-82,
          -60},{-82,-31},{-77.1,-31}},
                                  color={0,0,127}));
  connect(imSE.VE_OUT, imSum2_4.p1) annotation (Line(points={{71.5,23.9},{64,
          23.9},{64,16},{57.1,16}},
                                color={0,0,127}));
  connect(gain2.y, imSum2_4.p2) annotation (Line(points={{77.6,4},{64,4},{64,12},
          {57.1,12}},      color={0,0,127}));
  connect(imSE.VE_IN, imLimited_min.n1) annotation (Line(points={{92.5,23.9},{
          132,23.9},{132,-26},{120.9,-26}},
                                        color={0,0,127}));
  connect(gain2.u, imLimited_min.n1) annotation (Line(points={{86.8,4},{132,4},
          {132,-26},{120.9,-26}}, color={0,0,127}));
  connect(imDiv2_1.p1, imLimited_min.n1) annotation (Line(points={{117.1,52},{
          132,52},{132,-26},{120.9,-26}},
                                      color={0,0,127}));
  connect(XADIFD, imDiv2_1.p2) annotation (Line(points={{-160,40},{-136,40},{
          -136,34},{128,34},{128,48},{117.1,48}},
                                         color={0,0,127}));
  connect(imGain1.p1, imDiv2_1.n1)
    annotation (Line(points={{99.1,50},{107.1,50}},  color={0,0,127}));
  connect(imGain1.n1, fEX.IN)
    annotation (Line(points={{89.1,50},{82,50}},   color={0,0,127}));
  connect(imMult2_2.p2, imLimited_min.n1) annotation (Line(points={{142.9,-2.2},
          {134,-2.2},{134,-26},{120.9,-26}}, color={0,0,127}));
  connect(fEX.FEX, imMult2_2.p1) annotation (Line(points={{62.8,50},{58,50},{58,
          58},{136,58},{136,2.2},{142.9,2.2}}, color={0,0,127}));
  connect(imSum2_5.p1, imSum2_4.n1) annotation (Line(points={{19.1,18},{22,18},
          {22,14},{47.1,14}},color={0,0,127}));
  connect(imGain.p1, imDiv2_1.p2) annotation (Line(points={{38,31.1},{38,34},{
          128,34},{128,48},{117.1,48}},
                                    color={0,0,127}));
  connect(imSum2_5.n1, imDerivativeLag.p1) annotation (Line(points={{9.1,20},{
          -48,20},{-48,0},{-52.07,0}},
                                color={0,0,127}));
  connect(imDerivativeLag.n1, imSum3_1.p1) annotation (Line(points={{-66.07,0},
          {-82,0},{-82,-25},{-77.1,-25}},color={0,0,127}));
  connect(gain.u, imDerivativeLag.p1) annotation (Line(points={{-40,0.8},{-40,
          20},{-48,20},{-48,0},{-52.07,0}},
                                color={0,0,127}));
  connect(imGain.n1, imSum2_5.p2) annotation (Line(points={{38,21.1},{38,16},{
          24,16},{24,22},{19.1,22}},
                                  color={0,0,127}));
  connect(imSum2_7.p1, imDerivativeLag.p1) annotation (Line(points={{78.9,-24},
          {76,-24},{76,-16},{4,-16},{4,20},{-48,20},{-48,0},{-52.07,0}},color={0,
          0,127}));
  connect(imMult2_2.n1, EFD)
    annotation (Line(points={{152.9,0},{165,0}},         color={0,0,127}));
  connect(gain.y, imSum2_3.p1) annotation (Line(points={{-40,-8.4},{-40,-20},{
          -8,-20},{-8,-24},{-5.1,-24}},
                                color={0,0,127}));
  connect(imSum2_2.p1, imDerivativeLag.p1) annotation (Line(points={{-14,3.1},{
          -14,20},{-48,20},{-48,0},{-52.07,0}},
                                       color={0,0,127}));
  connect(imSum2_2.p2, Vref1.n1) annotation (Line(points={{-18,3.1},{-18,44.845},
          {-18.5,44.845}},
                         color={0,0,127}));
  connect(imSum2_2.n1, lV_GATE.n2) annotation (Line(points={{-16,-6.9},{-16,-34},
          {10,-34},{10,-30.6},{13,-30.6}},color={0,0,127}));
  annotation(Diagram(coordinateSystem(preserveAspectRatio=false,   extent={{-160,
            -80},{160,80}}),                                                                           graphics={  Text(extent={{
              -124,-18},{-114,-26}},                                                                                                  lineColor=
              {0,0,255},
          textString="VREF"),                                                                                                    Text(extent={{
              -110,-54},{-104,-60}},                                                                                                  lineColor=  {255, 0, 0}, textString=  "Vs"),                                                                                                    Text(extent={{
              122,-28},{128,-34}},                                                                                                    lineColor=  {255, 0, 0}, textString=  "V"), Text(extent={{
              126,-32},{128,-32}},                                                                                                    lineColor=  {255, 0, 0}, textString=  "E"), Text(extent={{
              -8,28},{2,22}},                                                                                                    lineColor=  {255, 0, 0}, textString=  "V"), Text(extent={{
              -4,24},{4,22}},                                                                                                    lineColor=  {255, 0, 0}, textString=  "FE"), Text(extent={{
              -170,60},{-160,54}},                                                                                                    lineColor=  {255, 0, 0}, textString=  "V"), Text(extent={{
              -160,56},{-166,54}},                                                                                                    lineColor=  {255, 0, 0}, textString=  "F")}),                                                                                                    Icon(coordinateSystem(preserveAspectRatio=false,   extent={{-160,
            -80},{160,80}}),                                                                                                    graphics={  Rectangle(extent={{
              -160,80},{160,-80}},                                                                                                    lineColor = {0, 0, 255}), Text(extent={{
              -150,64},{-128,54}},                                                                                                    lineColor=
              {0,0,255},
          textString="EFD0"),                                                                                                    Text(extent={{
              -150,28},{-120,12}},                                                                                                    lineColor=
              {0,0,255},
          textString="ECOMP"),                                                                                                    Text(extent={{
              -154,-16},{-106,-26}},                                                                                                    lineColor=
              {0,0,255},
          textString="VOTHSG"),                                                                                                    Text(extent={{
              -154,-36},{-122,-46}},                                                                                                    lineColor=
              {0,0,255},
          textString="VUEL"),                                                                                                    Text(extent={{
              128,8},{158,-8}},                                                                                                    lineColor = {0, 0, 255}, textString = "EFD"), Text(extent={{
              -52,32},{52,-30}},                                                                                                    lineColor=
              {0,0,255},
          textString="EXAC2"),                                                                                                    Text(extent={{
              -150,50},{-118,30}},                                                                                                    lineColor=
              {0,0,255},
          textString="XADIFD"),                                                                                                    Text(extent={{
              -154,-56},{-122,-66}},                                                                                                    lineColor=
              {0,0,255},
          textString="VOEL")}),
    Documentation(info="<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\">
<tr>
<td><p>Reference</p></td>
<td>EXAC2, PSS/E Manual</td>
</tr>
<tr>
<td><p>Last update</p></td>
<td>2015-08-25</td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p>Tin Rabuzin, SmarTS Lab, KTH Royal Institute of Technology</p></td>
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
end EXAC2;
