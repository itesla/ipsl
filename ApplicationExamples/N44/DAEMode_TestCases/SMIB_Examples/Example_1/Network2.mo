within N44.DAEMode_TestCases.SMIB_Examples.Example_1;
model Network2
    SMIB_Examples.Example_1.Generator.Generator G1(P_0 = 1997.999, Q_0 = 967.92, V_0 = 1, V_b = 400, angle_0 = 28.3385, displayPF = true) annotation (
        Placement(visible = true, transformation(origin = {-98, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    OpenIPSL.Electrical.Buses.Bus B1(displayPF = true) annotation (
        Placement(visible = true, transformation(origin = {-80, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    OpenIPSL.Electrical.Buses.Bus B2(displayPF = true) annotation (
        Placement(visible = true, transformation(origin = {-40, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    OpenIPSL.Electrical.Buses.Bus B3(displayPF = true) annotation (
        Placement(visible = true, transformation(origin = {58, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    inner OpenIPSL.Electrical.SystemBase SysData(S_b = 100, fn = 60) annotation (
        Placement(visible = true, transformation(origin = {-70, 85}, extent = {{-30, -15}, {30, 15}}, rotation = 0)));
    OpenIPSL.Electrical.Branches.PSAT.TwoWindingTransformer twoWindingTransformer(Sn = 2220, V_b = 400, Vn = 400, kT = 1, r = 0.0, x = 0.15) annotation (
        Placement(visible = true, transformation(origin = {-60, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    OpenIPSL.Electrical.Branches.PwLine pwLine1(B = 0.0, G = 0.0, R = 0.0, X = 0.5 * 100 / 2220) annotation (
        Placement(visible = true, transformation(origin = {30, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    OpenIPSL.Electrical.Branches.PwLine pwLine2(B = 0.0, G = 0.0, R = 0.0, X = 0.93 * 100 / 2220, t1 = 1) annotation (
        Placement(visible = true, transformation(origin = {30, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    OpenIPSL.Electrical.Buses.InfiniteBus infiniteBus(P_0 = -1998, Q_0 = 87.066, V_0 = 0.90081, V_b = 400, angle_0 = 0.0) annotation (
        Placement(visible = true, transformation(origin = {102, 0}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
    OpenIPSL.Electrical.Events.Breaker breaker1(rc_enabled=false) annotation (
        Placement(visible = true, transformation(origin = {-4, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    OpenIPSL.Electrical.Events.Breaker breaker2(rc_enabled=false) annotation (
        Placement(visible = true, transformation(origin = {-4, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
      connect(B3.p, infiniteBus.p) annotation (
        Line(points = {{58, 0}, {92, 0}, {92, 0}, {92, 0}}, color = {0, 0, 255}));
      connect(pwLine2.n, B3.p) annotation (
        Line(points={{39,-20},{44,-20},{44,0},{58,0}},          color = {0, 0, 255}));
      connect(pwLine1.n, B3.p) annotation (
        Line(points={{39,20},{44,20},{44,0},{58,0}},          color = {0, 0, 255}));
      connect(breaker1.r, pwLine1.p) annotation (
        Line(points={{6,20},{22,20},{22,20},{21,20}},          color = {0, 0, 255}));
      connect(breaker2.r, pwLine2.p) annotation (
        Line(points={{6,-20},{21,-20}},      color = {0, 0, 255}));
      connect(breaker1.s, B2.p) annotation (
        Line(points={{-14,20},{-26,20},{-26,0},{-40,0},{-40,0}},            color = {0, 0, 255}));
      connect(breaker2.s, B2.p) annotation (
        Line(points={{-14,-20},{-26,-20},{-26,0},{-40,0},{-40,0}},            color = {0, 0, 255}));
      connect(twoWindingTransformer.n, B2.p) annotation (
        Line(points={{-49,0},{-41,0},{-41,0},{-40,0}},          color = {0, 0, 255}));
      connect(G1.pwPin, B1.p) annotation (
        Line(points={{-87,0},{-80,0}},      color = {0, 0, 255}));
      connect(twoWindingTransformer.p, B1.p) annotation (
        Line(points={{-71,0},{-80,0}},      color = {0, 0, 255}));
      annotation (
        experiment(StartTime = 0, StopTime = 10, Tolerance = 1e-6, Interval = 1e-4),
        Documentation,
        Diagram(coordinateSystem(extent={{-120,-100},{120,100}})),
        Icon(coordinateSystem(extent={{-120,-100},{120,100}})),
        __OpenModelica_commandLineOptions="");
end Network2;