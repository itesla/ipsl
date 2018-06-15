within FOSSEE1.PSS.PSAT;
model PSS_TypeI
  parameter Real Kw "Stabilizer gain (pu/pu)";
  parameter Real Kp "Gain for active power";
  parameter Real Kv "Gain for bus voltage magnitude";
  parameter Real vsmax "Max stabilizer output signal (pu)";
  parameter Real vsmin "Min stabilizer output signal (pu)";
  parameter Real Tw "Wash-out time constant (s)";
  parameter Real Tc "Lag time constant";
  Modelica.Blocks.Interfaces.RealInput w "roto speed"
    annotation (Placement(transformation(extent={{-100,36},{-80,56}}),
        iconTransformation(extent={{-100,36},{-80,56}})));
  Modelica.Blocks.Interfaces.RealOutput Vref
    "indexes of the algebraic variable "                         annotation (
      Placement(transformation(extent={{98,10},{118,30}}), iconTransformation(
          extent={{98,10},{118,30}})));
  Modelica.Blocks.Interfaces.RealInput Pg "active power"
    annotation (Placement(transformation(extent={{-100,4},{-80,24}}),
        iconTransformation(extent={{-100,4},{-80,24}})));
  Modelica.Blocks.Interfaces.RealInput Vg "voltage magnitude
of the generator to which the PSS is connected through the AVR"
    annotation (Placement(transformation(extent={{-100,-30},{-80,-10}}),
        iconTransformation(extent={{-100,-30},{-80,-10}})));
  OpenIPSL.NonElectrical.Continuous.DerivativeLag
                                         derivativeLag(
    T=Tw,
    y_start=0,
    x_start=0,
    K=Tw)
    annotation (Placement(transformation(extent={{-18,6},{-2,22}})));
  Modelica.Blocks.Math.Gain gain(k=Kw) "Stabilizer gain "
    annotation (Placement(transformation(extent={{-70,40},{-58,52}})));
  Modelica.Blocks.Math.Gain gain1(k=Kp) "Gain for active power"
    annotation (Placement(transformation(extent={{-72,8},{-60,20}})));
  Modelica.Blocks.Math.Gain gain2(k=Kv) "Gain for bus voltage magnitude"
    annotation (Placement(transformation(extent={{-70,-26},{-58,-14}})));
  Modelica.Blocks.Math.Add3 add3_1
    annotation (Placement(transformation(extent={{-46,6},{-30,22}})));
  Modelica.Blocks.Math.Add add3_2
    annotation (Placement(transformation(extent={{56,10},{76,30}})));
  OpenIPSL.NonElectrical.Continuous.SimpleLagLim simpleLagLim(
    K=1,
    T=Tc,
    y_start=0,
    outMax=vsmax,
    outMin=vsmin)
    annotation (Placement(transformation(extent={{12,6},{28,22}})));
  Modelica.Blocks.Interfaces.RealInput vref0 annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={38,100}), iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={36,90})));
equation
  connect(Vg, gain2.u) annotation (Line(points={{-90,-20},{-84,-20},{-71.2,-20}},
        color={0,0,127}));
  connect(Pg, gain1.u)
    annotation (Line(points={{-90,14},{-90,14},{-73.2,14}}, color={0,0,127}));
  connect(gain.y, add3_1.u1) annotation (Line(points={{-57.4,46},{-55.65,46},{-55.65,
          20.4},{-47.6,20.4}}, color={0,0,127}));
  connect(gain1.y, add3_1.u2) annotation (Line(points={{-59.4,14},{-54,14},{-47.6,
          14}}, color={0,0,127}));
  connect(gain2.y, add3_1.u3) annotation (Line(points={{-57.4,-20},{-57.4,-20},{
          -56,-20},{-56,7.6},{-47.6,7.6}}, color={0,0,127}));
  connect(add3_1.y, derivativeLag.u) annotation (Line(points={{-29.2,14},{-24,14},
          {-19.6,14}}, color={0,0,127}));
  connect(derivativeLag.y, simpleLagLim.u)
    annotation (Line(points={{-1.2,14},{4,14},{10.4,14}}, color={0,0,127}));
  connect(simpleLagLim.y, add3_2.u2)
    annotation (Line(points={{28.8,14},{40,14},{54,14}}, color={0,0,127}));
  connect(add3_2.y, Vref)
    annotation (Line(points={{77,20},{77,20},{108,20}}, color={0,0,127}));
  connect(vref0, add3_2.u1) annotation (Line(points={{38,100},{38,96},{38,26},{54,
          26}}, color={0,0,127}));
  connect(w, gain.u)
    annotation (Line(points={{-90,46},{-71.2,46}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={
          Rectangle(
          extent={{-100,100},{100,-60}},
          lineColor={28,108,200},
          fillColor={85,170,255},
          fillPattern=FillPattern.Solid)}), Diagram(coordinateSystem(extent={{-100,
            -100},{100,100}})));
end PSS_TypeI;
