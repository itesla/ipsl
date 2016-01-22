within iPSL.Electrical.Wind.PSSE.WT4G;
model WT4E1 "Electrical Control for Type 4 Wind Generator"

  parameter Integer PFAFLG "PF fast control" annotation (choices(choice=1 "Enable",choice=0 "Disable"));
  parameter Integer VARFLG annotation (choices(choice=0 " Qord is not provided by WindVar", choice=1 " Qord is provided by WindVar"));
  parameter Integer PQFLAG "P/Q priority flag" annotation (choices(choice=0 "Q priority",choice=1 "P priority"));

  parameter Real Tfv "Filter time constant in voltage regulator (sec)";
  parameter Real Kpv " Proportional gain in voltage regulator (pu)";
  parameter Real KIV " Integrator gain in voltage regulator (pu)";

  parameter Real Kpp " Proportional gain in torque regulator (pu)";
  parameter Real KIP " Integrator gain in torque regulator (pu)";
  //should be 0.1 in PSSE
  parameter Real Kf "Rate feedback gain (pu)";
  parameter Real Tf "Rate feedback time constant (sec.)";
  parameter Real QMX " Max limit in voltage regulator (pu)";
  parameter Real QMN " Min limit in voltage regulator (pu)";
  parameter Real IPMAX " Max active current limit";
  parameter Real TRV " Voltage sensor time constant";
  parameter Real dPMX " Max limit in power PI controller";
  parameter Real dPMN " Min limit in power PI controller";
  parameter Real T_Power " Power filter time constant";
  parameter Real KQI " MVAR/Voltage gain";
  //should be 0.1 in PSSE

  parameter Real VMINCL=0.9 " Min voltage limit";
  parameter Real VMAXCL=1.1 " Max voltage limit";

  parameter Real KVI=120 " Voltage/MVAR gain";

  parameter Real Tv=0.50000E-01 " Lag time constant in WindVar controller";
  parameter Real Tp=0.50000E-01 " Pelec filter in fast PF controller";
  parameter Real ImaxTD=1.7 "Converter current limit";
  parameter Real Iphl=1.11 "Hard active current limit";
  parameter Real Iqhl=1.11 "Hard reactive current limit";

  //parameter Real Qord "MVAR order from MVAR emulator";

protected
  parameter Real Vref(fixed=false);
  parameter Real Pref=p0;
  parameter Real Qref=q0 "Q reference if PFAFLG=0 & VARFLG";
  parameter Real PFA_ref=atan2(q0, p0) "PF angle reference if PFAFLG=1";

  parameter Real p0(fixed=false);
  parameter Real q0(fixed=false);
  parameter Real v0(fixed=false);
  parameter Real Ip0(fixed=false);
  parameter Real Iq0(fixed=false);

  parameter Real Pord0(fixed=false);

  parameter Real k0(fixed=false) "Filter in voltage regulator";
  parameter Real k10(fixed=false) "Integrator in voltage regulator";
  parameter Real k20(fixed=false) "Integrator in active power regulator";
  parameter Real k30(fixed=false) "Active power regulator feedback";
  parameter Real k40(fixed=false) "Voltage sensor";
  parameter Real k50(fixed=false) "Power filter";
  parameter Real k60(fixed=false) "MVAR/Vref integrator";
  parameter Real k70(fixed=false) "Verror/Internal machine voltage integrator";
  parameter Real k80(fixed=false) "Lag of the WindVar controller";
  parameter Real k90(fixed=false) "Input filter of Pelec for PF fast controller";

public
  Modelica.Blocks.Interfaces.RealInput P(start=p0)
    annotation (Placement(transformation(extent={{-200,-74},{-170,-44}}), iconTransformation(
        extent={{-20,-20},{20,20}},
        rotation=180,
        origin={180,40})));
  Modelica.Blocks.Interfaces.RealInput Q(start=q0) annotation (Placement(transformation(
        extent={{-16,-16},{16,16}},
        rotation=270,
        origin={50,110}), iconTransformation(
        extent={{-20,-20},{20,20}},
        rotation=180,
        origin={180,100})));

  Modelica.Blocks.Interfaces.RealInput V(start=v0)
    annotation (Placement(transformation(extent={{-206,-114},{-172,-80}}), iconTransformation(
        extent={{-20,-20},{20,20}},
        rotation=180,
        origin={180,160})));

  Modelica.Blocks.Nonlinear.VariableLimiter imLimited_max annotation (Placement(transformation(extent={{104,-74},{128,-46}})));
  Modelica.Blocks.Interfaces.RealOutput WIPCMD annotation (Placement(transformation(extent={{178,-70},{196,-52}}), iconTransformation(extent={{200,-80},{240,-40}})));

  Modelica.Blocks.Nonlinear.Limiter Qord(uMin=QMN, uMax=QMX) annotation (Placement(transformation(extent={{8,18},{44,66}})));

  Modelica.Blocks.Math.Feedback feedback1 annotation (Placement(transformation(extent={{44,50},{58,36}})));
  Modelica.Blocks.Continuous.LimIntegrator K6(
    outMin=VMINCL,
    outMax=VMAXCL,
    k=KQI,
    y_start=k60) annotation (Placement(transformation(extent={{56,32},{76,54}})));
  Modelica.Blocks.Math.Feedback Vcl annotation (Placement(transformation(extent={{76,36},{90,50}})));
  Modelica.Blocks.Interfaces.RealOutput WIQCMD annotation (Placement(transformation(extent={{178,34},{196,52}}), iconTransformation(extent={{200,-160},{240,-120}})));
  iPSL.NonElectrical.Continuous.IntegratorLimVar K7(K=KVI, y_start=k70) annotation (Placement(transformation(extent={{92,18},{160,68}})));

  Modelica.Blocks.Math.Division division annotation (Placement(transformation(extent={{92,-66},{102,-56}})));
  Modelica.Blocks.Nonlinear.Limiter imLimited_min(uMin=0.0000001,uMax=Modelica.Constants.inf) annotation (Placement(transformation(extent={{34,-118},{58,-92}})));
  Modelica.Blocks.Math.Add3 add3_1(k1=-1, k3=-1) annotation (Placement(transformation(extent={{-48,-66},{-36,-54}})));
  Modelica.Blocks.Sources.Constant VAR3(k=Pref) annotation (Placement(transformation(
        extent={{-8,-8},{8,8}},
        rotation=0,
        origin={-78,-34})));
  Modelica.Blocks.Math.Gain gain(k=Kpp) annotation (Placement(transformation(extent={{-4,-66},{8,-54}})));
  Modelica.Blocks.Continuous.LimIntegrator K2(
    y_start=k20,
    outMin=dPMN,
    outMax=dPMX,
    k=KIP) annotation (Placement(transformation(extent={{-6,-52},{14,-30}})));
  Modelica.Blocks.Math.Add Pord(k2=-1) annotation (Placement(transformation(extent={{54,-60},{68,-46}})));
  Submodels.CCL cCL(
    Qmax=QMX,
    ImaxTD=ImaxTD,
    Iphl=Iphl,
    Iqhl=Iqhl,
    pqflag=PQFLAG) annotation (Placement(transformation(extent={{104,-24},{160,24}})));
  Modelica.Blocks.Math.Add Pord1 annotation (Placement(transformation(extent={{30,-62},{40,-52}})));
  Modelica.Blocks.Continuous.Derivative K3(
    k=Kf,
    T=Tf,
    x_start=k30) annotation (Placement(transformation(
        extent={{13,-13},{-13,13}},
        rotation=0,
        origin={-19,-87})));
  Modelica.Blocks.Math.Tan tan1 annotation (Placement(transformation(extent={{-120,50},{-100,70}})));
  Modelica.Blocks.Math.Product Qcmdn1 annotation (Placement(transformation(extent={{-80,30},{-60,50}})));
  Modelica.Blocks.Sources.Constant VAR2(k=PFA_ref) annotation (Placement(transformation(extent={{-160,50},{-140,70}})));
  iPSL.NonElectrical.Continuous.SimpleLag K(
    K=1,
    T=Tfv,
    y_start=k0) annotation (Placement(transformation(extent={{-4,140},{16,160}})));
  Modelica.Blocks.Math.Add add3(k2=-1) annotation (Placement(transformation(extent={{-162,140},{-142,160}})));
  Modelica.Blocks.Sources.Constant VARL(k=Vref) annotation (Placement(transformation(extent={{-194,162},{-174,182}})));
  Modelica.Blocks.Math.Add add4 annotation (Placement(transformation(extent={{-64,140},{-44,160}})));
  Modelica.Blocks.Nonlinear.Limiter Qord1(uMin=QMN, uMax=QMX) annotation (Placement(transformation(extent={{-34,140},{-14,160}})));
  Modelica.Blocks.Sources.Constant Qcmd0(k=Qref) annotation (Placement(transformation(
        extent={{-7,-7},{7,7}},
        rotation=0,
        origin={-41,7})));
  Modelica.Blocks.Continuous.LimIntegrator K1(
    outMin=-100000,
    outMax=-0.051730465143919,
    y_start=k10,
    k=KIV,
    initType=Modelica.Blocks.Types.Init.InitialOutput) annotation (Placement(transformation(extent={{-94,160},{-74,180}})));
  iPSL.NonElectrical.Continuous.SimpleLag K8(
    K=Kpv,
    y_start=k80,
    T=Tv) annotation (Placement(transformation(extent={{-124,120},{-104,140}})));
  iPSL.NonElectrical.Continuous.SimpleLag K8_extra(
    y_start=k80,
    K=1,
    T=0.05) annotation (Placement(transformation(extent={{-94,120},{-74,140}})));
  NonElectrical.Continuous.LeadLag K11(
    y_start=0,
    T2=0.05,
    K=1.5,
    T1=0.025,
    x_start=0) annotation (Placement(transformation(extent={{-124,160},{-104,180}})));
  iPSL.NonElectrical.Continuous.SimpleLag K5(
    K=1,
    T=T_Power,
    y_start=k50) annotation (Placement(transformation(extent={{-104,-78},{-50,-42}})));
  Modelica.Blocks.Sources.Constant NoLimiMin(k=-Modelica.Constants.inf) annotation (Placement(transformation(
        extent={{-7,-7},{7,7}},
        rotation=0,
        origin={99,-89})));
  NonElectrical.Continuous.SimpleLag K0(
    K=1,
    y_start=p0,
    T=Tp) annotation (Placement(transformation(extent={{-140,10},{-120,30}})));
initial equation
  Vref = v0;
  p0 = P;
  q0 = Q;
  v0 = V;
  Ip0 = WIPCMD;
  Iq0 = WIQCMD;
  Pord0 = v0*Ip0;

  k0 = q0;
  k10 = q0;
  k80 = 0;
  k40 = v0;
  //may be incorrect !

  k50 = p0;
  k20 = 0;
  k30 = 0;

  k60 = v0;
  k70 = q0/v0;

  k90 = p0;
equation

  if VARFLG == 1 then
    Qord.u = K.y;
  else
    if PFAFLG == 1 then
      Qord.u = Qcmdn1.y;
    else
      Qord.u = Qref;
    end if;
  end if;
  connect(imLimited_max.y, WIPCMD) annotation (Line(
      points={{129.2,-60},{171.205,-60},{171.205,-61},{187,-61}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Q, feedback1.u2) annotation (Line(
      points={{50,110},{51,110},{51,48.6}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(V, Vcl.u2) annotation (Line(
      points={{-189,-97},{83,-97},{83,37.4}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(imLimited_min.y, division.u2) annotation (Line(
      points={{59.2,-105},{88,-105},{88,-64},{91,-64}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(VAR3.y, add3_1.u1) annotation (Line(
      points={{-69.2,-34},{-56,-34},{-56,-55.2},{-49.2,-55.2}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Pord.u1, VAR3.y) annotation (Line(
      points={{52.6,-48.8},{50.4,-48.8},{50.4,-34},{-69.2,-34}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(imLimited_min.u, V) annotation (Line(
      points={{31.6,-105},{-4.06,-105},{-4.06,-97},{-189,-97}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(division.u1, Pord.y) annotation (Line(
      points={{91,-58},{78,-58},{78,-53},{68.7,-53}},
      color={0,0,127},
      smooth=Smooth.None));

  connect(division.y, imLimited_max.u) annotation (Line(
      points={{102.5,-61},{105.25,-61},{105.25,-60},{101.6,-60}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(cCL.IPmax, imLimited_max.limit1) annotation (Line(
      points={{118,-9.6},{118,-48.8},{101.6,-48.8}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(cCL.IpCMD, imLimited_max.y) annotation (Line(
      points={{147.4,-8.4},{147.4,-60},{129.2,-60}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(cCL.Vt, V) annotation (Line(
      points={{103.72,1.2},{76,1.2},{76,-97},{-189,-97}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(K2.y, Pord1.u1) annotation (Line(
      points={{15,-41},{15,-43.5},{29,-43.5},{29,-54}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(gain.y, Pord1.u2) annotation (Line(
      points={{8.6,-60},{29,-60}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Pord1.y, Pord.u2) annotation (Line(
      points={{40.5,-57},{46.25,-57},{46.25,-57.2},{52.6,-57.2}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(add4.y, Qord1.u) annotation (Line(
      points={{-43,150},{-36,150}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Qord1.y, K.u) annotation (Line(
      points={{-13,150},{-6,150}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Qord.y, feedback1.u1) annotation (Line(
      points={{45.8,42},{40,42},{40,43},{45.4,43}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(K3.u, Pord1.y) annotation (Line(
      points={{-3.4,-87},{44,-87},{44,-57},{40.5,-57}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(K3.y, add3_1.u3) annotation (Line(
      points={{-33.3,-87},{-56,-87},{-56,-64.8},{-49.2,-64.8}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(K7.y, WIQCMD) annotation (Line(
      points={{163.4,43},{187,43}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(K7.u, Vcl.y) annotation (Line(
      points={{85.2,43},{89.3,43}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(K7.outMin, cCL.IQmin) annotation (Line(
      points={{98.8,8},{98.8,18.75},{117.44,18.75},{117.44,10.08}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(K7.outMax, cCL.IQmax) annotation (Line(
      points={{153.2,78},{153.2,30.875},{132.56,30.875},{132.56,10.08}},
      color={0,0,127},
      smooth=Smooth.None));

  connect(K7.y, cCL.IqCMD) annotation (Line(
      points={{163.4,43},{163.4,25.5},{147.4,25.5},{147.4,8.4}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(K6.y, Vcl.u1) annotation (Line(
      points={{77,43},{77.4,43}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(K6.u, feedback1.y) annotation (Line(
      points={{54,43},{57.3,43}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(K8.y, K8_extra.u) annotation (Line(
      points={{-103,130},{-96,130}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(K11.y, K1.u) annotation (Line(
      points={{-103,170},{-96,170}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(add3_1.u2, K5.y) annotation (Line(
      points={{-49.2,-60},{-47.3,-60}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(P, K5.u) annotation (Line(
      points={{-185,-59},{-94.5,-59},{-94.5,-60},{-109.4,-60}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(add3_1.y, K2.u) annotation (Line(
      points={{-35.4,-60},{-30,-60},{-30,-42},{-8,-42},{-8,-41}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(gain.u, add3_1.y) annotation (Line(
      points={{-5.2,-60},{-35.4,-60}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(NoLimiMin.y, imLimited_max.limit2) annotation (Line(
      points={{106.7,-89},{114,-89},{114,-76},{101.6,-76},{101.6,-71.2}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(add3.y, K11.u) annotation (Line(points={{-141,150},{-134,150},{-134,170},{-126,170}}, color={0,0,127}));
  connect(K8.u, K11.u) annotation (Line(points={{-126,130},{-134,130},{-134,170},{-126,170}}, color={0,0,127}));
  connect(VARL.y, add3.u1) annotation (Line(points={{-173,172},{-170,172},{-170,156},{-164,156}}, color={0,0,127}));
  connect(K8_extra.y, add4.u2) annotation (Line(points={{-73,130},{-70,130},{-70,144},{-66,144}}, color={0,0,127}));
  connect(add4.u1, K1.y) annotation (Line(points={{-66,156},{-70,156},{-70,170},{-73,170}}, color={0,0,127}));
  connect(P, K0.u) annotation (Line(points={{-185,-59},{-185,20},{-142,20}}, color={0,0,127}));
  connect(add3.u2, V) annotation (Line(points={{-164,144},{-189,144},{-189,-97}}, color={0,0,127}));
  connect(tan1.y, Qcmdn1.u1) annotation (Line(points={{-99,60},{-92,60},{-92,46},{-82,46}}, color={0,0,127}));
  connect(K0.y, Qcmdn1.u2) annotation (Line(points={{-119,20},{-92,20},{-92,34},{-82,34}}, color={0,0,127}));
  connect(VAR2.y, tan1.u) annotation (Line(points={{-139,60},{-122,60},{-122,60}}, color={0,0,127}));
  annotation (Diagram(coordinateSystem(
        preserveAspectRatio=false,
        extent={{-200,-200},{200,200}},
        initialScale=0.05), graphics={
        Text(
          extent={{-68,-68},{-58,-72}},
          lineColor={255,0,0},
          textString="K+5"),
        Text(
          extent={{66,92},{106,76}},
          lineColor={0,0,255},
          textString="simplified one
"),
        Text(
          extent={{62,54},{72,50}},
          lineColor={255,0,0},
          textString="K+6"),
        Text(
          extent={{70,32},{80,26}},
          lineColor={0,0,255},
          textString="Vterm"),
        Text(
          extent={{24,52},{46,48}},
          lineColor={255,0,0},
          textString="Qord:QCMD
"),
        Text(
          extent={{-84,-54},{-80,-56}},
          lineColor={0,0,255},
          lineThickness=0.5,
          fillColor={0,0,255},
          fillPattern=FillPattern.Solid,
          textString="Speed"),
        Rectangle(
          extent={{-122,-16},{164,-124}},
          lineColor={255,0,0},
          lineThickness=0.5,
          pattern=LinePattern.Dash),
        Text(
          extent={{102,-116},{164,-122}},
          lineColor={255,0,0},
          pattern=LinePattern.Dash,
          lineThickness=0.5,
          fillColor={0,0,255},
          fillPattern=FillPattern.Solid,
          textString="Active Power Control"),
        Text(
          extent={{118,28},{138,24}},
          lineColor={255,0,0},
          textString="K+7"),
        Text(
          extent={{72,-104},{114,-106}},
          lineColor={0,0,255},
          textString="avoid div by zero error
",
          textStyle={TextStyle.Bold}),
        Text(
          extent={{-12,-90},{-2,-94}},
          lineColor={255,0,0},
          textString="K+3"),
        Text(
          extent={{12,-36},{22,-40}},
          lineColor={255,0,0},
          textString="K+2"),
        Rectangle(
          extent={{-166,90},{-56,8}},
          lineColor={255,0,0},
          lineThickness=0.5,
          pattern=LinePattern.Dash),
        Rectangle(
          extent={{-196,198},{22,108}},
          lineColor={255,0,0},
          lineThickness=0.5,
          pattern=LinePattern.Dash),
        Text(
          extent={{-118,196},{-56,190}},
          lineColor={255,0,0},
          pattern=LinePattern.Dash,
          lineThickness=0.5,
          fillColor={0,0,255},
          fillPattern=FillPattern.Solid,
          textString="Reactive Power Control"),
        Line(
          points={{-52,26},{-20,26}},
          color={0,0,255},
          smooth=Smooth.None,
          thickness=0.5),
        Line(
          points={{4,130},{4,90}},
          color={0,0,255},
          smooth=Smooth.None,
          thickness=0.5),
        Line(
          points={{4,56},{-2,46}},
          color={255,0,0},
          smooth=Smooth.None,
          pattern=LinePattern.Dot,
          thickness=0.5),
        Text(
          extent={{-8,56},{2,52}},
          lineColor={255,0,0},
          textString="1"),
        Text(
          extent={{-8,38},{2,34}},
          lineColor={255,0,0},
          textString="0"),
        Line(
          points={{-6,38},{-6,14}},
          color={0,0,255},
          smooth=Smooth.None,
          thickness=0.5),
        Line(
          points={{-2,42},{22,42}},
          color={0,0,255},
          smooth=Smooth.None,
          thickness=0.5),
        Line(
          points={{-6,46},{-2,42}},
          color={0,0,255},
          smooth=Smooth.None,
          thickness=0.5),
        Text(
          extent={{-2,64},{20,56}},
          lineColor={255,0,0},
          textString="VARFLG"),
        Line(
          points={{-30,8},{-20,8}},
          color={0,0,255},
          smooth=Smooth.None,
          thickness=0.5),
        Line(
          points={{-18,20},{-6,14}},
          color={0,0,255},
          smooth=Smooth.None,
          thickness=0.5),
        Text(
          extent={{-42,36},{-20,28}},
          lineColor={255,0,0},
          textString="PFAFLG"),
        Text(
          extent={{-30,4},{-20,0}},
          lineColor={255,0,0},
          textString="0"),
        Line(
          points={{-6,130},{4,130}},
          color={0,0,255},
          smooth=Smooth.None,
          thickness=0.5),
        Text(
          extent={{244,128},{312,90}},
          lineColor={255,0,0},
          horizontalAlignment=TextAlignment.Left,
          textStyle={TextStyle.Bold},
          textString="nonwindup limit worths attention
K+6 and K+7 have been changed to mine ones

 models in the library are not working (with when function)
",
          fontSize=18),
        Text(
          extent={{252,60},{324,-116}},
          lineColor={0,0,255},
          horizontalAlignment=TextAlignment.Left,
          textStyle={TextStyle.Bold},
          textString="M Remote bus No
      for voltage control;
     0 for local control
M+1 PFAFLG:
    1 if PF fast control enabled
    0 if PF fast control disabled
M+2 VARFLG:
    1 if Qord is provided by WindVar
    0 if Qord is not provided by WindVar
if VARFLG=PFAFLG=0 then Qord is provided as a Qref=const
M+3 PQFLAG,
    P/Q priority flag:
     0 Q priority
    1 P priority",
          fontSize=16),
        Text(
          extent={{264,-152},{348,-194}},
          lineColor={0,0,255},
          textString="Current North American configuration with WindVAR:
varflg = 1; pfaflg = 0; Kqi small (0.1)",
          horizontalAlignment=TextAlignment.Left),
        Text(
          extent={{-144,88},{-82,82}},
          lineColor={255,0,0},
          pattern=LinePattern.Dash,
          lineThickness=0.5,
          fillColor={0,0,255},
          fillPattern=FillPattern.Solid,
          textString="Power Factor Regulator")}), Icon(coordinateSystem(
        extent={{-200,-200},{200,200}},
        preserveAspectRatio=true,
        initialScale=0.05), graphics={Rectangle(
          extent={{-200,200},{200,-200}},
          lineColor={0,0,255},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid), Text(
          extent={{-100,60},{120,-60}},
          lineColor={0,0,255},
          textString="WT4E1")}));
end WT4E1;
