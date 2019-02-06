within N44.DAEMode_TestCases.SMIB_Examples.Example_2.Generator;
model Generator
    extends OpenIPSL.Interfaces.Generator;
    OpenIPSL.Electrical.Machines.PSAT.Order6 order6(D = 0, M = 7, P_0 = P_0, Q_0 = Q_0, Sn = 2220, T1q0 = 1, T2d0 = 0.03, T2q0 = 0.07, Taa = 0.002, V_0 = V_0, V_b = V_b, Vn = 400, angle_0 = angle_0, ra = 0.003, x1d = 0.3, x1q = 0.65, x2d = 0.23, x2q = 0.25, xd = 1.81, xq = 1.76) annotation (
          Placement(visible = true, transformation(origin = {9, -5}, extent = {{-15, -15}, {15, 15}}, rotation = 0)));
    OpenIPSL.Electrical.Controls.PSAT.AVR.AVRtypeIII aVRtypeIII(K0 = 200, T1 = 1, T2 = 1, Te = 0.0001, Tr = 0.015, vfmax = 7, vfmin = -6.4) annotation (
          Placement(visible = true, transformation(origin = {-52, 6}, extent = {{-12, -12}, {12, 12}}, rotation = 0)));
    OpenIPSL.Electrical.Controls.PSAT.PSS.PSSTypeII pss(
          Kw=9.5,
          T1=0.154,
          T2=0.033,
          T3=1,
          T4=1,
          Tw=1.41,
          vsmax=0.2,
          vsmin=-0.2) annotation (
          Placement(visible = true, transformation(origin = {-84, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
    connect(pss.vSI, order6.w) annotation (
          Line(points = {{-94, 0}, {-100, 0}, {-100, 30}, {32, 30}, {32, 8}, {26, 8}, {26, 8}}, color = {0, 0, 127}));
    connect(pss.vs, aVRtypeIII.vs) annotation (
          Line(points = {{-72, 0}, {-64, 0}, {-64, 0}, {-62, 0}}, color = {0, 0, 127}));
    connect(order6.pm0, order6.pm) annotation (
          Line(points = {{-4, -22}, {-4, -22}, {-4, -30}, {-18, -30}, {-18, -12}, {-10, -12}, {-10, -12}}, color = {0, 0, 127}));
    connect(order6.v, aVRtypeIII.v) annotation (
          Line(points = {{26, 0}, {38, 0}, {38, 26}, {-70, 26}, {-70, 12}, {-62, 12}, {-62, 12}}, color = {0, 0, 127}));
    connect(order6.vf0, aVRtypeIII.vf0) annotation (
          Line(points = {{-3, 12}, {-3, 24}, {-52, 24}, {-52, 18}}, color = {0, 0, 127}));
    connect(aVRtypeIII.vf, order6.vf) annotation (
          Line(points = {{-38, 6}, {-23, 6}, {-23, 3}, {-9, 3}}, color = {0, 0, 127}));
    connect(order6.p, pwPin) annotation (
          Line(points = {{24, -5}, {62, -5}, {62, 0}, {110, 0}}, color = {0, 0, 255}));
end Generator;