within OpenIPSL.Electrical.Events;
model TestBreaker
  inner SystemBase SysData annotation (Placement(transformation(extent={{-100,80},{-76,100}})));
  Buses.InfiniteBus infiniteBus(displayPF=true) annotation (Placement(transformation(extent={{-44,0},{-24,20}})));
  Loads.PSAT.LOADPQ lOADPQ annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={50,10})));
  Breaker breaker(t_o=0.5) annotation (Placement(transformation(extent={{0,6},{8,14}})));
equation
  connect(lOADPQ.p, breaker.r) annotation (Line(points={{40,10},{9,10}}, color={0,0,255}));
  connect(breaker.s, infiniteBus.p) annotation (Line(points={{-1,10},{-24,10}}, color={0,0,255}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end TestBreaker;
