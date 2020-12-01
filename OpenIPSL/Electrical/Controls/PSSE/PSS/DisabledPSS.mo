within OpenIPSL.Electrical.Controls.PSSE.PSS;
model DisabledPSS "Disabled PSS (constant output)"
  extends BaseClasses.BasePSS;

  Modelica.Blocks.Sources.Constant const(k=0)
    annotation (Placement(transformation(extent={{100,-10},{120,10}})));
equation
  connect(const.y, VOTHSG)
    annotation (Line(points={{121,0},{210,0},{210,0}}, color={0,0,127}));
end DisabledPSS;
