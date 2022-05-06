within OpenIPSL.Examples.NamsskoganGrid;
model StaticCondenser "Static condenser model used solely in the Namsskogan test system"
  parameter OpenIPSL.Types.PerUnit B "Susceptance";
  OpenIPSL.Interfaces.PwPin p
    annotation (Placement(transformation(extent={{80,-8},{100,12}})));
  OpenIPSL.Types.PerUnit V "Voltage magnitude";
  OpenIPSL.Types.Angle Angle_V "voltage angle";
  OpenIPSL.Types.PerUnit Q "Reactive power";

equation
  0 = p.vr*p.ir + p.vi*p.ii;
  Q = p.vi*p.ir - p.vr*p.ii;
  V = sqrt(p.vr^2 + p.vi^2);
  Angle_V = atan2(p.vi, p.vr);
  Q = B*V^2;
  annotation (Documentation(info="<html>
<p>This static condenser is developed especially for this example system.
Since this component is not a standard model, it is not in the main body of the library and its usage outside this example is not encouraged.</p>
</html>"));
end StaticCondenser;
