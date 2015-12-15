within KundurSMIB.Generation_Groups;
model Generator

  iPSL.Electrical.Machines.PSAT.SixthOrder.Order6 machine(
    Vn=400,
    V_b=400,
    ra=0.003,
    xd=1.81,
    xq=1.76,
    xd1=0.3,
    xq1=0.65,
    xd2=0.23,
    xq2=0.25,
    Td10=8,
    Tq10=1,
    Td20=0.03,
    Tq20=0.07,
    Taa=0.002,
    M=7,
    D=0,
    P_0=19.979999999936396,
    Q_0=9.679249699065775,
    V_0=1,
    angle_0=0.494677176989154,
    Sn=2220) annotation (Placement(transformation(extent={{14,-30},{74,30}})));
  iPSL.Connectors.PwPin pwPin annotation (Placement(transformation(extent={{100,-10},{120,10}}), iconTransformation(extent={{100,-10},{120,10}})));
equation
  connect(machine.pm0, machine.pm) annotation (Line(points={{20,-33},{20,-33},{20,-40},{0,-40},{0,-15},{14,-15}}, color={0,0,127}));
  connect(machine.p, pwPin) annotation (Line(points={{77,0.14892},{78.5,0.14892},{78.5,0},{110,0}}, color={0,0,255}));
  connect(machine.vf0, machine.vf) annotation (Line(points={{20,33},{20,48},{-8,48},{-8,15},{14,15}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics={
        Ellipse(
          extent={{-100,100},{100,-100}},
          lineColor={0,0,0},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Line(
          points={{-48,2},{-20,56},{2,4},{24,-28},{48,22}},
          color={0,0,0},
          smooth=Smooth.Bezier),
        Text(
          extent={{-52,-18},{56,-66}},
          lineColor={0,0,0},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          textString="%name")}), Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}})));
end Generator;
