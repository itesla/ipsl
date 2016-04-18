within OpenIPSL.Electrical.Controls.PSSE.ES;
model IEEET2 "IEEE Type 2 excitation system"
  extends OpenIPSL.Electrical.Controls.PSSE.ES.BaseClasses.BaseExciter;

  parameter Real T_R=0.02 "Voltage input time constant (s)";
  parameter Real K_A=200.0 "AVR gain";
  parameter Real T_A=0.001 "AVR time constant (s)";
  parameter Real V_RMAX=6.08 "Maximum AVR output (pu)";
  parameter Real V_RMIN=-6.08 "Minimum AVR output (pu)";
  parameter Real K_E=1 "Exciter field gain";
  parameter Real T_E=0.55 "Exciter time constant s";
  parameter Real K_F=0.06 "Rate feedback gain (pu)";
  parameter Real T_F1=0.3 "Rate feedback time constant (s)";
  parameter Real T_F2=0.6 "Rate feedback time constant (s)";
  parameter Real E_1=2.85 "Exciter saturation point 1 (pu)";
  parameter Real S_EE_1=0.3 "Saturation at E_1";
  parameter Real E_2=3.8 "Exciter saturation point 2 (pu)";
  parameter Real S_EE_2=0.6 "Saturation at E_2";


  function param_init
    input Real V_RMAX_init;
    input Real K_E_init;
    input Real E_2;
    input Real S_EE_2;
    input Real Efd0;
    input Real SE_Efd0;
    output Real V_RMAX;
    output Real K_E;
  algorithm
    if (V_RMAX_init == 0) then
      if (K_E_init <= 0) then
        V_RMAX := S_EE_2*E_2;
      else
        V_RMAX := S_EE_2 + K_E_init;
      end if;
    else
      V_RMAX := V_RMAX_init;
    end if;

    if (K_E_init == 0) then
      K_E := V_RMAX/(10*Efd0) - SE_Efd0;
    else
      K_E := K_E_init;
    end if;

    annotation (Documentation(revisions="<html>
<!--DISCLAIMER-->
<p>Copyright 2015-2016 RTE (France), SmarTS Lab (Sweden), AIA (Spain) and DTU (Denmark)</p>
<ul>
<li>RTE: <a href=\"http://www.rte-france.com\">http://www.rte-france.com</a></li>
<li>SmarTS Lab, research group at KTH: <a href=\"https://www.kth.se/en\">https://www.kth.se/en</a></li>
<li>AIA: <a href=\"http://www.aia.es/en/energy\"> http://www.aia.es/en/energy</a></li>
<li>DTU: <a href=\"http://www.dtu.dk/english\"> http://www.dtu.dk/english</a></li>
</ul>
<p>The authors can be contacted by email: <a href=\"mailto:info@itesla-ipsl.org\">info@itesla-ipsl.org</a></p>

<p>This Source Code Form is subject to the terms of the Mozilla Public License, v. 2.0. </p>
<p>If a copy of the MPL was not distributed with this file, You can obtain one at <a href=\"http://mozilla.org/MPL/2.0/\"> http://mozilla.org/MPL/2.0</a>.</p>
</html>"));
  end param_init;

  Modelica.Blocks.Math.Add3 add3_1(k2=-1) annotation (Placement(transformation(extent={{-52,-4},{-38,10}})));
  Modelica.Blocks.Math.Add add(k2=-1) annotation (Placement(transformation(extent={{-28,-8},{-16,4}})));
  NonElectrical.Continuous.SimpleLag simpleLag(
    K=1,
    T=T_F2,
    y_start=0) annotation (Placement(transformation(extent={{-2,-40},{-16,-26}})));
  Modelica.Blocks.Continuous.Derivative derivativeLag(
    k=K_F,
    y_start=0,
    T=T_F1,
    initType=Modelica.Blocks.Types.Init.InitialOutput,
    x_start=VR0) annotation (Placement(transformation(extent={{28,-40},{14,-26}})));
  NonElectrical.Continuous.SimpleLagLim simpleLagLim(
    K=K_A,
    T=T_A,
    y_start=VR0,
    outMax=V_RMAX0,
    outMin=V_RMIN0) annotation (Placement(transformation(extent={{100,-10},{120,10}})));
protected
  parameter Real V_RMAX0(fixed=false);
  //=7.3 "Maximum AVR output (pu)";
  parameter Real V_RMIN0(fixed=false);
  //=-7.3 "Minimum AVR output (pu)";
  parameter Real K_E0(fixed=false);
  //=1 "Exciter field gain, s"
  parameter Real VT0(fixed=false);
  //=Ec0;
  parameter Real VREF(fixed=false);
  //=VR0/KA+VT0+Vs.a0 "Reference terminal voltage (pu)";
  parameter Real Efd0(fixed=false);
  //
  parameter Real SE_Efd0(fixed=false);
  parameter Real VR0(fixed=false);

public
  BaseClasses.RotatingExciter rotatingExciter annotation (Placement(transformation(extent={{140,-10},{160,10}})));
  NonElectrical.Continuous.SimpleLag TransducerDelay(
    K=1,
    T=T_R,
    y_start=ECOMP0) annotation (Placement(transformation(extent={{-170,-10},{-150,10}})));
initial algorithm
  VT0 := ECOMP;
  Efd0 := EFD0;
  SE_Efd0 := OpenIPSL.NonElectrical.Functions.SE(
    EFD0,
    S_EE_1,
    S_EE_2,
    E_1,
    E_2);

  (V_RMAX0,K_E0) := param_init(
    V_RMAX,
    K_E,
    E_2,
    S_EE_2,
    Efd0,
    SE_Efd0);
  if (V_RMAX == 0) then
    V_RMIN0 := -V_RMAX0;
  else
    V_RMIN0 := V_RMIN;
  end if;

  VR0 := Efd0*(K_E0 + SE_Efd0);
  VREF := VR0/K_A + VT0 - add3_2.y;

equation
  connect(add3_1.y, add.u1) annotation (Line(points={{-37.3,3},{-33.65,3},{-33.65,1.6},{-29.2,1.6}}, color={0,0,127}));
  connect(simpleLag.y, add.u2) annotation (Line(points={{-16.7,-33},{-34,-33},{-34,-5.6},{-29.2,-5.6}}, color={0,0,127}));
  connect(simpleLag.u, derivativeLag.y) annotation (Line(points={{-0.6,-33},{6.7,-33},{13.3,-33}}, color={0,0,127}));
  connect(add.y, simpleLagLim.u) annotation (Line(points={{-15.4,-2},{10,-2},{10,0},{98,0}}, color={0,0,127}));
  connect(rotatingExciter.EFD, EFD) annotation (Line(points={{161.25,0},{210,0},{210,0}}, color={0,0,127}));
  connect(ECOMP, TransducerDelay.u) annotation (Line(points={{-200,0},{-172,0},{-172,0}}, color={0,0,127}));
  connect(TransducerDelay.y, DiffV.u2) annotation (Line(points={{-149,0},{-132,0},{-132,-6},{-122,-6}}, color={0,0,127}));
  connect(simpleLagLim.y, rotatingExciter.I_C) annotation (Line(points={{121,0},{138.75,0},{138.75,0}}, color={0,0,127}));
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio=false,extent={{-200,-200},{200,160}})),
    Icon(coordinateSystem(preserveAspectRatio=true, extent={{-200,-200},{200,160}}), graphics={
        Rectangle(
          extent={{-120,100},{120,-100}},
          lineColor={0,0,255},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Text(
          extent={{100,8},{118,-8}},
          lineColor={0,0,255},
          textString="EFD"),
        Text(
          extent={{-38,14},{44,-18}},
          lineColor={0,0,255},
          textString="IEEET2"),
        Text(
          extent={{-102,-74},{-78,-86}},
          lineColor={0,0,255},
          textString="EFD0"),
        Text(
          extent={{-98,46},{-60,34}},
          lineColor={0,0,255},
          textString="VOTHSG "),
        Text(
          extent={{-102,-32},{-74,-48}},
          lineColor={0,0,255},
          textString=" VUEL "),
        Text(
          extent={{-102,6},{-72,-8}},
          lineColor={0,0,255},
          textString=" VOEL"),
        Text(
          extent={{-100,84},{-68,74}},
          lineColor={0,0,255},
          textString="ECOMP")}),
    Documentation(revisions="<html>
<!--DISCLAIMER-->
<p>Copyright 2015-2016 RTE (France), SmarTS Lab (Sweden), AIA (Spain) and DTU (Denmark)</p>
<ul>
<li>RTE: <a href=\"http://www.rte-france.com\">http://www.rte-france.com</a></li>
<li>SmarTS Lab, research group at KTH: <a href=\"https://www.kth.se/en\">https://www.kth.se/en</a></li>
<li>AIA: <a href=\"http://www.aia.es/en/energy\"> http://www.aia.es/en/energy</a></li>
<li>DTU: <a href=\"http://www.dtu.dk/english\"> http://www.dtu.dk/english</a></li>
</ul>
<p>The authors can be contacted by email: <a href=\"mailto:info@itesla-ipsl.org\">info@itesla-ipsl.org</a></p>

<p>This Source Code Form is subject to the terms of the Mozilla Public License, v. 2.0. </p>
<p>If a copy of the MPL was not distributed with this file, You can obtain one at <a href=\"http://mozilla.org/MPL/2.0/\"> http://mozilla.org/MPL/2.0</a>.</p>
</html>"));
end IEEET2;
