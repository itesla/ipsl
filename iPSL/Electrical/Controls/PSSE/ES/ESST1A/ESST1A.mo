within iPSL.Electrical.Controls.PSSE.ES.ESST1A;
model ESST1A "IEEE Type ST1A Excitation System"

  iPSL.NonElectrical.Math.ImSum2 imSum2_1(
    a0=0,
    a1=1,
    a2=-1)
    annotation (Placement(transformation(extent={{-57.6,-7.6},{-37.6,12.4}})));
  Modelica.Blocks.Sources.Constant Vref(k=VREF)
    annotation (Placement(transformation(extent={{-82.5,4.9},{-58.5,28.9}})));
  iPSL.NonElectrical.Math.ImSum3 imSum3_1(
    a0=0,
    a2=1,
    a1=-1,
    a3=1)
    annotation (Placement(transformation(extent={{-31.2,11.8},{-11.2,31.8}})));
  iPSL.NonElectrical.Math.ImSum2 imSum2_2(
    a0=0,
    a1=1,
    a2=1)
    annotation (Placement(transformation(extent={{-68.2,43.3},{-48.2,63.3}})));
  Modelica.Blocks.Interfaces.RealInput ECOMP
    "Input, generator terminal voltage"
    annotation (Placement(transformation(extent={{-100.3,-5.6},{-90.3,6.4}}),
        iconTransformation(
        extent={{-16,-17.5},{16,17.5}},
        rotation=0,
        origin={-89.3,-2})));
  Modelica.Blocks.Interfaces.RealInput VOTHSG "VOS=1"
                                   annotation (Placement(transformation(extent={{-100.2,
            61.8},{-90.2,73.8}}),
                                iconTransformation(extent={{-11,-13},{11,13}},
        rotation=90,
        origin={17,89})));

  Modelica.Blocks.Interfaces.RealInput VUEL1 "UEL=1"
                                 annotation (Placement(transformation(extent={{-100.1,
            30.6},{-90.1,42.6}}),
                             iconTransformation(extent={{-9,-10},{9,10}},
        rotation=270,
        origin={-58.3,-88})));
  NonElectrical.Continuous.SimpleLag imLimitedSimpleLag(
    y_start=VA0,
    Ymin=V_AMIN,
    Ymax=V_AMAX,
    K=K_A,
    T=T_A)
    annotation (Placement(transformation(extent={{54.6,0.3},{100.6,38.3}})));
  Modelica.Blocks.Interfaces.RealOutput EFD "Output,excitation voltage"
    annotation (Placement(transformation(extent={{179.3,-5.8},{189.3,6.2}}),
        iconTransformation(extent={{146,-18.4},{178,19.6}})));

parameter Real V_0 "Voltage magnitude (pu)" annotation (Dialog(group="Power flow data"));

parameter Real T_R=0 "Voltage input time constant (s)" annotation (Dialog(group="Excitation system parameters"));
parameter Real V_IMAX annotation (Dialog(group="Excitation system parameters"));
parameter Real V_IMIN annotation (Dialog(group="Excitation system parameters"));
parameter Real T_C=0 "AVR lead-lag time constant (s)" annotation (Dialog(group="Excitation system parameters"));
parameter Real T_B=0 "AVR lead-lag time constant (s)" annotation (Dialog(group="Excitation system parameters"));
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
parameter Real V_RMAX=9 annotation (Dialog(group="Excitation system parameters"));
parameter Real V_RMIN=-5.43 annotation (Dialog(group="Excitation system parameters"));
parameter Real K_C=0.2 "Rectifier load factor (pu)" annotation (Dialog(group="Excitation system parameters"));
parameter Real K_F=0.03 "Rate feedback gain (pu)" annotation (Dialog(group="Excitation system parameters"));
parameter Real T_F=1 "Rate feedback time constant (s)" annotation (Dialog(group="Excitation system parameters"));
parameter Real K_LR annotation (Dialog(group="Excitation system parameters"));
parameter Real I_LR annotation (Dialog(group="Excitation system parameters"));

  iPSL.NonElectrical.Continuous.DerivativeLag imDerivativeLag(
    y_start=0,
    K=K_F,
    T=T_F)
    annotation (Placement(transformation(extent={{70.4,37.6},{26.4,67.6}})));
  Modelica.Blocks.Interfaces.RealInput VOTHSG2 "VOS=2"
    annotation (Placement(transformation(extent={{-100.4,-31},{-90.4,-19}}),
        iconTransformation(extent={{-10.5,-12.5},{10.5,12.5}},
        rotation=90,
        origin={-20.2,89})));
  Modelica.Blocks.Interfaces.RealInput VUEL3 "UEL=3"
    annotation (Placement(transformation(extent={{-100.3,-72},{-90.3,-60}}),
        iconTransformation(extent={{-10,-10},{10,10}},
        rotation=270,
        origin={3.7,-88.9})));
  iPSL.NonElectrical.Continuous.ImLimited imLimited(Ymin=V_IMIN, Ymax=V_IMAX)
    annotation (Placement(transformation(extent={{-17.2,11.8},{2.8,31.8}})));
  NonElectrical.Logical.HV_GATE
          hV_GATE
    annotation (Placement(transformation(extent={{2.3,9.5},{22.8,30.3}})));
  Modelica.Blocks.Interfaces.RealInput VUEL2 "UEL=2"
                                 annotation (Placement(transformation(extent={{-100.5,
            -52},{-90.5,-40}}),
                              iconTransformation(extent={{-9,-10},{9,10}},
        rotation=270,
        origin={-26.8,-87.8})));
  iPSL.NonElectrical.Math.ImSum3 imSum3_2(
    a0=0,
    a2=1,
    a1=1,
    a3=-1)
    annotation (Placement(transformation(extent={{94.3,6.3},{114.3,26.3}})));

  iPSL.NonElectrical.Math.ImSum2 imSum2_4(
    a0=0,
    a2=1,
    a1=-1) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={94,-55.7})));
  iPSL.NonElectrical.Math.ImGain imGain(K=K_LR) annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={94.3,-39.7})));
  NonElectrical.Continuous.ImLimited                  imLimited_min1(
                Ymin=0, Ymax=99999)
    annotation (Placement(transformation(extent={{90.3,-37.7},{110.3,-17.7}})));
  NonElectrical.Logical.HV_GATE
          hV_GATE1
    annotation (Placement(transformation(extent={{112.3,4.3},{132.3,24.3}})));
  NonElectrical.Logical.LV_GATE
          lV_GATE
    annotation (Placement(transformation(extent={{129.8,-1.7},{149.8,18.3}})));
  Modelica.Blocks.Interfaces.RealInput VOEL
                        annotation (Placement(transformation(
        extent={{-5,-6},{5,6}},
        rotation=270,
        origin={123.3,-69.7}),
                          iconTransformation(extent={{-10,-11},{10,11}},
        rotation=270,
        origin={42.5,-89.2})));
  Modelica.Blocks.Interfaces.RealInput VT "sensed VT"
                                  annotation (Placement(transformation(
        extent={{-5,-6},{5,6}},
        rotation=270,
        origin={145.3,-69.7}),
                           iconTransformation(
        extent={{-8.5,-11.5},{8.5,11.5}},
        rotation=270,
        origin={82,-87})));
  iPSL.NonElectrical.Math.ImGain imGain1(K=V_RMIN) annotation (Placement(
        transformation(
        extent={{10,-10},{-10,10}},
        rotation=0,
        origin={136.7,-34.7})));
  iPSL.NonElectrical.Math.ImGain imGain2(K=V_RMAX) annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={152.6,-34.7})));
  iPSL.NonElectrical.Math.ImSum2 imSum2_3(
    a0=0,
    a1=1,
    a2=-1) annotation (Placement(transformation(extent={{158.6,-46.7},{178.6,-26.7}})));
  iPSL.NonElectrical.Math.ImGain imGain3(K=K_C) annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={160.3,-71.7})));
  iPSL.NonElectrical.Math.ImSetPoint Vref1(V=I_LR)
    annotation (Placement(transformation(extent={{58.3,-87.7},{82.3,-63.7}})));
  NonElectrical.Continuous.ImLeadLag imLeadLag(
    K=1,
    T1=T_C,
    T2=T_B,
    nStartValue=VA0/K_A)
    annotation (Placement(transformation(extent={{15.8,4.7},{46.6,34}})));
  NonElectrical.Continuous.ImLeadLag imLeadLag1(
    K=1,
    nStartValue=VA0/K_A,
    T1=T_C1,
    T2=T_B1)
    annotation (Placement(transformation(extent={{36.6,4.7},{67.4,34}})));

  ImRelay imRelay
    annotation (Placement(transformation(extent={{141.3,-18.6},{172.6,13.8}})));
  NonElectrical.Continuous.ImSimpleLag imSimpleLag(
    K=1,
    nStartValue=V_0,
    T=T_R)
    annotation (Placement(transformation(extent={{-95.8,-21},{-52.8,21.8}})));
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
protected
  parameter Real VREF(fixed = false) "Reference terminal voltage (pu)";
  parameter Real Efd0(fixed = false)
    "Initial value of the excitation voltage as a parameter";
  parameter Real IFD0(fixed=false);
  parameter Real  VA0(fixed=false);
initial equation
  Efd0 = EFD0;
  IFD0 = 1.23;
  VA0 = Efd0 + K_LR*(IFD0-I_LR);
  VREF = VA0/K_A + V_0 - imSum2_2.n1;

equation

  connect(Vref.n1, imSum2_1.p1) annotation (Line(
      points={{-64.62,16.9},{-54.7,16.9},{-54.7,4.4},{-52.7,4.4}},
      color={0,0,127},
      smooth=Smooth.None));

  connect(imSum3_1.n1, imLimited.p1) annotation (Line(
      points={{-16.3,21.8},{-12.3,21.8}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(imLimited.n1, hV_GATE.n1) annotation (Line(
      points={{-2.3,21.8},{0.8,21.8},{0.8,21.772},{5.375,21.772}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(VUEL2, hV_GATE.n2) annotation (Line(
      points={{-95.5,-46},{-55.4,-46},{-55.4,-45.6},{-0.7,-45.6},{-0.7,17.196},{
          5.375,17.196}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(VOTHSG2, imSum3_2.p2) annotation (Line(
      points={{-95.4,-25},{87.9,-25},{87.9,16.3},{99.2,16.3}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(imSum2_4.n1, imGain.p1) annotation (Line(
      points={{94,-50.8},{94,-47.8},{94.3,-47.8},{94.3,-44.8}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(imLimited_min1.p1, imGain.n1) annotation (Line(
      points={{95.2,-27.7},{94.3,-27.7},{94.3,-34.8}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(imLimited_min1.n1, imSum3_2.p3) annotation (Line(
      points={{105.2,-27.7},{107.9,-27.7},{107.9,8.3},{99.2,8.3},{99.2,13.3}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(imSum3_2.n1, hV_GATE1.n1) annotation (Line(
      points={{109.2,16.3},{112.3,16.3},{112.3,16.1},{115.3,16.1}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(VUEL3, hV_GATE1.n2) annotation (Line(
      points={{-95.3,-66},{69.9,-66},{69.9,-1.7},{115.3,-1.7},{115.3,11.7}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(hV_GATE1.p, lV_GATE.n1) annotation (Line(
      points={{128.2,13.8},{130,13.8},{130,14},{130.8,14},{130.8,10.1},{132.8,10.1}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(VOEL, lV_GATE.n2) annotation (Line(
      points={{123.3,-69.7},{123.3,5.7},{132.8,5.7}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(imDerivativeLag.n1, imSum3_1.p1) annotation (Line(
      points={{26.18,52.6},{-29.2,52.6},{-29.2,24.8},{-26.3,24.8}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(VT, imGain1.p1) annotation (Line(
      points={{145.3,-69.7},{145.3,-34.7},{141.8,-34.7}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(imGain2.p1, VT) annotation (Line(
      points={{147.5,-34.7},{145.3,-34.7},{145.3,-69.7}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(imGain2.n1, imSum2_3.p1) annotation (Line(
      points={{157.5,-34.7},{163.5,-34.7}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(imGain3.n1, imSum2_3.p2) annotation (Line(
      points={{165.2,-71.7},{163.5,-71.7},{163.5,-38.7}},
      color={0,0,127},
      smooth=Smooth.None));

  connect(imLimitedSimpleLag.n0, imSum3_2.p1) annotation (Line(
      points={{88.87,19.3},{99.2,19.3}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Vref1.n1, imSum2_4.p1) annotation (Line(points={{76.18,-75.7},{92,-75.7},
          {92,-60.8}},color={0,0,127}));
  connect(imSum2_1.n1, imSum3_1.p3) annotation (Line(points={{-42.7,2.4},{-29.8,
          2.4},{-29.8,18.8},{-26.3,18.8}}, color={0,0,127}));
  connect(VOTHSG, imSum2_2.p1) annotation (Line(points={{-95.2,67.8},{-89.8,67.8},
          {-89.8,67.7},{-67.8,67.7},{-67.8,55.3},{-63.3,55.3}}, color={0,0,127}));
  connect(VUEL1, imSum2_2.p2) annotation (Line(points={{-95.1,36.6},{-67.8,36.6},
          {-67.8,51.3},{-63.3,51.3}}, color={0,0,127}));
  connect(imSum2_2.n1, imSum3_1.p2) annotation (Line(points={{-53.3,53.3},{-53.3,
          53.3},{-39.2,53.3},{-39.2,21.8},{-26.3,21.8}},
                                                   color={0,0,127}));

  connect(imLimitedSimpleLag.p1, imLeadLag1.n1) annotation (Line(points={{65.87,
          19.3},{58.8,19.3},{58.8,19.35},{59.546,19.35}}, color={0,0,127}));
  connect(imLeadLag.n1, imLeadLag1.p1) annotation (Line(points={{38.746,19.35},{
          38.746,19.35},{44.146,19.35}}, color={0,0,127}));
  connect(lV_GATE.p, imRelay.p1) annotation (Line(points={{145.7,7.8},{147.1,
          7.8},{149.516,7.8},{149.516,0.678}},
                                          color={0,0,127}));
  connect(imDerivativeLag.p1, imRelay.p1) annotation (Line(points={{70.18,52.6},
          {149.3,52.6},{149.3,7.8},{149.516,7.8},{149.516,0.678}}, color={0,0,127}));
  connect(imGain1.n1, imRelay.p3) annotation (Line(points={{131.8,-34.7},{128.8,
          -34.7},{128.8,-7.584},{149.516,-7.584}}, color={0,0,127}));
  connect(imSum2_3.n1, imRelay.p2) annotation (Line(points={{173.5,-36.7},{
          176.1,-36.7},{176.1,-19.2},{136.6,-19.2},{136.6,-3.858},{149.516,
          -3.858}},
        color={0,0,127}));
  connect(imRelay.n1, EFD) annotation (Line(points={{164.618,0.192},{173.559,
          0.192},{173.559,0.2},{184.3,0.2}},
                                      color={0,0,127}));
  connect(ECOMP, imSimpleLag.p1) annotation (Line(points={{-95.3,0.4},{-88.55,0.4},
          {-80.965,0.4}}, color={0,0,127}));
  connect(imSimpleLag.n1, imSum2_1.p2) annotation (Line(points={{-59.25,0.4},{-59.25,
          0.4},{-52.7,0.4}}, color={0,0,127}));
  connect(hV_GATE.p, imLeadLag.p1) annotation (Line(points={{18.5975,19.38},{20.9988,
          19.38},{20.9988,19.35},{23.346,19.35}}, color={0,0,127}));
  connect(XADIFD, imGain3.p1) annotation (Line(points={{103.25,-77.55},{103.25,-84.8},
          {151.7,-84.8},{151.7,-71.7},{155.2,-71.7}}, color={0,0,127}));
  connect(XADIFD, imSum2_4.p2) annotation (Line(points={{103.25,-77.55},{103.25,
          -69.775},{96,-69.775},{96,-60.8}}, color={0,0,127}));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,
            -80},{180,80}},
        grid={0.1,0.1}),       graphics={
        Text(
          extent={{-76.3,28},{-66.3,20}},
          lineColor={0,0,255},
          textString="VREF"),
        Text(
          extent={{-11.2,35.6},{-1.2,29.6}},
          lineColor={255,0,0},
          textString="V"),
        Text(
          extent={{-1.5,32.3},{-7.5,30.3}},
          lineColor={255,0,0},
          textString="F"),
        Text(
          extent={{86.3,26.3},{96.3,20.3}},
          lineColor={255,0,0},
          textString="V"),
        Text(
          extent={{96.3,22.3},{90.3,20.3}},
          lineColor={255,0,0},
          textString="A"),
        Text(
          extent={{-93.4,80.6},{-78.4,65.3}},
          lineColor={0,0,255},
          textString="VOTHSG1"),
        Text(
          extent={{-96.3,49.9},{-84.9,39.4}},
          lineColor={0,0,255},
          textString="VUEL1"),
        Text(
          extent={{-97.1,16.6},{-83.7,1.1}},
          lineColor={0,0,255},
          textString="ECOMP"),
        Text(
          extent={{-96.6,-10.1},{-81.6,-25.4}},
          lineColor={0,0,255},
          textString="VOTHSG2"),
        Text(
          extent={{-96.4,-33.8},{-85,-44.3}},
          lineColor={0,0,255},
          textString="VUEL2"),
        Text(
          extent={{-96.8,-54},{-85.4,-64.5}},
          lineColor={0,0,255},
          textString="VUEL3"),
        Text(
          extent={{25.2,-67.2},{38.6,-82.7}},
          lineColor={0,0,255},
          textString="EFD0")}),
                             Icon(coordinateSystem(preserveAspectRatio=true,
          extent={{-100,-80},{180,80}},
        grid={0.1,0.1}),                   graphics={
        Rectangle(extent={{-72,78},{148,-80}}, lineColor={0,0,255}),
        Text(
          extent={{98,-68},{120,-78}},
          lineColor={0,0,255},
          textString="IFD"),
        Text(
          extent={{-78,14},{-36,-14}},
          lineColor={0,0,255},
          textString="Ec"),
        Text(
          extent={{2,78},{38,50}},
          lineColor={0,128,0},
          textString="VOTHSG
(VOS=1)"),
        Text(
          extent={{26,-68},{58,-78}},
          lineColor={0,0,255},
          textString="VOEL"),
        Text(
          extent={{116,8},{146,-8}},
          lineColor={0,0,255},
          textString="EFD"),
        Text(
          extent={{-16,36},{88,-26}},
          lineColor={0,0,255},
          textString="ESST1A"),
        Text(
          extent={{74,-68},{96,-78}},
          lineColor={0,0,255},
          textString="VT"),
        Text(
          extent={{-42,-64},{-14,-78}},
          lineColor={0,128,0},
          textString="VUEL2
(UEL=2)"),
        Text(
          extent={{-72,-64},{-44,-78}},
          lineColor={0,128,0},
          textString="VUEL1
(UEL=1)"),
        Text(
          extent={{-10,-64},{18,-78}},
          lineColor={0,128,0},
          textString="VUEL3
(UEL=3)"),
        Text(
          extent={{-40,74},{-2,56}},
          lineColor={0,128,0},
          textString="VOTHSG2
(VOS=2)"),
        Text(
          extent={{124,-68},{146,-78}},
          lineColor={0,0,255},
          textString="ILR"),
        Text(
          extent={{-72,-4},{18,-94}},
          lineColor={0,128,0},
          fontName="Calibri",
          textStyle={TextStyle.Bold,TextStyle.Italic},
          textString="Alternate UEL inputs"),
        Text(
          extent={{-42,88},{46,-8}},
          lineColor={0,128,0},
          fontName="Calibri",
          textStyle={TextStyle.Bold,TextStyle.Italic},
          textString="Alternate stabilizer inputs"),
        Text(
          extent={{3,20},{-3,-20}},
          lineColor={0,128,0},
          textString="}",
          origin={2,49},
          rotation=270),
        Text(
          extent={{3,20},{-3,-20}},
          lineColor={0,128,0},
          textString="}",
          origin={-26,-59},
          rotation=90),
        Text(
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
