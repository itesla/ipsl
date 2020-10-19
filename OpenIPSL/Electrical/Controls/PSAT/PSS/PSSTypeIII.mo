within OpenIPSL.Electrical.Controls.PSAT.PSS;
model PSSTypeIII "PSAT PSS Type III"
  parameter Real Kw "Stabilizer gain";
  parameter SI.Time Tw "Wash-out time constant";
  parameter SI.Time T1 "First stabilizer time constant";
  parameter SI.Time T2 "Second stabilizer time constant";
  parameter SI.Time T3 "Third stabilizer time constant";
  parameter SI.Time T4 "Fourth stabilizer time constant";
  parameter SI.Time Tc "SimpleLagLim time constant";
  parameter SI.PerUnit vsmax "Max stabilizer output signal";
  parameter SI.PerUnit vsmin "Min stabilizer output signal";
  OpenIPSL.NonElectrical.Continuous.SimpleLagLim simpleLagLim(
    K=1,
    T=Tc,
    y_start=0,
    outMax=vsmax,
    outMin=vsmin)
    annotation (Placement(transformation(extent={{40,-10},{60,10}})));
  Modelica.Blocks.Interfaces.RealInput vs1 "Rotor speed" annotation (Placement(transformation(extent={{-140,-20},{-100,20}})));
  Modelica.Blocks.Interfaces.RealOutput Vref
    "Indexes of the algebraic variable"                         annotation (Placement(transformation(extent={{100,-10},{120,10}})));
  OpenIPSL.NonElectrical.Continuous.DerivativeLag derivativeLag(K=Kw*Tw, T=Tw,
    y_start=0)
    annotation (Placement(transformation(extent={{-60,-10},{-40,10}})));
  Modelica.Blocks.Continuous.TransferFunction transferFunction(b={T1,T3,1}, a={
        T2,T4,1})
    annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
equation
  connect(simpleLagLim.y, Vref)
    annotation (Line(points={{61,0},{110,0}},            color={0,0,127}));
  connect(vs1, derivativeLag.u)
    annotation (Line(points={{-120,0},{-62,0}},   color={0,0,127}));
  connect(derivativeLag.y, transferFunction.u)
    annotation (Line(points={{-39,0},{-12,0}},   color={0,0,127}));
  connect(simpleLagLim.u, transferFunction.y)
    annotation (Line(points={{38,0},{11,0}},          color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
          Rectangle(
          extent={{-100,100},{100,-100}},
          lineColor={28,108,200},
          fillColor={85,170,255},
          fillPattern=FillPattern.Solid), Text(
          extent={{-140,-100},{140,-160}},
          lineColor={0,0,255},
          textString="%name")}),            Diagram(coordinateSystem(
          preserveAspectRatio=false)),
    Documentation(info="<html>
<p>
For more information see <a href=\"OpenIPSL.UsersGuide.References\">[Milano2013]</a>, section \"18.4.3
Type III\".
</p>
</html>"));
end PSSTypeIII;
