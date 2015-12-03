within iPSL.Electrical.Controls.PSSE.ES.ESST1A;


model ESST1A "IEEE Type ST1A Excitation System"
  Modelica.Blocks.Sources.Constant Vref(k=VREF)
    annotation (Placement(transformation(extent={{-75.6,15.9},{-66,26}})));
  Modelica.Blocks.Interfaces.RealInput ECOMP
    "Input, generator terminal voltage" annotation (Placement(transformation(
          extent={{-100.3,-5.6},{-90.3,6.4}}), iconTransformation(
        extent={{-16,-17.5},{16,17.5}},
        rotation=0,
        origin={-89.3,-2})));
  Modelica.Blocks.Interfaces.RealInput VOTHSG "VOS=1" annotation (Placement(
        transformation(extent={{-100.2,61.8},{-90.2,73.8}}), iconTransformation(
        extent={{-11,-13},{11,13}},
        rotation=90,
        origin={17,89})));
  Modelica.Blocks.Interfaces.RealInput VUEL1 "UEL=1" annotation (Placement(
        transformation(extent={{-100.1,30.6},{-90.1,42.6}}), iconTransformation(
        extent={{-9,-10},{9,10}},
        rotation=270,
        origin={-58.3,-88})));
  Modelica.Blocks.Interfaces.RealOutput EFD "Output,excitation voltage"
    annotation (Placement(transformation(extent={{179.3,-5.8},{189.3,6.2}}),
        iconTransformation(extent={{146,-18.4},{178,19.6}})));
  parameter Real V_0 "Voltage magnitude (pu)"
    annotation (Dialog(group="Power flow data"));
  parameter Real T_R=0 "Voltage input time constant (s)"
    annotation (Dialog(group="Excitation system parameters"));
  parameter Real V_IMAX
    annotation (Dialog(group="Excitation system parameters"));
  parameter Real V_IMIN
    annotation (Dialog(group="Excitation system parameters"));
  parameter Real T_C=0 "AVR lead-lag time constant (s)"
    annotation (Dialog(group="Excitation system parameters"));
  parameter Real T_B=0 "AVR lead-lag time constant (s)"
    annotation (Dialog(group="Excitation system parameters"));
  parameter Real T_C1=0 "AVR lead-lag time constant (s)"
    annotation (Dialog(group="Excitation system parameters"));
  parameter Real T_B1=0 "AVR lead-lag time constant (s)"
    annotation (Dialog(group="Excitation system parameters"));
  parameter Real K_A=400 "AVR gain"
    annotation (Dialog(group="Excitation system parameters"));
  parameter Real T_A=0.02 "AVR time constant (s)"
    annotation (Dialog(group="Excitation system parameters"));
  parameter Real V_AMAX "Maximum AVR output (pu)"
    annotation (Dialog(group="Excitation system parameters"));
  parameter Real V_AMIN "Minimum AVR output (pu)"
    annotation (Dialog(group="Excitation system parameters"));
  parameter Real V_RMAX=9
    annotation (Dialog(group="Excitation system parameters"));
  parameter Real V_RMIN=-5.43
    annotation (Dialog(group="Excitation system parameters"));
  parameter Real K_C=0.2 "Rectifier load factor (pu)"
    annotation (Dialog(group="Excitation system parameters"));
  parameter Real K_F=0.03 "Rate feedback gain (pu)"
    annotation (Dialog(group="Excitation system parameters"));
  parameter Real T_F=1 "Rate feedback time constant (s)"
    annotation (Dialog(group="Excitation system parameters"));
  parameter Real K_LR annotation (Dialog(group="Excitation system parameters"));
  parameter Real I_LR annotation (Dialog(group="Excitation system parameters"));
  Modelica.Blocks.Continuous.Derivative imDerivativeLag(
    y_start=0,
    k=K_F,
    T=T_F,
    initType=Modelica.Blocks.Types.Init.InitialOutput)
    annotation (Placement(transformation(extent={{50,50},{39.4,60.6}})));
  Modelica.Blocks.Interfaces.RealInput VOTHSG2 "VOS=2" annotation (Placement(
        transformation(extent={{-100.4,-31},{-90.4,-19}}), iconTransformation(
        extent={{-10.5,-12.5},{10.5,12.5}},
        rotation=90,
        origin={-20.2,89})));
  Modelica.Blocks.Interfaces.RealInput VUEL3 "UEL=3" annotation (Placement(
        transformation(extent={{-100.3,-72},{-90.3,-60}}), iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={3.7,-88.9})));
  Modelica.Blocks.Nonlinear.Limiter imLimited(uMin=V_IMIN, uMax=V_IMAX)
    annotation (Placement(transformation(extent={{-16.2,19.8},{-6,30}})));
  NonElectrical.Logical.HV_GATE hV_GATE
    annotation (Placement(transformation(extent={{2.3,10.5},{22.8,31.3}})));
  Modelica.Blocks.Interfaces.RealInput VUEL2 "UEL=2" annotation (Placement(
        transformation(extent={{-100.5,-52},{-90.5,-40}}), iconTransformation(
        extent={{-9,-10},{9,10}},
        rotation=270,
        origin={-26.8,-87.8})));
  Modelica.Blocks.Math.Gain imGain(k=K_LR) annotation (Placement(transformation(
        extent={{-4.65,-4.85},{4.65,4.85}},
        rotation=90,
        origin={85.15,-31.35})));
  NonElectrical.Logical.HV_GATE hV_GATE1
    annotation (Placement(transformation(extent={{112.3,4.3},{132.3,24.3}})));
  NonElectrical.Logical.LV_GATE lV_GATE
    annotation (Placement(transformation(extent={{129.8,-1.7},{149.8,18.3}})));
  Modelica.Blocks.Interfaces.RealInput VOEL annotation (Placement(
        transformation(
        extent={{-5,-6},{5,6}},
        rotation=270,
        origin={123.3,-69.7}), iconTransformation(
        extent={{-10,-11},{10,11}},
        rotation=270,
        origin={42.5,-89.2})));
  Modelica.Blocks.Interfaces.RealInput VT "sensed VT" annotation (Placement(
        transformation(
        extent={{-5,-6},{5,6}},
        rotation=270,
        origin={145.3,-69.7}), iconTransformation(
        extent={{-8.5,-11.5},{8.5,11.5}},
        rotation=270,
        origin={82,-87})));
  Modelica.Blocks.Sources.Constant Vref1(k=I_LR)
    annotation (Placement(transformation(extent={{60,-80},{70,-70}})));
  NonElectrical.Continuous.LeadLag imLeadLag(
    K=1,
    T1=T_C,
    T2=T_B,
    y_start=VA0/K_A)
    annotation (Placement(transformation(extent={{26,15},{36,25}})));
  NonElectrical.Continuous.LeadLag imLeadLag1(
    K=1,
    y_start=VA0/K_A,
    T1=T_C1,
    T2=T_B1) annotation (Placement(transformation(extent={{45,15},{55,25}})));
  NonElectrical.Continuous.SimpleLag imSimpleLag(
    K=1,
    y_start=V_0,
    T=T_R) annotation (Placement(transformation(extent={{-74.8,-5},{-65,5}})));
  Modelica.Blocks.Interfaces.RealInput EFD0 "VOS=1" annotation (Placement(
        transformation(
        extent={{-5,-6},{5,6}},
        rotation=90,
        origin={43.1,-75.7}), iconTransformation(
        extent={{-11,-13},{11,13}},
        rotation=90,
        origin={92,87.3})));
  Modelica.Blocks.Interfaces.RealInput XADIFD annotation (Placement(
        transformation(
        extent={{-12.35,-12.35},{12.35,12.35}},
        rotation=90,
        origin={103.25,-77.55})));
  Modelica.Blocks.Math.Add add(k2=-1)
    annotation (Placement(transformation(extent={{-55,0},{-45,10}})));
  Modelica.Blocks.Math.Add add1(k2=-1)
    annotation (Placement(transformation(extent={{-55,50},{-45,60}})));
  Modelica.Blocks.Math.Add3 add3_1(k1=-1)
    annotation (Placement(transformation(extent={{-34,20},{-24,30}})));
  NonElectrical.Continuous.SimpleLagLim simpleLagLim(
    K=K_A,
    T=T_A,
    y_start=VA0,
    outMax=V_AMAX,
    outMin=V_AMIN)
    annotation (Placement(transformation(extent={{64,15},{74,25}})));
  Modelica.Blocks.Math.Add add2(k1=-1) annotation (Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={85,-51})));
  Modelica.Blocks.Nonlinear.Limiter imLimited1(uMax=Modelica.Constants.inf,
      uMin=0) annotation (Placement(transformation(
        extent={{-5.1,-5.1},{5.1,5.1}},
        rotation=90,
        origin={84.9,-15.1})));
  Modelica.Blocks.Math.Add3 add3_2(k1=+1, k2=-1)
    annotation (Placement(transformation(extent={{96,11},{106,21}})));
  Modelica.Blocks.Math.Gain imGain1(k=V_RMIN) annotation (Placement(
        transformation(
        extent={{-4.65,-4.85},{4.65,4.85}},
        rotation=90,
        origin={130.15,-45.35})));
  Modelica.Blocks.Math.Gain imGain2(k=V_RMAX) annotation (Placement(
        transformation(
        extent={{-4.65,-4.85},{4.65,4.85}},
        rotation=90,
        origin={145.15,-45.35})));
  Modelica.Blocks.Math.Add add3(k1=-1) annotation (Placement(transformation(
        extent={{5,-5},{-5,5}},
        rotation=270,
        origin={155,-25})));
  Modelica.Blocks.Math.Gain imGain3(k=K_C) annotation (Placement(transformation(
        extent={{-4.65,-4.85},{4.65,4.85}},
        rotation=90,
        origin={165.15,-45.35})));
  Modelica.Blocks.Nonlinear.VariableLimiter variableLimiter
    annotation (Placement(transformation(extent={{158,-6},{170,6}})));
protected
  parameter Real VREF(fixed=false) "Reference terminal voltage (pu)";
  parameter Real Efd0(fixed=false)
    "Initial value of the excitation voltage as a parameter";
  parameter Real IFD0(fixed=false);
  parameter Real VA0(fixed=false);
initial equation
  Efd0 = EFD0;
  IFD0 = 1.23;
  VA0 = Efd0 + K_LR*(IFD0 - I_LR);
  VREF = VA0/K_A + V_0;
equation
  connect(VUEL2, hV_GATE.n2) annotation (Line(
      points={{-95.5,-46},{-55.4,-46},{-55.4,-45.6},{-0.7,-45.6},{-0.7,15.7},{
          1.01875,15.7}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(VUEL3, hV_GATE1.n2) annotation (Line(
      points={{-95.3,-66},{69.9,-66},{69.9,-0.7},{111.05,-0.7},{111.05,9.3}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(hV_GATE1.p, lV_GATE.n1) annotation (Line(
      points={{131.05,14.3},{130,14.3},{130,14},{130.8,14},{130.8,13.3},{128.55,
          13.3}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(VOEL, lV_GATE.n2) annotation (Line(
      points={{123.3,-69.7},{123.3,3.3},{128.55,3.3}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(ECOMP, imSimpleLag.u) annotation (Line(points={{-95.3,0.4},{-85.65,
          0.4},{-85.65,0},{-75.78,0}}, color={0,0,127}));
  connect(Vref.y, add.u1) annotation (Line(points={{-65.52,20.95},{-60,20.95},{
          -60,8},{-56,8}}, color={0,0,127}));
  connect(imSimpleLag.y, add.u2) annotation (Line(points={{-64.51,0},{-62,0},{-60,
          0},{-60,2},{-56,2}}, color={0,0,127}));
  connect(VOTHSG, add1.u1) annotation (Line(points={{-95.2,67.8},{-70,67.8},{-70,
          59},{-56,59},{-56,58}}, color={0,0,127}));
  connect(VUEL1, add1.u2) annotation (Line(points={{-95.1,36.6},{-70,36.6},{-70,
          52},{-56,52}}, color={0,0,127}));
  connect(add.y, add3_1.u3) annotation (Line(points={{-44.5,5},{-40,5},{-40,21},
          {-35,21}}, color={0,0,127}));
  connect(add1.y, add3_1.u2) annotation (Line(points={{-44.5,55},{-40,55},{-40,
          25},{-35,25}}, color={0,0,127}));
  connect(imDerivativeLag.y, add3_1.u1) annotation (Line(points={{38.87,55.3},{
          -38,55.3},{-38,29},{-35,29}}, color={0,0,127}));
  connect(add3_1.y, imLimited.u) annotation (Line(points={{-23.5,25},{-17.22,25},
          {-17.22,24.9}}, color={0,0,127}));
  connect(imLimited.y, hV_GATE.n1) annotation (Line(points={{-5.49,24.9},{0,
          24.9},{0,26.1},{1.01875,26.1}}, color={0,0,127}));
  connect(hV_GATE.p, imLeadLag.u) annotation (Line(points={{21.5188,20.9},{
          21.2987,20.9},{21.2987,20},{25,20}}, color={0,0,127}));
  connect(imLeadLag.y, imLeadLag1.u)
    annotation (Line(points={{36.5,20},{44,20}}, color={0,0,127}));
  connect(simpleLagLim.u, imLeadLag1.y)
    annotation (Line(points={{63,20},{55.5,20}}, color={0,0,127}));
  connect(imGain.u, add2.y) annotation (Line(points={{85.15,-36.93},{85.15,-42.065},
          {85,-42.065},{85,-45.5}}, color={0,0,127}));
  connect(Vref1.y, add2.u1)
    annotation (Line(points={{70.5,-75},{82,-75},{82,-57}}, color={0,0,127}));
  connect(add2.u2, XADIFD) annotation (Line(points={{88,-57},{88,-77.55},{
          103.25,-77.55}}, color={0,0,127}));
  connect(imGain.y, imLimited1.u) annotation (Line(points={{85.15,-26.235},{
          85.15,-23.6175},{84.9,-23.6175},{84.9,-21.22}}, color={0,0,127}));
  connect(add3_2.y, hV_GATE1.n1) annotation (Line(points={{106.5,16},{111.05,16},
          {111.05,19.3}}, color={0,0,127}));
  connect(simpleLagLim.y, add3_2.u1)
    annotation (Line(points={{74.5,20},{84.75,20},{95,20}}, color={0,0,127}));
  connect(VOTHSG2, add3_2.u3) annotation (Line(points={{-95.4,-25},{-28,-25},{
          40,-25},{40,12},{95,12}}, color={0,0,127}));
  connect(imLimited1.y, add3_2.u2) annotation (Line(points={{84.9,-9.49},{84.9,
          16},{95,16}}, color={0,0,127}));
  connect(VT, imGain1.u) annotation (Line(points={{145.3,-69.7},{130.15,-69.7},
          {130.15,-50.93}}, color={0,0,127}));
  connect(VT, imGain2.u) annotation (Line(points={{145.3,-69.7},{145.3,-60.35},
          {145.15,-60.35},{145.15,-50.93}}, color={0,0,127}));
  connect(imGain2.y, add3.u2) annotation (Line(points={{145.15,-40.235},{145.15,
          -36},{152,-36},{152,-31}}, color={0,0,127}));
  connect(imGain3.y, add3.u1) annotation (Line(points={{165.15,-40.235},{165.15,
          -38},{165,-38},{165,-36},{158,-36},{158,-31}}, color={0,0,127}));
  connect(XADIFD, imGain3.u) annotation (Line(points={{103.25,-77.55},{103.25,-79},
          {165.15,-79},{165.15,-50.93}}, color={0,0,127}));
  connect(variableLimiter.y, EFD) annotation (Line(points={{170.6,0},{184.3,0},
          {184.3,0.2}}, color={0,0,127}));
  connect(lV_GATE.p, variableLimiter.u) annotation (Line(points={{148.55,8.3},{
          150,8.3},{150,0},{156.8,0}}, color={0,0,127}));
  connect(add3.y, variableLimiter.limit1) annotation (Line(points={{155,-19.5},
          {155,-16},{155,-16},{155,4.8},{156.8,4.8}}, color={0,0,127}));
  connect(imGain1.y, variableLimiter.limit2) annotation (Line(points={{130.15,-40.235},
          {130.15,-4.8},{156.8,-4.8}}, color={0,0,127}));
  connect(imDerivativeLag.u, variableLimiter.u) annotation (Line(points={{51.06,
          55.3},{150,55.3},{150,0},{156.8,0}}, color={0,0,127}));
  annotation (
    Diagram(coordinateSystem(
        preserveAspectRatio=false,
        extent={{-100,-80},{180,80}},
        grid={1,1}), graphics={Text(
          extent={{-11.2,35.6},{-1.2,29.6}},
          lineColor={255,0,0},
          textString="V"),Text(
          extent={{-1.5,32.3},{-7.5,30.3}},
          lineColor={255,0,0},
          textString="F"),Text(
          extent={{80.3,28.3},{90.3,22.3}},
          lineColor={255,0,0},
          textString="V"),Text(
          extent={{90.3,24.3},{84.3,22.3}},
          lineColor={255,0,0},
          textString="A"),Text(
          extent={{-93.4,80.6},{-78.4,65.3}},
          lineColor={0,0,255},
          textString="VOTHSG1"),Text(
          extent={{-96.3,49.9},{-84.9,39.4}},
          lineColor={0,0,255},
          textString="VUEL1"),Text(
          extent={{-97.1,16.6},{-83.7,1.1}},
          lineColor={0,0,255},
          textString="ECOMP"),Text(
          extent={{-96.6,-10.1},{-81.6,-25.4}},
          lineColor={0,0,255},
          textString="VOTHSG2"),Text(
          extent={{-96.4,-33.8},{-85,-44.3}},
          lineColor={0,0,255},
          textString="VUEL2"),Text(
          extent={{-96.8,-54},{-85.4,-64.5}},
          lineColor={0,0,255},
          textString="VUEL3"),Text(
          extent={{25.2,-67.2},{38.6,-82.7}},
          lineColor={0,0,255},
          textString="EFD0")}),
    Icon(coordinateSystem(
        preserveAspectRatio=true,
        extent={{-100,-80},{180,80}},
        grid={1,1}), graphics={Rectangle(extent={{-72,78},{148,-80}}, lineColor
          ={0,0,255}),Text(
          extent={{98,-68},{120,-78}},
          lineColor={0,0,255},
          textString="IFD"),Text(
          extent={{-78,14},{-36,-14}},
          lineColor={0,0,255},
          textString="Ec"),Text(
          extent={{2,78},{38,50}},
          lineColor={0,128,0},
          textString="VOTHSG
(VOS=1)"),Text(
          extent={{26,-68},{58,-78}},
          lineColor={0,0,255},
          textString="VOEL"),Text(
          extent={{116,8},{146,-8}},
          lineColor={0,0,255},
          textString="EFD"),Text(
          extent={{-16,36},{88,-26}},
          lineColor={0,0,255},
          textString="ESST1A"),Text(
          extent={{74,-68},{96,-78}},
          lineColor={0,0,255},
          textString="VT"),Text(
          extent={{-42,-64},{-14,-78}},
          lineColor={0,128,0},
          textString="VUEL2
(UEL=2)"),Text(
          extent={{-72,-64},{-44,-78}},
          lineColor={0,128,0},
          textString="VUEL1
(UEL=1)"),Text(
          extent={{-10,-64},{18,-78}},
          lineColor={0,128,0},
          textString="VUEL3
(UEL=3)"),Text(
          extent={{-40,74},{-2,56}},
          lineColor={0,128,0},
          textString="VOTHSG2
(VOS=2)"),Text(
          extent={{124,-68},{146,-78}},
          lineColor={0,0,255},
          textString="ILR"),Text(
          extent={{-72,-4},{18,-94}},
          lineColor={0,128,0},
          fontName="Calibri",
          textStyle={TextStyle.Bold,TextStyle.Italic},
          textString="Alternate UEL inputs"),Text(
          extent={{-42,88},{46,-8}},
          lineColor={0,128,0},
          fontName="Calibri",
          textStyle={TextStyle.Bold,TextStyle.Italic},
          textString="Alternate stabilizer inputs"),Text(
          extent={{3,20},{-3,-20}},
          lineColor={0,128,0},
          textString="}",
          origin={2,49},
          rotation=270),Text(
          extent={{3,20},{-3,-20}},
          lineColor={0,128,0},
          textString="}",
          origin={-26,-59},
          rotation=90),Text(
          extent={{78.2,75.2},{110.2,65.2}},
          lineColor={0,0,255},
          textString="EFD0")}),
    Documentation(info="<html>
<p><br><span style=\"font-family: MS Shell Dlg 2;\">&LT;iPSL: iTesla Power System Library&GT;</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Copyright 2015 RTE (France), AIA (Spain), KTH (Sweden) and DTU (Denmark)</span></p>
<ul>
<li><span style=\"font-family: MS Shell Dlg 2;\">RTE: http://www.rte-france.com/ </span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">AIA: http://www.aia.es/en/energy/</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">KTH: https://www.kth.se/en</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">DTU:http://www.dtu.dk/english</span></li>
</ul>
<p><span style=\"font-family: MS Shell Dlg 2;\">The authors can be contacted by email: info at ipsl dot org</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">This package is part of the iTesla Power System Library (&QUOT;iPSL&QUOT;) .</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is free software: you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">You should have received a copy of the GNU Lesser General Public License along with the iPSL. If not, see &LT;http://www.gnu.org/licenses/&GT;.</span></p>
</html>"));
end ESST1A;
