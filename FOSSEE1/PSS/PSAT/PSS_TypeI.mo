within FOSSEE1.PSS.PSAT;
model PSS_TypeI "TODO Document what this model is about"
  parameter Real Kw "Stabilizer gain (pu/pu)";
  parameter Real Kp "Gain for active power";
  parameter Real Kv "Gain for bus voltage magnitude";
  parameter Real vsmax "Max stabilizer output signal (pu)";
  parameter Real vsmin "Min stabilizer output signal (pu)";
  parameter Real Tw "Wash-out time constant (s)";
  parameter Real Tc "Lag time constant";
  Modelica.Blocks.Interfaces.RealInput w "roto speed"
    annotation (Placement(transformation(extent={{-140,40},{-100,80}})));
  Modelica.Blocks.Interfaces.RealOutput Vref
    "indexes of the algebraic variable "                         annotation (Placement(transformation(extent={{100,-10},{120,10}})));
  Modelica.Blocks.Interfaces.RealInput Pg "active power"
    annotation (Placement(transformation(extent={{-140,-20},{-100,20}})));
  Modelica.Blocks.Interfaces.RealInput Vg "voltage magnitude
of the generator to which the PSS is connected through the AVR"
    annotation (Placement(transformation(extent={{-140,-80},{-100,-40}})));
  OpenIPSL.NonElectrical.Continuous.DerivativeLag
                                         derivativeLag(
    T=Tw,
    y_start=0,
    x_start=0,
    K=Tw)
    annotation (Placement(transformation(extent={{-20,-10},{0,10}})));
  Modelica.Blocks.Math.Gain gain(k=Kw) "Stabilizer gain "
    annotation (Placement(transformation(extent={{-80,50},{-60,70}})));
  Modelica.Blocks.Math.Gain gain1(k=Kp) "Gain for active power"
    annotation (Placement(transformation(extent={{-80,-10},{-60,10}})));
  Modelica.Blocks.Math.Gain gain2(k=Kv) "Gain for bus voltage magnitude"
    annotation (Placement(transformation(extent={{-80,-70},{-60,-50}})));
  Modelica.Blocks.Math.Add3 add3 annotation (Placement(transformation(extent={{-44,-6},{-32,6}})));
  Modelica.Blocks.Math.Add add annotation (Placement(transformation(extent={{70,-10},{90,10}})));
  OpenIPSL.NonElectrical.Continuous.SimpleLagLim simpleLagLim(
    K=1,
    T=Tc,
    y_start=0,
    outMax=vsmax,
    outMin=vsmin)
    annotation (Placement(transformation(extent={{12,-10},{32,10}})));
  Modelica.Blocks.Interfaces.RealInput vref0 annotation (Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=270,
        origin={0,120})));
equation
  connect(Vg, gain2.u) annotation (Line(points={{-120,-60},{-82,-60}},
        color={0,0,127}));
  connect(Pg, gain1.u)
    annotation (Line(points={{-120,0},{-82,0}},             color={0,0,127}));
  connect(gain.y, add3.u1) annotation (Line(points={{-59,60},{-51.65,60},{-51.65,4.8},{-45.2,4.8}}, color={0,0,127}));
  connect(gain1.y, add3.u2) annotation (Line(points={{-59,0},{-45.2,0}}, color={0,0,127}));
  connect(gain2.y, add3.u3) annotation (Line(points={{-59,-60},{-52,-60},{-52,-4.8},{-45.2,-4.8}}, color={0,0,127}));
  connect(add3.y, derivativeLag.u) annotation (Line(points={{-31.4,0},{-22,0}}, color={0,0,127}));
  connect(derivativeLag.y, simpleLagLim.u)
    annotation (Line(points={{1,0},{10,0}},               color={0,0,127}));
  connect(simpleLagLim.y, add.u2) annotation (Line(points={{33,0},{42,0},{42,-6},{68,-6}}, color={0,0,127}));
  connect(add.y, Vref) annotation (Line(points={{91,0},{110,0}}, color={0,0,127}));
  connect(vref0, add.u1) annotation (Line(points={{0,120},{0,66},{40,66},{40,6},{68,6}}, color={0,0,127}));
  connect(w, gain.u)
    annotation (Line(points={{-120,60},{-82,60}},  color={0,0,127}));
  annotation (Icon(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={
          Rectangle(
          extent={{-100,100},{100,-100}},
          lineColor={28,108,200},
          fillColor={85,170,255},
          fillPattern=FillPattern.Solid), Text(
          extent={{-140,-100},{140,-160}},
          lineColor={0,0,255},
          textString="%name")}),            Diagram(coordinateSystem(extent={{-100,
            -100},{100,100}})));
end PSS_TypeI;
