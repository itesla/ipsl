within FOSSEE1.PSS.PSAT;
model PSS_TypeIII
  parameter Real Kw "Stabilizer gain (pu/pu)";
  parameter Real Tw "Gain for active power";
  parameter Real T1 "Gain for bus voltage magnitude";
  parameter Real T2 "Wash-out time constant (s)";
  parameter Real T3 "Lag time constant";
  parameter Real T4 "Lag time constant";
  parameter Real Tc "SimpleLagLim time constant";
  parameter Real vsmax "Max stabilizer output signal (pu)";
  parameter Real vsmin "Min stabilizer output signal (pu)";

  OpenIPSL.NonElectrical.Continuous.SimpleLagLim simpleLagLim(
    K=1,
    T=Tc,
    y_start=0,
    outMax=vsmax,
    outMin=vsmin)
    annotation (Placement(transformation(extent={{30,-12},{54,12}})));
  Modelica.Blocks.Interfaces.RealInput vs1 "roto speed" annotation (Placement(
        transformation(extent={{-116,-16},{-84,16}}), iconTransformation(extent=
           {{-100,-14},{-70,16}})));
  Modelica.Blocks.Interfaces.RealOutput Vref
    "indexes of the algebraic variable "                         annotation (
      Placement(transformation(extent={{88,-12},{114,14}}),iconTransformation(
          extent={{86,-14},{114,14}})));
  OpenIPSL.NonElectrical.Continuous.DerivativeLag derivativeLag(K=Kw*Tw, T=Tw,
    y_start=0)
    annotation (Placement(transformation(extent={{-56,-12},{-32,12}})));
  Modelica.Blocks.Continuous.TransferFunction transferFunction(b={T1,T3,1}, a={
        T2,T4,1})
    annotation (Placement(transformation(extent={{-8,-10},{12,10}})));
equation
  connect(simpleLagLim.y, Vref)
    annotation (Line(points={{55.2,0},{55.2,1},{101,1}}, color={0,0,127}));
  connect(vs1, derivativeLag.u)
    annotation (Line(points={{-100,0},{-58.4,0}}, color={0,0,127}));
  connect(derivativeLag.y, transferFunction.u)
    annotation (Line(points={{-30.8,0},{-10,0}}, color={0,0,127}));
  connect(simpleLagLim.u, transferFunction.y)
    annotation (Line(points={{27.6,0},{20,0},{13,0}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
          Rectangle(
          extent={{-100,100},{100,-100}},
          lineColor={28,108,200},
          fillColor={85,170,255},
          fillPattern=FillPattern.Solid)}), Diagram(coordinateSystem(
          preserveAspectRatio=false)));
end PSS_TypeIII;
