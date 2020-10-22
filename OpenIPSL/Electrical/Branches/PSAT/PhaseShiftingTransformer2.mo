within OpenIPSL.Electrical.Branches.PSAT;
model PhaseShiftingTransformer2
  outer OpenIPSL.Electrical.SystemBase SysData;
  inner SI.PerUnit pk "Actual primary power flow";
  SI.Angle anglevk "Angle at primary";
  SI.Angle anglevm "Angle at secondary";
  SI.PerUnit vk "Voltage at primary";
  SI.PerUnit vm "Voltage at secondary";

  TwoWindingTransformer twoWindingTransformer annotation (Placement(transformation(extent={{-50,-10},{-30,10}})));
  Interfaces.PwPin p annotation (Placement(transformation(extent={{-110,-10},{-90,10}}), iconTransformation(extent={{-108,-10},{-88,10}})));
  PhaseShifter phaseShifter annotation (Placement(transformation(extent={{20,-10},{40,10}})));
  Interfaces.PwPin n annotation (Placement(transformation(extent={{100,-10},{120,10}}), iconTransformation(extent={{100,-10},{120,10}})));
equation
  vk = sqrt(p.vr^2 + p.vi^2);
  vm = sqrt(n.vr^2 + n.vi^2);
  anglevk = atan2(p.vi, p.vr);
  anglevm = atan2(n.vi, n.vr);
  pk=p.vr*p.ir + p.vi*p.ii;

  connect(twoWindingTransformer.p, p) annotation (Line(points={{-51,0},{-100,0}}, color={0,0,255}));
  connect(twoWindingTransformer.n, phaseShifter.p) annotation (Line(points={{-29,0},{19,0}}, color={0,0,255}));
  connect(phaseShifter.n, n) annotation (Line(points={{41,0},{110,0}}, color={0,0,255}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end PhaseShiftingTransformer2;
