within iPSL.Electrical.Wind.PSSE.WT3G;


model WT3E1
  parameter Integer VARFLG "0 constant Q; 1 Reactive control; -1 Constant PF control"
    annotation (choices(
      choice=0 "0 constant Q",
      choice=1 "1 Reactive control",
      choice=-1 "-1 Constant PF control"));
  parameter Integer VLRFLG "0 Bypass V control; 1 WT3G1 Eqcmd limits;2 WT3G2 Eqcmd limits";
  // 5 'WT3E1' 1       5      0      0      3      2         '1 '
  //        0.15000       18.000       5.0000       0.0000      0.50000E-01
  //         3.0000      0.60000       1.1200      0.10000      0.29600
  //       -0.43600       1.1000      0.50000E-01  0.45000     -0.45000
  //         5.0000      0.50000E-01  0.90000       1.2000       40.000
  //       -0.50000      0.40000      0.50000E-01  0.50000E-01   1.0000
  //        0.69000      0.78000      0.98000       1.1200      0.74000
  //         1.2000     /
  parameter Real Tfv=0.15000 "Filter time constant in voltage regulator (sec)";
  parameter Real Kpv=18.000 "  Proportional gain in voltage regulator (pu)";
  parameter Real KIV=5.0000 "  Integrator gain in voltage regulator (pu)";
  parameter Real Xc=0.0000 "  Line drop compensation reactance (pu)";
  parameter Real TFP=0.50000E-01 "  Filter time constant in torque regulator";
  parameter Real Kpp=3.0000 "  Proportional gain in torque regulator (pu) ";
  parameter Real KIP=0.60000 " Integrator gain in torque regulator (pu)";
  parameter Real PMX=1.1200 "  Max limit in torque regulator (pu)";
  parameter Real PMN=0.10000 "  Min limit in torque regulator (pu)";
  parameter Real QMX=0.29600 "  Max limit in voltage regulator (pu)";
  parameter Real QMN=-0.43600 "  Min limit in voltage regulator (pu)";
  parameter Real IPMAX=1.1000 "  Max active current limit";
  parameter Real TRV=0.50000E-01 " Voltage sensor time constant";
  parameter Real RPMX=0.45000 "  Max power order derivative";
  parameter Real RPMN=-0.45000 "  Min power order derivative";
  parameter Real T_Power=5.0000 "  Power filter time constant";
  parameter Real Kqi=0.50000E-01 "  MVAR/Voltage gain";
  parameter Real VMINCL=0.90000 "  Min voltage limit";
  parameter Real VMAXCL=1.2000 "  Max voltage limit";
  parameter Real Kqv=40.000 "  Voltage/MVAR gain";
  parameter Real XIQmin=-0.50000;
  parameter Real XIQmax=0.40000;
  parameter Real Tv=0.50000E-01 "  Lag time constant in WindVar controller";
  parameter Real Tp=0.50000E-01 "  Pelec filter in fast PF controller";
  parameter Real Fn=1.0000 "  A portion of online wind turbines";
  parameter Real wPmin=0.69000 "  Shaft speed at Pmin (pu)";
  parameter Real wP20=0.78000 "  Shaft speed at 20% rated power (pu) ";
  parameter Real wP40=0.98000 "  Shaft speed at 40% rated power (pu)";
  parameter Real wP60=1.1200 "  Shaft speed at 60% rated power (pu)";
  parameter Real Pmin=0.74000 "  Minimum power for operating at P100 speed (pu)";
  parameter Real wP100=1.2000 "  Shaft speed at 100% rated power (pu)";
  parameter Real v0;
  parameter Real p0;
  parameter Real q0;
  parameter Real Thetaref(fixed=false) "PF angle reference if PFAFLG=1";
  parameter Real Vref " Remote bus ref voltage";
  //parameter Real Qord "MVAR order from MVAR emulator";
  parameter Real Qref=q0 "Q reference if PFAFLG=0 & VARFLG";
  parameter Real sp0=Speed(
      p0,
      PMN,
      wPmin,
      wP20,
      wP40,
      wP60,
      wP100,
      Pmin);
  parameter Real k0(fixed=false);
  parameter Real k10(fixed=false);
  parameter Real k20(fixed=false);
  parameter Real k30(fixed=false);
  parameter Real k40(fixed=false);
  parameter Real k50(fixed=false);
  parameter Real k60(fixed=false);
  parameter Real k70(fixed=false);
  parameter Real k80(fixed=false);
  parameter Real k90(fixed=false);

  function Speed
    extends Modelica.Icons.Function;
    input Real x;
    input Real PMN "  Min limit in torque regulator (pu)";
    input Real wmin;
    input Real w20;
    input Real w40;
    input Real w60;
    input Real w100;
    input Real Pmin " Minimum power for operating at wP100 speed (pu)";
    output Real y;
  protected
    parameter Real K1=(w20 - wmin)/(0.2 - PMN);
    parameter Real K2=(w40 - w20)/(0.4 - 0.2);
    parameter Real K3=(w60 - w40)/(0.6 - 0.4);
    parameter Real K4=(w100 - w60)/(Pmin - 0.6);
    Real K, x0, y0;
  algorithm
    if x <= PMN then
      K := 0;
      y0 := wmin;
      x0 := PMN;
    elseif x > Pmin and x <= 0.2 then
      K := K1;
      y0 := wmin;
      x0 := PMN;
    elseif x > 0.2 and x <= 0.4 then
      K := K2;
      y0 := w20;
      x0 := 0.2;
    elseif x > 0.4 and x <= 0.6 then
      K := K3;
      y0 := w40;
      x0 := 0.4;
    elseif x > 0.6 and x <= Pmin then
      K := K4;
      y0 := w60;
      x0 := 0.6;
    else
      K := 0;
      y0 := w100;
      x0 := Pmin;
    end if;
    y := K*(x - x0) + y0 - 1;
  end Speed;

  Modelica.Blocks.Interfaces.RealInput Pelec
    annotation (Placement(transformation(extent={{-120,-76},{-90,-46}}), iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={138,-92})));
  iPSL.NonElectrical.Continuous.SimpleLag K5(
    K=1,
    T=T_Power,
    y_start=k50) annotation (Placement(transformation(extent={{-32,-70},{-16,-54}})));
  Modelica.Blocks.Math.Add add(k2=-1) annotation (Placement(transformation(extent={{-8,-64},{2,-54}})));
  Modelica.Blocks.Continuous.Integrator K3(
    y_start=k30,
    k=KIP,
    initType=Modelica.Blocks.Types.Init.InitialOutput) annotation (Placement(transformation(extent={{14,-54},{22,-46}})));
  Modelica.Blocks.Math.Gain imGain(k=Kpp) annotation (Placement(transformation(extent={{14,-70},{22,-62}})));
  Modelica.Blocks.Math.Add add1 annotation (Placement(transformation(extent={{28,-62},{38,-52}})));
  Modelica.Blocks.Math.Feedback feedback annotation (Placement(transformation(extent={{58,-62},{72,-48}})));
  Modelica.Blocks.Nonlinear.Limiter imLimited(uMin=RPMN, uMax=RPMX) annotation (Placement(transformation(extent={{76,-60},{86,-50}})));
  Modelica.Blocks.Continuous.LimIntegrator K2(
    outMin=PMN,
    outMax=PMX,
    k=1/TFP,
    y_start=k20,
    initType=Modelica.Blocks.Types.Init.InitialOutput) annotation (Placement(transformation(extent={{92,-60},{102,-50}})));
  Modelica.Blocks.Interfaces.RealInput Vterm(start=v0)
    annotation (Placement(transformation(extent={{-122,-112},{-88,-78}}), iconTransformation(
        extent={{-12,-12},{12,12}},
        rotation=180,
        origin={136,-16})));
  Modelica.Blocks.Nonlinear.Limiter imLimited_max(uMin=-Modelica.Constants.inf, uMax=IPMAX) annotation (Placement(transformation(extent={{140,-64},{150,-54}})));
  Modelica.Blocks.Interfaces.RealOutput WIPCMD annotation (Placement(transformation(extent={{176,2},{194,20}}), iconTransformation(extent={{148,40},{166,58}})));
  Modelica.Blocks.Math.Add add2 annotation (Placement(transformation(extent={{22,-36},{32,-26}})));
  Modelica.Blocks.Sources.Constant const(k=1) annotation (Placement(transformation(extent={{0,-30},{6,-24}})));
  Modelica.Blocks.Nonlinear.Limiter Qord(uMin=QMN, uMax=QMX) annotation (Placement(transformation(extent={{26,36},{40,50}})));
  Modelica.Blocks.Interfaces.RealInput Qelec annotation (Placement(transformation(
        extent={{-16,-16},{16,16}},
        rotation=270,
        origin={50,110}), iconTransformation(
        extent={{-11,-11},{11,11}},
        rotation=180,
        origin={137,-53})));
  Modelica.Blocks.Math.Feedback feedback1 annotation (Placement(transformation(extent={{44,50},{58,36}})));
  Modelica.Blocks.Continuous.LimIntegrator K6(
    outMin=VMINCL,
    outMax=VMAXCL,
    k=Kqi,
    y_start=k60,
    initType=Modelica.Blocks.Types.Init.InitialOutput) annotation (Placement(transformation(extent={{62,38},{72,48}})));
  Modelica.Blocks.Math.Feedback Vcl annotation (Placement(transformation(extent={{76,36},{90,50}})));
  Modelica.Blocks.Interfaces.RealOutput WEQCMD annotation (Placement(transformation(extent={{176,32},{194,50}}), iconTransformation(extent={{148,64},{166,82}})));
  Modelica.Blocks.Interfaces.RealOutput WNDSP1
    annotation (Placement(transformation(extent={{20,-126},{38,-108}}), iconTransformation(
        extent={{-9,-9},{9,9}},
        rotation=270,
        origin={-47,-113})));
  Modelica.Blocks.Interfaces.RealOutput WPCMND
    annotation (Placement(transformation(extent={{144,-104},{162,-86}}), iconTransformation(
        extent={{-9,-9},{9,9}},
        rotation=270,
        origin={15,-113})));
  Modelica.Blocks.Continuous.LimIntegrator K7(
    k=Kqv,
    y_start=k70,
    outMax=1 + XIQmax,
    outMin=XIQmin - 1) annotation (Placement(transformation(extent={{120,36},{136,52}})));
  Modelica.Blocks.Math.Tan tan1 annotation (Placement(transformation(extent={{-72,48},{-62,58}})));
  iPSL.NonElectrical.Continuous.SimpleLag K9(
    K=1,
    y_start=k90,
    T=Tp) annotation (Placement(transformation(extent={{-72,26},{-60,38}})));
  Modelica.Blocks.Math.Product Qcmdn1 annotation (Placement(transformation(extent={{-40,36},{-30,46}})));
  Modelica.Blocks.Sources.Constant VAR3(k=Thetaref) annotation (Placement(transformation(extent={{-104,46},{-92,58}})));
  iPSL.NonElectrical.Continuous.SimpleLag K4(
    K=1,
    T=TRV,
    y_start=k40) annotation (Placement(transformation(extent={{-132,78},{-122,88}})));
  iPSL.NonElectrical.Continuous.SimpleLag K8(
    K=Kpv,
    T=Tv,
    y_start=k80) annotation (Placement(transformation(extent={{-72,78},{-64,86}})));
  iPSL.NonElectrical.Continuous.SimpleLag K(
    K=1,
    T=Tfv,
    y_start=k0) annotation (Placement(transformation(extent={{-30,86},{-22,94}})));
  Modelica.Blocks.Interfaces.RealInput Iterm "magenitute of terminal current"
    annotation (Placement(transformation(extent={{-216,64},{-184,96}}), iconTransformation(
        extent={{-12,-12},{12,12}},
        rotation=180,
        origin={136,20})));
  Modelica.Blocks.Math.Gain XC(k=Xc) "Line drop compensation reactance (pu)" annotation (Placement(transformation(extent={{-178,74},{-166,86}})));
  Modelica.Blocks.Math.Add add3(k2=-1) annotation (Placement(transformation(extent={{-110,82},{-100,92}})));
  Modelica.Blocks.Sources.Constant VARL(k=Vref) annotation (Placement(transformation(extent={{-166,104},{-146,124}})));
  Modelica.Blocks.Math.Gain portion(k=1/Fn) "Line drop compensation reactance (pu)" annotation (Placement(transformation(extent={{-94,82},{-84,92}})));
  NonElectrical.Continuous.SimpleLag K1(
    y_start=k10,
    K=KIV,
    T=Tv) annotation (Placement(transformation(extent={{-66,96},{-58,104}})));
  Modelica.Blocks.Math.Add add4 annotation (Placement(transformation(extent={{-54,88},{-50,92}})));
  Modelica.Blocks.Math.Add add5(k2=-1) annotation (Placement(transformation(extent={{-154,78},{-144,88}})));
  Modelica.Blocks.Sources.Constant Qcmd0(k=Qref) annotation (Placement(transformation(
        extent={{-8,-8},{8,8}},
        rotation=90,
        origin={0,20})));
  Modelica.Blocks.Math.Division division annotation (Placement(transformation(extent={{118,-64},{128,-54}})));
  Modelica.Blocks.Nonlinear.Limiter imLimited_min(uMin=0.01, uMax=Modelica.Constants.inf) annotation (Placement(transformation(extent={{82,-102},{96,-88}})));
  Modelica.Blocks.Nonlinear.Limiter Qord1(uMin=QMN, uMax=QMX) annotation (Placement(transformation(extent={{-46,86},{-38,94}})));
  Modelica.Blocks.Interfaces.RealInput WEQCMD0
    annotation (Placement(transformation(extent={{-218,-84},{-184,-50}}), iconTransformation(
        extent={{-12,-12},{12,12}},
        rotation=270,
        origin={90,78})));
  Modelica.Blocks.Interfaces.RealInput WIPCMD0
    annotation (Placement(transformation(extent={{-216,-52},{-184,-20}}), iconTransformation(
        extent={{-12,-12},{12,12}},
        rotation=270,
        origin={54,78})));
  iPSL.NonElectrical.Continuous.SimpleLag K10(
    T=Tv,
    y_start=k80,
    K=1) annotation (Placement(transformation(extent={{-78,96},{-70,104}})));
  Modelica.Blocks.Math.Product Qcmdn2 annotation (Placement(transformation(extent={{44,-60},{54,-50}})));
protected
  Modelica.Blocks.Interfaces.RealInput WNDSP_1 annotation (Placement(transformation(extent={{-70,-78},{-38,-46}})));
  Modelica.Blocks.Interfaces.RealInput ShaftSpeed=sp0
    annotation (Placement(transformation(extent={{-122,-50},{-88,-16}}), iconTransformation(
        extent={{-12,-12},{12,12}},
        rotation=90,
        origin={80,-92})));
initial equation
  Thetaref = atan2(q0, p0);
  k40 = v0;
  k0 = q0;
  k10 = q0;
  k60 = v0;
  k70 = WEQCMD0;
  k20 = WIPCMD0*v0;
  k30 = k20/(sp0 + 1);
  k80 = 0;
  k90 = p0;
  k50 = sp0;
equation
  WNDSP_1 = Speed(
    Pelec,
    PMN,
    wPmin,
    wP20,
    wP40,
    wP60,
    wP100,
    Pmin);
  if VLRFLG <> 0 then
    K7.u = Vcl.y;
    WEQCMD = K7.y;
  else
    WEQCMD = Vcl.y;
    K7.u = 0;
  end if;
  if VARFLG == 1 then
    Qord.u = K.y;
  elseif VARFLG == (-1) then
    Qord.u = Qcmdn1.y;
  else
    Qord.u = Qref;
  end if;
  connect(ShaftSpeed, add.u1) annotation (Line(
      points={{-105,-33},{-14,-33},{-14,-56},{-9,-56}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(add2.u2, ShaftSpeed) annotation (Line(
      points={{21,-34},{-44,-34},{-44,-33},{-105,-33}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(const.y, add2.u1) annotation (Line(
      points={{6.3,-27},{8,-27},{8,-28},{21,-28}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Qelec, feedback1.u2) annotation (Line(
      points={{50,110},{51,110},{51,48.6}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(WNDSP_1, WNDSP1) annotation (Line(
      points={{-54,-62},{-54,-117},{29,-117}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(tan1.y, Qcmdn1.u1) annotation (Line(
      points={{-61.5,53},{-52,53},{-52,44},{-41,44}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(VAR3.y, tan1.u) annotation (Line(
      points={{-91.4,52},{-73,52},{-73,53}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(VARL.y, add3.u1) annotation (Line(
      points={{-145,114},{-118,114},{-118,90},{-111,90}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Iterm, XC.u) annotation (Line(
      points={{-200,80},{-179.2,80}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(XC.y, add5.u2) annotation (Line(
      points={{-165.4,80},{-155,80}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Vterm, add5.u1) annotation (Line(
      points={{-105,-95},{-164,-95},{-164,86},{-155,86}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(add3.y, portion.u) annotation (Line(
      points={{-99.5,87},{-95,87}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(imLimited_min.u, Vterm) annotation (Line(
      points={{80.6,-95},{-105,-95}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(imLimited_min.y, division.u2) annotation (Line(
      points={{96.7,-95},{114,-95},{114,-62},{117,-62}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(WNDSP_1, K5.u) annotation (Line(points={{-54,-62},{-33.6,-62}}, color={0,0,127}));
  connect(K5.y, add.u2) annotation (Line(points={{-15.2,-62},{-9,-62},{-9,-62}}, color={0,0,127}));
  connect(feedback.y, imLimited.u) annotation (Line(points={{71.3,-55},{75,-55}}, color={0,0,127}));
  connect(imLimited.y, K2.u) annotation (Line(points={{86.5,-55},{88.25,-55},{91,-55}}, color={0,0,127}));
  connect(K2.y, division.u1) annotation (Line(points={{102.5,-55},{114,-55},{114,-56},{117,-56}}, color={0,0,127}));
  connect(feedback.u2, division.u1) annotation (Line(points={{65,-60.6},{65,-72},{106,-72},{106,-56},{114,-56},{114,-56},{117,-56}}, color={0,0,127}));
  connect(WPCMND, division.u1) annotation (Line(points={{153,-95},{124,-95},{124,-72},{106,-72},{106,-56},{117,-56}}, color={0,0,127}));
  connect(Vcl.u2, Vterm) annotation (Line(points={{83,37.4},{83,-32},{62,-32},{62,-95},{-105,-95}}, color={0,0,127}));
  connect(division.y, imLimited_max.u) annotation (Line(points={{128.5,-59},{133.25,-59},{139,-59}}, color={0,0,127}));
  connect(imLimited_max.y, WIPCMD) annotation (Line(points={{150.5,-59},{168,-59},{168,11},{185,11}}, color={0,0,127}));
  connect(K3.y, add1.u1) annotation (Line(points={{22.4,-50},{24,-50},{24,-54},{27,-54}}, color={0,0,127}));
  connect(K3.u, add.y) annotation (Line(points={{13.2,-50},{8,-50},{8,-59},{2.5,-59}}, color={0,0,127}));
  connect(imGain.y, add1.u2) annotation (Line(points={{22.4,-66},{24,-66},{24,-60},{27,-60}}, color={0,0,127}));
  connect(imGain.u, add.y) annotation (Line(points={{13.2,-66},{8,-66},{8,-59},{2.5,-59}}, color={0,0,127}));
  connect(Qcmdn2.y, feedback.u1) annotation (Line(points={{54.5,-55},{58.25,-55},{58.25,-55},{59.4,-55}}, color={0,0,127}));
  connect(add1.y, Qcmdn2.u2) annotation (Line(points={{38.5,-57},{40.25,-57},{40.25,-58},{43,-58}}, color={0,0,127}));
  connect(add2.y, Qcmdn2.u1) annotation (Line(points={{32.5,-31},{40,-31},{40,-52},{43,-52}}, color={0,0,127}));
  connect(add5.y, K4.u) annotation (Line(points={{-143.5,83},{-138.75,83},{-138.75,83},{-133,83}}, color={0,0,127}));
  connect(K4.y, add3.u2) annotation (Line(points={{-121.5,83},{-118,83},{-118,84},{-111,84}}, color={0,0,127}));
  connect(K9.y, Qcmdn1.u2) annotation (Line(points={{-59.4,32},{-52,32},{-52,38},{-41,38}}, color={0,0,127}));
  connect(K9.u, Pelec) annotation (Line(points={{-73.2,32},{-116,32},{-116,-61},{-105,-61}}, color={0,0,127}));
  connect(K8.u, portion.y) annotation (Line(points={{-72.8,82},{-83.5,82},{-83.5,87}}, color={0,0,127}));
  connect(K8.y, add4.u2) annotation (Line(points={{-63.6,82},{-56,82},{-56,88.8},{-54.4,88.8}}, color={0,0,127}));
  connect(K1.y, add4.u1) annotation (Line(points={{-57.6,100},{-56,100},{-56,91.2},{-54.4,91.2}}, color={0,0,127}));
  connect(K10.y, K1.u) annotation (Line(points={{-69.6,100},{-66.8,100},{-66.8,100}}, color={0,0,127}));
  connect(K10.u, portion.y) annotation (Line(points={{-78.8,100},{-83.5,100},{-83.5,87}}, color={0,0,127}));
  connect(add4.y, Qord1.u) annotation (Line(points={{-49.8,90},{-46.8,90}}, color={0,0,127}));
  connect(Qord1.y, K.u) annotation (Line(points={{-37.6,90},{-34,90},{-30.8,90}}, color={0,0,127}));
  connect(feedback1.y, K6.u) annotation (Line(points={{57.3,43},{58.65,43},{58.65,43},{61,43}}, color={0,0,127}));
  connect(K6.y, Vcl.u1) annotation (Line(points={{72.5,43},{74.25,43},{74.25,43},{77.4,43}}, color={0,0,127}));
  connect(Qord.y, feedback1.u1) annotation (Line(points={{40.7,43},{43.35,43},{43.35,43},{45.4,43}}, color={0,0,127}));
  annotation (
    choices(
      choice=0 "0 Bypass V control",
      choice=1 "1 WT3G1 Eqcmd limits",
      choice=-1 "-1 WT3G2 Eqcmd limits"),
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-200,-140},{180,140}}), graphics={
        Text(
          extent={{-30,-70},{-20,-74}},
          lineColor={255,0,0},
          textString="K+5"),
        Text(
          extent={{12,-40},{22,-44}},
          lineColor={255,0,0},
          textString="K+3"),
        Text(
          extent={{96,-44},{116,-48}},
          lineColor={255,0,0},
          textString="Pord:WPCMND
K+2
"),
        Text(
          extent={{66,92},{106,76}},
          lineColor={0,0,255},
          textString="simplified one
"),
        Text(
          extent={{62,54},{72,50}},
          lineColor={255,0,0},
          textString="K+6"),
        Line(
          points={{100,44},{108,46}},
          color={0,0,255},
          smooth=Smooth.None),
        Line(
          points={{106,48},{106,64}},
          color={0,0,255},
          smooth=Smooth.None),
        Line(
          points={{106,64},{144,64}},
          color={0,0,255},
          smooth=Smooth.None),
        Line(
          points={{144,44},{144,64}},
          color={0,0,255},
          smooth=Smooth.None),
        Line(
          points={{108,44},{118,44}},
          color={0,0,255},
          smooth=Smooth.None),
        Text(
          extent={{102,30},{126,20}},
          lineColor={255,0,0},
          textString="VLTFLG"),
        Line(
          points={{106,30},{106,40}},
          color={0,0,255},
          smooth=Smooth.None),
        Line(
          points={{136,44},{160,44}},
          color={0,0,255},
          smooth=Smooth.None),
        Text(
          extent={{102,58},{112,54}},
          lineColor={255,0,0},
          textString="0"),
        Text(
          extent={{108,42},{118,38}},
          lineColor={255,0,0},
          textString="1 or 2"),
        Text(
          extent={{70,32},{80,26}},
          lineColor={0,0,255},
          textString="Vterm"),
        Text(
          extent={{24,52},{46,48}},
          lineColor={255,0,0},
          textString="Qord:QCMD
"),
        Rectangle(
          extent={{-90,-50},{-54,-76}},
          lineColor={0,0,255},
          lineThickness=0.5),
        Line(
          points={{-86,-54},{-86,-74},{-58,-74},{-60,-72},{-60,-76},{-58,-74},{-58,-74}},
          color={0,0,255},
          smooth=Smooth.None,
          thickness=0.5),
        Line(
          points={{-82,-72},{-80,-68},{-76,-64},{-70,-60},{-64,-58},{-64,-58}},
          color={0,0,255},
          thickness=0.5,
          smooth=Smooth.None),
        Line(
          points={{-86,-54},{-88,-56},{-84,-56},{-86,-54},{-86,-54}},
          color={0,0,255},
          thickness=0.5,
          smooth=Smooth.None),
        Text(
          extent={{-84,-54},{-80,-56}},
          lineColor={0,0,255},
          lineThickness=0.5,
          fillColor={0,0,255},
          fillPattern=FillPattern.Solid,
          textString="Speed"),
        Text(
          extent={{-60,-70},{-56,-72}},
          lineColor={0,0,255},
          lineThickness=0.5,
          fillColor={0,0,255},
          fillPattern=FillPattern.Solid,
          textString="P"),
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
        Rectangle(
          extent={{-110,64},{-24,8}},
          lineColor={255,0,0},
          lineThickness=0.5,
          pattern=LinePattern.Dash),
        Text(
          extent={{-108,14},{-24,8}},
          lineColor={255,0,0},
          pattern=LinePattern.Dash,
          lineThickness=0.5,
          fillColor={0,0,255},
          fillPattern=FillPattern.Solid,
          textString="Constant Power Factor Control"),
        Text(
          extent={{-34,102},{-14,98}},
          lineColor={255,0,0},
          textString="K
"),
        Text(
          extent={{-76,24},{-56,20}},
          lineColor={255,0,0},
          textString="K+9"),
        Text(
          extent={{116,36},{136,32}},
          lineColor={255,0,0},
          textString="K+7"),
        Line(
          points={{-26,42},{-2,42}},
          color={0,0,255},
          smooth=Smooth.None,
          thickness=0.5),
        Line(
          points={{0,90},{0,52}},
          color={0,0,255},
          smooth=Smooth.None,
          thickness=0.5),
        Line(
          points={{10,56},{4,46}},
          color={255,0,0},
          smooth=Smooth.None,
          pattern=LinePattern.Dot,
          thickness=0.5),
        Text(
          extent={{-14,40},{-4,36}},
          lineColor={255,0,0},
          textString="-1"),
        Text(
          extent={{-4,56},{6,52}},
          lineColor={255,0,0},
          textString="1"),
        Text(
          extent={{2,34},{12,30}},
          lineColor={255,0,0},
          textString="0"),
        Line(
          points={{0,38},{0,30}},
          color={0,0,255},
          smooth=Smooth.None,
          thickness=0.5),
        Line(
          points={{4,42},{28,42}},
          color={0,0,255},
          smooth=Smooth.None,
          thickness=0.5),
        Line(
          points={{0,46},{4,42}},
          color={0,0,255},
          smooth=Smooth.None,
          thickness=0.5),
        Rectangle(
          extent={{-196,136},{-12,68}},
          lineColor={255,0,0},
          lineThickness=0.5,
          pattern=LinePattern.Dash),
        Text(
          extent={{-138,94},{-118,90}},
          lineColor={255,0,0},
          textString="K+4"),
        Line(
          points={{-16,90},{0,90}},
          color={0,0,255},
          smooth=Smooth.None,
          thickness=0.5),
        Text(
          extent={{-84,128},{-22,122}},
          lineColor={255,0,0},
          pattern=LinePattern.Dash,
          lineThickness=0.5,
          fillColor={0,0,255},
          fillPattern=FillPattern.Solid,
          textString="Reactive Power Control"),
        Text(
          extent={{4,64},{26,56}},
          lineColor={255,0,0},
          textString="VARFLG"),
        Text(
          extent={{34,18},{66,-14}},
          lineColor={0,0,255},
          lineThickness=0.5,
          fillColor={0,0,255},
          fillPattern=FillPattern.Solid,
          textString="if VARFLG==1 then
Qord.p1=Qcmd1.n1;
elseif VARFLG==-1then
Qord.p1=Qcmdn1.y;
else
VARFLG==0;
end if;
 "),
        Text(
          extent={{-78,110},{-58,106}},
          lineColor={255,0,0},
          textString="K+1
"),
        Text(
          extent={{-80,76},{-60,72}},
          lineColor={255,0,0},
          textString="K+8"),
        Text(
          extent={{72,-104},{114,-106}},
          lineColor={0,0,255},
          textString="avoid div by zero error
",
          textStyle={TextStyle.Bold}),
        Line(
          points={{-82,-72},{-86,-72},{-86,-72}},
          color={0,0,255},
          thickness=0.5,
          smooth=Smooth.None),
        Line(
          points={{-64,-58},{-56,-58},{-56,-58}},
          color={0,0,255},
          thickness=0.5,
          smooth=Smooth.None)}),
    Icon(coordinateSystem(extent={{-200,-140},{180,140}}, preserveAspectRatio=true), graphics={Rectangle(extent={{-96,90},{148,-104}}, lineColor={0,0,255}),Text(
          extent={{-74,68},{106,-76}},
          lineColor={0,0,255},
          textString="Converter Control
Model ( WT3E1 )")}),
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
end WT3E1;
