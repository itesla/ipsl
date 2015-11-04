within iPSL.Electrical.Wind.DTU;
model QControl_Type4B "Developed by DTU"

  iPSL.NonElectrical.Nonlinear.ImReal4in imReal4in
    annotation (Placement(transformation(extent={{-72,6},{-32,44}})));
  Modelica.Blocks.Interfaces.RealInput Uref annotation(Placement(transformation(extent = {{-88, 16}, {-80, 24}})));
  Modelica.Blocks.Interfaces.RealInput Qref annotation(Placement(transformation(extent = {{-88, -4}, {-80, 4}})));
  Modelica.Blocks.Interfaces.RealInput Qwtt annotation(Placement(transformation(extent = {{-88, 36}, {-80, 44}})));
  Modelica.Blocks.Interfaces.RealInput Pwtt annotation(Placement(transformation(extent = {{-88, -24}, {-80, -16}})));
  Modelica.Blocks.Interfaces.RealInput Uwtt annotation(Placement(transformation(extent = {{-88, -44}, {-80, -36}})));
  iPSL.NonElectrical.Continuous.ImSimpleLag imSimpleLag(
    nStartValue=ini_Pwtt,
    K=1,
    T=Tpfilt)
    annotation (Placement(transformation(extent={{-82,-32},{-48,-8}})));
  parameter Real Tpfilt "Power measurement filter time constant";
  parameter Real MwttPF "Power factor control mode";
  parameter Real MwttU "Voltage control mode";
  parameter Real MwttOL "Open loop mode";
  parameter Real Uref0 "User defined voltage reference";
  parameter Real Tangent_phi "Calculated from power factor setpoint";
  parameter Real Qmax "Maximum reactive power";
  parameter Real Qmin "Minimum reactive power";
  parameter Real Tufilt "Voltage measurement filter time constant";
  parameter Real Uqdip "Voltage threshold value for LVRT detection";
  parameter Real Tpost
    "Length of time period where post fault reactive power is injected";
  parameter Real Udb1 "Voltage dead band lower limit";
  parameter Real Udb2 "Voltage dead band upper limit";
  parameter Real Kqv "Voltage scaling factor for LVRT current";
  parameter Real iqh1 "Maximum reactive current injection during dip";
  parameter Real iqmin "Minimum reactive current injection";
  parameter Real iqmax "Maximum reactive current injection";
  parameter Real iq_post "Post fault reactive current injection";
  parameter Real Umax "Maximum voltage in voltage PI controller integral term";
  parameter Real Umin "Minimum voltage in voltage PI controller integral term";
  parameter Real KiQ "Reactive power PI controller integration gain";
  parameter Real KpQ "Reactive power PI controller proportional gain";
  parameter Real Tqord "Time constant in reactive power order lag";
  parameter Real KiU "Voltage PI controller integration gain";
  parameter Real KpU "Voltage PI controller proportional gain";
  parameter Real Tiq "Time constant in reactive current lag";
  parameter Real ini_Pwtt(fixed = false)
    "Initial value of the state (Active power order lag)";
  parameter Real ini_Uwtt(fixed = false)
    "Initial value of the state (Voltage order lag)";
  parameter Real ini_Qpi(fixed = false)
    "Initial value of the state (Reactive power PI controller)";
  parameter Real ini_Qwtt(fixed = false)
    "Initial value of the state (Reactive power order lag)";
  parameter Real ini_Iqwtt(fixed = false) "Initial reactive current";
  parameter Real Rdroop "Resistive component of voltage drop impedance";
  parameter Real Xdroop "Inductive component of voltage drop impedance";
  iPSL.NonElectrical.Math.ImSetPoint imSetPoint1(V=MwttPF)
    annotation (Placement(transformation(extent={{-92,40},{-74,60}})));
  iPSL.NonElectrical.Math.ImSetPoint imSetPoint4(V=MwttOL)
    annotation (Placement(transformation(extent={{-92,64},{-74,84}})));
  iPSL.NonElectrical.Math.ImSetPoint imSetPoint3(V=Uref0)
    annotation (Placement(transformation(extent={{-92,56},{-74,76}})));
  iPSL.NonElectrical.Math.ImSetPoint imSetPoint2(V=MwttU)
    annotation (Placement(transformation(extent={{-92,48},{-74,68}})));
  iPSL.NonElectrical.Math.ImMult2 imMult2_1(
    a0=0,
    a1=1,
    a2=1) annotation (Placement(transformation(extent={{-54,-32},{-34,-12}})));
  iPSL.NonElectrical.Math.ImSetPoint imSetPoint(V=Tangent_phi)
    annotation (Placement(transformation(extent={{-72,-40},{-52,-20}})));
  iPSL.NonElectrical.Nonlinear.ImRelay imRelay
    annotation (Placement(transformation(extent={{-40,14},{-8,46}})));
  iPSL.NonElectrical.Nonlinear.ImLimiter imLimiter(Ymin=Qmin, Ymax=Qmax)
    annotation (Placement(transformation(extent={{-16,20},{4,40}})));
  iPSL.NonElectrical.Math.ImSum2 imSum2_1(
    a0=0,
    a1=1,
    a2=-1) annotation (Placement(transformation(extent={{0,22},{20,42}})));
  iPSL.NonElectrical.Continuous.ImSimpleLag imSimpleLag1(
    K=1,
    T=Tufilt,
    nStartValue=ini_Uwtt)
    annotation (Placement(transformation(extent={{-82,-52},{-48,-28}})));
  iPSL.NonElectrical.Nonlinear.ImRelay imRelay1
    annotation (Placement(transformation(extent={{22,20},{54,57}})));
  iPSL.NonElectrical.Math.ImSetPoint imSetPoint5(V=0)
    annotation (Placement(transformation(extent={{11,29},{31,49}})));
  iPSL.Electrical.Wind.DTU.LVRT lVRT(Uqdip=Uqdip, Tpost=Tpost)
    annotation (Placement(transformation(extent={{-54,-74},{2,-32}})));
  iPSL.NonElectrical.Nonlinear.ImLimiter imLimiter1(Ymin=0.01, Ymax=999)
    annotation (Placement(transformation(extent={{-44,-50},{-24,-30}})));
  iPSL.Electrical.Wind.DTU.VoltageDepCurrent voltageDepCurrent(
    Udb1=Udb1,
    Udb2=Udb2,
    Kqv=Kqv) annotation (Placement(transformation(extent={{-52,-98},{0,-62}})));
  iPSL.NonElectrical.Nonlinear.ImLimiter imLimiter2(Ymin=iqmin, Ymax=iqh1)
    annotation (Placement(transformation(extent={{-10,-90},{10,-70}})));
  iPSL.NonElectrical.Math.ImSetPoint imSetPoint6(V=iq_post)
    annotation (Placement(transformation(extent={{2,-82},{20,-66}})));
  iPSL.NonElectrical.Math.ImGain imGain(K=KpQ)
    annotation (Placement(transformation(extent={{44,14},{64,34}})));
  iPSL.NonElectrical.Math.ImSum2 imSum2_2(
    a0=0,
    a2=1,
    a1=1) annotation (Placement(transformation(extent={{58,22},{78,42}})));
  iPSL.NonElectrical.Math.ImSum2 imSum2_3(
    a0=0,
    a2=1,
    a1=1) annotation (Placement(transformation(extent={{26,58},{46,78}})));
  iPSL.NonElectrical.Nonlinear.ImRelay imRelay2
    annotation (Placement(transformation(extent={{72,36},{104,68}})));
  iPSL.NonElectrical.Nonlinear.ImLimiter imLimiter3(Ymin=Umin, Ymax=Umax)
    annotation (Placement(transformation(extent={{96,42},{116,62}})));
  iPSL.NonElectrical.Math.ImSum2 imSum2_4(
    a0=0,
    a1=-1,
    a2=1) annotation (Placement(transformation(extent={{112,40},{132,60}})));
  iPSL.NonElectrical.Math.ImDiv2 imDiv2_1(
    a0=0,
    a1=1,
    a2=1,
    nStartValue=ini_Iqwtt)
    annotation (Placement(transformation(extent={{88,2},{108,22}})));
  iPSL.NonElectrical.Math.ImSetPoint imSetPoint8(V=0)
    annotation (Placement(transformation(extent={{137,50},{157,70}})));
  iPSL.NonElectrical.Nonlinear.ImRelay imRelay4
    annotation (Placement(transformation(extent={{154,42},{186,79}})));
  iPSL.NonElectrical.Math.ImGain imGain1(K=KpU)
    annotation (Placement(transformation(extent={{180,40},{200,60}})));
  iPSL.NonElectrical.Math.ImSum2 imSum2_7(
    a0=0,
    a2=1,
    a1=1) annotation (Placement(transformation(extent={{192,46},{212,66}})));
  iPSL.NonElectrical.Nonlinear.ImRelay imRelay5
    annotation (Placement(transformation(extent={{217,45},{249,77}})));
  Modelica.Blocks.Interfaces.RealOutput Iqcmd annotation(Placement(transformation(extent = {{120, -24}, {128, -16}}), iconTransformation(extent = {{120, -24}, {128, -16}})));
  Modelica.Blocks.Interfaces.RealOutput F_LVRT annotation(Placement(transformation(extent = {{120, 16}, {128, 24}}), iconTransformation(extent = {{120, 16}, {128, 24}})));
  iPSL.NonElectrical.Continuous.ImSimpleLag_nonwindup imSimpleLag_nonwindup(
    rmin=-999,
    rmax=999,
    initValue=ini_Qwtt,
    min=Qmin,
    max=Qmax,
    T=Tqord) annotation (Placement(transformation(extent={{28,-2},{52,24}})));
  iPSL.NonElectrical.Continuous.ImSimpleLag_frznonwindup imSimpleLag_frznonwindup(
    min=iqmin,
    max=iqmax,
    T=Tiq,
    rmin=-999,
    rmax=999,
    initValue=ini_Iqwtt)
    annotation (Placement(transformation(extent={{142,-30},{182,4}})));
  iPSL.Electrical.Wind.DTU.IQLVRT iQLVRT1
    annotation (Placement(transformation(extent={{30,-96},{78,-52}})));
  iPSL.Electrical.Wind.DTU.VoltageDrop voltageDrop(Rdroop=Rdroop, Xdroop=Xdroop)
    annotation (Placement(transformation(extent={{-28,-36},{20,2}})));
  iPSL.NonElectrical.Continuous.ImIntegratornonwindup ImIntegratornonwindup(
    Ymin=Umin,
    Ymax=Umax,
    K=KiQ,
    nStartValue=ini_Qpi)
    annotation (Placement(transformation(extent={{44,28},{64,48}})));
  iPSL.NonElectrical.Continuous.ImIntegratornonwindup ImIntegratornonwindup1(
    Ymin=iqmin,
    Ymax=iqmax,
    K=KiU,
    nStartValue=ini_Iqwtt)
    annotation (Placement(transformation(extent={{180,50},{200,70}})));
initial equation
  ini_Pwtt = Pwtt;
  ini_Qpi = imLimiter1.n1;
  ini_Uwtt = Uwtt;
  ini_Qwtt = -Qwtt;

equation
  connect(imReal4in.p1, Uref) annotation(Line(points = {{-61, 28.8}, {-69.75, 28.8}, {-69.75, 20}, {-84, 20}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(imReal4in.p2, Qref) annotation(Line(points = {{-61, 21.2}, {-68.75, 21.2}, {-68.75, 0}, {-84, 0}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(Pwtt, imSimpleLag.p1) annotation(Line(points = {{-84, -20}, {-70.27, -20}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(imSetPoint1.n1, imReal4in.in1) annotation(Line(points = {{-78.59, 50}, {-60, 50}, {-60, 33.74}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(imSetPoint2.n1, imReal4in.in2) annotation(Line(points = {{-78.59, 58}, {-54.8, 58}, {-54.8, 33.74}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(imSetPoint3.n1, imReal4in.in3) annotation(Line(points = {{-78.59, 66}, {-49.2, 66}, {-49.2, 33.74}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(imSetPoint4.n1, imReal4in.in4) annotation(Line(points = {{-78.59, 74}, {-44, 74}, {-44, 33.74}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(imSimpleLag.n1, imMult2_1.p1) annotation(Line(points={{-53.1,-20},{-48,
          -20},{-48,-19.8},{-49.1,-19.8}},                                                                                  color = {0, 0, 127}, smooth = Smooth.None));
  connect(imSetPoint.n1, imMult2_1.p2) annotation(Line(points = {{-57.1, -30}, {-50, -30}, {-50, -24.2}, {-49.1, -24.2}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(imMult2_1.n1, imRelay.p2) annotation(Line(points = {{-39.1, -22}, {-38, -22}, {-38, 30}, {-32.16, 30}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(imReal4in.n, imRelay.p3) annotation(Line(points = {{-43.2, 25}, {-30.6, 25}, {-30.6, 25.2}, {-32.16, 25.2}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(imRelay.p1, imReal4in.in1) annotation(Line(points = {{-32.16, 34.8}, {-38, 34.8}, {-38, 50}, {-60, 50}, {-60, 33.74}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(imRelay.n1, imLimiter.p1) annotation(Line(points = {{-16.16, 30}, {-11.1, 30}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(imLimiter.n1, imSum2_1.p2) annotation(Line(points = {{-1.1, 30}, {4.9, 30}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(Qwtt, imSum2_1.p1) annotation(Line(points = {{-84, 40}, {0, 40}, {0, 34}, {4.9, 34}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(Uwtt, imSimpleLag1.p1) annotation(Line(points = {{-84, -40}, {-70.27, -40}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(imSum2_1.n1, imRelay1.p3) annotation(Line(points = {{14.9, 32}, {22, 32}, {22, 32.95}, {29.84, 32.95}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(imRelay1.p2, imSetPoint5.n1) annotation(Line(points = {{29.84, 38.5}, {28, 38.5}, {28, 39}, {25.9, 39}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(lVRT.Uwtt, imSimpleLag1.n1) annotation(Line(points={{-38.88,-53},{-46.44,
          -53},{-46.44,-40},{-53.1,-40}},                                                                                    color = {0, 0, 127}, smooth = Smooth.None));
  connect(imSimpleLag1.n1, imLimiter1.p1) annotation(Line(points={{-53.1,-40},{-39.1,
          -40}},                                                                                  color = {0, 0, 127}, smooth = Smooth.None));
  connect(lVRT.F_LVRT, imRelay1.p1) annotation(Line(points = {{-13.68, -48.8}, {2, -48.8}, {2, 44.05}, {29.84, 44.05}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(voltageDepCurrent.Uwtt, imSimpleLag1.n1) annotation(Line(points={{-40.04,
          -80},{-46,-80},{-46,-40},{-53.1,-40}},                                                                                    color = {0, 0, 127}, smooth = Smooth.None));
  connect(voltageDepCurrent.iqv, imLimiter2.p1) annotation(Line(points = {{-12.22, -80}, {-5.1, -80}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(imGain.p1, imRelay1.p3) annotation(Line(points = {{48.9, 24}, {20, 24}, {20, 32}, {22, 32}, {22, 32.95}, {29.84, 32.95}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(imGain.n1, imSum2_2.p2) annotation(Line(points = {{58.9, 24}, {60, 24}, {60, 30}, {62.9, 30}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(imSum2_3.p1, imReal4in.in3) annotation(Line(points = {{30.9, 70}, {-49.2, 70}, {-49.2, 33.74}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(imSum2_3.p2, imLimiter.p1) annotation(Line(points = {{30.9, 66}, {-14, 66}, {-14, 30}, {-11.1, 30}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(imRelay2.p1, imReal4in.in2) annotation(Line(points = {{79.84, 56.8}, {-54.8, 56.8}, {-54.8, 33.74}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(imRelay2.p2, imSum2_3.n1) annotation(Line(points = {{79.84, 52}, {76, 52}, {76, 68}, {40.9, 68}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(imRelay2.n1, imLimiter3.p1) annotation(Line(points = {{95.84, 52}, {100.9, 52}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(imLimiter3.n1, imSum2_4.p1) annotation(Line(points = {{110.9, 52}, {116.9, 52}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(imDiv2_1.p2, imLimiter1.n1) annotation(Line(points = {{92.9, 10}, {90, 10}, {90, 0}, {-29.1, 0}, {-29.1, -40}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(imSetPoint8.n1, imRelay4.p2) annotation(Line(points = {{151.9, 60}, {164, 60}, {164, 60.5}, {161.84, 60.5}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(imSum2_4.n1, imRelay4.p3) annotation(Line(points = {{126.9, 50}, {148, 50}, {148, 54.95}, {161.84, 54.95}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(imRelay4.p1, imRelay1.p1) annotation(Line(points = {{161.84, 66.05}, {136, 66.05}, {136, -4}, {2, -4}, {2, 44.05}, {29.84, 44.05}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(imGain1.p1, imRelay4.p3) annotation(Line(points = {{184.9, 50}, {148, 50}, {148, 54.95}, {161.84, 54.95}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(imRelay5.p1, imReal4in.in4) annotation(Line(points = {{224.84, 65.8}, {208, 65.8}, {208, 74}, {-44, 74}, {-44, 33.74}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(F_LVRT, imRelay1.p1) annotation(Line(points = {{124, 20}, {80, 20}, {80, -28}, {2, -28}, {2, 44.05}, {29.84, 44.05}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(imSimpleLag_nonwindup.yi, imLimiter.p1) annotation(Line(points = {{31.96, 11}, {-14, 11}, {-14, 30}, {-11.1, 30}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(imSimpleLag_nonwindup.yo, imDiv2_1.p1) annotation(Line(points = {{47.92, 10.87}, {61.96, 10.87}, {61.96, 14}, {92.9, 14}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(imDiv2_1.n1, imSimpleLag_frznonwindup.yi) annotation(Line(points = {{102.9, 12}, {126, 12}, {126, -13}, {148.6, -13}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(imSimpleLag_frznonwindup.yo, imRelay5.p2) annotation(Line(points = {{175.2, -13.17}, {218, -13.17}, {218, 61}, {224.84, 61}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(imSimpleLag_frznonwindup.frz, imRelay1.p1) annotation(Line(points = {{154, -5.01}, {146, -5.01}, {146, -4}, {136, -4}, {2, -3.95}, {2, 44.05}, {29.84, 44.05}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(lVRT.Fpost, iQLVRT1.Fpost) annotation(Line(points = {{-13.68, -57.2}, {16, -57.2}, {16, -46}, {64, -46}, {64, -61.68}, {63.6, -61.68}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(imRelay5.n1, iQLVRT1.iQstate) annotation(Line(points = {{240.84, 61}, {246, 61}, {246, -30}, {30, -30}, {30, -67.4}, {42.96, -67.4}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(iQLVRT1.iQcmd, Iqcmd) annotation(Line(points = {{64.56, -74}, {94, -74}, {94, -20}, {124, -20}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(imSetPoint6.n1, iQLVRT1.iQpost) annotation(Line(points = {{15.41, -74}, {42.96, -74}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(imLimiter2.n1, iQLVRT1.iqv) annotation(Line(points = {{4.9, -80}, {24, -80}, {24, -80.6}, {42.96, -80.6}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(voltageDrop.Pwt, imSimpleLag.p1) annotation(Line(points = {{-19.6, -9.4}, {-76, -9.4}, {-76, -20}, {-70.27, -20}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(voltageDrop.Qwt, imSum2_1.p1) annotation(Line(points = {{-19.6, -17}, {-26, -17}, {-26, 6}, {-80, 6}, {-80, 40}, {0, 40}, {0, 34}, {4.9, 34}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(voltageDrop.Uwt, imLimiter1.p1) annotation(Line(points = {{-19.6, -24.6}, {-34, -24.6}, {-34, -32}, {-42, -32}, {-42, -40}, {-39.1, -40}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(voltageDrop.deltaU, imSum2_4.p2) annotation(Line(points = {{11.6, -17}, {86, -17}, {86, 38}, {116.9, 38}, {116.9, 48}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(imRelay1.n1, ImIntegratornonwindup.p1) annotation(Line(points = {{45.84, 38.5}, {48, 38.5}, {48, 38}, {48.9, 38}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(imSum2_2.p1, ImIntegratornonwindup.n0) annotation(Line(points = {{62.9, 34}, {60, 34}, {60, 38}, {58.9, 38}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(imRelay4.n1, ImIntegratornonwindup1.p1) annotation(Line(points = {{177.84, 60.5}, {180.92, 60.5}, {180.92, 60}, {184.9, 60}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(ImIntegratornonwindup1.n0, imSum2_7.p1) annotation(Line(points = {{194.9, 60}, {196, 60}, {196, 58}, {196.9, 58}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(imGain1.n1, imSum2_7.p2) annotation(Line(points = {{194.9, 50}, {196, 50}, {196, 54}, {196.9, 54}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(imSum2_2.n1, imRelay2.p3) annotation(Line(points = {{72.9, 32}, {76, 32}, {76, 47.2}, {79.84, 47.2}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(imSum2_7.n1, imRelay5.p3) annotation(Line(points = {{206.9, 56}, {216, 56}, {216, 56.2}, {224.84, 56.2}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(iQLVRT1.F_LVRT, imRelay1.p1) annotation(Line(points = {{44.4, -61.68}, {44.4, -42}, {2, -42}, {2, 44.05}, {29.84, 44.05}}, color = {0, 0, 127}, smooth = Smooth.None));
  annotation(Icon(coordinateSystem(extent = {{-100, -100}, {260, 80}}, preserveAspectRatio = false), graphics={  Rectangle(extent=  {{-80, 40}, {120, -40}}, lineColor=  {0, 0, 255},
            lineThickness=                                                                                                    0.5), Text(extent=  {{-25, 26}, {52, -22}}, lineColor=  {0, 0, 255},
            lineThickness=                                                                                                    0.5,
            fillPattern=                                                                                                    FillPattern.Solid, textString=  "Type 4B
Q Control"),
     Text(extent=  {{-74, 36}, {-54, 30}}, lineColor=  {0, 0, 255}, textString=  "Qwtt"), Text(extent=  {{-74, 22}, {-54, 16}}, lineColor=  {0, 0, 255}, textString=  "Uref"), Text(extent=  {{-74, 3}, {-54, -3}}, lineColor=  {0, 0, 255}, textString=  "Qref"), Text(extent=  {{-74, -17}, {-54, -23}}, lineColor=  {0, 0, 255}, textString=  "Pwtt"), Text(extent=  {{-74, -32}, {-54, -38}}, lineColor=  {0, 0, 255}, textString=  "Uwtt"), Text(extent=  {{96, 22}, {116, 16}}, lineColor=  {0, 0, 255}, textString=  "LVRT"), Text(extent=  {{96, -16}, {116, -22}}, lineColor=  {0, 0, 255}, textString=  "iQcmd")}), Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {260, 80}}), graphics),
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
end QControl_Type4B;
