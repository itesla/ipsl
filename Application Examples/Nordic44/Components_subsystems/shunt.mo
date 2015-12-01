within Nordic44.Components_subsystems;
model shunt
  parameter Real G "(p.u.) on system base";
  parameter Real B "(p.u.) on system base";
  Complex I;
  Complex V;
  Real v;
  Complex S;
  PowerSystems.Connectors.PwPin p
    annotation (Placement(transformation(extent={{-14,66},{6,86}})));
equation

  v = sqrt(p.vr^2 + p.vi^2);
  I = Complex(p.ir, p.ii);
  V = Complex(p.vr, p.vi);
  I = Complex(G, B)*V;
  S = Complex(p.vr, p.vi)*Complex(p.ir, -p.ii) annotation (Diagram(
        coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
            100,100}}), graphics), Icon(coordinateSystem(
          preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
        graphics={Rectangle(extent={{-66,72},{66,-82}}, lineColor={0,0,255}),
          Text(
          extent={{-42,52},{42,-66}},
          lineColor={0,0,255},
          textStyle={TextStyle.Bold},
          textString="Y")}));

end shunt;
