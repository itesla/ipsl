within N44.DAEMode_TestCases.SMIB_Examples.Example_1Mod;
model Network
    SMIB_Examples.Example_1Mod.Generator.Generator G1(P_0 = 1997.999, Q_0 = 967.92, V_0 = 1, V_b = 400, angle_0 = 28.3385, displayPF = true) annotation (
        Placement(visible = true, transformation(origin = {-88, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    OpenIPSL.Electrical.Buses.Bus B1(displayPF = true) annotation (
        Placement(visible = true, transformation(origin = {-60, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    OpenIPSL.Electrical.Buses.Bus B2(displayPF = true) annotation (
        Placement(visible = true, transformation(origin = {-20, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    OpenIPSL.Electrical.Buses.Bus B3(displayPF = true) annotation (
        Placement(visible = true, transformation(origin = {68, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    inner OpenIPSL.Electrical.SystemBase SysData(S_b = 100, fn = 60) annotation (
        Placement(visible = true, transformation(origin = {-70, 85}, extent = {{-30, -15}, {30, 15}}, rotation = 0)));
    OpenIPSL.Electrical.Branches.PSAT.TwoWindingTransformer twoWindingTransformer(Sn = 2220, V_b = 400, Vn = 400, kT = 1, r = 0.0, x = 0.15) annotation (
        Placement(visible = true, transformation(origin = {-40, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    OpenIPSL.Electrical.Branches.PwLine pwLine1(B = 0.0, G = 0.0, R = 0.0, X = 0.5 * 100 / 2220) annotation (
        Placement(visible = true, transformation(origin = {26, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    OpenIPSL.Electrical.Branches.PwLine pwLine2(B = 0.0, G = 0.0, R = 0.0, X = 0.93 * 100 / 2220) annotation (
        Placement(visible = true, transformation(origin = {44, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    OpenIPSL.Electrical.Buses.InfiniteBus infiniteBus(P_0 = -1998, Q_0 = 87.066, V_0 = 0.90081, V_b = 400, angle_0 = 0.0) annotation (
        Placement(visible = true, transformation(origin = {90, 0}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
    OpenIPSL.Electrical.Events.PwFault pwFault(R = 0.0, X = 0.01 * 100 / 2220, t1 = 0.5, t2 = 0.57) annotation (
        Placement(visible = true, transformation(origin = {2, -38}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
    OpenIPSL.Electrical.Events.Breaker breaker(
        enableTrigger=false,
        rc_enabled=false,
        t_o=0.57) annotation (
        Placement(visible = true, transformation(origin = {16, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
    connect(breaker.r, pwLine2.p) annotation (
        Line(points = {{26, -20}, {34, -20}, {34, -20}, {36, -20}}, color = {0, 0, 255}));
    connect(breaker.s, B2.p) annotation (
        Line(points = {{6, -20}, {-8, -20}, {-8, 0}, {-20, 0}, {-20, 0}}, color = {0, 0, 255}));
    connect(pwLine1.n, B3.p) annotation (
        Line(points = {{33, 20}, {60, 20}, {60, 0}, {68, 0}}, color = {0, 0, 255}));
    connect(pwLine1.p, B2.p) annotation (
        Line(points = {{15, 20}, {-8, 20}, {-8, 0}, {-20, 0}}, color = {0, 0, 255}));
    connect(pwLine2.n, B3.p) annotation (
        Line(points = {{51, -20}, {60, -20}, {60, 0}, {68, 0}}, color = {0, 0, 255}));
    connect(infiniteBus.p, B3.p) annotation (
        Line(points = {{80, 0}, {66, 0}}, color = {0, 0, 255}));
    connect(pwFault.p, B2.p) annotation (
        Line(points = {{-7, -38}, {-16, -38}, {-16, 0}, {-20, 0}}, color = {0, 0, 255}));
    connect(twoWindingTransformer.n, B2.p) annotation (
        Line(points = {{-28, 0}, {-20, 0}, {-20, 0}, {-20, 0}}, color = {0, 0, 255}));
    connect(twoWindingTransformer.p, B1.p) annotation (
        Line(points = {{-52, 0}, {-60, 0}, {-60, 0}, {-60, 0}}, color = {0, 0, 255}));
    connect(G1.pwPin, B1.p) annotation (
        Line(points = {{-76, 0}, {-62, 0}, {-62, 0}, {-60, 0}}, color = {0, 0, 255}));
end Network;
