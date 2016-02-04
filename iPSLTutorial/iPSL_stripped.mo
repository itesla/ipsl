package iPSL "iTesla Power System Library"
  package Examples
    package Example_1
      model Example_1
        iPSL.Electrical.Buses.Bus B1 annotation(Placement(transformation(extent = {{-92, -12}, {-68, 12}})));
        iPSL.Electrical.Buses.Bus B2 annotation(Placement(transformation(extent = {{-32, -12}, {-8, 12}})));
        iPSL.Electrical.Buses.Bus B3 annotation(Placement(transformation(extent = {{48, -12}, {72, 12}})));
        Generator.Generator G1(P_0 = 19.979999999936396, Q_0 = 9.679249699065775, angle_0 = 0.494677176989154, V_b = 400, V_0 = 1) annotation(Placement(transformation(extent = {{-120, -10}, {-100, 10}})));
        iPSL.Electrical.Branches.PSAT.TwoWindingTransformer transformer(Sn = 2220, fn = 60, x = 0.15, r = 0, V_b = 400, Vn = 400) annotation(Placement(transformation(extent = {{-60, -10}, {-40, 10}})));
        iPSL.Electrical.Branches.PwLine line_1(R = 0, G = 0, B = 0, S_b = 100, X = 0.5 * 100 / 2220) annotation(Placement(transformation(extent = {{10, 10}, {30, 30}})));
        iPSL.Electrical.Loads.PSAT.LOADPQ load(Sn = 100, S_b = 100, P_0 = 19.979999999894400, Q_0 = -0.870664705119217) annotation(Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 0, origin = {80, -30})));
        iPSL.Electrical.Buses.InfiniteBus infinite_bus(V = 0.90081, angle = 0) annotation(Placement(transformation(extent = {{-10, 10}, {10, -10}}, rotation = 180, origin = {110, 0})));
        iPSL.Electrical.Events.PwFault fault(R = 0, t1 = 0.5, t2 = 0.57, X = 0.01 * 100 / 2220) annotation(Placement(transformation(extent = {{0, -60}, {20, -40}})));
        iPSL.Electrical.Branches.PwLine line_2(R = 0, G = 0, B = 0, S_b = 100, X = 0.93 * 100 / 2220) annotation(Placement(transformation(extent = {{10, -30}, {30, -10}})));
        inner Electrical.SystemBase SysData(fn = 60) annotation(Placement(transformation(extent = {{60, -100}, {120, -60}})));
      equation
        connect(G1.pwPin, B1.p) annotation(Line(points = {{-99, 0}, {-80, 0}}, color = {0, 0, 255}));
        connect(B1.p, transformer.p) annotation(Line(points = {{-80, 0}, {-70, 0}, {-61, 0}}, color = {0, 0, 255}));
        connect(transformer.n, B2.p) annotation(Line(points = {{-39, 0}, {-20, 0}}, color = {0, 0, 255}));
        connect(B2.p, line_1.p) annotation(Line(points = {{-20, 0}, {-14, 0}, {-10, 0}, {-10, 20}, {13, 20}}, color = {0, 0, 255}));
        connect(line_1.n, B3.p) annotation(Line(points = {{27, 20}, {50, 20}, {50, 0}, {60, 0}}, color = {0, 0, 255}));
        connect(B3.p, infinite_bus.p) annotation(Line(points = {{60, 0}, {80, 0}, {80, 0}, {99, 0}}, color = {0, 0, 255}));
        connect(load.p, infinite_bus.p) annotation(Line(points = {{80, -19}, {80, 0}, {99, 0}, {99, 1.38778e-015}}, color = {0, 0, 255}));
        connect(fault.p, line_1.p) annotation(Line(points = {{-1.66667, -50}, {-14, -50}, {-14, 0}, {-10, 0}, {-10, 20}, {13, 20}}, color = {0, 0, 255}));
        connect(line_2.n, B3.p) annotation(Line(points = {{27, -20}, {50, -20}, {50, 0}, {60, 0}}, color = {0, 0, 255}));
        connect(line_2.p, line_1.p) annotation(Line(points = {{13, -20}, {-10, -20}, {-10, 20}, {13, 20}}, color = {0, 0, 255}));
        annotation(Diagram(coordinateSystem(extent = {{-140, -100}, {120, 100}}, preserveAspectRatio = false), graphics = {Text(extent = {{-120, 100}, {100, 80}}, lineColor = {0, 0, 0}, lineThickness = 1, fillPattern = FillPattern.Solid, fontSize = 15, textStyle = {TextStyle.Bold}, textString = "Example 1: Single-machine infinite bus model*"), Text(extent = {{-164, -88}, {54, -106}}, lineColor = {0, 0, 0}, lineThickness = 1, fillPattern = FillPattern.Solid, fontSize = 12, textString = "*P. Kundur, \"Power System Stability and Control\", Example 13.2")}), Icon(coordinateSystem(extent = {{-140, -100}, {120, 100}})), experiment(StartTime = 0, StopTime = 10, Tolerance = 1e-6, Interval = 1e-4));
      end Example_1;

      extends Modelica.Icons.Package;

      package Generator
        model Step_1
          iPSL.Electrical.Machines.PSAT.SixthOrder.Order6 machine(Vn = 400, V_b = 400, ra = 0.003, xd = 1.81, xq = 1.76, xd1 = 0.3, xq1 = 0.65, xd2 = 0.23, xq2 = 0.25, Td10 = 8, Tq10 = 1, Td20 = 0.03, Tq20 = 0.07, Taa = 0.002, M = 7, D = 0, P_0 = 19.979999999936396, Q_0 = 9.679249699065775, V_0 = 1, angle_0 = 0.494677176989154, Sn = 2220) annotation(Placement(transformation(extent = {{0, -30}, {60, 30}})));
          annotation(Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = false, initialScale = 0.1, grid = {2, 2}), graphics = {Rectangle(lineColor = {255, 0, 0}, lineThickness = 1, extent = {{-26, 46}, {80, -46}}), Text(fillPattern = FillPattern.Solid, lineThickness = 1, extent = {{-72, 60}, {118, 42}}, textString = "Electrical.Machines.PSAT.SixthOrder.Order6", fontSize = 12), Text(fillPattern = FillPattern.Solid, lineThickness = 1, extent = {{-96, 104}, {94, 86}}, textString = "Step 1: Machine model and parameters", fontSize = 15, textStyle = {TextStyle.Bold})}));
        end Step_1;

        model Step_2
          iPSL.Electrical.Machines.PSAT.SixthOrder.Order6 machine(Vn = 400, V_b = 400, ra = 0.003, xd = 1.81, xq = 1.76, xd1 = 0.3, xq1 = 0.65, xd2 = 0.23, xq2 = 0.25, Td10 = 8, Tq10 = 1, Td20 = 0.03, Tq20 = 0.07, Taa = 0.002, M = 7, D = 0, P_0 = 19.979999999936396, Q_0 = 9.679249699065775, V_0 = 1, angle_0 = 0.494677176989154, Sn = 2220) annotation(Placement(transformation(extent = {{20, -30}, {80, 30}})));
          iPSL.Electrical.Controls.PSAT.AVR.AVRtypeIII avr(vfmax = 7, vfmin = -6.40, K0 = 200, T2 = 1, T1 = 1, Te = 0.0001, vf0 = 2.420701642076922, Tr = 0.015, s0 = 0) annotation(Placement(transformation(extent = {{-52, -6}, {-12, 34}})));
          Modelica.Blocks.Sources.Constant pss_off(k = 0) annotation(Placement(transformation(extent = {{-100, -4}, {-80, 16}})));
          annotation(Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Rectangle(extent = {{-64, 42}, {-2, -12}}, lineColor = {255, 0, 0}, lineThickness = 1), Text(extent = {{-96, 104}, {94, 86}}, lineColor = {0, 0, 0}, lineThickness = 1, fillPattern = FillPattern.Solid, fontSize = 15, textStyle = {TextStyle.Bold}, textString = "Step 2: AVR model and parameters"), Text(extent = {{-82, 56}, {20, 40}}, lineColor = {0, 0, 0}, lineThickness = 1, fillPattern = FillPattern.Solid, fontSize = 12, textString = "Electrical.Controls.PSAT.AVR.AVRtypeIII"), Text(extent = {{-138, -14}, {-36, -30}}, lineColor = {0, 0, 0}, lineThickness = 1, fillPattern = FillPattern.Solid, fontSize = 12, textString = "Modelica.Blocks.Sources.Constant"), Rectangle(extent = {{-108, 24}, {-74, -12}}, lineColor = {255, 0, 0}, lineThickness = 1)}));
        end Step_2;

        model Step_3
          iPSL.Electrical.Machines.PSAT.SixthOrder.Order6 machine(Vn = 400, V_b = 400, ra = 0.003, xd = 1.81, xq = 1.76, xd1 = 0.3, xq1 = 0.65, xd2 = 0.23, xq2 = 0.25, Td10 = 8, Tq10 = 1, Td20 = 0.03, Tq20 = 0.07, Taa = 0.002, M = 7, D = 0, P_0 = 19.979999999936396, Q_0 = 9.679249699065775, V_0 = 1, angle_0 = 0.494677176989154, Sn = 2220) annotation(Placement(transformation(extent = {{8, -30}, {68, 30}})));
          iPSL.Electrical.Controls.PSAT.AVR.AVRtypeIII avr(vfmax = 7, vfmin = -6.40, K0 = 200, T2 = 1, T1 = 1, Te = 0.0001, vf0 = 2.420701642076922, Tr = 0.015, s0 = 0) annotation(Placement(transformation(extent = {{-52, -6}, {-12, 34}})));
        protected
          iPSL.Connectors.PwPin terminal annotation(Placement(transformation(extent = {{90, -10}, {110, 10}}), iconTransformation(extent = {{90, -10}, {110, 10}})));
        public
          Modelica.Blocks.Sources.Constant pss_off(k = 0) annotation(Placement(transformation(extent = {{-100, -4}, {-80, 16}})));
          annotation(Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Rectangle(extent = {{80, 20}, {120, -20}}, lineColor = {255, 0, 0}, lineThickness = 1), Text(extent = {{-92, 104}, {98, 86}}, lineColor = {0, 0, 0}, lineThickness = 1, fillPattern = FillPattern.Solid, fontSize = 15, textStyle = {TextStyle.Bold}, textString = "Step 3: Power terminal of the generator model"), Text(extent = {{50, 34}, {152, 18}}, lineColor = {0, 0, 0}, lineThickness = 1, fillPattern = FillPattern.Solid, fontSize = 12, textString = "Connectors.PwPin")}));
        end Step_3;

        model Step_4
          iPSL.Electrical.Machines.PSAT.SixthOrder.Order6 machine(Vn = 400, V_b = 400, ra = 0.003, xd = 1.81, xq = 1.76, xd1 = 0.3, xq1 = 0.65, xd2 = 0.23, xq2 = 0.25, Td10 = 8, Tq10 = 1, Td20 = 0.03, Tq20 = 0.07, Taa = 0.002, M = 7, D = 0, P_0 = 19.979999999936396, Q_0 = 9.679249699065775, V_0 = 1, angle_0 = 0.494677176989154, Sn = 2220) annotation(Placement(visible = true, transformation(extent = {{16, -70}, {76, -10}}, rotation = 0)));
          iPSL.Electrical.Controls.PSAT.AVR.AVRtypeIII avr(vfmax = 7, vfmin = -6.40, K0 = 200, T2 = 1, T1 = 1, Te = 0.0001, vf0 = 2.420701642076922, Tr = 0.015, s0 = 0) annotation(Placement(visible = true, transformation(extent = {{-54, -46}, {-14, -6}}, rotation = 0)));
          Modelica.Blocks.Sources.Constant pss_off(k = 0) annotation(Placement(visible = true, transformation(extent = {{-98, -44}, {-78, -24}}, rotation = 0)));
        protected
          iPSL.Connectors.PwPin terminal annotation(Placement(visible = true, transformation(extent = {{92, -50}, {112, -30}}, rotation = 0)));
        equation
          connect(machine.p, terminal) annotation(Line(points = {{79, -39.8511}, {79.75, -39.8511}, {79.75, -39.8511}, {80.5, -39.8511}, {80.5, -40}, {91.25, -40}, {91.25, -40}, {102, -40}}, color = {0, 0, 255}));
          connect(pss_off.y, avr.vs) annotation(Line(points = {{-77, -34}, {-58, -34}}, color = {0, 0, 127}));
          connect(avr.v, machine.v) annotation(Line(points = {{-58, -16}, {-70, -16}, {-70, -8.88178e-16}, {86, -8.88178e-16}, {86, -31}, {82.5, -31}, {82.5, -31}, {79, -31}}, color = {0, 0, 127}));
          connect(avr.vf, machine.vf) annotation(Line(points = {{-12, -26}, {16, -26}, {16, -25}}, color = {0, 0, 127}));
          connect(machine.pm, machine.pm0) annotation(Line(points = {{16, -55}, {6, -55}, {6, -55}, {-4, -55}, {-4, -80}, {22, -80}, {22, -76.5}, {22, -76.5}, {22, -73}}, color = {0, 0, 127}));
          annotation(Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = false, initialScale = 0.1, grid = {2, 2}), graphics = {Text(fillPattern = FillPattern.Solid, lineThickness = 1, extent = {{-92, 104}, {98, 86}}, textString = "Step 4: Connecting model's signals", fontSize = 15, textStyle = {TextStyle.Bold}), Text(origin = {0, -8}, fillPattern = FillPattern.Solid, lineThickness = 1, extent = {{-94, 60}, {36, 54}}, textString = "1. Machine's terminal voltage to AVR's input signal

2. AVR's output field voltage to machine's input field voltage

3. Initially calculated mechanical power to input signal of the machine's 
mechanical power

4. Machine's power terminal to the generator model power terminal

5. Constant pss_off to the PSS input at the AVR", fontSize = 10, horizontalAlignment = TextAlignment.Left)}));
        end Step_4;

        model Generator
          extends iPSL.Electrical.Essentials.pfComponent;
          iPSL.Electrical.Controls.PSAT.AVR.AVRtypeIII avr(vfmax = 7, vfmin = -6.40, K0 = 200, T2 = 1, T1 = 1, Te = 0.0001, vf0 = 2.420701642076922, Tr = 0.015, s0 = 0) annotation(Placement(transformation(extent = {{-54, -4}, {-14, 36}})));
          iPSL.Electrical.Machines.PSAT.SixthOrder.Order6 machine(ra = 0.003, xd = 1.81, xq = 1.76, xd1 = 0.3, xq1 = 0.65, xd2 = 0.23, xq2 = 0.25, Td10 = 8, Tq10 = 1, Td20 = 0.03, Tq20 = 0.07, Taa = 0.002, M = 7, D = 0, Sn = 2220, V_b = V_b, V_0 = V_0, angle_0 = angle_0, P_0 = P_0, Q_0 = Q_0, Vn = 400) annotation(Placement(transformation(extent = {{14, -30}, {74, 30}})));
          iPSL.Connectors.PwPin pwPin annotation(Placement(transformation(extent = {{100, -10}, {120, 10}}), iconTransformation(extent = {{100, -10}, {120, 10}})));
          Modelica.Blocks.Sources.Constant pss_off(k = 0) annotation(Placement(transformation(extent = {{-100, -2}, {-80, 18}})));
        equation
          connect(avr.vf, machine.vf) annotation(Line(points = {{-12, 16}, {14, 16}, {14, 15}}, color = {0, 0, 127}));
          connect(avr.v, machine.v) annotation(Line(points = {{-58, 26}, {-72, 26}, {-72, 50}, {94, 50}, {94, 9}, {77, 9}}, color = {0, 0, 127}));
          connect(machine.pm0, machine.pm) annotation(Line(points = {{20, -33}, {20, -33}, {20, -40}, {0, -40}, {0, -15}, {14, -15}}, color = {0, 0, 127}));
          connect(machine.p, pwPin) annotation(Line(points = {{77, 0.14892}, {78.5, 0.14892}, {78.5, 0}, {110, 0}}, color = {0, 0, 255}));
          connect(pss_off.y, avr.vs) annotation(Line(points = {{-79, 8}, {-58, 8}, {-58, 8}}, color = {0, 0, 127}));
          annotation(Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Ellipse(extent = {{-100, 100}, {100, -100}}, lineColor = {0, 0, 0}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid), Line(points = {{-48, 2}, {-20, 56}, {2, 4}, {24, -28}, {48, 22}}, color = {0, 0, 0}, smooth = Smooth.Bezier), Text(extent = {{-52, -18}, {56, -66}}, lineColor = {0, 0, 0}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, textString = "%name")}), Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}})));
        end Generator;
      end Generator;

      package Network
        model Step_1
          iPSL.Electrical.Buses.Bus B1 annotation(Placement(transformation(extent = {{-92, -12}, {-68, 12}})));
          iPSL.Electrical.Buses.Bus B2 annotation(Placement(transformation(extent = {{-32, -12}, {-8, 12}})));
          iPSL.Electrical.Buses.Bus B3 annotation(Placement(transformation(extent = {{48, -12}, {72, 12}})));
          Generator.Generator G1 annotation(Placement(transformation(extent = {{-120, -10}, {-100, 10}})));
          Electrical.SystemBase SysData(S_b = 100, fn = 60) annotation(Placement(visible = true, transformation(origin = {72.4271, -75}, extent = {{-29.5101, -25}, {41.3141, 25}}, rotation = 0)));
          annotation(Diagram(coordinateSystem(extent = {{-140, -100}, {120, 100}}, preserveAspectRatio = false), graphics = {Text(extent = {{-106, 102}, {84, 84}}, lineColor = {0, 0, 0}, lineThickness = 1, fillPattern = FillPattern.Solid, fontSize = 15, textStyle = {TextStyle.Bold}, textString = "Step 1: Adding generator and bus models"), Rectangle(extent = {{-126, 14}, {-94, -14}}, lineColor = {255, 0, 0}, lineThickness = 1), Rectangle(extent = {{-86, 20}, {66, -22}}, lineColor = {255, 0, 0}, lineThickness = 1), Text(extent = {{-104, 36}, {86, 18}}, lineColor = {0, 0, 0}, lineThickness = 1, fillPattern = FillPattern.Solid, fontSize = 12, textString = "Electrical.Buses.Bus")}), Icon(coordinateSystem(extent = {{-140, -100}, {120, 100}})));
        end Step_1;

        model Step_2
          iPSL.Electrical.Buses.Bus B1 annotation(Placement(transformation(extent = {{-92, -12}, {-68, 12}})));
          iPSL.Electrical.Buses.Bus B2 annotation(Placement(transformation(extent = {{-32, -12}, {-8, 12}})));
          iPSL.Electrical.Buses.Bus B3 annotation(Placement(transformation(extent = {{48, -12}, {72, 12}})));
          Generator.Generator G1 annotation(Placement(transformation(extent = {{-120, -10}, {-100, 10}})));
          iPSL.Electrical.Branches.PSAT.TwoWindingTransformer twoWindingTransformer(Sn = 2220, Vbus = 400000, Vn1 = 400000, fn = 60, X = 0.15, R = 0, Sb = 100, V_b = 400, Vn = 400, kT = 1, x = 0.15, r = 0) annotation(Placement(transformation(extent = {{-60, -10}, {-40, 10}})));
          iPSL.Electrical.Branches.PwLine pwLine(R = 0, G = 0, B = 0, X = 0.5 * 100 / 2220, S_b = 100) annotation(Placement(transformation(extent = {{10, 10}, {30, 30}})));
          iPSL.Electrical.Branches.PwLine pwLine1(R = 0, G = 0, B = 0, S_b = 100, X = 0.93 * 100 / 2220) annotation(Placement(transformation(extent = {{10, -30}, {30, -10}})));
          Electrical.SystemBase SysData(S_b = 100, fn = 60) annotation(Placement(visible = true, transformation(origin = {74.0653, -80}, extent = {{-28.6565, -20}, {40.119, 20}}, rotation = 0)));
          annotation(Diagram(coordinateSystem(extent = {{-140, -100}, {120, 100}}, preserveAspectRatio = false), graphics = {Text(extent = {{-106, 102}, {84, 84}}, lineColor = {0, 0, 0}, lineThickness = 1, fillPattern = FillPattern.Solid, fontSize = 15, textStyle = {TextStyle.Bold}, textString = "Step 2: Adding transformer and line models"), Rectangle(extent = {{-66, 10}, {-34, -10}}, lineColor = {255, 0, 0}, lineThickness = 1), Text(extent = {{-20, 44}, {56, 34}}, lineColor = {0, 0, 0}, lineThickness = 1, fillPattern = FillPattern.Solid, fontSize = 12, textString = "Electrical.Branches.PwLine"), Rectangle(extent = {{4, 34}, {36, -32}}, lineColor = {255, 0, 0}, lineThickness = 1), Text(extent = {{-128, 26}, {8, 14}}, lineColor = {0, 0, 0}, lineThickness = 1, fillPattern = FillPattern.Solid, fontSize = 12, textString = "Electrical.Branches.PSAT.TwoWindingTransformer")}), Icon(coordinateSystem(extent = {{-140, -100}, {120, 100}})));
        end Step_2;

        model Step_3
          iPSL.Electrical.Buses.Bus B1 annotation(Placement(transformation(extent = {{-92, -12}, {-68, 12}})));
          iPSL.Electrical.Buses.Bus B2 annotation(Placement(transformation(extent = {{-32, -12}, {-8, 12}})));
          iPSL.Electrical.Buses.Bus B3 annotation(Placement(transformation(extent = {{48, -12}, {72, 12}})));
          Generator.Generator G1 annotation(Placement(transformation(extent = {{-120, -10}, {-100, 10}})));
          iPSL.Electrical.Branches.PSAT.TwoWindingTransformer twoWindingTransformer(Sn = 2220, fn = 60, x = 0.15, r = 0, V_b = 400, Vn = 400) annotation(Placement(transformation(extent = {{-60, -10}, {-40, 10}})));
          iPSL.Electrical.Branches.PwLine pwLine(R = 0, G = 0, B = 0, X = 0.5 * 100 / 2220, S_b = 100) annotation(Placement(transformation(extent = {{10, 10}, {30, 30}})));
          iPSL.Electrical.Branches.PwLine pwLine1(R = 0, G = 0, B = 0, S_b = 100, X = 0.93 * 100 / 2220) annotation(Placement(transformation(extent = {{10, -30}, {30, -10}})));
          iPSL.Electrical.Loads.PSAT.LOADPQ lOADPQ(Sn = 100, S_b = 100, P_0 = 19.979999999894400, Q_0 = -0.870664705119217) annotation(Placement(visible = true, transformation(origin = {80, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 360)));
          iPSL.Electrical.Buses.InfiniteBus infiniteBus(V = 0.90081, angle = 0) annotation(Placement(visible = true, transformation(origin = {106, 0}, extent = {{-10, 10}, {10, -10}}, rotation = 180)));
          Electrical.SystemBase SysData(S_b = 100, fn = 60) annotation(Placement(visible = true, transformation(origin = {91.3364, -85}, extent = {{-17.6168, -15}, {24.6636, 15}}, rotation = 0)));
          annotation(Icon(coordinateSystem(extent = {{-140, -100}, {120, 100}})), Diagram(coordinateSystem(extent = {{-140, -100}, {120, 100}}, preserveAspectRatio = false, initialScale = 0.1, grid = {2, 2}), graphics = {Text(fillPattern = FillPattern.Solid, lineThickness = 1, extent = {{-106, 102}, {84, 84}}, textString = "Step 3: Adding load and infinite bus models", fontSize = 15, textStyle = {TextStyle.Bold}), Rectangle(lineColor = {255, 0, 0}, lineThickness = 1, extent = {{72, -14}, {88, -34}}), Text(fillPattern = FillPattern.Solid, lineThickness = 1, extent = {{40, -36}, {124, -46}}, textString = "Electrical.Loads.PSAT.LOADPQ ", fontSize = 12), Rectangle(lineColor = {255, 0, 0}, lineThickness = 1, extent = {{94, 14}, {118, -12}}), Text(origin = {-2, 0}, fillPattern = FillPattern.Solid, lineThickness = 1, extent = {{62, 24}, {146, 14}}, textString = "Electrical.Buses.InfiniteBus", fontSize = 12)}));
        end Step_3;

        model Step_4
          iPSL.Electrical.Buses.Bus B1 annotation(Placement(transformation(extent = {{-92, -12}, {-68, 12}})));
          iPSL.Electrical.Buses.Bus B2 annotation(Placement(transformation(extent = {{-32, -12}, {-8, 12}})));
          iPSL.Electrical.Buses.Bus B3 annotation(Placement(transformation(extent = {{48, -12}, {72, 12}})));
          Generator.Generator G1 annotation(Placement(transformation(extent = {{-120, -10}, {-100, 10}})));
          iPSL.Electrical.Branches.PSAT.TwoWindingTransformer twoWindingTransformer(Sn = 2220, fn = 60, x = 0.15, r = 0, V_b = 400, Vn = 400) annotation(Placement(transformation(extent = {{-60, -10}, {-40, 10}})));
          iPSL.Electrical.Branches.PwLine pwLine(R = 0, G = 0, B = 0, X = 0.5 * 100 / 2220, S_b = 100) annotation(Placement(transformation(extent = {{10, 10}, {30, 30}})));
          iPSL.Electrical.Buses.InfiniteBus infiniteBus(V = 0.90081, angle = 0) annotation(Placement(transformation(extent = {{-10, 10}, {10, -10}}, rotation = 180, origin = {110, 0})));
          iPSL.Electrical.Events.PwFault pwFault(R = 0, t1 = 0.5, t2 = 0.57, X = 0.01 * 100 / 2220) annotation(Placement(transformation(extent = {{0, -60}, {20, -40}})));
          iPSL.Electrical.Branches.PwLine pwLine1(R = 0, G = 0, B = 0, S_b = 100, X = 0.93 * 100 / 2220) annotation(Placement(transformation(extent = {{10, -30}, {30, -10}})));
          iPSL.Electrical.Loads.PSAT.LOADPQ lOADPQ(Sn = 100, S_b = 100, P_0 = 19.979999999894400, Q_0 = -0.870664705119217) annotation(Placement(visible = true, transformation(origin = {80, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 360)));
          Electrical.SystemBase SysData(S_b = 100, fn = 60) annotation(Placement(visible = true, transformation(origin = {104.09, -92}, extent = {{-9.62041, -8}, {13.4686, 8}}, rotation = 0)));
          annotation(Diagram(coordinateSystem(extent = {{-140, -100}, {120, 100}}, preserveAspectRatio = false), graphics = {Text(extent = {{-106, 102}, {84, 84}}, lineColor = {0, 0, 0}, lineThickness = 1, fillPattern = FillPattern.Solid, fontSize = 15, textStyle = {TextStyle.Bold}, textString = "Step 3: Adding fault model"), Rectangle(extent = {{-6, -36}, {24, -64}}, lineColor = {255, 0, 0}, lineThickness = 1), Text(extent = {{-30, -66}, {54, -76}}, lineColor = {0, 0, 0}, lineThickness = 1, fillPattern = FillPattern.Solid, fontSize = 12, textString = "Electrical.Events.PwFault")}), Icon(coordinateSystem(extent = {{-140, -100}, {120, 100}})));
        end Step_4;

        model Step_5
          iPSL.Electrical.Buses.Bus B1 annotation(Placement(visible = true, transformation(extent = {{-100, -12}, {-76, 12}}, rotation = 0)));
          iPSL.Electrical.Buses.Bus B2 annotation(Placement(visible = true, transformation(extent = {{-40, -12}, {-16, 12}}, rotation = 0)));
          iPSL.Electrical.Buses.Bus B3 annotation(Placement(visible = true, transformation(extent = {{40, -12}, {64, 12}}, rotation = 0)));
          Generator.Generator G1 annotation(Placement(visible = true, transformation(extent = {{-128, -10}, {-108, 10}}, rotation = 0)));
          iPSL.Electrical.Branches.PSAT.TwoWindingTransformer twoWindingTransformer(Sn = 2220, fn = 60, x = 0.15, r = 0, V_b = 400, Vn = 400) annotation(Placement(visible = true, transformation(extent = {{-68, -10}, {-48, 10}}, rotation = 0)));
          iPSL.Electrical.Branches.PwLine pwLine(R = 0, G = 0, B = 0, X = 0.5 * 100 / 2220, S_b = 100) annotation(Placement(visible = true, transformation(extent = {{2, 10}, {22, 30}}, rotation = 0)));
          iPSL.Electrical.Loads.PSAT.LOADPQ lOADPQ(Sn = 100, S_b = 100, P_0 = 19.979999999894400, Q_0 = -0.870664705119217) annotation(Placement(visible = true, transformation(origin = {72, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 360)));
          iPSL.Electrical.Buses.InfiniteBus infiniteBus(V = 0.90081, angle = 0) annotation(Placement(visible = true, transformation(origin = {102, 0}, extent = {{-10, 10}, {10, -10}}, rotation = 180)));
          iPSL.Electrical.Events.PwFault pwFault(R = 0, t1 = 0.5, t2 = 0.57, X = 0.01 * 100 / 2220) annotation(Placement(visible = true, transformation(extent = {{-8, -60}, {12, -40}}, rotation = 0)));
          iPSL.Electrical.Branches.PwLine pwLine1(R = 0, G = 0, B = 0, S_b = 100, X = 0.93 * 100 / 2220) annotation(Placement(visible = true, transformation(extent = {{2, -30}, {22, -10}}, rotation = 0)));
        equation
          connect(pwLine1.p, pwLine.p) annotation(Line(points = {{5, -20}, {-18, -20}, {-18, 20}, {5, 20}}, color = {0, 0, 255}));
          connect(pwLine1.n, B3.p) annotation(Line(points = {{19, -20}, {42, -20}, {42, 0}, {52, 0}}, color = {0, 0, 255}));
          connect(pwFault.p, pwLine.p) annotation(Line(points = {{-9.66667, -50}, {-22, -50}, {-22, 0}, {-18, 0}, {-18, 20}, {5, 20}}, color = {0, 0, 255}));
          connect(lOADPQ.p, infiniteBus.p) annotation(Line(points = {{72, -19}, {72, -9.5}, {72, -9.5}, {72, 0}, {91, 0}, {91, 1.38778e-15}}, color = {0, 0, 255}));
          connect(B3.p, infiniteBus.p) annotation(Line(points = {{52, 0}, {72, 0}, {72, 0}, {91, 0}}, color = {0, 0, 255}));
          connect(pwLine.n, B3.p) annotation(Line(points = {{19, 20}, {42, 20}, {42, 0}, {52, 0}}, color = {0, 0, 255}));
          connect(B2.p, pwLine.p) annotation(Line(points = {{-28, 0}, {-22, 0}, {-22, 0}, {-18, 0}, {-18, 20}, {5, 20}}, color = {0, 0, 255}));
          connect(twoWindingTransformer.n, B2.p) annotation(Line(points = {{-47, 0}, {-28, 0}, {-28, 0}, {-28, 0}, {-28, 0}}, color = {0, 0, 255}));
          connect(B1.p, twoWindingTransformer.p) annotation(Line(points = {{-88, 0}, {-78, 0}, {-78, 0}, {-69, 0}}, color = {0, 0, 255}));
          connect(G1.pwPin, B1.p) annotation(Line(points = {{-107, 0}, {-88, 0}, {-88, 0}}, color = {0, 0, 255}));
          annotation(Diagram(coordinateSystem(extent = {{-140, -100}, {120, 100}}, preserveAspectRatio = false), graphics = {Text(extent = {{-106, 102}, {84, 84}}, lineColor = {0, 0, 0}, lineThickness = 1, fillPattern = FillPattern.Solid, fontSize = 15, textStyle = {TextStyle.Bold}, textString = "Step 5: Connecting network components")}), Icon(coordinateSystem(extent = {{-140, -100}, {120, 100}})));
        end Step_5;
      end Network;
      annotation(Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Polygon(origin = {8.0, 14.0}, lineColor = {78, 138, 73}, fillColor = {78, 138, 73}, pattern = LinePattern.None, fillPattern = FillPattern.Solid, points = {{-58.0, 46.0}, {42.0, -14.0}, {-58.0, -74.0}, {-58.0, 46.0}})}), Documentation(info = ""));
    end Example_1;

    package Example_2
      extends Modelica.Icons.Package;

      model Example_2
        import iPSL;
        iPSL.Electrical.Buses.Bus B1 annotation(Placement(transformation(extent = {{-92, -12}, {-68, 12}})));
        iPSL.Electrical.Buses.Bus B2 annotation(Placement(transformation(extent = {{-32, -12}, {-8, 12}})));
        iPSL.Electrical.Buses.Bus B3 annotation(Placement(transformation(extent = {{48, -12}, {72, 12}})));
        iPSL.Examples.Example_2.Generator.Generator G1(P_0 = 19.979999999936396, Q_0 = 9.679249699065775, angle_0 = 0.494677176989154, V_b = 400, V_0 = 1) annotation(Placement(transformation(extent = {{-120, -10}, {-100, 10}})));
        iPSL.Electrical.Branches.PSAT.TwoWindingTransformer Transformer(Sn = 2220, V_b = 400000, Vn = 400000, fn = 60, x = 0.15, r = 0) annotation(Placement(transformation(extent = {{-60, -10}, {-40, 10}})));
        iPSL.Electrical.Branches.PwLine Line_1(R = 0, G = 0, B = 0, X = 0.022522522522523, S_b = 100) annotation(Placement(transformation(extent = {{10, 10}, {30, 30}})));
        iPSL.Electrical.Loads.PSAT.LOADPQ Load(Sn = 100, S_b = 100, P_0 = 19.979999999894400, Q_0 = -0.870664705119217) annotation(Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 0, origin = {80, -30})));
        iPSL.Electrical.Buses.InfiniteBus infinite_bus(V = 0.90081, angle = 0) annotation(Placement(transformation(extent = {{-10, 10}, {10, -10}}, rotation = 180, origin = {110, 0})));
        iPSL.Electrical.Events.PwFault Fault(R = 0, t1 = 0.5, t2 = 0.57, X = 0.0004504504504504504) annotation(Placement(transformation(extent = {{0, -60}, {20, -40}})));
        iPSL.Electrical.Branches.PwLine Line_2(R = 0, G = 0, B = 0, S_b = 100, X = 0.041891891891892) annotation(Placement(transformation(extent = {{10, -30}, {30, -10}})));
        inner iPSL.Electrical.SystemBase SysData(S_b = 100, fn = 60) annotation(Placement(transformation(extent = {{60, -100}, {120, -60}})));
      equation
        connect(G1.pwPin, B1.p) annotation(Line(points = {{-99, 0}, {-80, 0}}, color = {0, 0, 255}));
        connect(B1.p, Transformer.p) annotation(Line(points = {{-80, 0}, {-70, 0}, {-70, 0}, {-61, 0}}, color = {0, 0, 255}));
        connect(Transformer.n, B2.p) annotation(Line(points = {{-39, 0}, {-20, 0}, {-20, 0}}, color = {0, 0, 255}));
        connect(B2.p, Line_1.p) annotation(Line(points = {{-20, 0}, {-14, 0}, {-14, 0}, {-10, 0}, {-10, 20}, {13, 20}}, color = {0, 0, 255}));
        connect(Load.p, infinite_bus.p) annotation(Line(points = {{80, -19}, {80, 0}, {99, 0}, {99, 1.38778e-015}}, color = {0, 0, 255}));
        connect(Fault.p, Line_1.p) annotation(Line(points = {{-1.66667, -50}, {-14, -50}, {-14, 0}, {-10, 0}, {-10, 20}, {13, 20}}, color = {0, 0, 255}));
        connect(Line_2.p, Line_1.p) annotation(Line(points = {{13, -20}, {-10, -20}, {-10, 20}, {13, 20}}, color = {0, 0, 255}));
        connect(B3.p, infinite_bus.p) annotation(Line(points = {{60, 0}, {70, 0}, {99, 0}, {99, 1.38778e-015}}, color = {0, 0, 255}));
        connect(B3.p, Line_1.n) annotation(Line(points = {{60, 0}, {56, 0}, {56, 0}, {50, 0}, {50, 20}, {27, 20}}, color = {0, 0, 255}));
        connect(Line_2.n, Line_1.n) annotation(Line(points = {{27, -20}, {50, -20}, {50, 20}, {27, 20}}, color = {0, 0, 255}));
        annotation(Icon(coordinateSystem(extent = {{-140, -100}, {120, 100}})), Diagram(coordinateSystem(extent = {{-140, -100}, {120, 100}}, preserveAspectRatio = false, initialScale = 0.1, grid = {2, 2}), graphics = {Text(fillPattern = FillPattern.Solid, lineThickness = 1, extent = {{-120, 100}, {100, 80}}, fontSize = 15, textStyle = {TextStyle.Bold}, textString = "Example 2: Single-machine infinite bus model with the PSS*", lineColor = {0, 0, 0}), Text(fillPattern = FillPattern.Solid, lineThickness = 1, extent = {{-170, -88}, {48, -106}}, textString = "*P. Kundur, \"Power System Stability and Control\", Example 13.2", fontSize = 12)}));
      end Example_2;

      package Generator
        model Step_1
          iPSL.Electrical.Controls.PSAT.AVR.AVRtypeIII avr(vfmax = 7, vfmin = -6.40, K0 = 200, T2 = 1, T1 = 1, Te = 0.0001, vf0 = 2.420701642076922, Tr = 0.015, s0 = 0) annotation(Placement(transformation(extent = {{0, 0}, {20, 20}})));
          iPSL.Electrical.Machines.PSAT.SixthOrder.Order6 machine(Vn = 400, ra = 0.003, xd = 1.81, xq = 1.76, xd1 = 0.3, xq1 = 0.65, xd2 = 0.23, xq2 = 0.25, Td10 = 8, Tq10 = 1, Td20 = 0.03, Tq20 = 0.07, Taa = 0.002, M = 7, D = 0, Sn = 2220, V_b = V_b, V_0 = V_0, angle_0 = angle_0, P_0 = P_0, Q_0 = Q_0) annotation(Placement(transformation(extent = {{40, -20}, {80, 20}})));
          iPSL.Connectors.PwPin pwPin annotation(Placement(transformation(extent = {{100, -10}, {120, 10}}), iconTransformation(extent = {{100, -10}, {120, 10}})));
          iPSL.Electrical.Controls.PSAT.PSS.PSSTypeII pss(vsmax = 0.2, vsmin = -0.2, Kw = 9.5, Tw = 1.41, T1 = 0.154, T2 = 0.033, T3 = 1, T4 = 1) annotation(Placement(transformation(extent = {{-40, -4}, {-20, 16}})));
        equation
          connect(avr.vf, machine.vf) annotation(Line(points = {{21, 10}, {30, 10}, {30, 10}, {40, 10}}, color = {0, 0, 127}));
          connect(machine.p, pwPin) annotation(Line(points = {{82, 0.09928}, {92, 0.09928}, {92, 0}, {110, 0}}, color = {0, 0, 255}));
          connect(machine.pm, machine.pm0) annotation(Line(points = {{40, -10}, {34, -10}, {34, -28}, {44, -28}, {44, -22}}, color = {0, 0, 127}));
          annotation(Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Ellipse(extent = {{-100, 100}, {100, -100}}, lineColor = {0, 0, 0}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid), Line(points = {{-48, 2}, {-20, 56}, {2, 4}, {24, -28}, {48, 22}}, color = {0, 0, 0}, smooth = Smooth.Bezier), Text(extent = {{-52, -18}, {56, -66}}, lineColor = {0, 0, 0}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, textString = "%name")}), Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Rectangle(extent = {{-46, 20}, {-14, -8}}, lineColor = {255, 0, 0}, lineThickness = 1), Text(extent = {{-92, 102}, {98, 84}}, lineColor = {0, 0, 0}, lineThickness = 1, fillPattern = FillPattern.Solid, fontSize = 15, textStyle = {TextStyle.Bold}, textString = "Step 1: Adding PSS to the generator model"), Text(extent = {{-76, 32}, {28, 24}}, lineColor = {0, 0, 0}, lineThickness = 1, fillPattern = FillPattern.Solid, fontSize = 12, textString = "Electrical.Controls.PSAT.PSS.PSSTypeII")}));
        end Step_1;

        model Step_2
          iPSL.Electrical.Controls.PSAT.AVR.AVRtypeIII avr(vfmax = 7, vfmin = -6.40, K0 = 200, T2 = 1, T1 = 1, Te = 0.0001, vf0 = 2.420701642076922, Tr = 0.015, s0 = 0) annotation(Placement(transformation(extent = {{0, 0}, {20, 20}})));
          iPSL.Electrical.Machines.PSAT.SixthOrder.Order6 machine(Vn = 400, ra = 0.003, xd = 1.81, xq = 1.76, xd1 = 0.3, xq1 = 0.65, xd2 = 0.23, xq2 = 0.25, Td10 = 8, Tq10 = 1, Td20 = 0.03, Tq20 = 0.07, Taa = 0.002, M = 7, D = 0, Sn = 2220, V_b = V_b, V_0 = V_0, angle_0 = angle_0, P_0 = P_0, Q_0 = Q_0) annotation(Placement(transformation(extent = {{40, -20}, {80, 20}})));
          iPSL.Connectors.PwPin pwPin annotation(Placement(transformation(extent = {{100, -10}, {120, 10}}), iconTransformation(extent = {{100, -10}, {120, 10}})));
          iPSL.Electrical.Controls.PSAT.PSS.PSSTypeII pss(vsmax = 0.2, vsmin = -0.2, Kw = 9.5, Tw = 1.41, T1 = 0.154, T2 = 0.033, T3 = 1, T4 = 1) annotation(Placement(transformation(extent = {{-40, -4}, {-20, 16}})));
        equation
          connect(avr.vf, machine.vf) annotation(Line(points = {{21, 10}, {40, 10}, {40, 10}}, color = {0, 0, 127}));
          connect(machine.p, pwPin) annotation(Line(points = {{82, 0.09928}, {92, 0.09928}, {92, 0}, {110, 0}}, color = {0, 0, 255}));
          connect(pss.vSI, machine.w) annotation(Line(points = {{-41, 6}, {-60, 6}, {-60, -40}, {96, -40}, {96, 18}, {82, 18}}, color = {0, 0, 127}));
          connect(pss.vs, avr.vs) annotation(Line(points = {{-19, 6}, {-2, 6}}, color = {0, 0, 127}));
          connect(avr.v, machine.v) annotation(Line(points = {{-2, 15}, {-10, 15}, {-10, -34}, {92, -34}, {92, 6}, {82, 6}}, color = {0, 0, 127}));
          connect(machine.pm, machine.pm0) annotation(Line(points = {{40, -10}, {32, -10}, {32, -26}, {44, -26}, {44, -22}}, color = {0, 0, 127}));
          annotation(Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Ellipse(extent = {{-100, 100}, {100, -100}}, lineColor = {0, 0, 0}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid), Line(points = {{-48, 2}, {-20, 56}, {2, 4}, {24, -28}, {48, 22}}, color = {0, 0, 0}, smooth = Smooth.Bezier), Text(extent = {{-52, -18}, {56, -66}}, lineColor = {0, 0, 0}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, textString = "%name")}), Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Text(extent = {{-92, 102}, {98, 84}}, lineColor = {0, 0, 0}, lineThickness = 1, fillPattern = FillPattern.Solid, fontSize = 15, textStyle = {TextStyle.Bold}, textString = "Step 2: Connecting model's signals"), Text(extent = {{-94, 86}, {88, 40}}, lineColor = {0, 0, 0}, lineThickness = 1, fillPattern = FillPattern.Solid, fontSize = 12, horizontalAlignment = TextAlignment.Left, textString = "1. Generator terminal voltage to voltage input of the AVR

2. PSS output to PSS input of the AVR

3. Generator speed to the input signal of the PSS")}));
        end Step_2;

        model Generator
          extends iPSL.Electrical.Essentials.pfComponent;
          iPSL.Electrical.Controls.PSAT.AVR.AVRtypeIII avr(vfmax = 7, vfmin = -6.40, K0 = 200, T2 = 1, T1 = 1, Te = 0.0001, vf0 = 2.420701642076922, Tr = 0.015, s0 = 0) annotation(Placement(transformation(extent = {{0, 0}, {20, 20}})));
          iPSL.Electrical.Machines.PSAT.SixthOrder.Order6 machine(Vn = 400, ra = 0.003, xd = 1.81, xq = 1.76, xd1 = 0.3, xq1 = 0.65, xd2 = 0.23, xq2 = 0.25, Td10 = 8, Tq10 = 1, Td20 = 0.03, Tq20 = 0.07, Taa = 0.002, M = 7, D = 0, Sn = 2220, V_b = V_b, V_0 = V_0, angle_0 = angle_0, P_0 = P_0, Q_0 = Q_0) annotation(Placement(transformation(extent = {{40, -20}, {80, 20}})));
          iPSL.Connectors.PwPin pwPin annotation(Placement(transformation(extent = {{100, -10}, {120, 10}}), iconTransformation(extent = {{100, -10}, {120, 10}})));
          iPSL.Electrical.Controls.PSAT.PSS.PSSTypeII pss(vsmax = 0.2, vsmin = -0.2, Kw = 9.5, Tw = 1.41, T1 = 0.154, T2 = 0.033, T3 = 1, T4 = 1) annotation(Placement(transformation(extent = {{-40, -4}, {-20, 16}})));
        equation
          connect(avr.vf, machine.vf) annotation(Line(points = {{21, 10}, {40, 10}, {40, 10}}, color = {0, 0, 127}));
          connect(machine.p, pwPin) annotation(Line(points = {{82, 0.09928}, {92, 0.09928}, {92, 0}, {110, 0}}, color = {0, 0, 255}));
          connect(pss.vSI, machine.w) annotation(Line(points = {{-41, 6}, {-60, 6}, {-60, -40}, {96, -40}, {96, 18}, {82, 18}}, color = {0, 0, 127}));
          connect(pss.vs, avr.vs) annotation(Line(points = {{-19, 6}, {-2, 6}}, color = {0, 0, 127}));
          connect(avr.v, machine.v) annotation(Line(points = {{-2, 15}, {-10, 15}, {-10, -34}, {92, -34}, {92, 6}, {82, 6}}, color = {0, 0, 127}));
          connect(machine.pm, machine.pm0) annotation(Line(points = {{40, -10}, {34, -10}, {34, -28}, {44, -28}, {44, -22}}, color = {0, 0, 127}));
          annotation(Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Ellipse(extent = {{-100, 100}, {100, -100}}, lineColor = {0, 0, 0}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid), Line(points = {{-48, 2}, {-20, 56}, {2, 4}, {24, -28}, {48, 22}}, color = {0, 0, 0}, smooth = Smooth.Bezier), Text(extent = {{-52, -18}, {56, -66}}, lineColor = {0, 0, 0}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, textString = "%name")}), Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}})));
        end Generator;
      end Generator;
      annotation(Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Polygon(origin = {8.0, 14.0}, lineColor = {78, 138, 73}, fillColor = {78, 138, 73}, pattern = LinePattern.None, fillPattern = FillPattern.Solid, points = {{-58.0, 46.0}, {42.0, -14.0}, {-58.0, -74.0}, {-58.0, 46.0}})}), Documentation(info = ""));
    end Example_2;

    package Example_3
      extends Modelica.Icons.Package;

      model Example_3
        iPSL.Electrical.Branches.PSAT.TwoWindingTransformer twoWindingTransformer(V_b = 16500, Vn = 16500, kT = 16.5 / 230, x = 0.0576, r = 0) annotation(Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 90, origin = {0, -66})));
        iPSL.Electrical.Branches.PwLine line_6_4(R = 0.017, X = 0.092, G = 0, B = 0.079) annotation(Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 90, origin = {86, -20})));
        iPSL.Electrical.Branches.PwLine line_4_5(G = 0, R = 0.01, X = 0.085, B = 0.088) annotation(Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 90, origin = {-72, -20})));
        iPSL.Electrical.Loads.PSAT.LOADPQ lOADPQ(P_0 = 1.25, Q_0 = 0.5) annotation(Placement(transformation(extent = {{-7, -7}, {7, 7}}, rotation = 0, origin = {-99, -9})));
        iPSL.Electrical.Loads.PSAT.LOADPQ PQ1(P_0 = 0.9, Q_0 = 0.3) annotation(Placement(transformation(extent = {{-7, -7}, {7, 7}}, rotation = 0, origin = {109, -13})));
        iPSL.Electrical.Branches.PwLine line_9_6(G = 0, R = 0.039, X = 0.170, B = 0.179) annotation(Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 90, origin = {86, 58})));
        iPSL.Electrical.Branches.PwLine line_5_7(G = 0, R = 0.032, X = 0.161, B = 0.153) annotation(Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 90, origin = {-72, 54})));
        iPSL.Electrical.Branches.PwLine line_8_9(G = 0, R = 0.0119, X = 0.1008, B = 0.1045) annotation(Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 0, origin = {40, 90})));
        iPSL.Electrical.Branches.PSAT.TwoWindingTransformer twoWindingTransformer1(r = 0, V_b = 13800, Vn = 13800, kT = 13.8 / 230, x = 0.0586) annotation(Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 180, origin = {102, 90})));
        iPSL.Electrical.Branches.PSAT.TwoWindingTransformer twoWindingTransformer2(r = 0, kT = 18 / 230, x = 0.0625, Sn = 100, V_b = 18, Vn = 18) annotation(Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 0, origin = {-102, 90})));
        iPSL.Electrical.Loads.PSAT.LOADPQ lOADPQ1(P_0 = 1, Q_0 = 0.35) annotation(Placement(transformation(extent = {{-7, -7}, {7, 7}}, rotation = 0, origin = {-9, 65})));
        iPSL.Electrical.Controls.PSAT.FACTS.STATCOM.STATCOM sTATCOM3_1(Vbus = 230000, Vn = 230000, Qg = 0.128730182132440, angle_0 = 0.011660880329005, Kr = 100, Tr = 0.1, i_Max = 1.2, Sb = 100, Sn = 100, fn = 60, V_0 = 1.025, i_Min = -0.8) annotation(Placement(transformation(extent = {{-6, -6}, {6, 6}}, rotation = 90, origin = {12, 66})));
        iPSL.Electrical.Buses.Bus B2 annotation(Placement(transformation(extent = {{-130, 80}, {-110, 100}})));
        iPSL.Electrical.Buses.Bus B7 annotation(Placement(transformation(extent = {{-90, 80}, {-70, 100}})));
        iPSL.Electrical.Buses.Bus B8 annotation(Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 0, origin = {0, 90})));
        iPSL.Electrical.Buses.Bus B9 annotation(Placement(transformation(extent = {{70, 80}, {90, 100}})));
        iPSL.Electrical.Buses.Bus B3 annotation(Placement(transformation(extent = {{110, 80}, {130, 100}})));
        iPSL.Electrical.Buses.Bus B6 annotation(Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = -90, origin = {86, 20})));
        iPSL.Electrical.Buses.Bus B5 annotation(Placement(transformation(extent = {{-12, -12}, {12, 12}}, rotation = 90, origin = {-72, 20})));
        iPSL.Electrical.Buses.Bus B4 annotation(Placement(transformation(extent = {{-12, -12}, {12, 12}}, rotation = -90, origin = {0, -46})));
        iPSL.Electrical.Buses.Bus B1 annotation(Placement(transformation(extent = {{-12, -12}, {12, 12}}, rotation = -90, origin = {0, -86})));
        iPSL.Electrical.Branches.PwLine2Openings ine_7_8(R = 0.0085, X = 0.072, G = 0, B = 0.0745, t1 = 100, t2 = 100.15) annotation(Placement(transformation(extent = {{-50, 80}, {-30, 100}})));
        Generation_Groups.Gen1 gen1(angle_0 = 0.160490018910725, V_b = 18, V_0 = 1.025, height_1 = 0.05, tstart_1 = 2, P_0 = 1.63, Q_0 = 0.001552891584958, refdisturb_1 = true) annotation(Placement(transformation(extent = {{-160, 80}, {-140, 100}})));
        Generation_Groups.Gen2 gen2(angle_0 = 0.080629575357894, Q_0 = -0.163501111031896, V_b = 13.8, V_0 = 1.025, P_0 = 0.85, height_2 = 0.05, tstart_2 = 2, refdisturb_2 = false) annotation(Placement(transformation(extent = {{160, 80}, {140, 100}})));
        Generation_Groups.Gen3 gen3(V_0 = 1.040000000000000, angle_0 = 0, P_0 = 0.715870954698345, Q_0 = 0.248141030193284, height_3 = 0.05, tstart_3 = 2, refdisturb_3 = false, V_b = 16.5) annotation(Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 90, origin = {0, -106})));
        inner iPSL.Electrical.SystemBase SysData(S_b = 100, fn = 60) annotation(Placement(transformation(extent = {{120, -120}, {180, -80}})));
        Electrical.Events.PwFault pwFault1 annotation(Placement(visible = true, transformation(origin = {-22, 28}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
      equation
        connect(pwFault1.p, B5.p) annotation(Line(points = {{-29, 28}, {-72, 28}, {-72, 20}, {-72, 20}}, color = {0, 0, 255}));
        connect(line_5_7.n, B7.p) annotation(Line(points = {{-72, 61}, {-72, 90}, {-80, 90}}, color = {0, 0, 255}, smooth = Smooth.None));
        connect(twoWindingTransformer1.n, B9.p) annotation(Line(points = {{91, 90}, {80, 90}}, color = {0, 0, 255}, smooth = Smooth.None));
        connect(line_9_6.n, B9.p) annotation(Line(points = {{86, 65}, {86, 90}, {80, 90}}, color = {0, 0, 255}, smooth = Smooth.None));
        connect(twoWindingTransformer1.p, B3.p) annotation(Line(points = {{113, 90}, {120, 90}}, color = {0, 0, 255}, smooth = Smooth.None));
        connect(line_6_4.n, B6.p) annotation(Line(points = {{86, -13}, {86, 20}}, color = {0, 0, 255}, smooth = Smooth.None));
        connect(B6.p, line_9_6.p) annotation(Line(points = {{86, 20}, {86, 51}}, color = {0, 0, 255}, smooth = Smooth.None));
        connect(line_4_5.n, B5.p) annotation(Line(points = {{-72, -13}, {-72, 20}}, color = {0, 0, 255}, smooth = Smooth.None));
        connect(line_5_7.p, B5.p) annotation(Line(points = {{-72, 47}, {-72, 20}}, color = {0, 0, 255}, smooth = Smooth.None));
        connect(twoWindingTransformer.p, B1.p) annotation(Line(points = {{0, -77}, {0, -86}}, color = {0, 0, 255}, smooth = Smooth.None));
        connect(B7.p, ine_7_8.p) annotation(Line(points = {{-80, 90}, {-47, 90}}, color = {0, 0, 255}));
        connect(ine_7_8.n, B8.p) annotation(Line(points = {{-33, 90}, {-33, 90}, {0, 90}}, color = {0, 0, 255}));
        connect(B2.p, gen1.pwPin) annotation(Line(points = {{-120, 90}, {-139, 90}}, color = {0, 0, 255}));
        connect(B2.p, twoWindingTransformer2.p) annotation(Line(points = {{-120, 90}, {-110, 90}, {-113, 90}}, color = {0, 0, 255}));
        connect(twoWindingTransformer2.n, B7.p) annotation(Line(points = {{-91, 90}, {-91, 90}, {-80, 90}}, color = {0, 0, 255}));
        connect(gen2.pwPin, B3.p) annotation(Line(points = {{139, 90}, {129.5, 90}, {120, 90}}, color = {0, 0, 255}));
        connect(lOADPQ.p, B5.p) annotation(Line(points = {{-99, -1.3}, {-99, 4}, {-72, 4}, {-72, 20}}, color = {0, 0, 255}));
        connect(line_4_5.p, B4.p) annotation(Line(points = {{-72, -27}, {-72, -27}, {-72, -42}, {0, -42}, {0, -46}}, color = {0, 0, 255}));
        connect(line_6_4.p, B4.p) annotation(Line(points = {{86, -27}, {86, -42}, {0, -42}, {0, -46}}, color = {0, 0, 255}));
        connect(PQ1.p, B6.p) annotation(Line(points = {{109, -5.3}, {109, 0}, {86, 0}, {86, 20}}, color = {0, 0, 255}));
        connect(lOADPQ1.p, B8.p) annotation(Line(points = {{-9, 72.7}, {-9, 90}, {0, 90}}, color = {0, 0, 255}));
        connect(B4.p, twoWindingTransformer.n) annotation(Line(points = {{0, -46}, {0, -55}}, color = {0, 0, 255}));
        connect(gen3.pwPin, B1.p) annotation(Line(points = {{0, -95}, {0, -86}}, color = {0, 0, 255}));
        connect(line_8_9.n, B9.p) annotation(Line(points = {{47, 90}, {63.5, 90}, {80, 90}}, color = {0, 0, 255}));
        connect(B8.p, line_8_9.p) annotation(Line(points = {{0, 90}, {33, 90}, {33, 90}}, color = {0, 0, 255}));
        connect(sTATCOM3_1.p, line_8_9.p) annotation(Line(points = {{12, 72.6}, {12, 90}, {33, 90}}, color = {0, 0, 255}));
        annotation(Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-180, -120}, {180, 120}})), Icon(coordinateSystem(extent = {{-180, -120}, {180, 120}})), Documentation(info = "<html>
<table cellspacing=\"2\" cellpadding=\"0\" border=\"0\"<tr>
<td><p>Reference</p></td>
<td><p>PSAT Manual 2.1.8</p></td>
</tr>
<tr>
<td><p>Last update</p></td>
<td><p>15/07/2015</p></td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p>MAA Murad, SmarTS Lab, KTH Royal Institute of Technology</p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p><a href=\"mailto:luigiv@kth.se\">luigiv@kth.se</a></p></td>
</tr>
</table>
</html>"));
      end Example_3;

      package Generation_Groups
        model Gen1
          extends iPSL.Electrical.Essentials.pfComponent;
          parameter Real height_1 annotation(Dialog(group = "AVR Disturbance"));
          parameter Real tstart_1 annotation(Dialog(group = "AVR Disturbance"));
          parameter Boolean refdisturb_1 annotation(Dialog(group = "AVR Disturbance"));
          iPSL.Electrical.Machines.PSAT.FourthOrder.Order4 gen(Sn = 100, Vn = 18, V_b = V_b, V_0 = V_0, angle_0 = angle_0, P_0 = P_0, Q_0 = Q_0, ra = 0, xd = 0.8958, xq = 0.8645, xd1 = 0.1198, xq1 = 0.1969, Td10 = 6, Tq10 = 0.5350, M = 12.8, D = 0) annotation(Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 0, origin = {28, 14})));
          iPSL.Electrical.Controls.PSAT.AVR.AVRTypeII AVR(vrmin = -5, vrmax = 5, v0 = 1.025000000000000, vf0 = 1.755517086537914, vref0 = 1.118023800520641, Ka = 20, Ta = 0.2, Kf = 0.063, Tf = 0.35, Ke = 1, Te = 0.314, Tr = 0.001, Ae = 0.0039, Be = 1.55) annotation(Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 0, origin = {-6, 10})));
          Modelica.Blocks.Sources.Constant vref2(k = 1.118023800520641) annotation(Placement(transformation(extent = {{-5, -5}, {5, 5}}, rotation = 0, origin = {-71, 25})));
          Modelica.Blocks.Sources.Step step(startTime = tstart_1, offset = 1.118023800520641, height = height_1) annotation(Placement(transformation(extent = {{-4, -4}, {4, 4}}, rotation = 90, origin = {-56, -2})));
          Modelica.Blocks.Logical.Switch switch1 annotation(Placement(transformation(extent = {{-50, 12}, {-40, 22}})));
          Modelica.Blocks.Sources.BooleanConstant booleanConstant(k = refdisturb_1) annotation(Placement(transformation(extent = {{-80, 2}, {-70, 12}})));
          iPSL.Connectors.PwPin pwPin annotation(Placement(transformation(extent = {{100, -10}, {120, 10}})));
          Real P_MW;
          Real Q_MVA;
        equation
          P_MW = gen.P * S_b;
          Q_MVA = gen.Q * S_b;
          connect(gen.v, AVR.v) annotation(Line(points = {{39, 17}, {48, 17}, {48, -14}, {-22, -14}, {-22, 9}, {-14, 9}}, color = {0, 0, 127}, smooth = Smooth.None));
          connect(switch1.y, AVR.vref) annotation(Line(points = {{-39.5, 17}, {-26.75, 17}, {-26.75, 15.4}, {-14, 15.4}}, color = {0, 0, 127}));
          connect(booleanConstant.y, switch1.u2) annotation(Line(points = {{-69.5, 7}, {-66, 7}, {-66, 17}, {-51, 17}}, color = {255, 0, 255}));
          connect(vref2.y, switch1.u3) annotation(Line(points = {{-65.5, 25}, {-60, 25}, {-60, 13}, {-51, 13}}, color = {0, 0, 127}));
          connect(step.y, switch1.u1) annotation(Line(points = {{-56, 2.4}, {-56, 21}, {-51, 21}}, color = {0, 0, 127}));
          connect(gen.p, pwPin) annotation(Line(points = {{39, 14.0496}, {66, 14.0496}, {66, 0}, {110, 0}}, color = {0, 0, 255}));
          connect(AVR.vf, gen.vf) annotation(Line(points = {{2.5, 12.6}, {8, 12.6}, {8, 19}, {18, 19}}, color = {0, 0, 127}));
          connect(gen.pm0, gen.pm) annotation(Line(points = {{20, 3}, {20, 0}, {14, 0}, {14, 9}, {18, 9}}, color = {0, 0, 127}));
          annotation(Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}})), Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Ellipse(extent = {{-100, -100}, {100, 100}}, lineColor = {28, 108, 200}), Line(points = {{-60, -20}, {-20, 20}, {20, -20}, {60, 20}}, color = {28, 108, 200}), Text(extent = {{-34, -32}, {38, -52}}, lineColor = {28, 108, 200}, fillColor = {0, 0, 255}, fillPattern = FillPattern.Solid, textString = "%name"), Text(extent = {{62, 106}, {134, 68}}, lineColor = {238, 46, 47}, fillColor = {0, 0, 255}, fillPattern = FillPattern.Solid, textString = DynamicSelect("0.0", String(P_MW, significantDigits = 3))), Text(extent = {{62, -70}, {134, -108}}, lineColor = {0, 255, 0}, fillColor = {0, 0, 255}, fillPattern = FillPattern.Solid, textString = DynamicSelect("0.0", String(Q_MVA, significantDigits = 3)))}));
        end Gen1;

        model Gen2
          extends iPSL.Electrical.Essentials.pfComponent;
          parameter Real height_2 annotation(Dialog(group = "AVR Disturbance"));
          parameter Real tstart_2 annotation(Dialog(group = "AVR Disturbance"));
          parameter Boolean refdisturb_2 annotation(Dialog(group = "AVR Disturbance"));
          iPSL.Electrical.Machines.PSAT.FourthOrder.Order4 gen(Sn = 100, Vn = 13.8, V_b = V_b, V_0 = V_0, angle_0 = angle_0, P_0 = P_0, Q_0 = Q_0, ra = 0, xd = 1.3125, xq = 1.2678, xd1 = 0.1813, xq1 = 0.25, Td10 = 5.89, Tq10 = 0.6, M = 6.02, D = 0) annotation(Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 0, origin = {28, 14})));
          iPSL.Electrical.Controls.PSAT.AVR.AVRTypeII AVR(vrmin = -5, vrmax = 5, v0 = 1.025000000000000, vref0 = 1.095179545801796, vf0 = 1.359665419632471, Ka = 20, Ta = 0.2, Kf = 0.063, Tf = 0.35, Ke = 1, Te = 0.314, Tr = 0.001, Ae = 0.0039, Be = 1.555) annotation(Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 0, origin = {-6, 10})));
          Modelica.Blocks.Sources.Constant vref2(k = 1.095179545801796) annotation(Placement(transformation(extent = {{-5, -5}, {5, 5}}, rotation = 0, origin = {-71, 25})));
          Modelica.Blocks.Sources.Step step(startTime = tstart_2, height = height_2, offset = 1.095179545801796) annotation(Placement(transformation(extent = {{-4, -4}, {4, 4}}, rotation = 90, origin = {-56, -2})));
          Modelica.Blocks.Logical.Switch switch1 annotation(Placement(transformation(extent = {{-50, 12}, {-40, 22}})));
          Modelica.Blocks.Sources.BooleanConstant booleanConstant(k = refdisturb_2) annotation(Placement(transformation(extent = {{-80, 2}, {-70, 12}})));
          iPSL.Connectors.PwPin pwPin annotation(Placement(transformation(extent = {{100, -10}, {120, 10}})));
          Real P_MW;
          Real Q_MVA;
        equation
          P_MW = gen.P * S_b;
          Q_MVA = gen.Q * S_b;
          connect(gen.v, AVR.v) annotation(Line(points = {{39, 17}, {48, 17}, {48, -14}, {-22, -14}, {-22, 9}, {-14, 9}}, color = {0, 0, 127}, smooth = Smooth.None));
          connect(switch1.y, AVR.vref) annotation(Line(points = {{-39.5, 17}, {-26.75, 17}, {-26.75, 15.4}, {-14, 15.4}}, color = {0, 0, 127}));
          connect(booleanConstant.y, switch1.u2) annotation(Line(points = {{-69.5, 7}, {-66, 7}, {-66, 17}, {-51, 17}}, color = {255, 0, 255}));
          connect(vref2.y, switch1.u3) annotation(Line(points = {{-65.5, 25}, {-60, 25}, {-60, 13}, {-51, 13}}, color = {0, 0, 127}));
          connect(step.y, switch1.u1) annotation(Line(points = {{-56, 2.4}, {-56, 21}, {-51, 21}}, color = {0, 0, 127}));
          connect(gen.p, pwPin) annotation(Line(points = {{39, 14.0496}, {66, 14.0496}, {66, 0}, {110, 0}}, color = {0, 0, 255}));
          connect(AVR.vf, gen.vf) annotation(Line(points = {{2.5, 12.6}, {8, 12.6}, {8, 19}, {18, 19}}, color = {0, 0, 127}));
          connect(gen.pm0, gen.pm) annotation(Line(points = {{20, 3}, {20, 0}, {12, 0}, {12, 9}, {18, 9}}, color = {0, 0, 127}));
          annotation(Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}})), Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Ellipse(extent = {{-100, -100}, {100, 100}}, lineColor = {28, 108, 200}), Line(points = {{-60, -20}, {-20, 20}, {20, -20}, {60, 20}}, color = {28, 108, 200}), Text(extent = {{-34, -32}, {38, -52}}, lineColor = {28, 108, 200}, fillColor = {0, 0, 255}, fillPattern = FillPattern.Solid, textString = "%name"), Text(extent = {{62, 106}, {134, 68}}, lineColor = {238, 46, 47}, fillColor = {0, 0, 255}, fillPattern = FillPattern.Solid, textString = DynamicSelect("0.0", String(P_MW, significantDigits = 3))), Text(extent = {{62, -70}, {134, -108}}, lineColor = {0, 255, 0}, fillColor = {0, 0, 255}, fillPattern = FillPattern.Solid, textString = DynamicSelect("0.0", String(Q_MVA, significantDigits = 3)))}));
        end Gen2;

        model Gen3
          extends iPSL.Electrical.Essentials.pfComponent;
          parameter Real height_3 annotation(Dialog(group = "AVR Disturbance"));
          parameter Real tstart_3 annotation(Dialog(group = "AVR Disturbance"));
          parameter Boolean refdisturb_3 annotation(Dialog(group = "AVR Disturbance"));
          iPSL.Electrical.Machines.PSAT.FourthOrder.Order4 gen(Sn = 100, ra = 0, xd = 0.1460, xq = 0.0969, xd1 = 0.0608, xq1 = 0.0969, Td10 = 8.96, Tq10 = 0.310, V_b = V_b, V_0 = V_0, P_0 = P_0, Q_0 = Q_0, M = 47.28, D = 0, Vn = 16.5) annotation(Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 0, origin = {28, 14})));
          iPSL.Electrical.Controls.PSAT.AVR.AVRTypeII AVR(vrmin = -5, vrmax = 5, v0 = 1.04, vf0 = 1.079018784709528, vref0 = 1.095077501312303, Ka = 20, Ta = 0.2, Kf = 0.063, Tf = 0.35, Ke = 1, Te = 0.314, Tr = 0.001, Ae = 0.0039, Be = 1.555) annotation(Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 0, origin = {-6, 10})));
          Modelica.Blocks.Sources.Constant vref2(k = 1.095077501312303) annotation(Placement(transformation(extent = {{-5, -5}, {5, 5}}, rotation = 0, origin = {-71, 25})));
          Modelica.Blocks.Sources.Step step(startTime = tstart_3, height = height_3, offset = 1.095077501312303) annotation(Placement(transformation(extent = {{-4, -4}, {4, 4}}, rotation = 90, origin = {-56, -2})));
          Modelica.Blocks.Logical.Switch switch1 annotation(Placement(transformation(extent = {{-50, 12}, {-40, 22}})));
          Modelica.Blocks.Sources.BooleanConstant booleanConstant(k = refdisturb_3) annotation(Placement(transformation(extent = {{-80, 2}, {-70, 12}})));
          iPSL.Connectors.PwPin pwPin annotation(Placement(transformation(extent = {{100, -10}, {120, 10}})));
          Real P_MW;
          Real Q_MVA;
        equation
          P_MW = gen.P * S_b;
          Q_MVA = gen.Q * S_b;
          connect(gen.v, AVR.v) annotation(Line(points = {{39, 17}, {48, 17}, {48, -14}, {-22, -14}, {-22, 9}, {-14, 9}}, color = {0, 0, 127}, smooth = Smooth.None));
          connect(switch1.y, AVR.vref) annotation(Line(points = {{-39.5, 17}, {-26.75, 17}, {-26.75, 15.4}, {-14, 15.4}}, color = {0, 0, 127}));
          connect(booleanConstant.y, switch1.u2) annotation(Line(points = {{-69.5, 7}, {-66, 7}, {-66, 17}, {-51, 17}}, color = {255, 0, 255}));
          connect(vref2.y, switch1.u3) annotation(Line(points = {{-65.5, 25}, {-60, 25}, {-60, 13}, {-51, 13}}, color = {0, 0, 127}));
          connect(step.y, switch1.u1) annotation(Line(points = {{-56, 2.4}, {-56, 21}, {-51, 21}}, color = {0, 0, 127}));
          connect(gen.p, pwPin) annotation(Line(points = {{39, 14.0496}, {66, 14.0496}, {66, 0}, {110, 0}}, color = {0, 0, 255}));
          connect(AVR.vf, gen.vf) annotation(Line(points = {{2.5, 12.6}, {8, 12.6}, {8, 19}, {18, 19}}, color = {0, 0, 127}));
          connect(gen.pm0, gen.pm) annotation(Line(points = {{20, 3}, {20, 0}, {14, 0}, {14, 9}, {18, 9}}, color = {0, 0, 127}));
          annotation(Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}})), Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Ellipse(extent = {{-100, -100}, {100, 100}}, lineColor = {28, 108, 200}), Line(points = {{-60, -20}, {-20, 20}, {20, -20}, {60, 20}}, color = {28, 108, 200}), Text(extent = {{-34, -32}, {38, -52}}, lineColor = {28, 108, 200}, fillColor = {0, 0, 255}, fillPattern = FillPattern.Solid, textString = "%name"), Text(extent = {{62, 106}, {134, 68}}, lineColor = {238, 46, 47}, fillColor = {0, 0, 255}, fillPattern = FillPattern.Solid, textString = DynamicSelect("0.0", String(P_MW, significantDigits = 3))), Text(extent = {{62, -70}, {134, -108}}, lineColor = {0, 255, 0}, fillColor = {0, 0, 255}, fillPattern = FillPattern.Solid, textString = DynamicSelect("0.0", String(Q_MVA, significantDigits = 3)))}));
        end Gen3;
      end Generation_Groups;
      annotation(Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Polygon(origin = {8.0, 14.0}, lineColor = {78, 138, 73}, fillColor = {78, 138, 73}, pattern = LinePattern.None, fillPattern = FillPattern.Solid, points = {{-58.0, 46.0}, {42.0, -14.0}, {-58.0, -74.0}, {-58.0, 46.0}})}), Documentation(info = ""));
    end Example_3;

    package Working_Examples
      extends Modelica.Icons.Package;

      package Example_1
        extends Modelica.Icons.Package;
        annotation(Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Polygon(origin = {8.0, 14.0}, lineColor = {78, 138, 73}, fillColor = {78, 138, 73}, pattern = LinePattern.None, fillPattern = FillPattern.Solid, points = {{-58.0, 46.0}, {42.0, -14.0}, {-58.0, -74.0}, {-58.0, 46.0}})}), Documentation(info = ""));
      end Example_1;

      package Example_2
        extends Modelica.Icons.Package;
        annotation(Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Polygon(origin = {8.0, 14.0}, lineColor = {78, 138, 73}, fillColor = {78, 138, 73}, pattern = LinePattern.None, fillPattern = FillPattern.Solid, points = {{-58.0, 46.0}, {42.0, -14.0}, {-58.0, -74.0}, {-58.0, 46.0}})}), Documentation(info = ""));
      end Example_2;

      package Example_3
        extends Modelica.Icons.Package;
        annotation(Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Polygon(origin = {8.0, 14.0}, lineColor = {78, 138, 73}, fillColor = {78, 138, 73}, pattern = LinePattern.None, fillPattern = FillPattern.Solid, points = {{-58.0, 46.0}, {42.0, -14.0}, {-58.0, -74.0}, {-58.0, 46.0}})}), Documentation(info = ""));
      end Example_3;
      annotation(Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Polygon(origin = {8.0, 14.0}, lineColor = {78, 138, 73}, fillColor = {78, 138, 73}, pattern = LinePattern.None, fillPattern = FillPattern.Solid, points = {{-58.0, 46.0}, {42.0, -14.0}, {-58.0, -74.0}, {-58.0, 46.0}})}), Documentation(info = ""));
    end Working_Examples;
    annotation(Icon(graphics = {Rectangle(extent = {{-80, 100}, {100, -80}}, lineColor = {0, 0, 0}, fillColor = {215, 230, 240}, fillPattern = FillPattern.Solid), Rectangle(extent = {{-100, 80}, {80, -100}}, lineColor = {0, 0, 0}, fillColor = {240, 240, 240}, fillPattern = FillPattern.Solid), Polygon(points = {{-48, 50}, {52, -10}, {-48, -70}, {-48, 50}}, lineColor = {0, 0, 255}, pattern = LinePattern.None, fillColor = {95, 95, 95}, fillPattern = FillPattern.Solid)}), Documentation(info = "<html>
<p><span style=\"font-family: MS Shell Dlg 2;\">&LT;iPSL: iTesla Power System Library&GT;</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Copyright 2015 RTE (France), AIA (Spain), KTH (Sweden) and DTU (Denmark)</span></p>
<ul>
<li><span style=\"font-family: MS Shell Dlg 2;\">RTE: http://www.rte-france.com/ </span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">AIA: http://www.aia.es/en/energy/</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">KTH: https://www.kth.se/en</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">DTU:http://www.dtu.dk/english</span></li>
</ul>
<p><span style=\"font-family: MS Shell Dlg 2;\">The authors can be contacted by email: info at itesla-ipsl dot org</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">This package is part of the iTesla Power System Library (&QUOT;iPSL&QUOT;) .</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is free software: you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">You should have received a copy of the GNU Lesser General Public License along with the iPSL. If not, see &LT;http://www.gnu.org/licenses/&GT;.</span></p>
</html>"));
  end Examples;

  package Electrical
    package Buses
      model Bus "Bus model
                                                  2014/03/10"
        iPSL.Connectors.PwPin p(vr(start = V_0 * cos(angle_0 * Modelica.Constants.pi / 180)), vi(start = V_0 * sin(angle_0 * Modelica.Constants.pi / 180))) annotation(Placement(visible = true, transformation(origin = {1.5559, 0.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {0.0, -0.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        Real V(start = V_0) "Bus voltage magnitude (pu)";
        Real angle(start = angle_0) "Bus voltage angle (deg)";
        parameter Real V_0 = 1 "Voltage magnitude (pu)" annotation(Dialog(group = "Power flow data"));
        parameter Real angle_0 = 0 "Voltage angle (deg)" annotation(Dialog(group = "Power flow data"));
      equation
        V = sqrt(p.vr ^ 2 + p.vi ^ 2);
        angle = atan2(p.vi, p.vr) * 180 / Modelica.Constants.pi;
        p.ir = 0;
        p.ii = 0;
        annotation(Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2}), graphics = {Rectangle(visible = true, fillPattern = FillPattern.Solid, extent = {{-10.0, -100.0}, {10.0, 100.0}}), Text(visible = true, origin = {0.9738, 119.0625}, fillPattern = FillPattern.Solid, extent = {{-39.0262, -16.7966}, {39.0262, 16.7966}}, textString = "%name", fontName = "Arial"), Text(origin = {0.9738, -114.937}, fillPattern = FillPattern.Solid, extent = {{-39.0262, -16.7966}, {39.0262, 16.7966}}, fontName = "Arial", textString = DynamicSelect("0.0", String(v, significantDigits = 3)), lineColor = {238, 46, 47}), Text(origin = {0.9738, -140.937}, fillPattern = FillPattern.Solid, extent = {{-39.0262, -16.7966}, {39.0262, 16.7966}}, fontName = "Arial", textString = DynamicSelect("0.0", String(anglevdeg, significantDigits = 3)), lineColor = {238, 46, 47})}), Diagram(coordinateSystem(extent = {{-148.5, -105.0}, {148.5, 105.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})), uses(Modelica(version = "3.2.1")), Documentation(info = "<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\"><tr>
<td><p>Reference</p></td>
<td><p>None</p></td>
</tr>
<tr>
<td><p>Last update</p></td>
<td><p>2015-12-14</p></td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p>SmarTS Lab, KTH Royal Institute of Technology</p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p><a href=\"mailto:luigiv@kth.se\">luigiv@kth.se</a></p></td>
</tr>
</table>
<p><br><span style=\"font-family: MS Shell Dlg 2;\">&LT;iPSL: iTesla Power System Library&GT;</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Copyright 2015 RTE (France), AIA (Spain), KTH (Sweden) and DTU (Denmark)</span></p>
<ul>
<li><span style=\"font-family: MS Shell Dlg 2;\">RTE: http://www.rte-france.com/ </span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">AIA: http://www.aia.es/en/energy/</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">KTH: https://www.kth.se/en</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">DTU:http://www.dtu.dk/english</span></li>
</ul>
<p><span style=\"font-family: MS Shell Dlg 2;\">The authors can be contacted by email: info at itesla-ipsl dot org</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">This package is part of the iTesla Power System Library (&QUOT;iPSL&QUOT;) .</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is free software: you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">You should have received a copy of the GNU Lesser General Public License along with the iPSL. If not, see &LT;http://www.gnu.org/licenses/&GT;.</span></p>
</html>"));
      end Bus;

      model InfiniteBus "Test"
        iPSL.Connectors.PwPin p annotation(Placement(visible = true, transformation(origin = {160.0, -0.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {110.0, -0.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        parameter Real V "Bus voltage magnitude (pu)";
        parameter Real angle "Bus voltage angle (deg)";
      equation
        p.vr = V * cos(angle * Modelica.Constants.pi / 180);
        p.vi = V * sin(angle * Modelica.Constants.pi / 180);
        annotation(Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Rectangle(visible = true, fillColor = {255, 255, 255}, extent = {{-100.0, -100.0}, {100.0, 100.0}})}), Diagram(coordinateSystem(extent = {{-148.5, -105.0}, {148.5, 105.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})), Documentation(info = "<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\"><tr>
<td><p>Reference</p></td>
<td><p>None</p></td>
</tr>
<tr>
<td><p>Last update</p></td>
<td><p>2015-12-14</p></td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p>Maxime Baudette, SmarTS Lab, KTH Royal Institute of Technology</p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p><a href=\"mailto:luigiv@kth.se\">luigiv@kth.se</a></p></td>
</tr>
</table>
<p><br><span style=\"font-family: MS Shell Dlg 2;\">&LT;iPSL: iTesla Power System Library&GT;</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Copyright 2015 RTE (France), AIA (Spain), KTH (Sweden) and DTU (Denmark)</span></p>
<ul>
<li><span style=\"font-family: MS Shell Dlg 2;\">RTE: http://www.rte-france.com/ </span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">AIA: http://www.aia.es/en/energy/</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">KTH: https://www.kth.se/en</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">DTU:http://www.dtu.dk/english</span></li>
</ul>
<p><span style=\"font-family: MS Shell Dlg 2;\">The authors can be contacted by email: info at itesla-ipsl dot org</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">This package is part of the iTesla Power System Library (&QUOT;iPSL&QUOT;) .</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is free software: you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">You should have received a copy of the GNU Lesser General Public License along with the iPSL. If not, see &LT;http://www.gnu.org/licenses/&GT;.</span></p>
</html>"));
      end InfiniteBus;

      model InfiniteBus2
        iPSL.Connectors.PwPin p annotation(Placement(visible = true, transformation(origin = {160.0, -0.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {110.0, -0.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        parameter Real angle "Bus voltage angle (deg)";
        Modelica.Blocks.Interfaces.RealInput V "Bus voltage magnitude (pu)" annotation(Placement(transformation(extent = {{-120, -10}, {-100, 10}}), iconTransformation(extent = {{-120, -10}, {-100, 10}})));
      equation
        p.vr = V * cos(angle * Modelica.Constants.pi / 180);
        p.vi = V * sin(angle * Modelica.Constants.pi / 180);
        annotation(Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Rectangle(visible = true, fillColor = {255, 255, 255}, extent = {{-100.0, -100.0}, {100.0, 100.0}})}), Diagram(coordinateSystem(extent = {{-148.5, -105}, {148.5, 105}}, preserveAspectRatio = false, initialScale = 0.1, grid = {5, 5}), graphics), Documentation(info = "<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\"><tr>
<td><p>Reference</p></td>
<td><p>None</p></td>
</tr>
<tr>
<td><p>Last update</p></td>
<td><p>2015-12-14</p></td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p>Maxime Baudette, SmarTS Lab, KTH Royal Institute of Technology</p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p><a href=\"mailto:luigiv@kth.se\">luigiv@kth.se</a></p></td>
</tr>
</table>
<p><br><span style=\"font-family: MS Shell Dlg 2;\">&LT;iPSL: iTesla Power System Library&GT;</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Copyright 2015 RTE (France), AIA (Spain), KTH (Sweden) and DTU (Denmark)</span></p>
<ul>
<li><span style=\"font-family: MS Shell Dlg 2;\">RTE: http://www.rte-france.com/ </span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">AIA: http://www.aia.es/en/energy/</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">KTH: https://www.kth.se/en</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">DTU:http://www.dtu.dk/english</span></li>
</ul>
<p><span style=\"font-family: MS Shell Dlg 2;\">The authors can be contacted by email: info at itesla-ipsl dot org</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">This package is part of the iTesla Power System Library (&QUOT;iPSL&QUOT;) .</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is free software: you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">You should have received a copy of the GNU Lesser General Public License along with the iPSL. If not, see &LT;http://www.gnu.org/licenses/&GT;.</span></p>
</html>"));
      end InfiniteBus2;

      model InternalBus "Bus for change base"
        constant Real pi = Modelica.Constants.pi;
        parameter Real M_b = 120 "System base power rating (MVA)" annotation(Dialog(group = "Power flow data"));
        parameter Real S_b = 1000 "System base power rating (MVA)" annotation(Dialog(group = "Power flow data"));
        iPSL.Connectors.PwPin p "Machine base" annotation(Placement(transformation(extent = {{-32, -4}, {-12, 16}}), iconTransformation(extent = {{-32, -4}, {-12, 16}})));
        iPSL.Connectors.PwPin n "System base" annotation(Placement(transformation(extent = {{8, -4}, {28, 16}}), iconTransformation(extent = {{8, -4}, {28, 16}})));
      protected
        parameter Real CoB = M_b / S_b;
      equation
        0 = n.vr - p.vr;
        0 = n.vi - p.vi;
        0 = p.ir * CoB + n.ir;
        0 = p.ii * CoB + n.ii;
        annotation(Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Rectangle(extent = {{8, 96}, {-12, -88}}, lineColor = {0, 0, 255}, fillColor = {95, 95, 95}, fillPattern = FillPattern.Solid), Text(extent = {{-46, 34}, {-22, 2}}, lineColor = {0, 0, 255}, textString = "*")}), Diagram(graphics), Documentation(info = "<html>
<p><br><span style=\"font-family: MS Shell Dlg 2;\">&LT;iPSL: iTesla Power System Library&GT;</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Copyright 2015 RTE (France), AIA (Spain), KTH (Sweden) and DTU (Denmark)</span></p>
<ul>
<li><span style=\"font-family: MS Shell Dlg 2;\">RTE: http://www.rte-france.com/ </span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">AIA: http://www.aia.es/en/energy/</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">KTH: https://www.kth.se/en</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">DTU:http://www.dtu.dk/english</span></li>
</ul>
<p><span style=\"font-family: MS Shell Dlg 2;\">The authors can be contacted by email: info at itesla-ipsl dot org</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">This package is part of the iTesla Power System Library (&QUOT;iPSL&QUOT;) .</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is free software: you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">You should have received a copy of the GNU Lesser General Public License along with the iPSL. If not, see &LT;http://www.gnu.org/licenses/&GT;.</span></p>
</html>"));
      end InternalBus;

      model BusExt
        iPSL.Connectors.PwPinExt Ext(p(vr(start = vr0), vi(start = vi0)));
        outer iPSL.Electrical.SystemBase SysData "Must add this line in all models";
        parameter Integer nu(min = 0) = 0 "Number of left connection" annotation(Dialog(connectorSizing = true), HideResult = true);
        parameter Integer no(min = 0) = 0 "Number of right connections" annotation(Dialog(connectorSizing = true), HideResult = true);
        iPSL.Connectors.PwPin u[nu] annotation(Placement(visible = true, transformation(origin = {-20.0001, 1}, extent = {{-9.99994, -99}, {10.0001, 99}}, rotation = 0), iconTransformation(origin = {20, 0}, extent = {{-4, -60}, {4, 60}}, rotation = 0)));
        iPSL.Connectors.PwPin o[no] annotation(Placement(visible = true, transformation(origin = {20, 0}, extent = {{-12, -100}, {12, 100}}, rotation = 0), iconTransformation(origin = {0, 0}, extent = {{-4, -60}, {4, 60}}, rotation = 0)));
        Real V(start = V_0) "Bus voltage magnitude (pu)";
        Real angle(start = angle_0) "Bus voltage angle (deg)";
        parameter Real V_0 "Voltage magnitude (pu)" annotation(Dialog(group = "Power flow data"));
        parameter Real angle_0 "Voltage angle (deg)" annotation(Dialog(group = "Power flow data"));
        parameter Real V_b = 130 "Base voltage (kV)" annotation(Dialog(group = "Power flow data"));
        parameter Real S_b = SysData.S_b "System base power (MVA)" annotation(Dialog(group = "Power flow data"));
      protected
        parameter Real vr0 = V_0 * cos(angle_0 * Modelica.Constants.pi / 180);
        parameter Real vi0 = V_0 * sin(angle_0 * Modelica.Constants.pi / 180);
      equation
        if nu > 0 then
          for i in 1:nu loop
            connect(Ext.p, u[i]);
          end for;
        end if;
        if no > 0 then
          for i in 1:no loop
            connect(Ext.p, o[i]);
          end for;
        end if;
        V = sqrt(Ext.p.vr ^ 2 + Ext.p.vi ^ 2);
        angle = atan2(Ext.p.vi, Ext.p.vr) * 180 / Modelica.Constants.pi;
        annotation(Diagram(coordinateSystem(extent = {{0, -100}, {20, 100}})), Icon(coordinateSystem(extent = {{0, -100}, {20, 100}}, preserveAspectRatio = false), graphics = {Rectangle(extent = {{0, 100}, {20, -100}}, lineColor = {0, 0, 255}, fillColor = {85, 170, 255}, fillPattern = FillPattern.Solid)}), Documentation(info = "<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\"><tr>
<td><p>Reference</p></td>
<td><p>None</p></td>
</tr>
<tr>
<td><p>Last update</p></td>
<td><p>2015-12-14</p></td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p>Jan Lavenius & Giuseppe Laera, SmarTS Lab, KTH Royal Institute of Technology</p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p><a href=\"mailto:luigiv@kth.se\">luigiv@kth.se</a></p></td>
</tr>
</table>
<p><br><span style=\"font-family: MS Shell Dlg 2;\">&LT;iPSL: iTesla Power System Library&GT;</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Copyright 2015 RTE (France), AIA (Spain), KTH (Sweden) and DTU (Denmark)</span></p>
<ul>
<li><span style=\"font-family: MS Shell Dlg 2;\">RTE: http://www.rte-france.com/ </span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">AIA: http://www.aia.es/en/energy/</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">KTH: https://www.kth.se/en</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">DTU:http://www.dtu.dk/english</span></li>
</ul>
<p><span style=\"font-family: MS Shell Dlg 2;\">The authors can be contacted by email: info at itesla-ipsl dot org</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">This package is part of the iTesla Power System Library (&QUOT;iPSL&QUOT;) .</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is free software: you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">You should have received a copy of the GNU Lesser General Public License along with the iPSL. If not, see &LT;http://www.gnu.org/licenses/&GT;.</span></p>
</html>"));
      end BusExt;
      annotation(Documentation(info = "<html>
<p><br><span style=\"font-family: MS Shell Dlg 2;\">&LT;iPSL: iTesla Power System Library&GT;</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Copyright 2015 RTE (France), AIA (Spain), KTH (Sweden) and DTU (Denmark)</span></p>
<ul>
<li><span style=\"font-family: MS Shell Dlg 2;\">RTE: http://www.rte-france.com/ </span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">AIA: http://www.aia.es/en/energy/</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">KTH: https://www.kth.se/en</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">DTU:http://www.dtu.dk/english</span></li>
</ul>
<p><span style=\"font-family: MS Shell Dlg 2;\">The authors can be contacted by email: info at itesla-ipsl dot org</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">This package is part of the iTesla Power System Library (&QUOT;iPSL&QUOT;) .</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is free software: you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">You should have received a copy of the GNU Lesser General Public License along with the iPSL. If not, see &LT;http://www.gnu.org/licenses/&GT;.</span></p>
</html>"));
    end Buses;

    package Branches
      model PwLine "Model for a transmission Line based on the pi-equivalent circuit.
                                                  2013"
        iPSL.Connectors.PwPin p annotation(Placement(transformation(extent = {{-80, -10}, {-60, 10}}), iconTransformation(extent = {{-80, -10}, {-60, 10}})));
        iPSL.Connectors.PwPin n annotation(Placement(transformation(extent = {{60, -10}, {80, 10}}), iconTransformation(extent = {{60, -10}, {80, 10}})));
        parameter Real R "Resistance p.u.";
        parameter Real X "Reactance p.u.";
        parameter Real G "Shunt half conductance p.u.";
        parameter Real B "Shunt half susceptance p.u.";
        parameter Real S_b = 100 "System base power (MVA)";
        Real P12;
        Real P21;
        Real Q12;
        Real Q21;
      equation
        P12 = (p.vr * p.ir - p.vi * p.ii) * S_b;
        P21 = -(n.vr * n.ir - n.vi * n.ii) * S_b;
        Q12 = (p.vr * p.ii - p.vi * p.ir) * S_b;
        Q21 = -(n.vr * n.ii - n.vi * n.ir) * S_b;
        R * (n.ir - G * n.vr + B * n.vi) - X * (n.ii - B * n.vr - G * n.vi) = n.vr - p.vr;
        R * (n.ii - B * n.vr - G * n.vi) + X * (n.ir - G * n.vr + B * n.vi) = n.vi - p.vi;
        R * (p.ir - G * p.vr + B * p.vi) - X * (p.ii - B * p.vr - G * p.vi) = p.vr - n.vr;
        R * (p.ii - B * p.vr - G * p.vi) + X * (p.ir - G * p.vr + B * p.vi) = p.vi - n.vi;
        annotation(Icon(graphics = {Rectangle(extent = {{-60, 40}, {60, -42}}, lineColor = {0, 0, 255}), Rectangle(extent = {{-40, 10}, {40, -10}}, lineColor = {0, 0, 255}, fillColor = {95, 95, 95}, fillPattern = FillPattern.Solid), Text(extent = {{-106, 82}, {-18, 36}}, lineColor = {238, 46, 47}, textString = DynamicSelect("0.0", String(P12, significantDigits = 2))), Text(extent = {{24, 82}, {112, 36}}, lineColor = {238, 46, 47}, textString = DynamicSelect("0.0", String(P21, significantDigits = 2))), Text(extent = {{20, -54}, {108, -100}}, lineColor = {0, 255, 0}, textString = DynamicSelect("0.0", String(Q21, significantDigits = 2))), Text(extent = {{-108, -54}, {-20, -100}}, lineColor = {0, 255, 0}, textString = DynamicSelect("0.0", String(Q12, significantDigits = 2))), Line(points = {{-86, 86}, {-38, 86}, {-46, 92}}, color = {0, 0, 0}), Line(points = {{-38, 86}, {-46, 80}}, color = {0, 0, 0}), Line(points = {{42, 86}, {90, 86}, {82, 92}}, color = {0, 0, 0}), Line(points = {{90, 86}, {82, 80}}, color = {0, 0, 0}), Line(points = {{-88, -54}, {-40, -54}, {-48, -48}}, color = {0, 0, 0}), Line(points = {{-80, -48}, {-80, -60}}, color = {0, 0, 0}), Line(points = {{-40, -54}, {-48, -60}}, color = {0, 0, 0}), Line(points = {{48, -48}, {48, -60}}, color = {0, 0, 0}), Line(points = {{40, -54}, {88, -54}, {80, -48}}, color = {0, 0, 0}), Line(points = {{88, -54}, {80, -60}}, color = {0, 0, 0})}), Diagram(graphics), uses(Modelica(version = "3.2.1")), Documentation(info = "<html>
<p><br><span style=\"font-family: MS Shell Dlg 2;\">&LT;iPSL: iTesla Power System Library&GT;</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Copyright 2015 RTE (France), AIA (Spain), KTH (Sweden) and DTU (Denmark)</span></p>
<ul>
<li><span style=\"font-family: MS Shell Dlg 2;\">RTE: http://www.rte-france.com/ </span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">AIA: http://www.aia.es/en/energy/</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">KTH: https://www.kth.se/en</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">DTU:http://www.dtu.dk/english</span></li>
</ul>
<p><span style=\"font-family: MS Shell Dlg 2;\">The authors can be contacted by email: info at itesla-ipsl dot org</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">This package is part of the iTesla Power System Library (&QUOT;iPSL&QUOT;) .</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is free software: you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">You should have received a copy of the GNU Lesser General Public License along with the iPSL. If not, see &LT;http://www.gnu.org/licenses/&GT;.</span></p>
</html>"));
      end PwLine;

      model PwLine_Bis "Model for a transmission Line based on the pi-equivalent circuit 
                                      with explicit equations for currents. Developed by RTE. 2014/12/16"
        iPSL.Connectors.PwPin p annotation(Placement(transformation(extent = {{-80, -10}, {-60, 10}}), iconTransformation(extent = {{-80, -10}, {-60, 10}})));
        iPSL.Connectors.PwPin n annotation(Placement(transformation(extent = {{60, -10}, {80, 10}}), iconTransformation(extent = {{60, -10}, {80, 10}})));
        parameter Real R "Resistance p.u.";
        parameter Real X "Reactance p.u.";
        parameter Real G "Shunt half conductance p.u.";
        parameter Real B "Shunt half susceptance p.u.";
      protected
        parameter Real Y = 1 / sqrt(R * R + X * X);
        parameter Real angle = atan2(R, X);
        parameter Real A = Y * sin(angle) + G;
        parameter Real A1 = (-B) + Y * cos(angle);
        parameter Real A2 = -Y * sin(angle);
        parameter Real A3 = -Y * cos(angle);
        parameter Real A4 = Y * cos(angle);
        parameter Real A5 = -Y * sin(angle);
        parameter Real A6 = B - Y * cos(angle);
        parameter Real A7 = Y * sin(angle) + G;
      equation
        n.ir = A * n.vr + A1 * n.vi + A2 * p.vr + A3 * p.vi;
        n.ii = A6 * n.vr + A7 * n.vi + A4 * p.vr + A2 * p.vi;
        p.ir = A5 * n.vr + A3 * n.vi + A * p.vr + A1 * p.vi;
        p.ii = A4 * n.vr + A5 * n.vi + A6 * p.vr + A7 * p.vi;
        annotation(Icon(graphics = {Rectangle(extent = {{-60, 40}, {60, -42}}, lineColor = {0, 0, 255}), Rectangle(extent = {{-40, 10}, {40, -10}}, lineColor = {0, 0, 255}, fillColor = {95, 95, 95}, fillPattern = FillPattern.Solid)}), Diagram(graphics), Documentation(info = "<html>
<p><br><span style=\"font-family: MS Shell Dlg 2;\">&LT;iPSL: iTesla Power System Library&GT;</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Copyright 2015 RTE (France), AIA (Spain), KTH (Sweden) and DTU (Denmark)</span></p>
<ul>
<li><span style=\"font-family: MS Shell Dlg 2;\">RTE: http://www.rte-france.com/ </span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">AIA: http://www.aia.es/en/energy/</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">KTH: https://www.kth.se/en</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">DTU:http://www.dtu.dk/english</span></li>
</ul>
<p><span style=\"font-family: MS Shell Dlg 2;\">The authors can be contacted by email: info at itesla-ipsl dot org</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">This package is part of the iTesla Power System Library (&QUOT;iPSL&QUOT;) .</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is free software: you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">You should have received a copy of the GNU Lesser General Public License along with the iPSL. If not, see &LT;http://www.gnu.org/licenses/&GT;.</span></p>
</html>"));
      end PwLine_Bis;

      model PwLine_2 "Model for a transmission Line based on the pi-equivalent circuit 
                                      with explicit equations for currents. Developed by RTE. 2014/12/16"
        iPSL.Connectors.PwPin p annotation(Placement(transformation(extent = {{-80, -10}, {-60, 10}}), iconTransformation(extent = {{-80, -10}, {-60, 10}})));
        iPSL.Connectors.PwPin n annotation(Placement(transformation(extent = {{60, -10}, {80, 10}}), iconTransformation(extent = {{60, -10}, {80, 10}})));
        parameter Real R "Resistance p.u.";
        parameter Real X "Reactance p.u.";
        parameter Real G "Shunt half conductance p.u.";
        parameter Real B "Shunt half susceptance p.u.";
        parameter Real Y = 1 / sqrt(R * R + X * X);
        parameter Real angle = atan2(R, X);
        parameter Real S1 = B;
        parameter Real S2 = B;
        parameter Real C1 = G;
        parameter Real C2 = G;
        //I=f(U);
        //I1
        parameter Real ir1_dur1 = Y * sin(angle) + C1;
        parameter Real ir1_dui1 = (-S1) + Y * cos(angle);
        parameter Real ir1_dur2 = -Y * sin(angle);
        parameter Real ir1_dui2 = -Y * cos(angle);
        parameter Real ii1_dur1 = S1 - Y * cos(angle);
        parameter Real ii1_dui1 = Y * sin(angle) + C1;
        parameter Real ii1_dur2 = Y * cos(angle);
        parameter Real ii1_dui2 = -Y * sin(angle);
        // I2
        parameter Real ir2_dur1 = -Y * sin(angle);
        parameter Real ir2_dui1 = -Y * cos(angle);
        parameter Real ir2_dur2 = C2 + Y * sin(angle);
        parameter Real ir2_dui2 = (-S2) + Y * cos(angle);
        parameter Real ii2_dur1 = Y * cos(angle);
        parameter Real ii2_dui1 = -Y * sin(angle);
        parameter Real ii2_dur2 = S2 - Y * cos(angle);
        parameter Real ii2_dui2 = C2 + Y * sin(angle);
        // Active, Reactive and Apparent power
        Real Ps "Active power at sending";
        Real Pr "Active power at receiving";
        Real Qs "Reactive power at sending";
        Real Qr "Reactive power at receiving";
        Real Ss "Apparent power at sending";
        Real Sr "Apparent power at receiving";
      equation
        n.ir = ir1_dur1 * n.vr + ir1_dui1 * n.vi + ir1_dur2 * p.vr + ir1_dui2 * p.vi;
        n.ii = ii1_dur1 * n.vr + ii1_dui1 * n.vi + ii1_dur2 * p.vr + ii1_dui2 * p.vi;
        p.ir = ir2_dur1 * n.vr + ir2_dui1 * n.vi + ir2_dur2 * p.vr + ir2_dui2 * p.vi;
        p.ii = ii2_dur1 * n.vr + ii2_dui1 * n.vi + ii2_dur2 * p.vr + ii2_dui2 * p.vi;
        Ps = p.vr * p.ir + p.vi * p.ii;
        Qs = (-p.vr * p.ii) + p.vi * p.ir;
        Ss = sqrt(Ps ^ 2 + Qs ^ 2);
        Pr = n.vr * n.ir + n.vi * n.ii;
        Qr = (-n.vr * n.ii) + n.vi * n.ir;
        Sr = sqrt(Pr ^ 2 + Qr ^ 2);
        annotation(Icon(graphics = {Rectangle(extent = {{-60, 40}, {60, -42}}, lineColor = {0, 0, 255}), Rectangle(extent = {{-40, 10}, {40, -10}}, lineColor = {0, 0, 255}, fillColor = {95, 95, 95}, fillPattern = FillPattern.Solid)}), Diagram(graphics), Documentation(info = "<html>
<p><br><span style=\"font-family: MS Shell Dlg 2;\">&LT;iPSL: iTesla Power System Library&GT;</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Copyright 2015 RTE (France), AIA (Spain), KTH (Sweden) and DTU (Denmark)</span></p>
<ul>
<li><span style=\"font-family: MS Shell Dlg 2;\">RTE: http://www.rte-france.com/ </span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">AIA: http://www.aia.es/en/energy/</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">KTH: https://www.kth.se/en</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">DTU:http://www.dtu.dk/english</span></li>
</ul>
<p><span style=\"font-family: MS Shell Dlg 2;\">The authors can be contacted by email: info at itesla-ipsl dot org</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">This package is part of the iTesla Power System Library (&QUOT;iPSL&QUOT;) .</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is free software: you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">You should have received a copy of the GNU Lesser General Public License along with the iPSL. If not, see &LT;http://www.gnu.org/licenses/&GT;.</span></p>
</html>"));
      end PwLine_2;

      model PwOpenLine "Transmission Line based on the pi-equivalent circuit
                                                 open at the Receiving/Sending end. 2014/04/28"
        iPSL.Connectors.PwPin p annotation(Placement(transformation(extent = {{-80, -10}, {-60, 10}}), iconTransformation(extent = {{-80, -10}, {-60, 10}})));
        iPSL.Connectors.PwPin n annotation(Placement(transformation(extent = {{60, -10}, {80, 10}}), iconTransformation(extent = {{60, -10}, {80, 10}})));
        parameter Real R "Resistance p.u.";
        parameter Real X "Reactance p.u.";
        parameter Real G "Shunt half conductance p.u.";
        parameter Real B "Shunt half susceptance p.u.";
        parameter Boolean OpenR_end "Open at Receiving end (true), Open at Sending end (false)";
        Real Zr;
        Real Zi;
      equation
        Zr = R * G - X * B;
        Zi = R * B + X * G;
        if OpenR_end == true then
          p.vr * (2.0 * G + G * Zr - B * Zi) - p.vi * (2.0 * B + Zr * B + Zi * G) = p.ir * (1.0 + Zr) - p.ii * Zi;
          p.vr * (2.0 * B + Zr * B + Zi * G) + p.vi * (2.0 * G + G * Zr - B * Zi) = p.ir * Zi + p.ii * (1.0 + Zr);
          n.vr - p.vr * (1.0 + Zr) + p.vi * Zi = (-p.ir * R) + p.ii * X;
          n.vi - p.vi * (1.0 + Zr) - p.vr * Zi = (-p.ir * X) - p.ii * R;
        else
          n.vr * (2.0 * G + G * Zr - B * Zi) - n.vi * (2.0 * B + Zr * B + Zi * G) = n.ir * (1.0 + Zr) - n.ii * Zi;
          n.vr * (2.0 * B + Zr * B + Zi * G) + n.vi * (2.0 * G + G * Zr - B * Zi) = n.ir * Zi + n.ii * (1.0 + Zr);
          p.vr - n.vr * (1.0 + Zr) + n.vi * Zi = (-n.ir * R) + n.ii * X;
          p.vi - n.vi * (1.0 + Zr) - n.vr * Zi = (-n.ir * X) - n.ii * R;
        end if;
        // Open at Receiving node
        // Open at Sending node
        annotation(Icon(graphics = {Rectangle(extent = {{-60, 40}, {60, -42}}, lineColor = {0, 0, 255}), Rectangle(extent = {{-40, 10}, {40, -10}}, lineColor = {0, 0, 255}, fillColor = {95, 95, 95}, fillPattern = FillPattern.Solid), Line(points = {{-38, 16}, {4, 16}, {24, 30}}, color = {0, 0, 255}, smooth = Smooth.None), Line(points = {{34, 18}, {40, 18}}, color = {0, 0, 255}, smooth = Smooth.None), Ellipse(extent = {{28, 22}, {34, 16}}, lineColor = {0, 0, 255})}), Diagram(graphics), Documentation(info = "<html>
<p><br><span style=\"font-family: MS Shell Dlg 2;\">&LT;iPSL: iTesla Power System Library&GT;</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Copyright 2015 RTE (France), AIA (Spain), KTH (Sweden) and DTU (Denmark)</span></p>
<ul>
<li><span style=\"font-family: MS Shell Dlg 2;\">RTE: http://www.rte-france.com/ </span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">AIA: http://www.aia.es/en/energy/</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">KTH: https://www.kth.se/en</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">DTU:http://www.dtu.dk/english</span></li>
</ul>
<p><span style=\"font-family: MS Shell Dlg 2;\">The authors can be contacted by email: info at itesla-ipsl dot org</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">This package is part of the iTesla Power System Library (&QUOT;iPSL&QUOT;) .</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is free software: you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">You should have received a copy of the GNU Lesser General Public License along with the iPSL. If not, see &LT;http://www.gnu.org/licenses/&GT;.</span></p>
</html>"));
      end PwOpenLine;

      model PwLinewithOpeningReceiving "Transmission Line based on the pi-equivalent circuit
                                                  with an opening event on the receiving node. Developed by AIA.
                                                  2014/03/10"
        iPSL.Connectors.PwPin p annotation(Placement(transformation(extent = {{-80, -10}, {-60, 10}}), iconTransformation(extent = {{-80, -10}, {-60, 10}})));
        iPSL.Connectors.PwPin n annotation(Placement(transformation(extent = {{60, -10}, {80, 10}}), iconTransformation(extent = {{60, -10}, {80, 10}})));
        parameter Real R "Resistance p.u.";
        parameter Real X "Reactance p.u.";
        parameter Real G "Shunt half conductance p.u.";
        parameter Real B "Shunt half susceptance p.u.";
        parameter Real t1 "Start time of the opening";
        parameter Real t2 "End time of the opening";
        Real Zr;
        Real Zi;
      equation
        Zr = R * G + X * B;
        Zi = R * B + X * G;
        if time > t1 then
          if time < t2 then
            p.vr * (2.0 * G + G * Zr - B * Zi) - p.vi * (2.0 * B + Zr * B + Zi * G) = p.ir * (1.0 + Zr) - p.ii * Zi;
            p.vr * (2.0 * B + Zr * B + Zi * G) + p.vi * (2.0 * G + G * Zr - B * Zi) = p.ir * Zi + p.ii * (1.0 + Zr);
            n.ii = 0.0;
            n.ir = 0.0;
          else
            R * (n.ir - G * n.vr + B * n.vi) - X * (n.ii - B * n.vr - G * n.vi) = n.vr - p.vr;
            R * (n.ii - B * n.vr - G * n.vi) + X * (n.ir - G * n.vr + B * n.vi) = n.vi - p.vi;
            R * (p.ir - G * p.vr + B * p.vi) - X * (p.ii - B * p.vr - G * p.vi) = p.vr - n.vr;
            R * (p.ii - B * p.vr - G * p.vi) + X * (p.ir - G * p.vr + B * p.vi) = p.vi - n.vi;
          end if;
        else
          R * (n.ir - G * n.vr + B * n.vi) - X * (n.ii - B * n.vr - G * n.vi) = n.vr - p.vr;
          R * (n.ii - B * n.vr - G * n.vi) + X * (n.ir - G * n.vr + B * n.vi) = n.vi - p.vi;
          R * (p.ir - G * p.vr + B * p.vi) - X * (p.ii - B * p.vr - G * p.vi) = p.vr - n.vr;
          R * (p.ii - B * p.vr - G * p.vi) + X * (p.ir - G * p.vr + B * p.vi) = p.vi - n.vi;
        end if;
        annotation(Icon(graphics = {Rectangle(extent = {{-60, 40}, {60, -42}}, lineColor = {0, 0, 255}), Rectangle(extent = {{-40, 10}, {40, -10}}, lineColor = {0, 0, 255}, fillColor = {95, 95, 95}, fillPattern = FillPattern.Solid), Line(points = {{-38, 16}, {4, 16}, {24, 30}}, color = {0, 0, 255}, smooth = Smooth.None), Line(points = {{34, 18}, {40, 18}}, color = {0, 0, 255}, smooth = Smooth.None), Ellipse(extent = {{28, 22}, {34, 16}}, lineColor = {0, 0, 255})}), Diagram(graphics), Documentation(info = "<html>
<p><br><span style=\"font-family: MS Shell Dlg 2;\">&LT;iPSL: iTesla Power System Library&GT;</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Copyright 2015 RTE (France), AIA (Spain), KTH (Sweden) and DTU (Denmark)</span></p>
<ul>
<li><span style=\"font-family: MS Shell Dlg 2;\">RTE: http://www.rte-france.com/ </span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">AIA: http://www.aia.es/en/energy/</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">KTH: https://www.kth.se/en</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">DTU:http://www.dtu.dk/english</span></li>
</ul>
<p><span style=\"font-family: MS Shell Dlg 2;\">The authors can be contacted by email: info at itesla-ipsl dot org</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">This package is part of the iTesla Power System Library (&QUOT;iPSL&QUOT;) .</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is free software: you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">You should have received a copy of the GNU Lesser General Public License along with the iPSL. If not, see &LT;http://www.gnu.org/licenses/&GT;.</span></p>
</html>"));
      end PwLinewithOpeningReceiving;

      model PwLinewithOpeningSending "Transmission Line based on the pi-equivalent circuit
                                                  with an opening event on the sending node.
                                                  2014/03/10"
        iPSL.Connectors.PwPin p annotation(Placement(transformation(extent = {{-80, -10}, {-60, 10}}), iconTransformation(extent = {{-80, -10}, {-60, 10}})));
        iPSL.Connectors.PwPin n annotation(Placement(transformation(extent = {{60, -10}, {80, 10}}), iconTransformation(extent = {{60, -10}, {80, 10}})));
        parameter Real R "Resistance p.u.";
        parameter Real X "Reactance p.u.";
        parameter Real G "Shunt half conductance p.u.";
        parameter Real B "Shunt half susceptance p.u.";
        parameter Real t1 "Start time of the opening";
        parameter Real t2 "End time of the opening";
        Real Zr;
        Real Zi;
      equation
        Zr = R * G + X * B;
        Zi = R * B + X * G;
        if time > t1 then
          if time < t2 then
            n.vr * (2.0 * G + G * Zr - B * Zi) - n.vi * (2.0 * B + Zr * B + Zi * G) = n.ir * (1.0 + Zr) - n.ii * Zi;
            n.vr * (2.0 * B + Zr * B + Zi * G) + n.vi * (2.0 * G + G * Zr - B * Zi) = n.ir * Zi + n.ii * (1.0 + Zr);
            p.ii = 0.0;
            p.ir = 0.0;
          else
            R * (n.ir - G * n.vr + B * n.vi) - X * (n.ii - B * n.vr - G * n.vi) = n.vr - p.vr;
            R * (n.ii - B * n.vr - G * n.vi) + X * (n.ir - G * n.vr + B * n.vi) = n.vi - p.vi;
            R * (p.ir - G * p.vr + B * p.vi) - X * (p.ii - B * p.vr - G * p.vi) = p.vr - n.vr;
            R * (p.ii - B * p.vr - G * p.vi) + X * (p.ir - G * p.vr + B * p.vi) = p.vi - n.vi;
          end if;
        else
          R * (n.ir - G * n.vr + B * n.vi) - X * (n.ii - B * n.vr - G * n.vi) = n.vr - p.vr;
          R * (n.ii - B * n.vr - G * n.vi) + X * (n.ir - G * n.vr + B * n.vi) = n.vi - p.vi;
          R * (p.ir - G * p.vr + B * p.vi) - X * (p.ii - B * p.vr - G * p.vi) = p.vr - n.vr;
          R * (p.ii - B * p.vr - G * p.vi) + X * (p.ir - G * p.vr + B * p.vi) = p.vi - n.vi;
        end if;
        annotation(Icon(graphics = {Rectangle(extent = {{-60, 40}, {60, -42}}, lineColor = {0, 0, 255}), Rectangle(extent = {{-40, 10}, {40, -10}}, lineColor = {0, 0, 255}, fillColor = {95, 95, 95}, fillPattern = FillPattern.Solid), Line(points = {{-38, 16}, {4, 16}, {24, 30}}, color = {0, 0, 255}, smooth = Smooth.None), Line(points = {{34, 18}, {40, 18}}, color = {0, 0, 255}, smooth = Smooth.None), Ellipse(extent = {{28, 22}, {34, 16}}, lineColor = {0, 0, 255})}), Diagram(graphics), Documentation(info = "<html>
<p><br><span style=\"font-family: MS Shell Dlg 2;\">&LT;iPSL: iTesla Power System Library&GT;</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Copyright 2015 RTE (France), AIA (Spain), KTH (Sweden) and DTU (Denmark)</span></p>
<ul>
<li><span style=\"font-family: MS Shell Dlg 2;\">RTE: http://www.rte-france.com/ </span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">AIA: http://www.aia.es/en/energy/</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">KTH: https://www.kth.se/en</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">DTU:http://www.dtu.dk/english</span></li>
</ul>
<p><span style=\"font-family: MS Shell Dlg 2;\">The authors can be contacted by email: info at itesla-ipsl dot org</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">This package is part of the iTesla Power System Library (&QUOT;iPSL&QUOT;) .</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is free software: you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">You should have received a copy of the GNU Lesser General Public License along with the iPSL. If not, see &LT;http://www.gnu.org/licenses/&GT;.</span></p>
</html>"));
      end PwLinewithOpeningSending;

      model PwTransformer "Two winding fixed transformer composed of an ideal transformer, a series 
                                                  impedance and a shunt admittance. 2013"
        iPSL.Connectors.PwPin p annotation(Placement(transformation(extent = {{-80, -8}, {-60, 12}}), iconTransformation(extent = {{-80, -8}, {-60, 12}})));
        iPSL.Connectors.PwPin n annotation(Placement(transformation(extent = {{60, -8}, {80, 12}}), iconTransformation(extent = {{60, -8}, {80, 12}})));
        parameter Real R "Resistance p.u.";
        parameter Real X "Reactance p.u.";
        parameter Real G "Shunt conductance p.u.";
        parameter Real B "Shunt susceptance p.u.";
        parameter Real r "Transformation ratio";
      equation
        r * (G * n.vr - B * n.vi - n.ir) = p.ir;
        r * (G * n.vi + B * n.vr - n.ii) = p.ii;
        R * p.ir - X * p.ii = r * r * p.vr - r * n.vr;
        R * p.ii + X * p.ir = r * r * p.vi - r * n.vi;
        annotation(Icon(graphics = {Rectangle(extent = {{-60, 40}, {60, -40}}, lineColor = {0, 0, 255}), Ellipse(extent = {{-26, 16}, {6, -16}}, lineColor = {0, 0, 255}, lineThickness = 1), Ellipse(extent = {{-8, 16}, {24, -16}}, lineColor = {0, 0, 255}, lineThickness = 1), Line(points = {{-42, 0}, {-26, 0}}, color = {0, 0, 255}, thickness = 1, smooth = Smooth.None), Line(points = {{24, 0}, {40, 0}}, color = {0, 0, 255}, thickness = 1, smooth = Smooth.None)}), Diagram(graphics), Documentation(info = "<html>
<p><br><span style=\"font-family: MS Shell Dlg 2;\">&LT;iPSL: iTesla Power System Library&GT;</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Copyright 2015 RTE (France), AIA (Spain), KTH (Sweden) and DTU (Denmark)</span></p>
<ul>
<li><span style=\"font-family: MS Shell Dlg 2;\">RTE: http://www.rte-france.com/ </span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">AIA: http://www.aia.es/en/energy/</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">KTH: https://www.kth.se/en</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">DTU:http://www.dtu.dk/english</span></li>
</ul>
<p><span style=\"font-family: MS Shell Dlg 2;\">The authors can be contacted by email: info at itesla-ipsl dot org</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">This package is part of the iTesla Power System Library (&QUOT;iPSL&QUOT;) .</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is free software: you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">You should have received a copy of the GNU Lesser General Public License along with the iPSL. If not, see &LT;http://www.gnu.org/licenses/&GT;.</span></p>
</html>"));
      end PwTransformer;

      model PwTransformer_2 "Two winding fixed transformer composed of an ideal transformer, 
                                      a series  impedance and a shunt admittance, with explicit equations for currents.
                                      2014/12/16"
        iPSL.Connectors.PwPin p annotation(Placement(transformation(extent = {{-80, -8}, {-60, 12}}), iconTransformation(extent = {{-80, -8}, {-60, 12}})));
        iPSL.Connectors.PwPin n annotation(Placement(transformation(extent = {{60, -8}, {80, 12}}), iconTransformation(extent = {{60, -8}, {80, 12}})));
        parameter Real R "Resistance p.u.";
        parameter Real X "Reactance p.u.";
        parameter Real G "Shunt conductance p.u.";
        parameter Real B "Shunt susceptance p.u.";
        parameter Real r "Transformation ratio";
      equation
        p.ir = 1 / (R * R + X * X) * (R * (r * r * p.vr - r * n.vr) + X * (r * r * p.vi - r * n.vi));
        p.ii = 1 / (R * R + X * X) * (R * (r * r * p.vi - r * n.vi) - X * (r * r * p.vr - r * n.vr));
        n.ir = (-1 / r * p.ir) + G * n.vr - B * n.vi;
        n.ii = (-1 / r * p.ii) + G * n.vi + B * n.vr;
        annotation(Icon(graphics = {Rectangle(extent = {{-60, 40}, {60, -40}}, lineColor = {0, 0, 255}), Ellipse(extent = {{-26, 16}, {6, -16}}, lineColor = {0, 0, 255}, lineThickness = 1), Ellipse(extent = {{-8, 16}, {24, -16}}, lineColor = {0, 0, 255}, lineThickness = 1), Line(points = {{-42, 0}, {-26, 0}}, color = {0, 0, 255}, thickness = 1, smooth = Smooth.None), Line(points = {{24, 0}, {40, 0}}, color = {0, 0, 255}, thickness = 1, smooth = Smooth.None)}), Diagram(graphics), Documentation(info = "<html>
<p><br><span style=\"font-family: MS Shell Dlg 2;\">&LT;iPSL: iTesla Power System Library&GT;</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Copyright 2015 RTE (France), AIA (Spain), KTH (Sweden) and DTU (Denmark)</span></p>
<ul>
<li><span style=\"font-family: MS Shell Dlg 2;\">RTE: http://www.rte-france.com/ </span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">AIA: http://www.aia.es/en/energy/</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">KTH: https://www.kth.se/en</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">DTU:http://www.dtu.dk/english</span></li>
</ul>
<p><span style=\"font-family: MS Shell Dlg 2;\">The authors can be contacted by email: info at itesla-ipsl dot org</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">This package is part of the iTesla Power System Library (&QUOT;iPSL&QUOT;) .</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is free software: you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">You should have received a copy of the GNU Lesser General Public License along with the iPSL. If not, see &LT;http://www.gnu.org/licenses/&GT;.</span></p>
</html>"));
      end PwTransformer_2;

      model PwPhaseTransformer "Two winding fixed transformer composed of an ideal transformer, a series 
                                                  impedance and a shunt admittance.
                                                  2014/03/10"
        iPSL.Connectors.PwPin p annotation(Placement(transformation(extent = {{-80, -8}, {-60, 12}}), iconTransformation(extent = {{-80, -8}, {-60, 12}})));
        iPSL.Connectors.PwPin n annotation(Placement(transformation(extent = {{60, -8}, {80, 12}}), iconTransformation(extent = {{60, -8}, {80, 12}})));
        // INPUT parameters
        parameter Real R "Resistance p.u.";
        parameter Real X "Reactance p.u.";
        parameter Real r "Transformation ratio";
        parameter Real G0 "Shunt conductance p.u.";
        parameter Real B0 "Shunt susceptance p.u.";
        parameter Real theta;
        // Calculated parameters
        parameter Real theta_rad = -theta * 3.141592 / 180;
        parameter Real Z2 = R * R + X * X;
        parameter Real G = if Z2 == 0 then 0 else R / Z2;
        parameter Real B = if Z2 == 0 then 0 else -X / Z2;
        parameter Real Gi = G0 / 2;
        parameter Real Bi = B0 / 2;
        parameter Real Gj = G0 / 2;
        parameter Real Bj = B0 / 2;
        //ADMITTANCE matrix
        parameter Real G11 = G * (r * r - r * cos(theta_rad)) + B * r * sin(theta_rad) + Gi + G * r * cos(theta_rad) - B * r * sin(theta_rad);
        parameter Real B11 = B * (r * r - r * cos(theta_rad)) - G * r * sin(theta_rad) + Bi + B * r * cos(theta_rad) + G * r * sin(theta_rad);
        parameter Real G12 = (-G * r * cos(theta_rad)) + B * r * sin(theta_rad);
        parameter Real B12 = (-B * r * cos(theta_rad)) - G * r * sin(theta_rad);
        parameter Real G21 = (-G * r * cos(theta_rad)) - B * r * sin(theta_rad);
        parameter Real B21 = (-B * r * cos(theta_rad)) + G * r * sin(theta_rad);
        parameter Real G22 = G * (1 - r * cos(theta_rad)) - B * r * sin(theta_rad) + Gj + G * r * cos(theta_rad) + B * r * sin(theta_rad);
        parameter Real B22 = B * (1 - r * cos(theta_rad)) + G * r * sin(theta_rad) + Bj + B * r * cos(theta_rad) - G * r * sin(theta_rad);
      equation
        p.ir = p.vr * G11 - p.vi * B11 + n.vr * G12 - n.vi * B12;
        p.ii = p.vi * G11 + p.vr * B11 + n.vi * G12 + n.vr * B12;
        n.ir = p.vr * G21 - p.vi * B21 + n.vr * G22 - n.vi * B22;
        n.ii = p.vi * G21 + p.vr * B21 + n.vi * G22 + n.vr * B22;
        annotation(Icon(graphics = {Rectangle(extent = {{-60, 40}, {60, -40}}, lineColor = {0, 0, 255}), Ellipse(extent = {{-26, 16}, {6, -16}}, lineColor = {0, 0, 255}, lineThickness = 1), Ellipse(extent = {{-8, 16}, {24, -16}}, lineColor = {0, 0, 255}, lineThickness = 1), Line(points = {{-42, 0}, {-26, 0}}, color = {0, 0, 255}, thickness = 1, smooth = Smooth.None), Line(points = {{24, 0}, {40, 0}}, color = {0, 0, 255}, thickness = 1, smooth = Smooth.None)}), Diagram(graphics), Documentation(info = "<html>
<p><br><span style=\"font-family: MS Shell Dlg 2;\">&LT;iPSL: iTesla Power System Library&GT;</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Copyright 2015 RTE (France), AIA (Spain), KTH (Sweden) and DTU (Denmark)</span></p>
<ul>
<li><span style=\"font-family: MS Shell Dlg 2;\">RTE: http://www.rte-france.com/ </span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">AIA: http://www.aia.es/en/energy/</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">KTH: https://www.kth.se/en</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">DTU:http://www.dtu.dk/english</span></li>
</ul>
<p><span style=\"font-family: MS Shell Dlg 2;\">The authors can be contacted by email: info at itesla-ipsl dot org</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">This package is part of the iTesla Power System Library (&QUOT;iPSL&QUOT;) .</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is free software: you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">You should have received a copy of the GNU Lesser General Public License along with the iPSL. If not, see &LT;http://www.gnu.org/licenses/&GT;.</span></p>
</html>"));
      end PwPhaseTransformer;

      model PwLine2Openings "Transmission Line based on the pi-equivalent circuit with an opening event on both sending and receiving end nodes"
        iPSL.Connectors.PwPin p annotation(Placement(transformation(extent = {{-76, -10}, {-56, 10}}), iconTransformation(extent = {{-80, -10}, {-60, 10}})));
        iPSL.Connectors.PwPin n annotation(Placement(transformation(extent = {{56, -10}, {76, 10}}), iconTransformation(extent = {{60, -10}, {80, 10}})));
        parameter Real R "Resistance";
        parameter Real X "Reactance";
        parameter Real G "Shunt half conductance";
        parameter Real B "Shunt half susceptance";
        parameter Real t1 "Start time of the opening";
        parameter Real t2 "End time of the opening";
        parameter Real S_b = 100 "System base power (MVA)";
        Real Zr;
        Real Zi;
        Real P12;
        Real P21;
        Real Q12;
        Real Q21;
      equation
        P12 = (p.vr * p.ir - p.vi * p.ii) * S_b;
        P21 = -(n.vr * n.ir - n.vi * n.ii) * S_b;
        Q12 = (p.vr * p.ii - p.vi * p.ir) * S_b;
        Q21 = -(n.vr * n.ii - n.vi * n.ir) * S_b;
        Zr = R * G + X * B;
        Zi = R * B + X * G;
        if time >= t1 then
          if time < t2 then
            p.ir = 0;
            p.ii = 0;
            n.ii = 0.0;
            n.ir = 0.0;
          else
            R * (n.ir - G * n.vr + B * n.vi) - X * (n.ii - B * n.vr - G * n.vi) = n.vr - p.vr;
            R * (n.ii - B * n.vr - G * n.vi) + X * (n.ir - G * n.vr + B * n.vi) = n.vi - p.vi;
            R * (p.ir - G * p.vr + B * p.vi) - X * (p.ii - B * p.vr - G * p.vi) = p.vr - n.vr;
            R * (p.ii - B * p.vr - G * p.vi) + X * (p.ir - G * p.vr + B * p.vi) = p.vi - n.vi;
          end if;
        else
          R * (n.ir - G * n.vr + B * n.vi) - X * (n.ii - B * n.vr - G * n.vi) = n.vr - p.vr;
          R * (n.ii - B * n.vr - G * n.vi) + X * (n.ir - G * n.vr + B * n.vi) = n.vi - p.vi;
          R * (p.ir - G * p.vr + B * p.vi) - X * (p.ii - B * p.vr - G * p.vi) = p.vr - n.vr;
          R * (p.ii - B * p.vr - G * p.vi) + X * (p.ir - G * p.vr + B * p.vi) = p.vi - n.vi;
        end if;
        annotation(Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Rectangle(extent = {{-60, 40}, {60, -42}}, lineColor = {0, 0, 255}), Rectangle(extent = {{-40, 10}, {40, -10}}, lineColor = {0, 0, 255}, fillColor = {95, 95, 95}, fillPattern = FillPattern.Solid), Line(points = {{-38, 16}, {4, 16}, {24, 30}}, color = {0, 0, 255}, smooth = Smooth.None), Line(points = {{34, 18}, {40, 18}}, color = {0, 0, 255}, smooth = Smooth.None), Ellipse(extent = {{28, 22}, {34, 16}}, lineColor = {0, 0, 255}), Text(extent = {{-108, 86}, {-20, 40}}, lineColor = {238, 46, 47}, textString = DynamicSelect("0.0", String(P12, significantDigits = 2))), Text(extent = {{22, 86}, {110, 40}}, lineColor = {238, 46, 47}, textString = DynamicSelect("0.0", String(P21, significantDigits = 2))), Text(extent = {{-108, -56}, {-20, -102}}, lineColor = {0, 255, 0}, textString = DynamicSelect("0.0", String(Q12, significantDigits = 2))), Text(extent = {{22, -56}, {110, -102}}, lineColor = {0, 255, 0}, textString = DynamicSelect("0.0", String(Q21, significantDigits = 2))), Line(points = {{-88, 86}, {-40, 86}, {-48, 92}}, color = {0, 0, 0}), Line(points = {{-40, 86}, {-48, 80}}, color = {0, 0, 0}), Line(points = {{-88, -54}, {-40, -54}, {-48, -48}}, color = {0, 0, 0}), Line(points = {{-40, -54}, {-48, -60}}, color = {0, 0, 0}), Line(points = {{-80, -48}, {-80, -60}}, color = {0, 0, 0}), Line(points = {{40, -54}, {88, -54}, {80, -48}}, color = {0, 0, 0}), Line(points = {{88, -54}, {80, -60}}, color = {0, 0, 0}), Line(points = {{48, -48}, {48, -60}}, color = {0, 0, 0}), Line(points = {{40, 86}, {88, 86}, {80, 92}}, color = {0, 0, 0}), Line(points = {{88, 86}, {80, 80}}, color = {0, 0, 0})}), uses(PowerSystems(version = "0.6"), Modelica(version = "3.2.1")), Documentation(info = "<html>
<p><br><span style=\"font-family: MS Shell Dlg 2;\">&LT;iPSL: iTesla Power System Library&GT;</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Copyright 2015 RTE (France), AIA (Spain), KTH (Sweden) and DTU (Denmark)</span></p>
<ul>
<li><span style=\"font-family: MS Shell Dlg 2;\">RTE: http://www.rte-france.com/ </span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">AIA: http://www.aia.es/en/energy/</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">KTH: https://www.kth.se/en</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">DTU:http://www.dtu.dk/english</span></li>
</ul>
<p><span style=\"font-family: MS Shell Dlg 2;\">The authors can be contacted by email: info at itesla-ipsl dot org</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">This package is part of the iTesla Power System Library (&QUOT;iPSL&QUOT;) .</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is free software: you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">You should have received a copy of the GNU Lesser General Public License along with the iPSL. If not, see &LT;http://www.gnu.org/licenses/&GT;.</span></p>
</html>"));
      end PwLine2Openings;

      package Data "Records of data for Line models"
        record LinePSSE
          parameter Real R "Resistance p.u.";
          parameter Real X "Reactance p.u.";
          parameter Real G "Shunt half conductance p.u.";
          parameter Real B "Shunt half susceptance p.u.";
          annotation(Icon(graphics = {Rectangle(extent = {{-40, 40}, {40, -40}}, lineColor = {0, 0, 255}), Text(extent = {{-32, 14}, {32, -10}}, lineColor = {0, 0, 255}, textStyle = {TextStyle.Bold}, textString = "|x|"), Text(extent = {{-58, 4}, {-46, -4}}, lineColor = {255, 255, 255}, textString = "p1")}), Diagram(graphics), Documentation(info = "<html>
<p><br><span style=\"font-family: MS Shell Dlg 2;\">&LT;iPSL: iTesla Power System Library&GT;</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Copyright 2015 RTE (France), AIA (Spain), KTH (Sweden) and DTU (Denmark)</span></p>
<ul>
<li><span style=\"font-family: MS Shell Dlg 2;\">RTE: http://www.rte-france.com/ </span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">AIA: http://www.aia.es/en/energy/</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">KTH: https://www.kth.se/en</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">DTU:http://www.dtu.dk/english</span></li>
</ul>
<p><span style=\"font-family: MS Shell Dlg 2;\">The authors can be contacted by email: info at itesla-ipsl dot org</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">This package is part of the iTesla Power System Library (&QUOT;iPSL&QUOT;) .</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is free software: you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">You should have received a copy of the GNU Lesser General Public License along with the iPSL. If not, see &LT;http://www.gnu.org/licenses/&GT;.</span></p>
</html>"));
        end LinePSSE;
        annotation(Documentation(info = "<html>
<p><br><span style=\"font-family: MS Shell Dlg 2;\">&LT;iPSL: iTesla Power System Library&GT;</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Copyright 2015 RTE (France), AIA (Spain), KTH (Sweden) and DTU (Denmark)</span></p>
<ul>
<li><span style=\"font-family: MS Shell Dlg 2;\">RTE: http://www.rte-france.com/ </span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">AIA: http://www.aia.es/en/energy/</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">KTH: https://www.kth.se/en</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">DTU:http://www.dtu.dk/english</span></li>
</ul>
<p><span style=\"font-family: MS Shell Dlg 2;\">The authors can be contacted by email: info at itesla-ipsl dot org</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">This package is part of the iTesla Power System Library (&QUOT;iPSL&QUOT;) .</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is free software: you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">You should have received a copy of the GNU Lesser General Public License along with the iPSL. If not, see &LT;http://www.gnu.org/licenses/&GT;.</span></p>
</html>"));
      end Data;

      package PSAT
        model TwoWindingTransformer "Modeled as series reactances without iron losses"
          iPSL.Connectors.PwPin p annotation(Placement(transformation(extent = {{-120, -10}, {-100, 10}})));
          iPSL.Connectors.PwPin n annotation(Placement(transformation(extent = {{100, -10}, {120, 10}})));
          parameter Real Sb = 100 "System base power (MVA)" annotation(Dialog(group = "Power flow"));
          parameter Real Sn = 100 "Power rating (MVA)" annotation(Dialog(group = "Power flow"));
          parameter Real V_b = 400000 "Sending end bus voltage" annotation(Dialog(group = "Power flow"));
          parameter Real Vn = 400000 "Voltage rating (kV)" annotation(Dialog(group = "Power flow"));
          parameter Real fn = 50 "Frequency rating (Hz)" annotation(Dialog(group = "Power flow"));
          parameter Real kT = 1 "Nominal tap ratio (V1/V2)" annotation(Dialog(group = "Transformer parameters"));
          parameter Real x = 0.001 "Reactance (pu)" annotation(Dialog(group = "Transformer parameters"));
          parameter Real r = 0.1 "Resistance (pu)" annotation(Dialog(group = "Transformer parameters"));
        protected
          parameter Real Vb2new = V_b ^ 2;
          parameter Real Vb2old = Vn * Vn;
          parameter Real xT = x * (Vb2old * Sb) / (Vb2new * Sn) "Reactance(inductive),p.u";
          parameter Real rT = r * (Vb2old * Sb) / (Vb2new * Sn) "Reactance(capacitive),p.u";
        equation
          rT * p.ir - xT * p.ii = p.vr - n.vr;
          rT * p.ii + xT * p.ir = p.vi - n.vi;
          rT * n.ir - xT * n.ii = n.vr - p.vr;
          xT * n.ir + rT * n.ii = n.vi - p.vi;
          annotation(Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics), Icon(graphics = {Ellipse(extent = {{-46, 30}, {8, -30}}, lineColor = {0, 0, 255}), Ellipse(extent = {{-10, 30}, {44, -30}}, lineColor = {0, 0, 255}), Line(points = {{100, 0}, {44, 0}, {44, 0}}, color = {0, 0, 255}, smooth = Smooth.None), Line(points = {{-100, 0}, {-46, 0}}, color = {0, 0, 255}, smooth = Smooth.None)}), Documentation(info = "<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\"><tr>
<td><p>Reference</p></td>
<td><p>PSAT Manual 2.1.8</p></td>
</tr>
<tr>
<td><p>Last update</p></td>
<td><p>29/09/2015</p></td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p>MAA Murad, SmarTS Lab, KTH Royal Institute of Technology</p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p><a href=\"mailto:luigiv@kth.se\">luigiv@kth.se</a></p></td>
</tr>
</table>
<p><br><span style=\"font-family: MS Shell Dlg 2;\">&LT;iPSL: iTesla Power System Library&GT;</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Copyright 2015 RTE (France), AIA (Spain), KTH (Sweden) and DTU (Denmark)</span></p>
<ul>
<li><span style=\"font-family: MS Shell Dlg 2;\">RTE: http://www.rte-france.com/ </span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">AIA: http://www.aia.es/en/energy/</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">KTH: https://www.kth.se/en</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">DTU:http://www.dtu.dk/english</span></li>
</ul>
<p><span style=\"font-family: MS Shell Dlg 2;\">The authors can be contacted by email: info at itesla-ipsl dot org</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">This package is part of the iTesla Power System Library (&QUOT;iPSL&QUOT;) .</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is free software: you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">You should have received a copy of the GNU Lesser General Public License along with the iPSL. If not, see &LT;http://www.gnu.org/licenses/&GT;.</span></p>
</html>"));
        end TwoWindingTransformer;

        package ThreeWindingTransformer
          model Branch1 "First winding of Three Winding Transformer"
            iPSL.Connectors.PwPin p annotation(Placement(transformation(extent = {{-120, -6}, {-100, 14}})));
            iPSL.Connectors.PwPin n1 annotation(Placement(transformation(extent = {{100, -10}, {120, 10}})));
            parameter Real SystemBase = 100;
            parameter Real Sn = 100 "Power rating MVA";
            parameter Real Vbus = 400000 "Sending end bus voltage, V";
            parameter Real Vn1 = 400000 "Voltage rating of the first winding, V";
            parameter Real Vn2 = 100000 "Voltage rating of the second winding, V";
            parameter Real Vn3 = 40000 "Voltage rating of the third winding, V";
            parameter Real fn = 50 "Frequency rating, Hz";
            parameter Real R12 = 0.01 "Resistance of the branch 1-2, p.u.";
            parameter Real R13 = 0.01 "Resistance of the branch 1-3, p.u.";
            parameter Real R23 = 0.01 "Resistance of the branch 2-3, p.u.";
            parameter Real X12 = 0.1 "Reactance of the branch 1-2, p.u.";
            parameter Real X13 = 0.1 "Reactance of the branch 1-3, p.u.";
            parameter Real X23 = 0.1 "Reactance of the branch 2-3, p.u.";
            parameter Real m = 0.98 "Fixed Tap ratio";
            Real r1;
            Real x1;
            Real anglev2 "Angle of the fictious bus";
            Real vbus2 "Voltage of the fictious bus";
          equation
            vbus2 = sqrt(n1.vr ^ 2 + n1.vi ^ 2);
            anglev2 = atan2(n1.vi, n1.vr);
            r1 = 0.5 * (R12 + R13 - R23);
            x1 = 0.5 * (X12 + X13 - X23);
            r1 * p.ir - x1 * p.ii = 1 / m ^ 2 * p.vr - 1 / m * n1.vr;
            r1 * p.ii + x1 * p.ir = 1 / m ^ 2 * p.vi - 1 / m * n1.vi;
            r1 * n1.ir - x1 * n1.ii = n1.vr - 1 / m * p.vr;
            x1 * n1.ir + r1 * n1.ii = n1.vi - 1 / m * p.vi;
            annotation(Documentation(info = "<html>
<p><br><span style=\"font-family: MS Shell Dlg 2;\">&LT;iPSL: iTesla Power System Library&GT;</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Copyright 2015 RTE (France), AIA (Spain), KTH (Sweden) and DTU (Denmark)</span></p>
<ul>
<li><span style=\"font-family: MS Shell Dlg 2;\">RTE: http://www.rte-france.com/ </span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">AIA: http://www.aia.es/en/energy/</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">KTH: https://www.kth.se/en</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">DTU:http://www.dtu.dk/english</span></li>
</ul>
<p><span style=\"font-family: MS Shell Dlg 2;\">The authors can be contacted by email: info at itesla-ipsl dot org</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">This package is part of the iTesla Power System Library (&QUOT;iPSL&QUOT;) .</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is free software: you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">You should have received a copy of the GNU Lesser General Public License along with the iPSL. If not, see &LT;http://www.gnu.org/licenses/&GT;.</span></p>
</html>"));
          end Branch1;

          model Branch2
            iPSL.Connectors.PwPin p2 annotation(Placement(transformation(extent = {{-120, -10}, {-100, 10}})));
            iPSL.Connectors.PwPin n2 annotation(Placement(transformation(extent = {{100, -10}, {120, 10}})));
            parameter Real SystemBase = 100;
            parameter Real Sn = 100 "Power rating MVA";
            parameter Real Vbus = 400000 "Sending end bus voltage, V";
            parameter Real Vn1 = 400000 "Voltage rating of the first winding, V";
            parameter Real Vn2 = 100000 "Voltage rating of the second winding, V";
            parameter Real Vn3 = 40000 "Voltage rating of the third winding, V";
            parameter Real fn = 50 "Frequency rating Hz";
            parameter Real R12 = 0.01 "Resistance of the branch 1-2, p.u.";
            parameter Real R13 = 0.01 "Resistance of the branch 1-3, p.u.";
            parameter Real R23 = 0.01 "Resistance of the branch 2-3, p.u.";
            parameter Real X12 = 0.1 "Reactance of the branch 1-2, p.u.";
            parameter Real X13 = 0.1 "Reactance of the branch 1-3, p.u.";
            parameter Real X23 = 0.1 "Reactance of the branch 232, p.u.";
            parameter Real m = 0.98 "Fixed Tap ratio";
            Real r2;
            Real x2;
          equation
            r2 = 0.5 * (R12 + R23 - R13);
            x2 = 0.5 * (X12 + X23 - X13);
            r2 * p2.ir - x2 * p2.ii = p2.vr - n2.vr;
            r2 * p2.ii + x2 * p2.ir = p2.vi - n2.vi;
            r2 * n2.ir - x2 * n2.ii = n2.vr - p2.vr;
            x2 * n2.ir + r2 * n2.ii = n2.vi - p2.vi;
            annotation(Documentation(info = "<html>
<p><br><span style=\"font-family: MS Shell Dlg 2;\">&LT;iPSL: iTesla Power System Library&GT;</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Copyright 2015 RTE (France), AIA (Spain), KTH (Sweden) and DTU (Denmark)</span></p>
<ul>
<li><span style=\"font-family: MS Shell Dlg 2;\">RTE: http://www.rte-france.com/ </span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">AIA: http://www.aia.es/en/energy/</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">KTH: https://www.kth.se/en</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">DTU:http://www.dtu.dk/english</span></li>
</ul>
<p><span style=\"font-family: MS Shell Dlg 2;\">The authors can be contacted by email: info at itesla-ipsl dot org</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">This package is part of the iTesla Power System Library (&QUOT;iPSL&QUOT;) .</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is free software: you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">You should have received a copy of the GNU Lesser General Public License along with the iPSL. If not, see &LT;http://www.gnu.org/licenses/&GT;.</span></p>
</html>"));
          end Branch2;

          model Branch3
            iPSL.Connectors.PwPin p3 annotation(Placement(transformation(extent = {{-120, -10}, {-100, 10}})));
            iPSL.Connectors.PwPin n3 annotation(Placement(transformation(extent = {{100, -10}, {120, 10}})));
            parameter Real SystemBase = 100;
            parameter Real Sn = 100 "Power rating MVA";
            parameter Real Vbus = 400000 "Sending end bus voltage, V";
            parameter Real Vn1 = 400000 "Voltage rating of the first winding, V";
            parameter Real Vn2 = 100000 "Voltage rating of the second winding, V";
            parameter Real Vn3 = 40000 "Voltage rating of the third winding, V";
            parameter Real fn = 50 "Frequency rating Hz";
            parameter Real R12 = 0.01 "Resistance of the branch 1-2, p.u.";
            parameter Real R13 = 0.01 "Resistance of the branch 1-3, p.u.";
            parameter Real R23 = 0.01 "Resistance of the branch 2-3, p.u.";
            parameter Real X12 = 0.1 "Reactance of the branch 1-2, p.u.";
            parameter Real X13 = 0.1 "Reactance of the branch 1-3, p.u.";
            parameter Real X23 = 0.1 "Reactance of the branch 2-3, p.u.";
            parameter Real m = 0.98 "Fixed Tap ratio";
            Real r3;
            Real x3;
          equation
            r3 = 0.5 * (R23 + R13 - R12);
            x3 = 0.5 * (X23 + X13 - X12);
            r3 * p3.ir - x3 * p3.ii = p3.vr - n3.vr;
            r3 * p3.ii + x3 * p3.ir = p3.vi - n3.vi;
            r3 * n3.ir - x3 * n3.ii = n3.vr - p3.vr;
            x3 * n3.ir + r3 * n3.ii = n3.vi - p3.vi;
            annotation(Documentation(info = "<html>
<p><br><span style=\"font-family: MS Shell Dlg 2;\">&LT;iPSL: iTesla Power System Library&GT;</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Copyright 2015 RTE (France), AIA (Spain), KTH (Sweden) and DTU (Denmark)</span></p>
<ul>
<li><span style=\"font-family: MS Shell Dlg 2;\">RTE: http://www.rte-france.com/ </span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">AIA: http://www.aia.es/en/energy/</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">KTH: https://www.kth.se/en</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">DTU:http://www.dtu.dk/english</span></li>
</ul>
<p><span style=\"font-family: MS Shell Dlg 2;\">The authors can be contacted by email: info at itesla-ipsl dot org</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">This package is part of the iTesla Power System Library (&QUOT;iPSL&QUOT;) .</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is free software: you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">You should have received a copy of the GNU Lesser General Public License along with the iPSL. If not, see &LT;http://www.gnu.org/licenses/&GT;.</span></p>
</html>"));
          end Branch3;

          model ThreeWindingTransformer
            iPSL.Connectors.PwPin b1 annotation(Placement(transformation(extent = {{-120, -10}, {-100, 10}})));
            iPSL.Connectors.PwPin b2 annotation(Placement(transformation(extent = {{100, 20}, {120, 40}})));
            iPSL.Connectors.PwPin b3 annotation(Placement(transformation(extent = {{100, -40}, {120, -20}})));
            parameter Real Sb = 100 "System base power (MVA)" annotation(Dialog(group = "Power flow data"));
            parameter Real Sn = 100 "Power rating (MVA)" annotation(Dialog(group = "Power flow data"));
            parameter Real Vbus = 400000 "Sending end bus voltage (V)" annotation(Dialog(group = "Power flow data"));
            parameter Real Vn1 = 400000 "Voltage rating of the first winding (V)" annotation(Dialog(group = "Power flow data"));
            parameter Real Vn2 = 100000 "Voltage rating of the second winding (V)" annotation(Dialog(group = "Power flow data"));
            parameter Real Vn3 = 40000 "Voltage rating of the third winding (V)" annotation(Dialog(group = "Power flow data"));
            parameter Real fn = 50 "Frequency rating (Hz)" annotation(Dialog(group = "Power flow data"));
            parameter Real R12 = 0.01 "Resistance of the branch 1-2 (pu)" annotation(Dialog(group = "Transformer data"));
            parameter Real R13 = 0.01 "Resistance of the branch 1-3 (pu)" annotation(Dialog(group = "Transformer data"));
            parameter Real R23 = 0.01 "Resistance of the branch 2-3 (pu)" annotation(Dialog(group = "Transformer data"));
            parameter Real X12 = 0.1 "Reactance of the branch 1-2 (pu)" annotation(Dialog(group = "Transformer data"));
            parameter Real X13 = 0.1 "Reactance of the branch 1-3 (pu)" annotation(Dialog(group = "Transformer data"));
            parameter Real X23 = 0.1 "Reactance of the branch 2-3 (pu)" annotation(Dialog(group = "Transformer data"));
            parameter Real m = 0.98 "Fixed tap ratio" annotation(Dialog(group = "Transformer data"));
            Real v1;
            Real v2;
            Real v3;
            Real anglev1;
            Real anglev2;
            Real anglev3;
            Branch1 branch1_1(SystemBase = Sb, Sn = Sn, Vbus = Vbus, Vn1 = Vn1, Vn2 = Vn2, Vn3 = Vn3, fn = fn, R12 = R12, R13 = R13, R23 = R23, X12 = X12, X13 = X13, X23 = X23, m = m) annotation(Placement(transformation(extent = {{-66, -10}, {-46, 10}})));
            Branch2 branch2_1(SystemBase = Sb, Sn = Sn, Vbus = Vbus, Vn1 = Vn1, Vn2 = Vn2, Vn3 = Vn3, fn = fn, R12 = R12, R13 = R13, R23 = R23, X12 = X12, X13 = X13, X23 = X23, m = m) annotation(Placement(transformation(extent = {{18, 20}, {38, 40}})));
            Branch3 branch3_1(SystemBase = Sb, Sn = Sn, Vbus = Vbus, Vn1 = Vn1, Vn2 = Vn2, Vn3 = Vn3, fn = fn, R12 = R12, R13 = R13, R23 = R23, X12 = X12, X13 = X13, X23 = X23, m = m) annotation(Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 180, origin = {30, -30})));
          equation
            v1 = sqrt(b1.vr ^ 2 + b1.vi ^ 2);
            v2 = sqrt(b2.vr ^ 2 + b2.vi ^ 2);
            v3 = sqrt(b3.vr ^ 2 + b3.vi ^ 2);
            anglev1 = atan2(b1.vi, b1.vr);
            anglev2 = atan2(b2.vi, b2.vr);
            anglev3 = atan2(b3.vi, b3.vr);
            connect(branch1_1.p, b1) annotation(Line(points = {{-67, 0.4}, {-110, 0.4}, {-110, 0}}, color = {0, 0, 255}, smooth = Smooth.None));
            connect(branch2_1.n2, b2) annotation(Line(points = {{39, 30}, {110, 30}}, color = {0, 0, 255}, smooth = Smooth.None));
            connect(branch3_1.p3, b3) annotation(Line(points = {{41, -30}, {110, -30}}, color = {0, 0, 255}, smooth = Smooth.None));
            connect(branch2_1.p2, branch3_1.n3) annotation(Line(points = {{17, 30}, {10, 30}, {10, -30}, {19, -30}}, color = {0, 0, 255}, smooth = Smooth.None));
            connect(branch1_1.n1, branch3_1.n3) annotation(Line(points = {{-45, 0}, {10, 0}, {10, -30}, {19, -30}}, color = {0, 0, 255}, smooth = Smooth.None));
            annotation(Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics), Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics = {Ellipse(extent = {{-52, 34}, {12, -28}}, lineColor = {0, 0, 255}), Ellipse(extent = {{-4, 64}, {60, 2}}, lineColor = {0, 0, 255}), Ellipse(extent = {{-2, 16}, {62, -46}}, lineColor = {0, 0, 255}), Line(points = {{-54, -22}, {10, 42}, {10, 42}}, color = {0, 0, 255}, smooth = Smooth.None), Line(points = {{2, 40}, {10, 42}, {10, 42}}, color = {0, 0, 255}, smooth = Smooth.None), Line(points = {{8, 34}, {10, 42}}, color = {0, 0, 255}, smooth = Smooth.None), Line(points = {{60, 32}, {100, 32}, {100, 32}}, color = {0, 0, 255}, smooth = Smooth.None), Line(points = {{58, -28}, {102, -28}, {100, -28}}, color = {0, 0, 255}, smooth = Smooth.None), Line(points = {{-100, 0}, {-52, 0}}, color = {0, 0, 255}, smooth = Smooth.None), Text(extent = {{-54, -62}, {54, -78}}, lineColor = {0, 128, 0}, textString = "%TWT%")}), Documentation(info = "<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\"><tr>
<td><p>Reference</p></td>
<td><p>PSAT Manual 2.1.8</p></td>
</tr>
<tr>
<td><p>Last update</p></td>
<td><p>15/07/2015</p></td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p>MAA Murad, SmarTS Lab, KTH Royal Institute of Technology</p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p><a href=\"mailto:luigiv@kth.se\">luigiv@kth.se</a></p></td>
</tr>
</table>
<p><br><span style=\"font-family: MS Shell Dlg 2;\">&LT;iPSL: iTesla Power System Library&GT;</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Copyright 2015 RTE (France), AIA (Spain), KTH (Sweden) and DTU (Denmark)</span></p>
<ul>
<li><span style=\"font-family: MS Shell Dlg 2;\">RTE: http://www.rte-france.com/ </span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">AIA: http://www.aia.es/en/energy/</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">KTH: https://www.kth.se/en</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">DTU:http://www.dtu.dk/english</span></li>
</ul>
<p><span style=\"font-family: MS Shell Dlg 2;\">The authors can be contacted by email: info at itesla-ipsl dot org</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">This package is part of the iTesla Power System Library (&QUOT;iPSL&QUOT;) .</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is free software: you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">You should have received a copy of the GNU Lesser General Public License along with the iPSL. If not, see &LT;http://www.gnu.org/licenses/&GT;.</span></p>
</html>"));
          end ThreeWindingTransformer;
          annotation(Documentation(info = "<html>
<p><br><span style=\"font-family: MS Shell Dlg 2;\">&LT;iPSL: iTesla Power System Library&GT;</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Copyright 2015 RTE (France), AIA (Spain), KTH (Sweden) and DTU (Denmark)</span></p>
<ul>
<li><span style=\"font-family: MS Shell Dlg 2;\">RTE: http://www.rte-france.com/ </span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">AIA: http://www.aia.es/en/energy/</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">KTH: https://www.kth.se/en</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">DTU:http://www.dtu.dk/english</span></li>
</ul>
<p><span style=\"font-family: MS Shell Dlg 2;\">The authors can be contacted by email: info at itesla-ipsl dot org</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">This package is part of the iTesla Power System Library (&QUOT;iPSL&QUOT;) .</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is free software: you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">You should have received a copy of the GNU Lesser General Public License along with the iPSL. If not, see &LT;http://www.gnu.org/licenses/&GT;.</span></p>
</html>"));
        end ThreeWindingTransformer;

        model ULTC_VoltageControl "Under Load Tap Changer, continous model, secondary voltage control"
          iPSL.Connectors.PwPin p annotation(Placement(transformation(extent = {{-120, -10}, {-100, 10}})));
          iPSL.Connectors.PwPin n annotation(Placement(transformation(extent = {{100, -10}, {120, 10}})));
          parameter Real Sb = 100 "System base power (MVA)" annotation(Dialog(group = "Power flow data"));
          parameter Real Vbus1 = 400000 "Sending end Bus nominal voltage (V)" annotation(Dialog(group = "Power flow data"));
          parameter Real Vbus2 = 100000 "Receiving end Bus nominal voltage (V)" annotation(Dialog(group = "Power flow data"));
          parameter Real Sn = 100 "Power rating (MVA)" annotation(Dialog(group = "Power flow data"));
          parameter Real Vn = 400000 "Voltage rating (V)" annotation(Dialog(group = "Power flow data"));
          parameter Real fn = 50 "Frequency rating (Hz)" annotation(Dialog(group = "Power flow data"));
          parameter Real V_0 = 1.008959700699460 "Voltage magnitude of the controlled bus (pu)" annotation(Dialog(group = "Power flow data"));
          parameter Real m0 = 0.98 "Initial tap ratio" annotation(Dialog(group = "Power flow data"));
          parameter Real kT = 4 "Nominal tap ratio (V1/V2)" annotation(Dialog(group = "ULTC data"));
          parameter Real H = 0.001 "Integral deviation (pu)" annotation(Dialog(group = "ULTC data"));
          parameter Real K = 0.10 "Inverse time constant (1/s)" annotation(Dialog(group = "ULTC data"));
          parameter Real m_max = 0.98 "Maximum tap ratio (p.u./p.u.)" annotation(Dialog(group = "ULTC data"));
          parameter Real m_min = 0.9785 "Minimum tap ratio (p.u./p.u.)" annotation(Dialog(group = "ULTC data"));
          parameter Real deltam = 0 "Tap ratio step (p.u./p.u.)" annotation(Dialog(group = "ULTC data"));
          parameter Real v_ref = 1.0 "Reference voltage (power) (pu)" annotation(Dialog(group = "ULTC data"));
          parameter Real xT = 0.001 "Transformer reactance (pu)" annotation(Dialog(group = "ULTC data"));
          parameter Real rT = 0.1 "Transformer resistance (pu)" annotation(Dialog(group = "ULTC data"));
          parameter Real d = 0.05 "Dead zone percentage" annotation(Dialog(group = "ULTC data"));
          Real m "Tap ratio";
          Real vk "Voltage at primary, p.u.";
          Real vm(start = V_0) "Voltage at secondary p.u.";
          Real anglevk "Angle at primary";
          Real anglevm "Angle at secondary ";
        protected
          parameter Real V2 = Vn / kT "Secondary voltage";
          parameter Real Vb2new = Vbus1 * Vbus1;
          parameter Real Vb2old = Vn * Vn;
          parameter Real R = rT * (Vb2old * Sb) / (Vb2new * Sn) "Transformer Resistance, p.u.";
          parameter Real X = xT * (Vb2old * Sb) / (Vb2new * Sn) "Transformer Reactance, p.u.";
          parameter Real vref = v_ref * (V2 / Vbus2);
        initial equation
          m = m0;
        equation
          vk = sqrt(p.vr ^ 2 + p.vi ^ 2);
          vm = sqrt(n.vr ^ 2 + n.vi ^ 2);
          anglevk = atan2(p.vi, p.vr);
          anglevm = atan2(n.vi, n.vr);
          if m > m_max and der(m) > 0 then
            R * p.ir - X * p.ii = 1 / m_max ^ 2 * p.vr - 1 / m_max * n.vr;
            R * p.ii + X * p.ir = 1 / m_max ^ 2 * p.vi - 1 / m_max * n.vi;
            R * n.ir - X * n.ii = n.vr - 1 / m_max * p.vr;
            X * n.ir + R * n.ii = n.vi - 1 / m_max * p.vi;
            der(m) = 0;
          elseif m < m_min and der(m) < 0 then
            R * p.ir - X * p.ii = 1 / m_min ^ 2 * p.vr - 1 / m_min * n.vr;
            R * p.ii + X * p.ir = 1 / m_min ^ 2 * p.vi - 1 / m_min * n.vi;
            R * n.ir - X * n.ii = n.vr - 1 / m_min * p.vr;
            X * n.ir + R * n.ii = n.vi - 1 / m_min * p.vi;
            der(m) = 0;
          else
            R * p.ir - X * p.ii = 1 / m ^ 2 * p.vr - 1 / m * n.vr;
            R * p.ii + X * p.ir = 1 / m ^ 2 * p.vi - 1 / m * n.vi;
            R * n.ir - X * n.ii = n.vr - 1 / m * p.vr;
            X * n.ir + R * n.ii = n.vi - 1 / m * p.vi;
            der(m) = (-H * m) + K * (vm - vref);
          end if;
          annotation(Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics), Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics = {Ellipse(extent = {{-46, 30}, {8, -30}}, lineColor = {0, 0, 255}), Ellipse(extent = {{-10, 30}, {44, -30}}, lineColor = {0, 0, 255}), Line(points = {{100, 0}, {44, 0}, {44, 0}}, color = {0, 0, 255}, smooth = Smooth.None), Line(points = {{-100, 0}, {-46, 0}}, color = {0, 0, 255}, smooth = Smooth.None), Line(points = {{70, 0}, {70, -40}, {-36, -40}, {-20, 18}, {-20, 18}}, color = {0, 0, 255}, smooth = Smooth.None), Line(points = {{-30, 6}, {-20, 18}}, color = {0, 0, 255}, smooth = Smooth.None), Line(points = {{-20, 2}, {-20, 16}}, color = {0, 0, 255}, smooth = Smooth.None), Text(extent = {{-32, 66}, {32, 54}}, lineColor = {0, 128, 0}, textString = "%ULTC%")}), Documentation(info = "<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\"><tr>
<td><p>Reference</p></td>
<td><p>PSAT Manual 2.1.8</p></td>
</tr>
<tr>
<td><p>Last update</p></td>
<td><p>15/07/2015</p></td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p>MAA Murad, SmarTS Lab, KTH Royal Institute of Technology</p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p><a href=\"mailto:luigiv@kth.se\">luigiv@kth.se</a></p></td>
</tr>
</table>
<p><br><span style=\"font-family: MS Shell Dlg 2;\">&LT;iPSL: iTesla Power System Library&GT;</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Copyright 2015 RTE (France), AIA (Spain), KTH (Sweden) and DTU (Denmark)</span></p>
<ul>
<li><span style=\"font-family: MS Shell Dlg 2;\">RTE: http://www.rte-france.com/ </span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">AIA: http://www.aia.es/en/energy/</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">KTH: https://www.kth.se/en</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">DTU:http://www.dtu.dk/english</span></li>
</ul>
<p><span style=\"font-family: MS Shell Dlg 2;\">The authors can be contacted by email: info at itesla-ipsl dot org</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">This package is part of the iTesla Power System Library (&QUOT;iPSL&QUOT;) .</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is free software: you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">You should have received a copy of the GNU Lesser General Public License along with the iPSL. If not, see &LT;http://www.gnu.org/licenses/&GT;.</span></p>
</html>"));
        end ULTC_VoltageControl;

        package PhaseShiftingTransformer
          model pst2
            constant Real pi = Modelica.Constants.pi;
            parameter Real SystemBase = 100;
            parameter Real Vbus1 = 20000 "Sending end Bus nominal voltage, change of base";
            parameter Real Vbus2 = 20000 "Receiving end Bus voltage, change of base";
            parameter Real Sn = 100 "Power rating MVA";
            parameter Real Vn1 = 20000 "Primary Voltage rating,KV";
            parameter Real Vn2 = 20000 "Secondary voltage rating, KV";
            parameter Real fn = 50 "Frequency rating Hz";
            parameter Real Tm = 0.001 "Measurement time constant, s";
            parameter Real Kp = 0.05 "Proportional gain";
            parameter Real Ki = 0.01 "Integral gain";
            parameter Real p_ref = 0.01 "Reference Power, p.u.";
            parameter Real alpha_max = pi / 2 "Maximum phase angle, rad";
            parameter Real alpha_min = -pi / 2 "Minimum phase angle, rad";
            parameter Real xT = 0.1 "Transformer Reactance, p.u.";
            parameter Real rT = 0.01 "Transformer Resistance, p.u.";
            parameter Real m = 0.98 "Transformer fixed tap  ratio, p.u./p.u.";
            parameter Real alpha0 = 0.002062339234360;
            parameter Real pmes0 = 0.01;
            parameter Real vm0 = 1.007257703014177;
            parameter Real anglevm0 = -0.009372077496959;
            Real vk "Voltage at primary, p.u.";
            Real vm(start = vm0) "Voltage at secondary p.u.";
            Real anglevk "Angle at primary";
            Real anglevm;
            Real alpha;
            Real pmes;
            iPSL.Connectors.PwPin p annotation(Placement(visible = true, transformation(extent = {{-120, -8}, {-100, 12}})));
            iPSL.Connectors.PwPin n annotation(Placement(transformation(extent = {{100, -8}, {120, 12}})));
            Modelica.Blocks.Interfaces.RealInput pk annotation(Placement(transformation(extent = {{-142, -62}, {-102, -22}})));
          protected
            parameter Real Vb2new = Vbus1 * Vbus1;
            parameter Real Vb2old = Vn1 * Vn1;
            parameter Real R = rT * (Vb2old * SystemBase) / (Vb2new * Sn) "Transformer Resistance, p.u.";
            parameter Real X = xT * (Vb2old * SystemBase) / (Vb2new * Sn) "Transformer Reactance, p.u.";
            parameter Real pref = p_ref * (Sn / SystemBase);
            parameter Real gt = R / (R ^ 2 + X ^ 2) "Converting resistance to conductance p.u.";
            parameter Real bt = -X / (R ^ 2 + X ^ 2) "Converting reactance to susceptance p.u.";
          initial equation
            alpha = alpha0;
            pmes = pmes0;
          equation
            vk = sqrt(p.vr ^ 2 + p.vi ^ 2);
            vm = sqrt(n.vr ^ 2 + n.vi ^ 2);
            anglevk = atan2(p.vi, p.vr);
            anglevm = atan2(n.vi, n.vr);
            if alpha > alpha_max and der(alpha) > 0 and der(pmes) > 0 then
              der(alpha) = 0;
              der(pmes) = (pk - pmes) / Tm;
              p.vr = n.vr * cos(alpha_max) - n.vi * sin(alpha_max);
              p.vi = n.vr * sin(alpha_max) + n.vi * cos(alpha_max);
              // pk=p.vr*p.ir + p.vi*p.ii;
              p.ir + n.ir = 0;
              p.ii + n.ii = 0;
            elseif alpha < alpha_min and der(alpha) < 0 and der(pmes) < 0 then
              der(alpha) = 0;
              der(pmes) = (pk - pmes) / Tm;
              p.vr = n.vr * cos(alpha_min) - n.vi * sin(alpha_min);
              p.vi = n.vr * sin(alpha_min) + n.vi * cos(alpha_min);
              // pk=p.vr*p.ir + p.vi*p.ii;
              p.ir + n.ir = 0;
              p.ii + n.ii = 0;
            else
              der(alpha) = Kp * (pk - pmes) / Tm + Ki * (pmes - pref);
              der(pmes) = (pk - pmes) / Tm;
              p.vr = n.vr * cos(alpha) - n.vi * sin(alpha);
              p.vi = n.vr * sin(alpha) + n.vi * cos(alpha);
              // pk=p.vr*p.ir + p.vi*p.ii;
              p.ir + n.ir = 0;
              p.ii + n.ii = 0;
            end if;
            annotation(Placement(transformation(extent = {{-120, -10}, {-100, 10}})), Placement(transformation(extent = {{100, -10}, {120, 10}})), Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics), Documentation(info = "<html>
<p><br><span style=\"font-family: MS Shell Dlg 2;\">&LT;iPSL: iTesla Power System Library&GT;</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Copyright 2015 RTE (France), AIA (Spain), KTH (Sweden) and DTU (Denmark)</span></p>
<ul>
<li><span style=\"font-family: MS Shell Dlg 2;\">RTE: http://www.rte-france.com/ </span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">AIA: http://www.aia.es/en/energy/</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">KTH: https://www.kth.se/en</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">DTU:http://www.dtu.dk/english</span></li>
</ul>
<p><span style=\"font-family: MS Shell Dlg 2;\">The authors can be contacted by email: info at itesla-ipsl dot org</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">This package is part of the iTesla Power System Library (&QUOT;iPSL&QUOT;) .</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is free software: you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">You should have received a copy of the GNU Lesser General Public License along with the iPSL. If not, see &LT;http://www.gnu.org/licenses/&GT;.</span></p>
</html>"));
          end pst2;

          model pst1
            constant Real pi = Modelica.Constants.pi;
            parameter Real SystemBase = 100;
            parameter Real Vbus1 = 20000 "Sending end Bus nominal voltage, change of base";
            parameter Real Vbus2 = 20000 "Receiving end Bus voltage, change of base";
            parameter Real Sn = 100 "Power rating MVA";
            parameter Real Vn1 = 20000 "Primary Voltage rating,KV";
            parameter Real Vn2 = 20000 "Secondary voltage rating, KV";
            parameter Real fn = 50 "Frequency rating Hz";
            parameter Real Tm = 0.001 "Measurement time constant, s";
            parameter Real Kp = 0.05 "Proportional gain";
            parameter Real Ki = 0.01 "Integral gain";
            parameter Real p_ref = 0.01 "Reference Power, p.u.";
            parameter Real alpha_max = pi / 2 "Maximum phase angle, rad";
            parameter Real alpha_min = -pi / 2 "Minimum phase angle, rad";
            parameter Real xT = 0.1 "Transformer Reactance, p.u.";
            parameter Real rT = 0.01 "Transformer Resistance, p.u.";
            parameter Real m = 0.98 "Transformer fixed tap  ratio, p.u./p.u.";
            parameter Real alpha0 = 0.002062339234360;
            parameter Real pmes0 = 0.01;
            parameter Real vk0 = 0.997649085060455;
            parameter Real anglevk0 = -0.007392164704867;
            Real vk(start = vk0) "Voltage at primary, p.u.";
            Real vm;
            Real anglevk(start = anglevk0);
            Real anglevm;
            iPSL.Connectors.PwPin p annotation(Placement(visible = true, transformation(extent = {{-120, -8}, {-100, 12}})));
            iPSL.Connectors.PwPin n annotation(Placement(transformation(extent = {{100, -8}, {120, 12}})));
          protected
            parameter Real Vb2new = Vbus1 * Vbus1;
            parameter Real Vb2old = Vn1 * Vn1;
            parameter Real R = rT * (Vb2old * SystemBase) / (Vb2new * Sn) "Transformer Resistance, p.u.";
            parameter Real X = xT * (Vb2old * SystemBase) / (Vb2new * Sn) "Transformer Reactance, p.u.";
            parameter Real pref = p_ref * (Sn / SystemBase);
            parameter Real gt = R / (R ^ 2 + X ^ 2) "Converting resistance to conductance p.u.";
            parameter Real bt = -X / (R ^ 2 + X ^ 2) "Converting reactance to susceptance p.u.";
          equation
            vk = sqrt(p.vr ^ 2 + p.vi ^ 2);
            vm = sqrt(n.vr ^ 2 + n.vi ^ 2);
            anglevk = atan2(p.vi, p.vr);
            anglevm = atan2(n.vi, n.vr);
            R * p.ir - X * p.ii = 1 / m ^ 2 * p.vr - 1 / m * n.vr;
            R * p.ii + X * p.ir = 1 / m ^ 2 * p.vi - 1 / m * n.vi;
            R * n.ir - X * n.ii = n.vr - 1 / m * p.vr;
            X * n.ir + R * n.ii = n.vi - 1 / m * p.vi;
            annotation(Placement(transformation(extent = {{-120, -10}, {-100, 10}})), Placement(transformation(extent = {{100, -10}, {120, 10}})), Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics), Documentation(info = "<html>
<p><br><span style=\"font-family: MS Shell Dlg 2;\">&LT;iPSL: iTesla Power System Library&GT;</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Copyright 2015 RTE (France), AIA (Spain), KTH (Sweden) and DTU (Denmark)</span></p>
<ul>
<li><span style=\"font-family: MS Shell Dlg 2;\">RTE: http://www.rte-france.com/ </span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">AIA: http://www.aia.es/en/energy/</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">KTH: https://www.kth.se/en</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">DTU:http://www.dtu.dk/english</span></li>
</ul>
<p><span style=\"font-family: MS Shell Dlg 2;\">The authors can be contacted by email: info at itesla-ipsl dot org</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">This package is part of the iTesla Power System Library (&QUOT;iPSL&QUOT;) .</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is free software: you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">You should have received a copy of the GNU Lesser General Public License along with the iPSL. If not, see &LT;http://www.gnu.org/licenses/&GT;.</span></p>
</html>"));
          end pst1;

          model PSTransformer
            constant Real pi = Modelica.Constants.pi;
            parameter Real SystemBase = 100;
            parameter Real Vbus1 = 20000 "Sending end Bus nominal voltage, change of base";
            parameter Real Vbus2 = 20000 "Receiving end Bus voltage, change of base";
            parameter Real Sn = 100 "Power rating MVA";
            parameter Real Vn1 = 20000 "Primary Voltage rating,KV";
            parameter Real Vn2 = 20000 "Secondary voltage rating, KV";
            parameter Real fn = 50 "Frequency rating Hz";
            parameter Real Tm = 0.001 "Measurement time constant, s";
            parameter Real Kp = 0.05 "Proportional gain";
            parameter Real Ki = 0.01 "Integral gain";
            parameter Real p_ref = 0.01 "Reference Power, p.u.";
            parameter Real alpha_max = pi / 2 "Maximum phase angle, rad";
            parameter Real alpha_min = -pi / 2 "Minimum phase angle, rad";
            parameter Real xT = 0.1 "Transformer Reactance, p.u.";
            parameter Real rT = 0.01 "Transformer Resistance, p.u.";
            parameter Real m = 0.98 "Transformer fixed tap  ratio, p.u./p.u.";
            parameter Real alpha0 = 0.002062339234360;
            parameter Real pmes0 = 0.01;
            parameter Real vk0 = 0.997649085060455;
            parameter Real vm0 = 1.007257703014177;
            parameter Real anglevk0 = -0.007392164704867;
            parameter Real anglevm0 = -0.009372077496959;
            Real vk(start = vk0);
            Real vm(start = vm0);
            Real anglevk(start = anglevk0);
            Real anglevm(start = anglevm0);
            iPSL.Connectors.PwPin p annotation(Placement(transformation(extent = {{-122, -8}, {-102, 12}})));
            iPSL.Connectors.PwPin n annotation(Placement(transformation(extent = {{100, -10}, {120, 10}})));
            Modelica.Blocks.Interfaces.RealOutput pk(start = p_ref) annotation(Placement(transformation(extent = {{100, -50}, {120, -30}}), iconTransformation(extent = {{100, -50}, {120, -30}})));
            Modelica.Blocks.Interfaces.RealInput u annotation(Placement(transformation(extent = {{-144, 36}, {-104, 76}})));
            pst1 pst1_1(SystemBase = SystemBase, Vbus1 = Vbus1, Vbus2 = Vbus2, Sn = Sn, Vn1 = Vn1, Vn2 = Vn2, fn = fn, Tm = Tm, Kp = Kp, Ki = Ki, p_ref = p_ref, alpha_max = alpha_max, alpha_min = alpha_min, xT = xT, rT = rT, m = m, alpha0 = alpha0, pmes0 = pmes0, vk0 = vk0, anglevk0 = anglevk0) annotation(Placement(transformation(extent = {{-46, -10}, {-26, 10}})));
            pst2 pst2_1(SystemBase = SystemBase, Vbus1 = Vbus1, Vbus2 = Vbus2, Sn = Sn, Vn1 = Vn1, Vn2 = Vn2, fn = fn, Tm = Tm, Kp = Kp, Ki = Ki, p_ref = p_ref, alpha_max = alpha_max, alpha_min = alpha_min, xT = xT, rT = rT, m = m, alpha0 = alpha0, pmes0 = pmes0, vm0 = vm0, anglevm0 = anglevm0) annotation(Placement(transformation(extent = {{16, -10}, {36, 10}})));
          protected
            parameter Real Vb2new = Vbus1 * Vbus1;
            parameter Real Vb2old = Vn1 * Vn1;
            parameter Real R = rT * (Vb2old * SystemBase) / (Vb2new * Sn) "Transformer Resistance, p.u.";
            parameter Real X = xT * (Vb2old * SystemBase) / (Vb2new * Sn) "Transformer Reactance, p.u.";
            parameter Real pref = p_ref * (Sn / SystemBase);
            parameter Real gt = R / (R ^ 2 + X ^ 2) "Converting resistance to conductance p.u.";
            parameter Real bt = -X / (R ^ 2 + X ^ 2) "Converting reactance to susceptance p.u.";
          equation
            vk = sqrt(p.vr ^ 2 + p.vi ^ 2);
            vm = sqrt(n.vr ^ 2 + n.vi ^ 2);
            anglevk = atan2(p.vi, p.vr);
            anglevm = atan2(n.vi, n.vr);
            pk = p.vr * p.ir + p.vi * p.ii;
            connect(pst2_1.n, n) annotation(Line(points = {{37, 0.2}, {70.5, 0.2}, {70.5, 0}, {110, 0}}, color = {0, 0, 255}, smooth = Smooth.None));
            connect(pst2_1.p, pst1_1.n) annotation(Line(points = {{15, 0.2}, {-25, 0.2}}, color = {0, 0, 255}, smooth = Smooth.None));
            connect(pst1_1.p, p) annotation(Line(points = {{-47, 0.2}, {-76.5, 0.2}, {-76.5, 2}, {-112, 2}}, color = {0, 0, 255}, smooth = Smooth.None));
            connect(u, pst2_1.pk) annotation(Line(points = {{-124, 56}, {-8, 56}, {-8, -4.2}, {13.8, -4.2}}, color = {0, 0, 127}, smooth = Smooth.None));
            annotation(Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics), Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Ellipse(extent = {{-48, 24}, {10, -32}}, lineColor = {0, 0, 255}), Ellipse(extent = {{-6, 26}, {52, -30}}, lineColor = {0, 0, 255}), Line(points = {{-104, 0}, {-48, 0}}, color = {0, 0, 255}, smooth = Smooth.None), Rectangle(extent = {{66, 10}, {94, -12}}, lineColor = {0, 0, 255}), Line(points = {{50, 0}, {66, 0}, {66, 0}}, color = {0, 0, 255}, smooth = Smooth.None), Line(points = {{100, 0}, {94, 0}, {96, 0}}, color = {0, 0, 255}, smooth = Smooth.None), Line(points = {{82, -12}, {82, -44}, {-48, -44}, {-48, 0}, {-48, 0}}, color = {0, 0, 255}, smooth = Smooth.None), Text(extent = {{74, 4}, {84, -2}}, lineColor = {0, 0, 255}, textString = "%Angle%"), Text(extent = {{-28, 78}, {40, 46}}, lineColor = {0, 128, 0}, textString = "%PST%")}), Documentation(info = "<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\"><tr>
<td><p>Reference</p></td>
<td><p>PSAT Manual 2.1.8</p></td>
</tr>
<tr>
<td><p>Last update</p></td>
<td><p>15/07/2015</p></td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p>MAA Murad, SmarTS Lab, KTH Royal Institute of Technology</p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p><a href=\"mailto:luigiv@kth.se\">luigiv@kth.se</a></p></td>
</tr>
</table>
<p><br><span style=\"font-family: MS Shell Dlg 2;\">&LT;iPSL: iTesla Power System Library&GT;</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Copyright 2015 RTE (France), AIA (Spain), KTH (Sweden) and DTU (Denmark)</span></p>
<ul>
<li><span style=\"font-family: MS Shell Dlg 2;\">RTE: http://www.rte-france.com/ </span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">AIA: http://www.aia.es/en/energy/</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">KTH: https://www.kth.se/en</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">DTU:http://www.dtu.dk/english</span></li>
</ul>
<p><span style=\"font-family: MS Shell Dlg 2;\">The authors can be contacted by email: info at itesla-ipsl dot org</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">This package is part of the iTesla Power System Library (&QUOT;iPSL&QUOT;) .</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is free software: you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">You should have received a copy of the GNU Lesser General Public License along with the iPSL. If not, see &LT;http://www.gnu.org/licenses/&GT;.</span></p>
</html>"));
          end PSTransformer;
          annotation(Documentation(info = "<html>
<p><br><span style=\"font-family: MS Shell Dlg 2;\">&LT;iPSL: iTesla Power System Library&GT;</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Copyright 2015 RTE (France), AIA (Spain), KTH (Sweden) and DTU (Denmark)</span></p>
<ul>
<li><span style=\"font-family: MS Shell Dlg 2;\">RTE: http://www.rte-france.com/ </span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">AIA: http://www.aia.es/en/energy/</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">KTH: https://www.kth.se/en</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">DTU:http://www.dtu.dk/english</span></li>
</ul>
<p><span style=\"font-family: MS Shell Dlg 2;\">The authors can be contacted by email: info at itesla-ipsl dot org</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">This package is part of the iTesla Power System Library (&QUOT;iPSL&QUOT;) .</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is free software: you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">You should have received a copy of the GNU Lesser General Public License along with the iPSL. If not, see &LT;http://www.gnu.org/licenses/&GT;.</span></p>
</html>"));
        end PhaseShiftingTransformer;

        package PhaseShiftingTransformer_1
          model pst2 "Angle part of PST"
            constant Real pi = Modelica.Constants.pi;
            parameter Real SystemBase = 100;
            parameter Real Vbus1 = 20000 "Sending end Bus nominal voltage, change of base";
            parameter Real Vbus2 = 20000 "Receiving end Bus voltage, change of base";
            parameter Real Sn = 100 "Power rating MVA";
            parameter Real Vn1 = 20000 "Primary Voltage rating,KV";
            parameter Real Vn2 = 20000 "Secondary voltage rating, KV";
            parameter Real fn = 50 "Frequency rating Hz";
            parameter Real Tm = 0.001 "Measurement time constant, s";
            parameter Real Kp = 0.05 "Proportional gain";
            parameter Real Ki = 0.01 "Integral gain";
            parameter Real p_ref = 0.01 "Reference Power, p.u.";
            parameter Real alpha_max = pi / 2 "Maximum phase angle, rad";
            parameter Real alpha_min = -pi / 2 "Minimum phase angle, rad";
            parameter Real xT = 0.1 "Transformer Reactance, p.u.";
            parameter Real rT = 0.01 "Transformer Resistance, p.u.";
            parameter Real m = 0.98 "Transformer fixed tap  ratio, p.u./p.u.";
            parameter Real alpha0 = 0.002062339234360 "Initial angle, from power flow";
            parameter Real pmes0 = 0.01 "from power flow";
            parameter Real vm0 = 1.007257703014177 "Receiving end bus voltage, from power flow";
            parameter Real anglevm0 = -0.009372077496959 "Receiving end bus angle, from power flow";
            Real vk;
            Real vm(start = vm0) "Voltage at secondary p.u.";
            Real anglevk "Angle at primary";
            Real anglevm;
            Real alpha;
            Real pmes;
            iPSL.Connectors.PwPin p annotation(Placement(visible = true, transformation(extent = {{-120, -8}, {-100, 12}})));
            iPSL.Connectors.PwPin n annotation(Placement(transformation(extent = {{100, -8}, {120, 12}})));
            Modelica.Blocks.Interfaces.RealInput pk annotation(Placement(transformation(extent = {{-142, -62}, {-102, -22}})));
          protected
            parameter Real Vb2new = Vbus1 * Vbus1;
            parameter Real Vb2old = Vn1 * Vn1;
            parameter Real R = rT * (Vb2old * SystemBase) / (Vb2new * Sn) "Transformer Resistance, p.u.";
            parameter Real X = xT * (Vb2old * SystemBase) / (Vb2new * Sn) "Transformer Reactance, p.u.";
            parameter Real pref = p_ref * (Sn / SystemBase);
            parameter Real gt = R / (R ^ 2 + X ^ 2) "Converting resistance to conductance p.u.";
            parameter Real bt = -X / (R ^ 2 + X ^ 2) "Converting reactance to susceptance p.u.";
          initial equation
            alpha = alpha0;
            pmes = pmes0;
          equation
            vk = sqrt(p.vr ^ 2 + p.vi ^ 2);
            vm = sqrt(n.vr ^ 2 + n.vi ^ 2);
            anglevk = atan2(p.vi, p.vr);
            anglevm = atan2(n.vi, n.vr);
            if alpha > alpha_max and der(alpha) > 0 and der(pmes) > 0 then
              der(alpha) = 0;
              der(pmes) = (pk - pmes) / Tm;
              p.vr = n.vr * cos(alpha_max) - n.vi * sin(alpha_max);
              p.vi = n.vr * sin(alpha_max) + n.vi * cos(alpha_max);
              p.ir + n.ir = 0;
              p.ii + n.ii = 0;
            elseif alpha < alpha_min and der(alpha) < 0 and der(pmes) < 0 then
              der(alpha) = 0;
              der(pmes) = (pk - pmes) / Tm;
              p.vr = n.vr * cos(alpha_min) - n.vi * sin(alpha_min);
              p.vi = n.vr * sin(alpha_min) + n.vi * cos(alpha_min);
              p.ir + n.ir = 0;
              p.ii + n.ii = 0;
            else
              der(alpha) = Kp * (pk - pmes) / Tm + Ki * (pmes - pref);
              der(pmes) = (pk - pmes) / Tm;
              p.vr = n.vr * cos(alpha) - n.vi * sin(alpha);
              p.vi = n.vr * sin(alpha) + n.vi * cos(alpha);
              p.ir + n.ir = 0;
              p.ii + n.ii = 0;
            end if;
            annotation(Placement(transformation(extent = {{-120, -10}, {-100, 10}})), Placement(transformation(extent = {{100, -10}, {120, 10}})), Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics), Documentation(info = "<html>
<p><br><span style=\"font-family: MS Shell Dlg 2;\">&LT;iPSL: iTesla Power System Library&GT;</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Copyright 2015 RTE (France), AIA (Spain), KTH (Sweden) and DTU (Denmark)</span></p>
<ul>
<li><span style=\"font-family: MS Shell Dlg 2;\">RTE: http://www.rte-france.com/ </span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">AIA: http://www.aia.es/en/energy/</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">KTH: https://www.kth.se/en</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">DTU:http://www.dtu.dk/english</span></li>
</ul>
<p><span style=\"font-family: MS Shell Dlg 2;\">The authors can be contacted by email: info at itesla-ipsl dot org</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">This package is part of the iTesla Power System Library (&QUOT;iPSL&QUOT;) .</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is free software: you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">You should have received a copy of the GNU Lesser General Public License along with the iPSL. If not, see &LT;http://www.gnu.org/licenses/&GT;.</span></p>
</html>"));
          end pst2;

          model pst1 "Tap ratio part of the PST"
            constant Real pi = Modelica.Constants.pi;
            parameter Real SystemBase = 100;
            parameter Real Vbus1 = 20000 "Sending end Bus nominal voltage, change of base";
            parameter Real Vbus2 = 20000 "Receiving end Bus voltage, change of base";
            parameter Real Sn = 100 "Power rating MVA";
            parameter Real Vn1 = 20000 "Primary Voltage rating, V";
            parameter Real Vn2 = 20000 "Secondary voltage rating, V";
            parameter Real fn = 50 "Frequency rating Hz";
            parameter Real Tm = 0.001 "Measurement time constant, s";
            parameter Real Kp = 0.05 "Proportional gain";
            parameter Real Ki = 0.01 "Integral gain";
            parameter Real p_ref = 0.01 "Reference Power, p.u.";
            parameter Real alpha_max = pi / 2 "Maximum phase angle, rad";
            parameter Real alpha_min = -pi / 2 "Minimum phase angle, rad";
            parameter Real xT = 0.1 "Transformer Reactance, p.u.";
            parameter Real rT = 0.01 "Transformer Resistance, p.u.";
            parameter Real m = 0.98 "Transformer fixed tap  ratio, p.u./p.u.";
            parameter Real alpha0 = 0.002062339234360 "Initial angle, from power flow";
            parameter Real pmes0 = 0.01 "from power flow";
            parameter Real vk0 = 0.997649085060455 "Sending end bus voltage, from power flow";
            parameter Real anglevk0 = -0.007392164704867 "Sending end bus angle, from power flow";
            Real vk(start = vk0) "Voltage at primary, p.u.";
            Real vm;
            Real anglevk(start = anglevk0);
            Real anglevm;
            iPSL.Connectors.PwPin p annotation(Placement(visible = true, transformation(extent = {{-120, -8}, {-100, 12}})));
            iPSL.Connectors.PwPin n annotation(Placement(transformation(extent = {{100, -8}, {120, 12}})));
          protected
            parameter Real Vb2new = Vbus1 * Vbus1;
            parameter Real Vb2old = Vn1 * Vn1;
            parameter Real R = rT * (Vb2old * SystemBase) / (Vb2new * Sn) "Transformer Resistance, p.u.";
            parameter Real X = xT * (Vb2old * SystemBase) / (Vb2new * Sn) "Transformer Reactance, p.u.";
            parameter Real pref = p_ref * (Sn / SystemBase);
            parameter Real gt = R / (R ^ 2 + X ^ 2) "Converting resistance to conductance p.u.";
            parameter Real bt = -X / (R ^ 2 + X ^ 2) "Converting reactance to susceptance p.u.";
          equation
            vk = sqrt(p.vr ^ 2 + p.vi ^ 2);
            vm = sqrt(n.vr ^ 2 + n.vi ^ 2);
            anglevk = atan2(p.vi, p.vr);
            anglevm = atan2(n.vi, n.vr);
            R * p.ir - X * p.ii = 1 / m ^ 2 * p.vr - 1 / m * n.vr;
            R * p.ii + X * p.ir = 1 / m ^ 2 * p.vi - 1 / m * n.vi;
            R * n.ir - X * n.ii = n.vr - 1 / m * p.vr;
            X * n.ir + R * n.ii = n.vi - 1 / m * p.vi;
            annotation(Placement(transformation(extent = {{-120, -10}, {-100, 10}})), Placement(transformation(extent = {{100, -10}, {120, 10}})), Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics), Documentation(info = "<html>
<p><br><span style=\"font-family: MS Shell Dlg 2;\">&LT;iPSL: iTesla Power System Library&GT;</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Copyright 2015 RTE (France), AIA (Spain), KTH (Sweden) and DTU (Denmark)</span></p>
<ul>
<li><span style=\"font-family: MS Shell Dlg 2;\">RTE: http://www.rte-france.com/ </span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">AIA: http://www.aia.es/en/energy/</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">KTH: https://www.kth.se/en</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">DTU:http://www.dtu.dk/english</span></li>
</ul>
<p><span style=\"font-family: MS Shell Dlg 2;\">The authors can be contacted by email: info at itesla-ipsl dot org</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">This package is part of the iTesla Power System Library (&QUOT;iPSL&QUOT;) .</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is free software: you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">You should have received a copy of the GNU Lesser General Public License along with the iPSL. If not, see &LT;http://www.gnu.org/licenses/&GT;.</span></p>
</html>"));
          end pst1;

          model PSTransformer
            constant Real pi = Modelica.Constants.pi;
            parameter Real SystemBase = 100;
            parameter Real Vbus1 = 20000 "Sending end Bus nominal voltage, change of base";
            parameter Real Vbus2 = 20000 "Receiving end Bus voltage, change of base";
            parameter Real Sn = 100 "Power rating MVA";
            parameter Real Vn1 = 20000 "Primary Voltage rating,KV";
            parameter Real Vn2 = 20000 "Secondary voltage rating, KV";
            parameter Real fn = 50 "Frequency rating Hz";
            parameter Real Tm = 0.001 "Measurement time constant, s";
            parameter Real Kp = 0.05 "Proportional gain";
            parameter Real Ki = 0.01 "Integral gain";
            parameter Real p_ref = 0.01 "Reference Power, p.u.";
            parameter Real alpha_max = pi / 2 "Maximum phase angle, rad";
            parameter Real alpha_min = -pi / 2 "Minimum phase angle, rad";
            parameter Real xT = 0.1 "Transformer Reactance, p.u.";
            parameter Real rT = 0.01 "Transformer Resistance, p.u.";
            parameter Real m = 0.98 "Transformer fixed tap  ratio, p.u./p.u.";
            parameter Real alpha0 = 0.002062339234360 "Initial angle, from power flow";
            parameter Real pmes0 = 0.01 "from power flow";
            parameter Real vk0 = 0.997649085060455 "Sending end bus voltage, from power flow";
            parameter Real vm0 = 1.007257703014177 "Receiving end bus voltage, from power flow";
            parameter Real anglevk0 = -0.007392164704867 "Sending end bus angle, from power flow";
            parameter Real anglevm0 = -0.009372077496959 "Receiving end bus angle, from power flow";
            Real vk(start = vk0);
            Real vm(start = vm0);
            Real anglevk(start = anglevk0);
            Real anglevm(start = anglevm0);
            iPSL.Connectors.PwPin p(vr(start = vr0), vi(start = vi0)) annotation(Placement(transformation(extent = {{-122, -8}, {-102, 12}})));
            iPSL.Connectors.PwPin n annotation(Placement(transformation(extent = {{100, -10}, {120, 10}})));
            Modelica.Blocks.Interfaces.RealOutput pk(start = p_ref) annotation(Placement(transformation(extent = {{100, -50}, {120, -30}}), iconTransformation(extent = {{100, -50}, {120, -30}})));
            Modelica.Blocks.Interfaces.RealInput u annotation(Placement(transformation(extent = {{-144, 36}, {-104, 76}})));
            pst1 pst1_1(alpha_max = alpha_max, SystemBase = SystemBase, Vbus1 = Vbus1, Vbus2 = Vbus2, Sn = Sn, Vn1 = Vn1, Vn2 = Vn2, fn = fn, Tm = Tm, Kp = Kp, Ki = Ki, p_ref = p_ref, alpha_min = alpha_min, xT = xT, rT = rT, m = m, alpha0 = alpha0, pmes0 = pmes0, vk0 = vk0, anglevk0 = anglevk0) annotation(Placement(transformation(extent = {{-46, -10}, {-26, 10}})));
            pst2 pst2_1(SystemBase = SystemBase, Vbus1 = Vbus1, Vbus2 = Vbus2, Sn = Sn, Vn1 = Vn1, Vn2 = Vn2, fn = fn, Tm = Tm, Kp = Kp, Ki = Ki, p_ref = p_ref, alpha_max = alpha_max, alpha_min = alpha_min, xT = xT, rT = rT, m = m, alpha0 = alpha0, pmes0 = pmes0, vm0 = vm0, anglevm0 = anglevm0) annotation(Placement(transformation(extent = {{16, -10}, {36, 10}})));
          protected
            parameter Real Vb2new = Vbus1 * Vbus1;
            parameter Real Vb2old = Vn1 * Vn1;
            parameter Real R = rT * (Vb2old * SystemBase) / (Vb2new * Sn) "Transformer Resistance, p.u.";
            parameter Real X = xT * (Vb2old * SystemBase) / (Vb2new * Sn) "Transformer Reactance, p.u.";
            parameter Real pref = p_ref * (Sn / SystemBase);
            parameter Real gt = R / (R ^ 2 + X ^ 2) "Converting resistance to conductance p.u.";
            parameter Real bt = -X / (R ^ 2 + X ^ 2) "Converting reactance to susceptance p.u.";
            parameter Real vr0 = vk0 * cos(anglevk0) "Initialitation";
            parameter Real vi0 = vm0 * sin(anglevk0) "Initialitation";
          equation
            vk = sqrt(p.vr ^ 2 + p.vi ^ 2);
            vm = sqrt(n.vr ^ 2 + n.vi ^ 2);
            anglevk = atan2(p.vi, p.vr);
            anglevm = atan2(n.vi, n.vr);
            pk = p.vr * p.ir + p.vi * p.ii;
            connect(pst2_1.n, n) annotation(Line(points = {{37, 0.2}, {70.5, 0.2}, {70.5, 0}, {110, 0}}, color = {0, 0, 255}, smooth = Smooth.None));
            connect(pst2_1.p, pst1_1.n) annotation(Line(points = {{15, 0.2}, {-25, 0.2}}, color = {0, 0, 255}, smooth = Smooth.None));
            connect(pst1_1.p, p) annotation(Line(points = {{-47, 0.2}, {-76.5, 0.2}, {-76.5, 2}, {-112, 2}}, color = {0, 0, 255}, smooth = Smooth.None));
            connect(u, pst2_1.pk) annotation(Line(points = {{-124, 56}, {-8, 56}, {-8, -4.2}, {13.8, -4.2}}, color = {0, 0, 127}, smooth = Smooth.None));
            annotation(Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics), Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Ellipse(extent = {{-48, 24}, {10, -32}}, lineColor = {0, 0, 255}), Ellipse(extent = {{-6, 26}, {52, -30}}, lineColor = {0, 0, 255}), Line(points = {{-104, 0}, {-48, 0}}, color = {0, 0, 255}, smooth = Smooth.None), Rectangle(extent = {{66, 10}, {94, -12}}, lineColor = {0, 0, 255}), Line(points = {{50, 0}, {66, 0}, {66, 0}}, color = {0, 0, 255}, smooth = Smooth.None), Line(points = {{100, 0}, {94, 0}, {96, 0}}, color = {0, 0, 255}, smooth = Smooth.None), Line(points = {{82, -12}, {82, -44}, {-48, -44}, {-48, 0}, {-48, 0}}, color = {0, 0, 255}, smooth = Smooth.None), Text(extent = {{74, 4}, {84, -2}}, lineColor = {0, 0, 255}, textString = "%Angle%"), Text(extent = {{-28, 78}, {40, 46}}, lineColor = {0, 128, 0}, textString = "%PST%")}), Documentation(info = "<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\"><tr>
<td><p>Reference</p></td>
<td><p>PSAT Manual 2.1.8</p></td>
</tr>
<tr>
<td><p>Last update</p></td>
<td><p>15/07/2015</p></td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p>MAA Murad, SmarTS Lab, KTH Royal Institute of Technology</p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p><a href=\"mailto:luigiv@kth.se\">luigiv@kth.se</a></p></td>
</tr>
</table>
<p><br><span style=\"font-family: MS Shell Dlg 2;\">&LT;iPSL: iTesla Power System Library&GT;</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Copyright 2015 RTE (France), AIA (Spain), KTH (Sweden) and DTU (Denmark)</span></p>
<ul>
<li><span style=\"font-family: MS Shell Dlg 2;\">RTE: http://www.rte-france.com/ </span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">AIA: http://www.aia.es/en/energy/</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">KTH: https://www.kth.se/en</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">DTU:http://www.dtu.dk/english</span></li>
</ul>
<p><span style=\"font-family: MS Shell Dlg 2;\">The authors can be contacted by email: info at itesla-ipsl dot org</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">This package is part of the iTesla Power System Library (&QUOT;iPSL&QUOT;) .</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is free software: you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">You should have received a copy of the GNU Lesser General Public License along with the iPSL. If not, see &LT;http://www.gnu.org/licenses/&GT;.</span></p>
</html>"));
          end PSTransformer;
          annotation(Documentation(info = "<html>
<p><br><span style=\"font-family: MS Shell Dlg 2;\">&LT;iPSL: iTesla Power System Library&GT;</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Copyright 2015 RTE (France), AIA (Spain), KTH (Sweden) and DTU (Denmark)</span></p>
<ul>
<li><span style=\"font-family: MS Shell Dlg 2;\">RTE: http://www.rte-france.com/ </span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">AIA: http://www.aia.es/en/energy/</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">KTH: https://www.kth.se/en</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">DTU:http://www.dtu.dk/english</span></li>
</ul>
<p><span style=\"font-family: MS Shell Dlg 2;\">The authors can be contacted by email: info at itesla-ipsl dot org</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">This package is part of the iTesla Power System Library (&QUOT;iPSL&QUOT;) .</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is free software: you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">You should have received a copy of the GNU Lesser General Public License along with the iPSL. If not, see &LT;http://www.gnu.org/licenses/&GT;.</span></p>
</html>"));
        end PhaseShiftingTransformer_1;

        model TwoWindingTransformerFixedTapRatio "Modeled as series reactances without iron losses"
          iPSL.Connectors.PwPin p annotation(Placement(transformation(extent = {{-120, -10}, {-100, 10}})));
          iPSL.Connectors.PwPin n annotation(Placement(transformation(extent = {{100, -10}, {120, 10}})));
          parameter Real Sb = 100 "System base power (MVA)" annotation(Dialog(group = "Power flow data"));
          parameter Real Sn = 100 "Power rating (MVA)" annotation(Dialog(group = "Power flow data"));
          parameter Real Vbus = 400000 "Sending end bus voltage" annotation(Dialog(group = "Power flow data"));
          parameter Real Vn = 400000 "Voltage rating (kV)" annotation(Dialog(group = "Power flow data"));
          parameter Real fn = 50 "Frequency rating (Hz)" annotation(Dialog(group = "Power flow data"));
          parameter Real kT = 1 "Nominal tap ratio (V1/V2)" annotation(Dialog(group = "Transformer data"));
          parameter Real x = 0.20 "Reactance (pu)" annotation(Dialog(group = "Transformer data"));
          parameter Real r = 0.01 "resistance (pu)" annotation(Dialog(group = "Transformer data"));
          parameter Real m = 1.0 "Fixed tap ratio" annotation(Dialog(group = "Transformer data"));
        protected
          parameter Real Vb2new = Vbus * Vbus;
          parameter Real Vb2old = Vn * Vn;
          parameter Real xT = x * (Vb2old * Sb) / (Vb2new * Sn) "Reactance(inductive),p.u";
          parameter Real rT = r * (Vb2old * Sb) / (Vb2new * Sn) "Reactance(capacitive),p.u";
        equation
          rT * p.ir - xT * p.ii = 1 / m ^ 2 * p.vr - 1 / m * n.vr;
          rT * p.ii + xT * p.ir = 1 / m ^ 2 * p.vi - 1 / m * n.vi;
          rT * n.ir - xT * n.ii = n.vr - 1 / m * p.vr;
          xT * n.ir + rT * n.ii = n.vi - 1 / m * p.vi;
          annotation(Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics), Documentation(info = "<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\"><tr>
<td><p>Reference</p></td>
<td><p>PSAT Manual 2.1.8</p></td>
</tr>
<tr>
<td><p>Last update</p></td>
<td><p>29/09/2015</p></td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p>MAA Murad, SmarTS Lab, KTH Royal Institute of Technology</p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p><a href=\"mailto:luigiv@kth.se\">luigiv@kth.se</a></p></td>
</tr>
</table>
<p><br><span style=\"font-family: MS Shell Dlg 2;\">&LT;iPSL: iTesla Power System Library&GT;</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Copyright 2015 RTE (France), AIA (Spain), KTH (Sweden) and DTU (Denmark)</span></p>
<ul>
<li><span style=\"font-family: MS Shell Dlg 2;\">RTE: http://www.rte-france.com/ </span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">AIA: http://www.aia.es/en/energy/</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">KTH: https://www.kth.se/en</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">DTU:http://www.dtu.dk/english</span></li>
</ul>
<p><span style=\"font-family: MS Shell Dlg 2;\">The authors can be contacted by email: info at itesla-ipsl dot org</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">This package is part of the iTesla Power System Library (&QUOT;iPSL&QUOT;) .</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is free software: you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">You should have received a copy of the GNU Lesser General Public License along with the iPSL. If not, see &LT;http://www.gnu.org/licenses/&GT;.</span></p>
</html>"), Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Ellipse(extent = {{-46, 30}, {8, -30}}, lineColor = {0, 0, 255}), Ellipse(extent = {{-10, 30}, {44, -30}}, lineColor = {0, 0, 255}), Line(points = {{100, 0}, {44, 0}, {44, 0}}, color = {0, 0, 255}, smooth = Smooth.None), Line(points = {{-100, 0}, {-46, 0}}, color = {0, 0, 255}, smooth = Smooth.None), Line(points = {{-64, -44}, {-22, 12}}, color = {28, 108, 200}), Line(points = {{-34, 6}, {-22, 12}}, color = {28, 108, 200}), Line(points = {{-24, 0}}, color = {28, 108, 200}), Line(points = {{-26, 0}, {-22, 12}}, color = {28, 108, 200})}));
        end TwoWindingTransformerFixedTapRatio;

        model TWTransformerWithFixedTapRatio "Modeled as series reactances without iron losses"
          iPSL.Connectors.PwPin p annotation(Placement(transformation(extent = {{-120, -10}, {-100, 10}})));
          iPSL.Connectors.PwPin n annotation(Placement(transformation(extent = {{100, -10}, {120, 10}})));
          parameter Real SystemBase = 100;
          parameter Real Sn = 100 "Power rating MVA";
          parameter Real Vbus = 400000 "Sending end bus voltage";
          parameter Real Vn1 = 400000 "Voltage rating of primary winding KV";
          parameter Real fn = 50 "Frequency rating Hz";
          parameter Real kT = 1 "Nominal Tap ratio (V1/V2), kV/kV";
          parameter Real X = 0.20 "Transformer reactance, p.u.";
          parameter Real R = 0.01 "Transformer resistance, p.u.";
          parameter Real m = 1.0 "Fixed Tap ratio";
        protected
          parameter Real Vb2new = Vbus * Vbus;
          parameter Real Vb2old = Vn1 * Vn1;
          parameter Real xT = X * (Vb2old * SystemBase) / (Vb2new * Sn) "Reactance(inductive),p.u";
          parameter Real rT = R * (Vb2old * SystemBase) / (Vb2new * Sn) "Reactance(capacitive),p.u";
        equation
          rT * p.ir - xT * p.ii = 1 / m ^ 2 * p.vr - 1 / m * n.vr;
          rT * p.ii + xT * p.ir = 1 / m ^ 2 * p.vi - 1 / m * n.vi;
          rT * n.ir - xT * n.ii = n.vr - 1 / m * p.vr;
          xT * n.ir + rT * n.ii = n.vi - 1 / m * p.vi;
          annotation(Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics), Icon(graphics = {Ellipse(extent = {{-46, 30}, {8, -30}}, lineColor = {0, 0, 255}), Ellipse(extent = {{-10, 30}, {44, -30}}, lineColor = {0, 0, 255}), Line(points = {{100, 0}, {44, 0}, {44, 0}}, color = {0, 0, 255}, smooth = Smooth.None), Line(points = {{-100, 0}, {-46, 0}}, color = {0, 0, 255}, smooth = Smooth.None), Line(points = {{-52, -28}, {-24, 20}}, color = {28, 108, 200}), Line(points = {{-34, 12}, {-24, 20}}, color = {28, 108, 200}), Line(points = {{-26, 8}, {-24, 20}}, color = {28, 108, 200})}), Documentation(info = "<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\"><tr>
<td><p>Reference</p></td>
<td><p>PSAT Manual 2.1.8</p></td>
</tr>
<tr>
<td><p>Last update</p></td>
<td><p>15/07/2015</p></td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p>MAA Murad, SmarTS Lab, KTH Royal Institute of Technology</p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p><a href=\"mailto:luigiv@kth.se\">luigiv@kth.se</a></p></td>
</tr>
</table>
<p><br><span style=\"font-family: MS Shell Dlg 2;\">&LT;iPSL: iTesla Power System Library&GT;</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Copyright 2015 RTE (France), AIA (Spain), KTH (Sweden) and DTU (Denmark)</span></p>
<ul>
<li><span style=\"font-family: MS Shell Dlg 2;\">RTE: http://www.rte-france.com/ </span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">AIA: http://www.aia.es/en/energy/</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">KTH: https://www.kth.se/en</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">DTU:http://www.dtu.dk/english</span></li>
</ul>
<p><span style=\"font-family: MS Shell Dlg 2;\">The authors can be contacted by email: info at itesla-ipsl dot org</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">This package is part of the iTesla Power System Library (&QUOT;iPSL&QUOT;) .</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is free software: you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">You should have received a copy of the GNU Lesser General Public License along with the iPSL. If not, see &LT;http://www.gnu.org/licenses/&GT;.</span></p>
</html>"));
        end TWTransformerWithFixedTapRatio;
        annotation(Documentation(info = "<html>
<p><br><span style=\"font-family: MS Shell Dlg 2;\">&LT;iPSL: iTesla Power System Library&GT;</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Copyright 2015 RTE (France), AIA (Spain), KTH (Sweden) and DTU (Denmark)</span></p>
<ul>
<li><span style=\"font-family: MS Shell Dlg 2;\">RTE: http://www.rte-france.com/ </span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">AIA: http://www.aia.es/en/energy/</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">KTH: https://www.kth.se/en</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">DTU:http://www.dtu.dk/english</span></li>
</ul>
<p><span style=\"font-family: MS Shell Dlg 2;\">The authors can be contacted by email: info at itesla-ipsl dot org</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">This package is part of the iTesla Power System Library (&QUOT;iPSL&QUOT;) .</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is free software: you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">You should have received a copy of the GNU Lesser General Public License along with the iPSL. If not, see &LT;http://www.gnu.org/licenses/&GT;.</span></p>
</html>"));
      end PSAT;
      annotation(Documentation(info = "<html>
<p><br><span style=\"font-family: MS Shell Dlg 2;\">&LT;iPSL: iTesla Power System Library&GT;</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Copyright 2015 RTE (France), AIA (Spain), KTH (Sweden) and DTU (Denmark)</span></p>
<ul>
<li><span style=\"font-family: MS Shell Dlg 2;\">RTE: http://www.rte-france.com/ </span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">AIA: http://www.aia.es/en/energy/</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">KTH: https://www.kth.se/en</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">DTU:http://www.dtu.dk/english</span></li>
</ul>
<p><span style=\"font-family: MS Shell Dlg 2;\">The authors can be contacted by email: info at itesla-ipsl dot org</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">This package is part of the iTesla Power System Library (&QUOT;iPSL&QUOT;) .</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is free software: you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">You should have received a copy of the GNU Lesser General Public License along with the iPSL. If not, see &LT;http://www.gnu.org/licenses/&GT;.</span></p>
</html>"));
    end Branches;

    package Machines
      package PSAT
        package SecondOrder
          model Order2 "Second Order Synchronous Machine with Inputs and Outputs"
            import Modelica.Constants.pi;
            extends BaseClasses.baseMachine(delta(start = delta0), pe(start = pm00), pm(start = pm00), pm0(start = pm00), vf(start = vf00), vf0(start = vf00), vq(start = vq0), vd(start = vd0), iq(start = iq0), id(start = id0));
          protected
            parameter Real c1 = Ra * K "CONSTANT";
            parameter Real c2 = x1d * K "CONSTANT";
            parameter Real c3 = x1d * K " CONSTANT";
            parameter Real K = 1 / (Ra * Ra + x1d * x1d) "CONSTANT";
            parameter Real delta0 = atan2(vi0 + Ra * ii0 + x1d * ir0, vr0 + Ra * ir0 - x1d * ii0) "Initial rotor angle";
            parameter Real pm00 = (vq0 + Ra * iq0) * iq0 + (vd0 + Ra * id0) * id0 "Initialitation";
            parameter Real vf00 = vq0 + Ra * iq0 + x1d * id0 "Initialitation";
            parameter Real vd0 = vr0 * cos(pi / 2 - delta0) - vi0 * sin(pi / 2 - delta0) "Initialitation";
            parameter Real vq0 = vr0 * sin(pi / 2 - delta0) + vi0 * cos(pi / 2 - delta0) "Initialitation";
            parameter Real id0 = ir0 * cos(pi / 2 - delta0) - ii0 * sin(pi / 2 - delta0) "Initialitation";
            parameter Real iq0 = ir0 * sin(pi / 2 - delta0) + ii0 * cos(pi / 2 - delta0) "Initialitation";
          equation
            id = (-c1 * vd) - c3 * vq + vf * c3;
            iq = c2 * vd - c1 * vq + vf * c1;
            pm0 = pm00;
            vf0 = vf00;
            annotation(Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = false, initialScale = 0.1, grid = {10, 10}), graphics = {Text(origin = {4, 61.9022}, fillPattern = FillPattern.Solid, extent = {{-57.2101, -15.0}, {57.2101, 15.0}}, fontName = "Arial", lineColor = {28, 108, 200}, textString = "Order II")}), Diagram(coordinateSystem(extent = {{-148.5, -105}, {148.5, 105}}, preserveAspectRatio = false, initialScale = 0.1, grid = {5, 5})), Documentation(info = "<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\">
<tr>
<td><p>Reference</p></td>
<td><p>Order II Synchonous Machine, PSAT Manual 2.1.8</p></td>
</tr>
<tr>
<td><p>Last update</p></td>
<td>September 2015</td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p>Joan Russinol, SmarTS Lab, KTH Royal Institute of Technology</p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p><a href=\"mailto:luigiv@kth.se\">luigiv@kth.se</a></p></td>
</tr>
</table>
<p><br><span style=\"font-family: MS Shell Dlg 2;\">&LT;iPSL: iTesla Power System Library&GT;</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Copyright 2015 RTE (France), AIA (Spain), KTH (Sweden) and DTU (Denmark)</span></p>
<ul>
<li><span style=\"font-family: MS Shell Dlg 2;\">RTE: http://www.rte-france.com/ </span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">AIA: http://www.aia.es/en/energy/</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">KTH: https://www.kth.se/en</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">DTU:http://www.dtu.dk/english</span></li>
</ul>
<p><span style=\"font-family: MS Shell Dlg 2;\">The authors can be contacted by email: info at itesla-ipsl dot org</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">This package is part of the iTesla Power System Library (&QUOT;iPSL&QUOT;) .</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is free software: you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">You should have received a copy of the GNU Lesser General Public License along with the iPSL. If not, see &LT;http://www.gnu.org/licenses/&GT;.</span></p>
</html>"));
          end Order2;
          annotation(Documentation(info = "<html>
<p><br><span style=\"font-family: MS Shell Dlg 2;\">&LT;iPSL: iTesla Power System Library&GT;</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Copyright 2015 RTE (France), AIA (Spain), KTH (Sweden) and DTU (Denmark)</span></p>
<ul>
<li><span style=\"font-family: MS Shell Dlg 2;\">RTE: http://www.rte-france.com/ </span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">AIA: http://www.aia.es/en/energy/</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">KTH: https://www.kth.se/en</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">DTU:http://www.dtu.dk/english</span></li>
</ul>
<p><span style=\"font-family: MS Shell Dlg 2;\">The authors can be contacted by email: info at itesla-ipsl dot org</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">This package is part of the iTesla Power System Library (&QUOT;iPSL&QUOT;) .</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is free software: you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">You should have received a copy of the GNU Lesser General Public License along with the iPSL. If not, see &LT;http://www.gnu.org/licenses/&GT;.</span></p>
</html>"));
        end SecondOrder;

        package ThirdOrder
          model Order3 "Third Order Synchronous Machine with Inputs and Outputs"
            import Modelica.Constants.pi;
            extends BaseClasses.baseMachine(delta(start = delta0), pe(start = pm00), pm(start = pm00), pm0(start = pm00), vf(start = vf00), vf0(start = vf00), vq(start = vq0), vd(start = vd0), iq(start = iq0), id(start = id0));
            parameter Real xd "d-axis synchronous reactance (pu)" annotation(Dialog(group = "Machine parameters"));
            parameter Real Td10 "d-axis open circuit transient time constant (s)" annotation(Dialog(group = "Machine parameters"));
            parameter Real xq "q-axis synchronous reactance (pu)" annotation(Dialog(group = "Machine parameters"));
            //Base changing
            Real e1q(start = e1q0) "q-axis transient voltage (pu)";
          protected
            parameter Real Xd = xd * CoB "d-axis reactance, p.u.";
            parameter Real x1d = xd1 * CoB "d-axis transient reactance, p.u.";
            parameter Real Xq = xq * CoB "q-axis reactance, p.u.";
            parameter Real m = M / CoB2 "Machanical starting time (2H), kWs/kVA";
            parameter Real c1 = Ra * K "CONSTANT";
            parameter Real c2 = x1d * K "CONSTANT";
            parameter Real c3 = Xq * K " CONSTANT";
            parameter Real K = 1 / (Ra * Ra + Xq * x1d) "CONSTANT";
            parameter Real delta0 = atan2(vi0 + Ra * ii0 + Xq * ir0, vr0 + Ra * ir0 - Xq * ii0) "Initialitation";
            parameter Real vd0 = vr0 * cos(pi / 2 - delta0) - vi0 * sin(pi / 2 - delta0) "Initialitation";
            parameter Real vq0 = vr0 * sin(pi / 2 - delta0) + vi0 * cos(pi / 2 - delta0) "Initialitation";
            parameter Real id0 = ir0 * cos(pi / 2 - delta0) - ii0 * sin(pi / 2 - delta0) "Initialitation";
            parameter Real iq0 = ir0 * sin(pi / 2 - delta0) + ii0 * cos(pi / 2 - delta0) "Initialitation";
            parameter Real pm00 = (vq0 + Ra * iq0) * iq0 + (vd0 + Ra * id0) * id0 "Initialitation";
            parameter Real vf00 = e1q0 + (Xd - x1d) * id0 "Initialitation";
            parameter Real e1q0 = vq0 + Ra * iq0 + x1d * id0 "Initialitation";
          initial equation
            der(e1q) = 0;
          equation
            der(e1q) = ((-e1q) - (Xd - x1d) * id + vf) / Td10;
            id = (-c1 * vd) - c3 * vq + e1q * c3;
            iq = c2 * vd - c1 * vq + e1q * c1;
            vf0 = vf00;
            pm0 = pm00;
            annotation(Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = false, initialScale = 0.1, grid = {10, 10}), graphics = {Text(origin = {4, 61.9022}, fillPattern = FillPattern.Solid, extent = {{-57.2101, -15.0}, {57.2101, 15.0}}, fontName = "Arial", lineColor = {28, 108, 200}, textString = "Order III")}), Diagram(coordinateSystem(extent = {{-148.5, -105.0}, {148.5, 105.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})), Documentation(info = "<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\">
<tr>
<td><p>Reference</p></td>
<td><p>Order III Synchonous Machine, PSAT Manual 2.1.8</p></td>
</tr>
<tr>
<td><p>Last update</p></td>
<td>September 2015</td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p>Joan Russinol, SmarTS Lab, KTH Royal Institute of Technology</p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p><a href=\"mailto:luigiv@kth.se\">luigiv@kth.se</a></p></td>
</tr>
</table>
<p><br><span style=\"font-family: MS Shell Dlg 2;\">&LT;iPSL: iTesla Power System Library&GT;</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Copyright 2015 RTE (France), AIA (Spain), KTH (Sweden) and DTU (Denmark)</span></p>
<ul>
<li><span style=\"font-family: MS Shell Dlg 2;\">RTE: http://www.rte-france.com/ </span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">AIA: http://www.aia.es/en/energy/</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">KTH: https://www.kth.se/en</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">DTU:http://www.dtu.dk/english</span></li>
</ul>
<p><span style=\"font-family: MS Shell Dlg 2;\">The authors can be contacted by email: info at itesla-ipsl dot org</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">This package is part of the iTesla Power System Library (&QUOT;iPSL&QUOT;) .</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is free software: you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">You should have received a copy of the GNU Lesser General Public License along with the iPSL. If not, see &LT;http://www.gnu.org/licenses/&GT;.</span></p>
</html>"));
          end Order3;
          annotation(Documentation(info = "<html>
<p><br><span style=\"font-family: MS Shell Dlg 2;\">&LT;iPSL: iTesla Power System Library&GT;</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Copyright 2015 RTE (France), AIA (Spain), KTH (Sweden) and DTU (Denmark)</span></p>
<ul>
<li><span style=\"font-family: MS Shell Dlg 2;\">RTE: http://www.rte-france.com/ </span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">AIA: http://www.aia.es/en/energy/</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">KTH: https://www.kth.se/en</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">DTU:http://www.dtu.dk/english</span></li>
</ul>
<p><span style=\"font-family: MS Shell Dlg 2;\">The authors can be contacted by email: info at itesla-ipsl dot org</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">This package is part of the iTesla Power System Library (&QUOT;iPSL&QUOT;) .</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is free software: you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">You should have received a copy of the GNU Lesser General Public License along with the iPSL. If not, see &LT;http://www.gnu.org/licenses/&GT;.</span></p>
</html>"));
        end ThirdOrder;

        package FourthOrder
          model Order4 "Fourth Order Synchronous Machine with Inputs and Outputs"
            import Modelica.Constants.pi;
            extends BaseClasses.baseMachine(delta(start = delta0), pe(start = pm00), pm(start = pm00), pm0(start = pm00), vf(start = vf00), vf0(start = vf00), vq(start = vq0), vd(start = vd0), iq(start = iq0), id(start = id0));
            parameter Real xd = 1.9 "d-axis synchronous reactance (pu)" annotation(Dialog(group = "Machine parameters"));
            parameter Real xq = 1.7 "q-axis synchronous reactance (pu)" annotation(Dialog(group = "Machine parameters"));
            parameter Real xq1 = 0.5 "q-axis transient reactance (pu)" annotation(Dialog(group = "Machine parameters"));
            parameter Real Td10 = 8 "d-axis open circuit transient time constant (s)" annotation(Dialog(group = "Machine parameters"));
            parameter Real Tq10 = 0.8 "q-axis open circuit transient time constant (s)" annotation(Dialog(group = "Machine parameters"));
            Real e1q(start = e1q0) "q-axis transient voltage (pu)";
            Real e1d(start = e1d0) "d-axis transient voltage (pu)";
          protected
            parameter Real Xd = xd * CoB "d-axis reactance, p.u.";
            parameter Real Xq = xq * CoB "q-axis reactance, p.u.";
            parameter Real x1q = xq1 * CoB "q-axis transient reactance, p.u.(only for order IV,V.1,VI,VIII)*";
            parameter Real vd0 = vr0 * cos(pi / 2 - delta0) - vi0 * sin(pi / 2 - delta0) "Initialitation";
            parameter Real vq0 = vr0 * sin(pi / 2 - delta0) + vi0 * cos(pi / 2 - delta0) "Initialitation";
            parameter Real id0 = ir0 * cos(pi / 2 - delta0) - ii0 * sin(pi / 2 - delta0) "Initialitation";
            parameter Real iq0 = ir0 * sin(pi / 2 - delta0) + ii0 * cos(pi / 2 - delta0) "Initialitation";
            parameter Real delta0 = atan2(vi0 + Ra * ii0 + Xq * ir0, vr0 + Ra * ir0 - Xq * ii0) "Initialitation";
            parameter Real pm00 = (vq0 + Ra * iq0) * iq0 + (vd0 + Ra * id0) * id0 "Initialitation";
            parameter Real vf00 = e1q0 + (Xd - x1d) * id0 "Initialitation";
            parameter Real e1q0 = vq0 + Ra * iq0 + x1d * id0 "Initialitation";
            parameter Real e1d0 = vd0 + Ra * id0 - x1q * iq0 "Initialitation *";
          equation
            der(e1q) = ((-e1q) - (Xd - x1d) * id + vf) / Td10;
            der(e1d) = ((-e1d) + (Xq - x1q) * iq) / Tq10 "differential equations *";
            e1q = vq + Ra * iq + x1d * id;
            e1d = vd + Ra * id - x1q * iq "relation between voltages and currents *";
            pm0 = pm00;
            vf0 = vf00;
            annotation(Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = false, initialScale = 0.1, grid = {10, 10}), graphics = {Text(origin = {4, 61.9022}, fillPattern = FillPattern.Solid, extent = {{-57.2101, -15.0}, {57.2101, 15.0}}, fontName = "Arial", lineColor = {28, 108, 200}, textString = "Order IV")}), Diagram(coordinateSystem(extent = {{-148.5, -105.0}, {148.5, 105.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})), Documentation(info = "<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\">
<tr>
<td><p>Reference</p></td>
<td>Generator Order IV, PSAT Manual</td>
</tr>
<tr>
<td><p>Last update</p></td>
<td>2015-10-02</td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p>Le Qi, SmarTS Lab, KTH Royal Institute of Technology</p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p><a href=\"mailto:luigiv@kth.se\">luigiv@kth.se</a></p></td>
</tr>
</table>
<p><br><span style=\"font-family: MS Shell Dlg 2;\">&LT;iPSL: iTesla Power System Library&GT;</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Copyright 2015 RTE (France), AIA (Spain), KTH (Sweden) and DTU (Denmark)</span></p>
<ul>
<li><span style=\"font-family: MS Shell Dlg 2;\">RTE: http://www.rte-france.com/ </span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">AIA: http://www.aia.es/en/energy/</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">KTH: https://www.kth.se/en</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">DTU:http://www.dtu.dk/english</span></li>
</ul>
<p><span style=\"font-family: MS Shell Dlg 2;\">The authors can be contacted by email: info at itesla-ipsl dot org</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">This package is part of the iTesla Power System Library (&QUOT;iPSL&QUOT;) .</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is free software: you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">You should have received a copy of the GNU Lesser General Public License along with the iPSL. If not, see &LT;http://www.gnu.org/licenses/&GT;.</span></p>
</html>"));
          end Order4;
          annotation(Documentation(info = "<html>
<p><br><span style=\"font-family: MS Shell Dlg 2;\">&LT;iPSL: iTesla Power System Library&GT;</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Copyright 2015 RTE (France), AIA (Spain), KTH (Sweden) and DTU (Denmark)</span></p>
<ul>
<li><span style=\"font-family: MS Shell Dlg 2;\">RTE: http://www.rte-france.com/ </span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">AIA: http://www.aia.es/en/energy/</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">KTH: https://www.kth.se/en</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">DTU:http://www.dtu.dk/english</span></li>
</ul>
<p><span style=\"font-family: MS Shell Dlg 2;\">The authors can be contacted by email: info at itesla-ipsl dot org</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">This package is part of the iTesla Power System Library (&QUOT;iPSL&QUOT;) .</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is free software: you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">You should have received a copy of the GNU Lesser General Public License along with the iPSL. If not, see &LT;http://www.gnu.org/licenses/&GT;.</span></p>
</html>"));
        end FourthOrder;

        package FifthOrder
          model Order5_Type1
            import Modelica.Constants.pi;
            extends BaseClasses.baseMachine(delta(start = delta0), pe(start = pm00), pm(start = pm00), pm0(start = pm00), vf(start = vf00), vf0(start = vf00), vq(start = vq0), vd(start = vd0), iq(start = iq0), id(start = id0));
            parameter Real xd = 1.9 "d-axis synchronous reactance (pu)" annotation(Dialog(group = "Machine parameters"));
            parameter Real xq = 1.7 "q-axis synchronous reactance (pu)" annotation(Dialog(group = "Machine parameters"));
            parameter Real xq1 = 0.5 "q-axis transient reactance (pu)" annotation(Dialog(group = "Machine parameters"));
            parameter Real Td10 = 8 "d-axis open circuit transient time constant (s)" annotation(Dialog(group = "Machine parameters"));
            parameter Real Tq10 = 0.8 "q-axis open circuit transient time constant (s)" annotation(Dialog(group = "Machine parameters"));
            parameter Real Tq20 = 0.02 "q-axis open circuit sub-transient time constant (s)" annotation(Dialog(group = "Machine parameters"));
            Real e1q(start = e1q0) "q-axis transient voltage";
            Real e1d(start = e1d0) "d-axis transient voltage";
            Real e2d(start = e2d0) "d-axis sub-transient voltage";
          protected
            parameter Real Xd = xd * CoB "d-axis reactance, p.u.";
            parameter Real Xq = xq * CoB "q-axis reactance, p.u.";
            parameter Real x1q = xq1 * CoB "q-axis transient reactance, p.u.(only for order IV,V.1,VI,VIII)*";
            parameter Real delta0 = atan2(vi0 + Ra * ii0 + Xq * ir0, vr0 + Ra * ir0 - Xq * ii0) "Initialitation";
            parameter Real vd0 = vr0 * cos(pi / 2 - delta0) - vi0 * sin(pi / 2 - delta0) "Initialitation";
            parameter Real vq0 = vr0 * sin(pi / 2 - delta0) + vi0 * cos(pi / 2 - delta0) "Initialitation";
            parameter Real id0 = ir0 * cos(pi / 2 - delta0) - ii0 * sin(pi / 2 - delta0) "Initialitation";
            parameter Real iq0 = ir0 * sin(pi / 2 - delta0) + ii0 * cos(pi / 2 - delta0) "Initialitation";
            parameter Real pm00 = (vq0 + Ra * iq0) * iq0 + (vd0 + Ra * id0) * id0 "Initialitation";
            parameter Real vf00 = e1q0 + (Xd - x1d) * id0 "Initialitation";
            parameter Real e1q0 = vq0 + Ra * iq0 + x1d * id0 "Initialitation";
            parameter Real e1d0 = vd0 + Ra * id0 - x1q * iq0 "Initialitation*";
            parameter Real e2d0 = vd0 + Ra * id0 - x1q * iq0 "Initialitation*/";
          equation
            der(e1q) = ((-e1q) - (Xd - x1d) * id + vf) / Td10;
            der(e1d) = ((-e1d) + (Xq - x1q - Tq20 / Tq10 * x1d / x1q * (Xq - x1q)) * iq) / Tq10 "differential equations/";
            der(e2d) = ((-e2d) + e1d + (x1q - x1d + Tq20 / Tq10 * x1d / x1q * (Xq - x1q)) * iq) / Tq20 "differential equations/";
            e1q = vq + Ra * iq + x1d * id;
            e2d = vd + Ra * id - x1q * iq "relation between voltages and currents/";
            pm0 = pm00;
            vf0 = vf00;
            annotation(Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = false, initialScale = 0.1, grid = {10, 10}), graphics = {Text(origin = {-6, 61.9022}, fillPattern = FillPattern.Solid, extent = {{-57.2101, -15.0}, {57.2101, 15.0}}, fontName = "Arial", lineColor = {28, 108, 200}, textString = "Order IV - Typ 1")}), Diagram(coordinateSystem(extent = {{-148.5, -105.0}, {148.5, 105.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})), Documentation(info = "<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\">
<tr>
<td><p>Reference</p></td>
<td>Generator Order V Type 1, PSAT Manual</td>
</tr>
<tr>
<td><p>Last update</p></td>
<td>2015-10-02</td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p>Le Qi, SmarTS Lab, KTH Royal Institute of Technology</p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p><a href=\"mailto:luigiv@kth.se\">luigiv@kth.se</a></p></td>
</tr>
</table>
<p><br><span style=\"font-family: MS Shell Dlg 2;\">&LT;iPSL: iTesla Power System Library&GT;</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Copyright 2015 RTE (France), AIA (Spain), KTH (Sweden) and DTU (Denmark)</span></p>
<ul>
<li><span style=\"font-family: MS Shell Dlg 2;\">RTE: http://www.rte-france.com/ </span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">AIA: http://www.aia.es/en/energy/</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">KTH: https://www.kth.se/en</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">DTU:http://www.dtu.dk/english</span></li>
</ul>
<p><span style=\"font-family: MS Shell Dlg 2;\">The authors can be contacted by email: info at itesla-ipsl dot org</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">This package is part of the iTesla Power System Library (&QUOT;iPSL&QUOT;) .</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is free software: you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">You should have received a copy of the GNU Lesser General Public License along with the iPSL. If not, see &LT;http://www.gnu.org/licenses/&GT;.</span></p>
</html>"));
          end Order5_Type1;

          model Order5_Type2
            import Modelica.Constants.pi;
            extends BaseClasses.baseMachine(delta(start = delta0), pe(start = pm00), pm(start = pm00), pm0(start = pm00), vf(start = vf00), vf0(start = vf00), vq(start = vq0), vd(start = vd0), iq(start = iq0), id(start = id0));
            parameter Real xd = 1.9 "d-axis synchronous reactance (pu)" annotation(Dialog(group = "Machine parameters"));
            parameter Real xq = 1.7 "q-axis synchronous reactance (pu)" annotation(Dialog(group = "Machine parameters"));
            parameter Real xd2 = 0.204 "d-axis sub-transient reactance (pu)" annotation(Dialog(group = "Machine parameters"));
            parameter Real xq2 = 0.3 "q-axis sub-transient reactance (pu)" annotation(Dialog(group = "Machine parameters"));
            parameter Real Td10 = 8 "d-axis open circuit transient time constant (s)" annotation(Dialog(group = "Machine parameters"));
            parameter Real Td20 = 0.8 "d-axis open circuit transient time constant (s)" annotation(Dialog(group = "Machine parameters"));
            parameter Real Tq20 = 0.02 "q-axis open circuit transient time constant (s)" annotation(Dialog(group = "Machine parameters"));
            parameter Real Taa = 0.002 "d-axis aditional leakage time constant (s)" annotation(Dialog(group = "Machine parameters"));
            Real e1q(start = e1q0) "q-axis transient voltage";
            Real e2q(start = e2q0) "q-axis sub-transient voltage";
            Real e2d(start = e2d0) "d-axis sub-transient voltage";
          protected
            parameter Real Xd = xd * CoB "d-axis reactance, p.u.";
            parameter Real x2d = xd2 * CoB "d-axis sub-transient reactance, p.u.(only for V.2,VI,VIII)";
            parameter Real Xq = xq * CoB "q-axis reactance, p.u.";
            parameter Real x2q = xq2 * CoB "q-axis sub-trasient reactance, p.u.(only for V.2,VI,VIII)";
            parameter Real delta0 = atan2(vi0 + Ra * ii0 + Xq * ir0, vr0 + Ra * ir0 - Xq * ii0) "Initialitation";
            parameter Real vd0 = vr0 * cos(pi / 2 - delta0) - vi0 * sin(pi / 2 - delta0) "Initialitation";
            parameter Real vq0 = vr0 * sin(pi / 2 - delta0) + vi0 * cos(pi / 2 - delta0) "Initialitation";
            parameter Real id0 = ir0 * cos(pi / 2 - delta0) - ii0 * sin(pi / 2 - delta0) "Initialitation";
            parameter Real iq0 = ir0 * sin(pi / 2 - delta0) + ii0 * cos(pi / 2 - delta0) "Initialitation";
            parameter Real pm00 = (vq0 + Ra * iq0) * iq0 + (vd0 + Ra * id0) * id0 "Initialitation";
            parameter Real e2q0 = vq0 + Ra * iq0 + x2d * id0 "Initialitation";
            parameter Real e2d0 = vd0 + Ra * id0 - x2q * iq0 "Initialitation";
            parameter Real K1 = Xd - x1d - Td20 / Td10 * x2d / x1d * (Xd - x1d);
            parameter Real K2 = x1d - x2d + Td20 / Td10 * x2d / x1d * (Xd - x1d);
            parameter Real e1q0 = (-K1 * Taa / Td10 * id0) + (1 - Taa / Td10) * (e2q0 + K2 * id0);
            parameter Real vf00 = (K1 * id0 + e1q0) / (1 - Taa / Td10);
          equation
            der(e1q) = ((-e1q) - (Xd - x1d - Td20 / Td10 * x2d / x1d * (Xd - x1d)) * id + (1 - Taa / Td10) * vf) / Td10;
            der(e2d) = ((-e2d) + (Xq - x2q) * iq) / Tq20;
            der(e2q) = ((-e2q) + e1q - (x1d - x2d + Td20 / Td10 * x2d / x1d * (Xd - x1d)) * id + Taa / Td10 * vf) / Td20 "differential equations";
            e2q = vq + Ra * iq + x2d * id;
            e2d = vd + Ra * id - x2q * iq "relation between voltages and currents";
            pm0 = pm00;
            vf0 = vf00;
            annotation(Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = false, initialScale = 0.1, grid = {10, 10}), graphics = {Rectangle(visible = true, fillColor = {255, 255, 255}, extent = {{-100.0, -100.0}, {100.0, 100.0}}), Text(origin = {-6, 61.9022}, fillPattern = FillPattern.Solid, extent = {{-57.2101, -15.0}, {57.2101, 15.0}}, fontName = "Arial", lineColor = {28, 108, 200}, textString = "Order IV - Typ 2")}), Diagram(coordinateSystem(extent = {{-148.5, -105.0}, {148.5, 105.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})), Documentation(info = "<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\">
<tr>
<td><p>Reference</p></td>
<td>Generator Order V Type 2, PSAT Manual</td>
</tr>
<tr>
<td><p>Last update</p></td>
<td>2015-10-02</td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p>Le Qi, SmarTS Lab, KTH Royal Institute of Technology</p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p><a href=\"mailto:luigiv@kth.se\">luigiv@kth.se</a></p></td>
</tr>
</table>
<p><br><span style=\"font-family: MS Shell Dlg 2;\">&LT;iPSL: iTesla Power System Library&GT;</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Copyright 2015 RTE (France), AIA (Spain), KTH (Sweden) and DTU (Denmark)</span></p>
<ul>
<li><span style=\"font-family: MS Shell Dlg 2;\">RTE: http://www.rte-france.com/ </span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">AIA: http://www.aia.es/en/energy/</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">KTH: https://www.kth.se/en</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">DTU:http://www.dtu.dk/english</span></li>
</ul>
<p><span style=\"font-family: MS Shell Dlg 2;\">The authors can be contacted by email: info at itesla-ipsl dot org</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">This package is part of the iTesla Power System Library (&QUOT;iPSL&QUOT;) .</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is free software: you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">You should have received a copy of the GNU Lesser General Public License along with the iPSL. If not, see &LT;http://www.gnu.org/licenses/&GT;.</span></p>
</html>"));
          end Order5_Type2;
          annotation(Documentation(info = "<html>
<p><br><span style=\"font-family: MS Shell Dlg 2;\">&LT;iPSL: iTesla Power System Library&GT;</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Copyright 2015 RTE (France), AIA (Spain), KTH (Sweden) and DTU (Denmark)</span></p>
<ul>
<li><span style=\"font-family: MS Shell Dlg 2;\">RTE: http://www.rte-france.com/ </span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">AIA: http://www.aia.es/en/energy/</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">KTH: https://www.kth.se/en</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">DTU:http://www.dtu.dk/english</span></li>
</ul>
<p><span style=\"font-family: MS Shell Dlg 2;\">The authors can be contacted by email: info at itesla-ipsl dot org</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">This package is part of the iTesla Power System Library (&QUOT;iPSL&QUOT;) .</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is free software: you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">You should have received a copy of the GNU Lesser General Public License along with the iPSL. If not, see &LT;http://www.gnu.org/licenses/&GT;.</span></p>
</html>"));
        end FifthOrder;

        package SixthOrder
          model Order6
            import Modelica.Constants.pi;
            extends BaseClasses.baseMachine(delta(start = delta0), pe(start = pm00), pm(start = pm00), pm0(start = pm00), vf(start = vf00), vf0(start = vf00), vq(start = vq0), vd(start = vd0), iq(start = iq0), id(start = id0));
            parameter Real xd = 1.9 "d-axis synchronous reactance (pu)" annotation(Dialog(group = "Machine parameters"));
            parameter Real xq = 1.7 "q-axis synchronous reactance (pu)" annotation(Dialog(group = "Machine parameters"));
            parameter Real xq1 = 0.5 "q-axis transient reactance (pu)" annotation(Dialog(group = "Machine parameters"));
            parameter Real xd2 = 0.204 "d-axis sub-transient reactance (pu)" annotation(Dialog(group = "Machine parameters"));
            parameter Real xq2 = 0.3 "q-axis sub-transient reactance (pu)" annotation(Dialog(group = "Machine parameters"));
            parameter Real Td10 = 8 "d-axis open circuit transient time constant (s)" annotation(Dialog(group = "Machine parameters"));
            parameter Real Tq10 = 0.8 "q-axis open circuit transient time constant (s)" annotation(Dialog(group = "Machine parameters"));
            parameter Real Td20 = 0.04 "d-axis open circuit transient time constant (s)" annotation(Dialog(group = "Machine parameters"));
            parameter Real Tq20 = 0.02 "q-axis open circuit transient time constant (s)" annotation(Dialog(group = "Machine parameters"));
            parameter Real Taa = 2e-3 "d-axis aditional leakage time constant (s)" annotation(Dialog(group = "Machine parameters"));
            Real e1q(start = e1q0) "q-axis transient voltage";
            Real e1d(start = e1d0) "d-axis transient voltage";
            Real e2q(start = e2q0) "q-axis sub-transient voltage";
            Real e2d(start = e2d0) "d-axis sub-transient voltage";
          protected
            parameter Real Xd = xd * CoB "d-axis reactance, p.u.";
            parameter Real x2d = xd2 * CoB "d-axis sub-transient reactance, p.u.(only for V.2,VI,VIII)";
            parameter Real Xq = xq * CoB "q-axis reactance, p.u.";
            parameter Real x1q = xq1 * CoB "q-axis reactance, p.u.";
            parameter Real x2q = xq2 * CoB "q-axis sub-trasient reactance, p.u.(only for V.2,VI,VIII)";
            parameter Real delta0 = atan2(vi0 + Ra * ii0 + Xq * ir0, vr0 + Ra * ir0 - Xq * ii0) "Initialitation";
            parameter Real vd0 = vr0 * cos(pi / 2 - delta0) - vi0 * sin(pi / 2 - delta0) "Initialitation";
            parameter Real vq0 = vr0 * sin(pi / 2 - delta0) + vi0 * cos(pi / 2 - delta0) "Initialitation";
            parameter Real id0 = ir0 * cos(pi / 2 - delta0) - ii0 * sin(pi / 2 - delta0) "Initialitation";
            parameter Real iq0 = ir0 * sin(pi / 2 - delta0) + ii0 * cos(pi / 2 - delta0) "Initialitation";
            parameter Real pm00 = (vq0 + Ra * iq0) * iq0 + (vd0 + Ra * id0) * id0 "Initialitation";
            parameter Real e2q0 = vq0 + Ra * iq0 + x2d * id0 "Initialitation";
            parameter Real e2d0 = vd0 + Ra * id0 - x2q * iq0 "Initialitation";
            parameter Real e1d0 = (Xq - x1q - Tq20 / Tq10 * x2q / x1q * (Xq - x1q)) * iq0;
            parameter Real K1 = Xd - x1d - Td20 / Td10 * x2d / x1d * (Xd - x1d);
            parameter Real K2 = x1d - x2d + Td20 / Td10 * x2d / x1d * (Xd - x1d);
            parameter Real e1q0 = e2q0 + K2 * id0 - Taa / Td10 * ((K1 + K2) * id0 + e2q0);
            parameter Real vf00 = (K1 * id0 + e1q0) / (1 - Taa / Td10);
          equation
            der(e1q) = ((-e1q) - (Xd - x1d - Td20 / Td10 * x2d / x1d * (Xd - x1d)) * id + (1 - Taa / Td10) * vf) / Td10;
            der(e1d) = ((-e1d) + (Xq - x1q - Tq20 / Tq10 * x2q / x1q * (Xq - x1q)) * iq) / Tq10;
            der(e2d) = ((-e2d) + e1d + (x1q - x2q + Tq20 / Tq10 * x2q / x1q * (Xq - x1q)) * iq) / Tq20;
            der(e2q) = ((-e2q) + e1q - (x1d - x2d + Td20 / Td10 * x2d / x1d * (Xd - x1d)) * id + Taa / Td10 * vf) / Td20 "differential equations";
            e2q = vq + Ra * iq + x2d * id;
            e2d = vd + Ra * id - x2q * iq;
            pm0 = pm00;
            vf0 = vf00;
            annotation(Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = false, initialScale = 0.1, grid = {10, 10}), graphics = {Rectangle(visible = true, fillColor = {255, 255, 255}, extent = {{-100.0, -100.0}, {100.0, 100.0}}), Text(origin = {4, 61.9022}, fillPattern = FillPattern.Solid, extent = {{-57.2101, -15.0}, {57.2101, 15.0}}, fontName = "Arial", lineColor = {28, 108, 200}, textString = "Order VI")}), Diagram(coordinateSystem(extent = {{-148.5, -105}, {148.5, 105}}, preserveAspectRatio = false, initialScale = 0.1, grid = {5, 5})), Documentation(info = "<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\">
<tr>
<td><p>Reference</p></td>
<td>Generator Order VI, PSAT Manual</td>
</tr>
<tr>
<td><p>Last update</p></td>
<td>2015-10-02</td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p>Le Qi, SmarTS Lab, KTH Royal Institute of Technology</p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p><a href=\"mailto:luigiv@kth.se\">luigiv@kth.se</a></p></td>
</tr>
</table>
<p><br><span style=\"font-family: MS Shell Dlg 2;\">&LT;iPSL: iTesla Power System Library&GT;</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Copyright 2015 RTE (France), AIA (Spain), KTH (Sweden) and DTU (Denmark)</span></p>
<ul>
<li><span style=\"font-family: MS Shell Dlg 2;\">RTE: http://www.rte-france.com/ </span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">AIA: http://www.aia.es/en/energy/</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">KTH: https://www.kth.se/en</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">DTU:http://www.dtu.dk/english</span></li>
</ul>
<p><span style=\"font-family: MS Shell Dlg 2;\">The authors can be contacted by email: info at itesla-ipsl dot org</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">This package is part of the iTesla Power System Library (&QUOT;iPSL&QUOT;) .</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is free software: you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">You should have received a copy of the GNU Lesser General Public License along with the iPSL. If not, see &LT;http://www.gnu.org/licenses/&GT;.</span></p>
</html>"));
          end Order6;
          annotation(Documentation(info = "<html>
<p><br><span style=\"font-family: MS Shell Dlg 2;\">&LT;iPSL: iTesla Power System Library&GT;</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Copyright 2015 RTE (France), AIA (Spain), KTH (Sweden) and DTU (Denmark)</span></p>
<ul>
<li><span style=\"font-family: MS Shell Dlg 2;\">RTE: http://www.rte-france.com/ </span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">AIA: http://www.aia.es/en/energy/</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">KTH: https://www.kth.se/en</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">DTU:http://www.dtu.dk/english</span></li>
</ul>
<p><span style=\"font-family: MS Shell Dlg 2;\">The authors can be contacted by email: info at itesla-ipsl dot org</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">This package is part of the iTesla Power System Library (&QUOT;iPSL&QUOT;) .</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is free software: you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">You should have received a copy of the GNU Lesser General Public License along with the iPSL. If not, see &LT;http://www.gnu.org/licenses/&GT;.</span></p>
</html>"));
        end SixthOrder;

        package BaseClasses
          partial model baseMachine
            extends iPSL.Electrical.Essentials.pfComponent;
            import Modelica.Constants.pi;
            import Modelica.Blocks.Interfaces.*;
            parameter Real Sn "Power rating (MVA)" annotation(Dialog(group = "Machine parameters"));
            parameter Real Vn "Voltage rating (kV)" annotation(Dialog(group = "Machine parameters"));
            parameter Real ra "Armature resistance (pu)" annotation(Dialog(group = "Machine parameters"));
            parameter Real xd1 "d-axis transient reactance (pu)" annotation(Dialog(group = "Machine parameters"));
            parameter Real M "Machanical starting time (2H), kWs/kVA" annotation(Dialog(group = "Machine parameters"));
            parameter Real D "Damping coefficient" annotation(Dialog(group = "Machine parameters"));
            //Initialization
            //Initialization of currents and voltages
            iPSL.Connectors.PwPin p(vr(start = vr0), vi(start = vi0), ir(start = ir0), ii(start = ii0)) annotation(Placement(visible = true, transformation(origin = {2.2777, 10.4683}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {110, 0.4964}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
            RealOutput delta "Rotor angle (deg)" annotation(Placement(visible = true, transformation(origin = {161.0916, -52.0898}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {110, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
            RealOutput w(start = 1) "Rotor speed (pu)" annotation(Placement(visible = true, transformation(origin = {160.1093, -96.8871}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {110, 90}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
            RealOutput v(start = V_0) "Generator terminal voltage (pu)" annotation(Placement(visible = true, transformation(origin = {146.6, 6.3277}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {110, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
            RealOutput P "Active power (pu)" annotation(Placement(visible = true, transformation(origin = {135.6, 56.3277}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {110, -30.1615}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
            RealOutput Q "Reactive power (pu)" annotation(Placement(visible = true, transformation(origin = {135.6, 36.3277}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {110, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
            RealInput vf "Field voltage (pu)" annotation(Placement(visible = true, transformation(origin = {-159.127, 67.3695}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0), iconTransformation(origin = {-100, 50}, extent = {{-10, -9.99999}, {9.99996, 9.99998}}, rotation = 0)));
            RealOutput vf0 "Initial field voltage (pu)" annotation(Placement(visible = true, transformation(origin = {159.127, 97.5816}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {-80, 110}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 90)));
            RealOutput pm0 "Initial mechanical power (pu)" annotation(Placement(visible = true, transformation(origin = {160.6004, 66.3277}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {-80, -110}, extent = {{-10, -10}, {10, 10}}, rotation = 270)));
            RealInput pm "Mechanical power (pu)" annotation(Placement(visible = true, transformation(origin = {-164.0384, -42.7137}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0), iconTransformation(origin = {-100, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
            Real anglev(start = angle_0) " Bus voltage angle";
            Real vd "d-axis voltage (pu)";
            Real vq "q-axis voltage (pu)";
            Real id "d-axis currrent (pu)";
            Real iq "q-axis current (pu)";
            Real pe;
          protected
            parameter Real vr0 = V_0 * cos(angle_0) "Initialitation";
            parameter Real vi0 = V_0 * sin(angle_0) "Initialitation";
            parameter Real ir0 = (P_0 * vr0 + Q_0 * vi0) / (vr0 ^ 2 + vi0 ^ 2) "Initialitation";
            parameter Real ii0 = (P_0 * vi0 - Q_0 * vr0) / (vr0 ^ 2 + vi0 ^ 2) "Initialitation";
            //Change of base constants
            parameter Real CoB = S_b * Vn / (Sn * V_b);
            parameter Real CoB2 = S_b / Sn;
            parameter Real m = M / CoB2 "Machanical starting time (2H), kWs/kVA";
            parameter Real d = D / CoB2 "Damping coefficient";
            parameter Real Ra = ra * CoB "armature resistance, p.u.";
            parameter Real x1d = xd1 * CoB "d-axis transient reactance, p.u.";
            parameter Real w_b = 2 * pi * fn "Base frequency in rad/s";
          initial equation
            w = 1;
          equation
            v = sqrt(p.vr ^ 2 + p.vi ^ 2);
            anglev = atan2(p.vi, p.vr);
            der(delta) = w_b * (w - 1);
            der(w) = (pm - pe - d * (w - 1)) / m;
            [p.ir; p.ii] = -[sin(delta), cos(delta); -cos(delta), sin(delta)] * [id; iq];
            [p.vr; p.vi] = [sin(delta), cos(delta); -cos(delta), sin(delta)] * [vd; vq];
            // -P = p.vr * p.ir + p.vi * p.ii;
            // -Q = p.vi * p.ir - p.vr * p.ii;
            P = vd * id + vq * iq;
            Q = vq * id - vd * iq;
            pe = (vq + Ra * iq) * iq + (vd + Ra * id) * id;
            annotation(Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}, grid = {1, 1}), graphics = {Text(origin = {-81, 50.5}, fillPattern = FillPattern.Solid, extent = {{-10, -10.5}, {10, 10.5}}, fontName = "Arial", textString = "vf", lineColor = {28, 108, 200}), Text(origin = {-77.3761, -48}, fillPattern = FillPattern.Solid, extent = {{-9.6086, -11.4189}, {9.6086, 11.4189}}, fontName = "Arial", textString = "pm", lineColor = {28, 108, 200}), Text(origin = {-80, 90}, fillPattern = FillPattern.Solid, extent = {{-10, -10}, {10, 10}}, fontName = "Arial", textString = "vf0", lineColor = {28, 108, 200}), Text(origin = {-80.6294, -89.5811}, fillPattern = FillPattern.Solid, extent = {{-15.3706, -13.4189}, {15.3706, 13.4189}}, fontName = "Arial", textString = "pm0", lineColor = {28, 108, 200}), Text(origin = {80.5, 60.6367}, fillPattern = FillPattern.Solid, extent = {{-23.5, -8.6367}, {23.5, 8.6367}}, fontName = "Arial", lineColor = {28, 108, 200}, textString = "delta"), Text(origin = {90, 90.5}, fillPattern = FillPattern.Solid, extent = {{-10, -10.5}, {10, 10.5}}, textString = "w", fontName = "Arial", lineColor = {28, 108, 200}), Text(origin = {90, 30}, fillPattern = FillPattern.Solid, extent = {{-10, -10}, {10, 10}}, textString = "v", fontName = "Arial", lineColor = {28, 108, 200}), Rectangle(fillColor = {255, 255, 255}, extent = {{-100, -100}, {100, 100}}, lineColor = {28, 108, 200}), Ellipse(extent = {{-40, 40}, {40, -40}}, lineColor = {28, 108, 200}), Line(points = {{-20, 0}, {-9, 15}, {9, -15}, {20, 0}}, color = {28, 108, 200}, smooth = Smooth.Bezier), Text(origin = {4, -58.0978}, fillPattern = FillPattern.Solid, extent = {{-57.2101, -15.0}, {57.2101, 15.0}}, textString = "%name", fontName = "Arial", lineColor = {28, 108, 200}), Text(origin = {90, -31}, fillPattern = FillPattern.Solid, extent = {{-10, -10}, {10, 10}}, fontName = "Arial", lineColor = {28, 108, 200}, textString = "P"), Text(origin = {90, -60}, fillPattern = FillPattern.Solid, extent = {{-10, -10}, {10, 10}}, fontName = "Arial", lineColor = {28, 108, 200}, textString = "Q")}), Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}, grid = {1, 1})), Documentation(info = "<html>
<p><br><span style=\"font-family: MS Shell Dlg 2;\">&LT;iPSL: iTesla Power System Library&GT;</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Copyright 2015 RTE (France), AIA (Spain), KTH (Sweden) and DTU (Denmark)</span></p>
<ul>
<li><span style=\"font-family: MS Shell Dlg 2;\">RTE: http://www.rte-france.com/ </span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">AIA: http://www.aia.es/en/energy/</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">KTH: https://www.kth.se/en</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">DTU:http://www.dtu.dk/english</span></li>
</ul>
<p><span style=\"font-family: MS Shell Dlg 2;\">The authors can be contacted by email: info at itesla-ipsl dot org</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">This package is part of the iTesla Power System Library (&QUOT;iPSL&QUOT;) .</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is free software: you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">You should have received a copy of the GNU Lesser General Public License along with the iPSL. If not, see &LT;http://www.gnu.org/licenses/&GT;.</span></p>
</html>"));
          end baseMachine;
          annotation(Documentation(info = "<html>
<p><br><span style=\"font-family: MS Shell Dlg 2;\">&LT;iPSL: iTesla Power System Library&GT;</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Copyright 2015 RTE (France), AIA (Spain), KTH (Sweden) and DTU (Denmark)</span></p>
<ul>
<li><span style=\"font-family: MS Shell Dlg 2;\">RTE: http://www.rte-france.com/ </span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">AIA: http://www.aia.es/en/energy/</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">KTH: https://www.kth.se/en</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">DTU:http://www.dtu.dk/english</span></li>
</ul>
<p><span style=\"font-family: MS Shell Dlg 2;\">The authors can be contacted by email: info at itesla-ipsl dot org</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">This package is part of the iTesla Power System Library (&QUOT;iPSL&QUOT;) .</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is free software: you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">You should have received a copy of the GNU Lesser General Public License along with the iPSL. If not, see &LT;http://www.gnu.org/licenses/&GT;.</span></p>
</html>"));
        end BaseClasses;
        annotation(Documentation(info = "<html>
<p><br><span style=\"font-family: MS Shell Dlg 2;\">&LT;iPSL: iTesla Power System Library&GT;</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Copyright 2015 RTE (France), AIA (Spain), KTH (Sweden) and DTU (Denmark)</span></p>
<ul>
<li><span style=\"font-family: MS Shell Dlg 2;\">RTE: http://www.rte-france.com/ </span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">AIA: http://www.aia.es/en/energy/</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">KTH: https://www.kth.se/en</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">DTU:http://www.dtu.dk/english</span></li>
</ul>
<p><span style=\"font-family: MS Shell Dlg 2;\">The authors can be contacted by email: info at itesla-ipsl dot org</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">This package is part of the iTesla Power System Library (&QUOT;iPSL&QUOT;) .</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is free software: you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">You should have received a copy of the GNU Lesser General Public License along with the iPSL. If not, see &LT;http://www.gnu.org/licenses/&GT;.</span></p>
</html>"));
      end PSAT;
      annotation(Documentation(info = "<html>
<p><br><span style=\"font-family: MS Shell Dlg 2;\">&LT;iPSL: iTesla Power System Library&GT;</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Copyright 2015 RTE (France), AIA (Spain), KTH (Sweden) and DTU (Denmark)</span></p>
<ul>
<li><span style=\"font-family: MS Shell Dlg 2;\">RTE: http://www.rte-france.com/ </span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">AIA: http://www.aia.es/en/energy/</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">KTH: https://www.kth.se/en</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">DTU:http://www.dtu.dk/english</span></li>
</ul>
<p><span style=\"font-family: MS Shell Dlg 2;\">The authors can be contacted by email: info at itesla-ipsl dot org</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">This package is part of the iTesla Power System Library (&QUOT;iPSL&QUOT;) .</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is free software: you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">You should have received a copy of the GNU Lesser General Public License along with the iPSL. If not, see &LT;http://www.gnu.org/licenses/&GT;.</span></p>
</html>"));
    end Machines;

    package Controls
      package PSAT
        package TG "Turbine and its governor (the mathematical models are taken from PSAT)"
          model TGTypeI
            Modelica.Blocks.Interfaces.RealInput w "Rotor speed (pu)" annotation(Placement(transformation(extent = {{-92, -10}, {-72, 10}}), iconTransformation(extent = {{-94, -4}, {-60, 34}})));
            Modelica.Blocks.Interfaces.RealOutput pm "Mechanical power (pu)" annotation(Placement(transformation(extent = {{70, 2}, {90, 22}}), iconTransformation(extent = {{78, -8}, {116, 34}})));
            parameter Real wref = 1 "Speed reference (pu)";
            parameter Real pref "Active power reference (pu)";
            parameter Real R "Droop (pu)";
            parameter Real pmax "Maximum turbine output (pu)";
            parameter Real pmin "Minimum turbine output (pu)";
            parameter Real Ts "Governor time constant (s)";
            parameter Real Tc "Servo time constant (s)";
            parameter Real T3 "Transient gain time constant (s)";
            parameter Real T4 "Power fraction time constant (s)";
            parameter Real T5 "Reheat time constant (s)";
            Real pin "Turbine output (pu)";
          protected
            parameter Real pin0 = pref "Initialization";
            parameter Real xg10 = pin0 "Initialization";
            parameter Real xg20 = (1 - T3 / Tc) * xg10 "Initialization";
            parameter Real xg30 = (1 - T4 / T5) * (xg20 + T3 * xg10 / Tc) "Initialization";
            Real pinstar;
            Real xg1(start = xg10, fixed = true);
            Real xg2(start = xg20, fixed = true);
            Real xg3(start = xg30, fixed = true);
          equation
            pinstar = pref + (wref - w) / R;
            if pinstar >= pmin and pinstar <= pmax then
              pin = pinstar;
            elseif pinstar > pmax then
              pin = pmax;
            else
              pin = pmin;
            end if;
            der(xg1) = (pin - xg1) / Ts;
            der(xg2) = ((1 - T3 / Tc) * xg1 - xg2) / Tc;
            der(xg3) = ((1 - T4 / T5) * (xg2 + T3 * xg1 / Tc) - xg3) / T5;
            pm = xg3 + (xg2 + T3 * xg1 / Tc) * T4 / T5;
            annotation(Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {140, 100}}), graphics), Icon(coordinateSystem(extent = {{-100, -100}, {140, 100}}, preserveAspectRatio = false), graphics = {Rectangle(extent = {{-58, 74}, {80, -50}}, lineColor = {0, 0, 255}), Text(extent = {{-74, 38}, {-12, 0}}, lineColor = {0, 0, 255}, textString = "w"), Text(extent = {{34, 22}, {82, -14}}, lineColor = {0, 0, 255}, textString = "pm
"), Text(extent = {{-18, -4}, {44, -44}}, lineColor = {0, 0, 255}, textString = "TG1")}), Documentation(info = "<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\">
<tr>
<td><p>Reference</p></td>
<td>Turbine and Governor - control scheme Type I</td>
</tr>
<tr>
<td><p>Last update</p></td>
<td>2015-10-02</td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p>Le Qi, SmarTS Lab, KTH Royal Institute of Technology</p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p><a href=\"mailto:luigiv@kth.se\">luigiv@kth.se</a></p></td>
</tr>
</table>
<p><br><span style=\"font-family: MS Shell Dlg 2;\">&LT;iPSL: iTesla Power System Library&GT;</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Copyright 2015 RTE (France), AIA (Spain), KTH (Sweden) and DTU (Denmark)</span></p>
<ul>
<li><span style=\"font-family: MS Shell Dlg 2;\">RTE: http://www.rte-france.com/ </span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">AIA: http://www.aia.es/en/energy/</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">KTH: https://www.kth.se/en</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">DTU:http://www.dtu.dk/english</span></li>
</ul>
<p><span style=\"font-family: MS Shell Dlg 2;\">The authors can be contacted by email: info at ipsl dot org</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">This package is part of the iTesla Power System Library (&QUOT;iPSL&QUOT;) .</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is free software: you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">You should have received a copy of the GNU Lesser General Public License along with the iPSL. If not, see &LT;http://www.gnu.org/licenses/&GT;.</span></p>
</html>"));
          end TGTypeI;

          model TGtypeII "TG Type II"
            Modelica.Blocks.Interfaces.RealInput pm0 "Initial mechanical power (pu)" annotation(Placement(visible = true, transformation(origin = {5.0, 75.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = -90), iconTransformation(origin = {0.0, 120.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = -90)));
            Modelica.Blocks.Interfaces.RealOutput pm "Mechanical power (pu)" annotation(Placement(visible = true, transformation(origin = {127.8147, -10.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {110.0, -0.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
            Modelica.Blocks.Interfaces.RealInput W "Rotor speed (pu)" annotation(Placement(visible = true, transformation(origin = {-86.6223, -82.7085}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = -270), iconTransformation(origin = {-120.0, -0.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)));
            Modelica.Blocks.Math.Add add1(k2 = -1) annotation(Placement(visible = true, transformation(origin = {-57.8833, -13.175}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
            Modelica.Blocks.Continuous.TransferFunction transferFunction1(a = {Ts, 1}, b = {T3, 1}) annotation(Placement(visible = true, transformation(origin = {5.0, -13.2292}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
            parameter Real wref = 1 "Reference speed (pu)";
            parameter Real R = 0.2 "Droop (pu)";
            parameter Real pmax0 = 1 "Maximum turbine output (pu)";
            parameter Real pmin0 = 0 "Minimum turbine output (pu)";
            parameter Real Ts = 0.1 "Governor Time constant (s)";
            parameter Real T3 = -0.1 "Transient gain time constant (s)";
            parameter Real S_b = 100 "System base power (MVA)" annotation(Dialog(group = "Power flow data"));
            parameter Real Sn = 20 "Nominal power (MVA)";
            Modelica.Blocks.Math.Gain gain1(k = 1 / Ro) annotation(Placement(visible = true, transformation(origin = {-26.9038, -12.7482}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
            Modelica.Blocks.Sources.Constant const(k = wref) annotation(Placement(visible = true, transformation(origin = {-125.0, -6.9858}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
            Modelica.Blocks.Math.Add add2 annotation(Placement(visible = true, transformation(origin = {50.0, -5.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
            Modelica.Blocks.Nonlinear.Limiter limiter1(uMax = pmax, uMin = pmin) annotation(Placement(visible = true, transformation(origin = {82.1897, -7.0368}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
          protected
            parameter Real Ro = R * S_b / Sn;
            parameter Real pmax = pmax0 * Sn / S_b;
            parameter Real pmin = pmin0 * Sn / S_b;
          equation
            connect(limiter1.y, pm) annotation(Line(visible = true, origin = {112.546, -8.5184}, points = {{-19.3563, 1.4816}, {2.0437, 1.4816}, {2.0437, -1.4816}, {15.2687, -1.4816}}, color = {0, 0, 127}));
            connect(pm0, add2.u1) annotation(Line(visible = true, origin = {16.0, 25.6667}, points = {{-11.0, 49.3333}, {-11.0, -24.6667}, {22.0, -24.6667}}, color = {0, 0, 127}));
            connect(add1.u2, W) annotation(Line(visible = true, origin = {-81.0427, -40.3528}, points = {{11.1594, 21.1778}, {-5.5797, 21.1778}, {-5.5796, -42.3557}}, color = {0, 0, 127}));
            connect(add2.y, limiter1.u) annotation(Line(visible = true, origin = {66.3923, -6.0184}, points = {{-5.3923, 1.0184}, {0.7974, 1.0184}, {0.7974, -1.0184}, {3.7974, -1.0184}}, color = {0, 0, 127}));
            connect(transferFunction1.y, add2.u2) annotation(Line(visible = true, origin = {31.0, -12.1146}, points = {{-15.0, -1.1146}, {4.0, -1.1146}, {4.0, 1.1146}, {7.0, 1.1146}}, color = {0, 0, 127}));
            connect(const.y, add1.u1) annotation(Line(visible = true, origin = {-82.4125, -7.0804}, points = {{-31.5875, 0.0946}, {9.5292, 0.0946}, {9.5292, -0.0946}, {12.5292, -0.0946}}, color = {0, 0, 127}));
            connect(gain1.y, transferFunction1.u) annotation(Line(visible = true, origin = {-10.726, -12.9887}, points = {{-5.1778, 0.2405}, {0.726, 0.2405}, {0.726, -0.2405}, {3.726, -0.2405}}, color = {0, 0, 127}));
            connect(add1.y, gain1.u) annotation(Line(visible = true, origin = {-42.3987, -12.9616}, points = {{-4.4846, -0.2134}, {0.4949, -0.2134}, {0.4949, 0.2134}, {3.4949, 0.2134}}, color = {0, 0, 127}));
            annotation(Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Rectangle(visible = true, fillColor = {255, 255, 255}, extent = {{-100.0, -100.0}, {100.0, 100.0}}), Text(visible = true, origin = {0.0, 2.0143}, fillPattern = FillPattern.Solid, extent = {{-35.7561, -17.9857}, {35.7561, 17.9857}}, textString = "TGtype2", fontName = "Arial"), Text(visible = true, origin = {0.0, 84.3902}, fillPattern = FillPattern.Solid, extent = {{-21.9862, -7.9881}, {21.9862, 7.9881}}, textString = "pm0", fontName = "Arial"), Text(visible = true, origin = {-80.0, -2.4321}, fillPattern = FillPattern.Solid, extent = {{-11.4068, -12.4321}, {11.4068, 12.4321}}, textString = "W", fontName = "Arial"), Text(visible = true, origin = {80.0, 1.5812}, fillPattern = FillPattern.Solid, extent = {{-16.0104, -8.4188}, {16.0104, 8.4188}}, textString = "pm", fontName = "Arial")}), Diagram(coordinateSystem(extent = {{-148.5, -105}, {148.5, 105}}, preserveAspectRatio = false, initialScale = 0.1, grid = {5, 5})), Documentation(info = "<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\">
<tr>
<td><p>Reference</p></td>
<td><p>TG Type II, PSAT Manual 2.1.8</p></td>
</tr>
<tr>
<td><p>Last update</p></td>
<td>September 2015</td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p>Joan Russinol, SmarTS Lab, KTH Royal Institute of Technology</p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p><a href=\"mailto:luigiv@kth.se\">luigiv@kth.se</a></p></td>
</tr>
</table>
<p><br><span style=\"font-family: MS Shell Dlg 2;\">&LT;iPSL: iTesla Power System Library&GT;</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Copyright 2015 RTE (France), AIA (Spain), KTH (Sweden) and DTU (Denmark)</span></p>
<ul>
<li><span style=\"font-family: MS Shell Dlg 2;\">RTE: http://www.rte-france.com/ </span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">AIA: http://www.aia.es/en/energy/</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">KTH: https://www.kth.se/en</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">DTU:http://www.dtu.dk/english</span></li>
</ul>
<p><span style=\"font-family: MS Shell Dlg 2;\">The authors can be contacted by email: info at ipsl dot org</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">This package is part of the iTesla Power System Library (&QUOT;iPSL&QUOT;) .</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is free software: you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">You should have received a copy of the GNU Lesser General Public License along with the iPSL. If not, see &LT;http://www.gnu.org/licenses/&GT;.</span></p>
</html>"));
          end TGtypeII;

          model TGTypeIII "Hydro Turbine (Linear model) and Governor (Standard model)- control scheme Type 3"
            parameter Real P_0 "Active power (pu)" annotation(Dialog(group = "Power flow data"));
            parameter Real wref = 1 "Reference speed (pu)";
            parameter Real Tg "Pilot valve droop (pu)";
            parameter Real gmax "Maximum gate opening (pu)";
            parameter Real gmin "Minimum gate opening (pu)";
            parameter Real vmax "Maximum gate opening rate (pu)";
            parameter Real vmin "Minimum gate opening rate (pu)";
            parameter Real Tp "Pilot valve time constant (s)";
            parameter Real Tr "Dashpot time constant (s)";
            parameter Real delta "Transient speed droop (p.u./p.u.)";
            parameter Real sigma "Permanent speed droop (p.u./p.u.)";
            parameter Real Tw "Water starting time (s)";
            parameter Real a11 "Deriv. of flow rate vs. turbine head";
            parameter Real a13 "Deriv. of flow rate vs. gate position";
            parameter Real a21 "Deriv. of torque vs. turbine head";
            parameter Real a23 "Deriv. of torque vs. gate position";
            parameter Real int3;
            Real deltaG "Gate position variation (pu)";
            Real G "Gate position (pu)";
            Modelica.Blocks.Continuous.Integrator integrator(initType = Modelica.Blocks.Types.Init.NoInit, y_start = 0) annotation(Placement(transformation(extent = {{-8, 56}, {4, 68}})));
            Modelica.Blocks.Math.Gain gain(k = 1 / (Tg * Tp)) annotation(Placement(transformation(extent = {{-88, 56}, {-76, 68}})));
            Modelica.Blocks.Math.Gain gain1(k = 1 / Tp) annotation(Placement(transformation(extent = {{-6, -6}, {6, 6}}, rotation = 180, origin = {-54, 42})));
            Modelica.Blocks.Continuous.Integrator integrator1(initType = Modelica.Blocks.Types.Init.NoInit, y_start = 0) annotation(Placement(transformation(extent = {{-56, 56}, {-44, 68}})));
            Modelica.Blocks.Math.Feedback feedback annotation(Placement(transformation(extent = {{-72, 56}, {-60, 68}})));
            Modelica.Blocks.Math.Gain gain2(k = delta + sigma) annotation(Placement(transformation(extent = {{-6, -6}, {6, 6}}, rotation = 180, origin = {-42, 82})));
            Modelica.Blocks.Math.Gain gain3(k = sigma / Tr) annotation(Placement(transformation(extent = {{-6, -6}, {6, 6}}, rotation = 180, origin = {-82, 26})));
            Modelica.Blocks.Math.Gain gain5(k = 1 / Tr) annotation(Placement(transformation(extent = {{-6, -6}, {6, 6}}, rotation = 0, origin = {-14, 8})));
            Modelica.Blocks.Continuous.Integrator integrator2(initType = Modelica.Blocks.Types.Init.NoInit, y_start = 0) annotation(Placement(transformation(extent = {{-6, -6}, {6, 6}}, rotation = 180, origin = {-10, 26})));
            Modelica.Blocks.Math.Feedback feedback1 annotation(Placement(transformation(extent = {{-6, 6}, {6, -6}}, rotation = 180, origin = {10, 26})));
            Modelica.Blocks.Math.Gain gain4(k = 1 / (a11 * Tw)) annotation(Placement(transformation(extent = {{-6, -6}, {6, 6}}, rotation = 180, origin = {104, 10})));
            Modelica.Blocks.Continuous.Integrator integrator3(initType = Modelica.Blocks.Types.Init.NoInit, y_start = int3) annotation(Placement(transformation(extent = {{-6, -6}, {6, 6}}, rotation = 0, origin = {104, 30})));
            Modelica.Blocks.Math.Feedback feedback2 annotation(Placement(transformation(extent = {{-6, -6}, {6, 6}}, rotation = 0, origin = {86, 30})));
            Modelica.Blocks.Math.Gain G6(k = (a11 * a23 - a13 * a21) / a11) annotation(Placement(transformation(extent = {{80, 58}, {92, 70}})));
            Modelica.Blocks.Math.Gain gain7(k = a13 * a21 / (a11 * a11 * Tw)) annotation(Placement(transformation(extent = {{66, 24}, {78, 36}})));
            Modelica.Blocks.Interfaces.RealInput w "Rotor speed (pu)" annotation(Placement(transformation(extent = {{-52, -6}, {-40, 6}}), iconTransformation(extent = {{-116, -18}, {-80, 18}})));
            Modelica.Blocks.Interfaces.RealOutput Pm "Mechanical power (pu)" annotation(Placement(transformation(extent = {{100, -6}, {112, 6}}), iconTransformation(extent = {{100, -10}, {128, 18}})));
            Modelica.Blocks.Nonlinear.Limiter limiter(uMax = vmax, uMin = vmin) annotation(Placement(transformation(extent = {{-28, 56}, {-16, 68}})));
            Modelica.Blocks.Nonlinear.Limiter limiter1(uMax = gmax, uMin = gmin) annotation(Placement(transformation(extent = {{14, 56}, {26, 68}})));
            Modelica.Blocks.Math.Add add(k1 = +1, k2 = -1) annotation(Placement(transformation(extent = {{-140, 56}, {-128, 68}})));
            Modelica.Blocks.Math.Add3 add3_1(k1 = -1, k2 = 1, k3 = 1) annotation(Placement(transformation(extent = {{-110, 56}, {-98, 68}})));
            Modelica.Blocks.Math.Add add1 annotation(Placement(transformation(extent = {{46, 58}, {58, 70}})));
            Modelica.Blocks.Math.Add add2 annotation(Placement(transformation(extent = {{126, 56}, {138, 68}})));
            Modelica.Blocks.Sources.Constant const(k = P_0) annotation(Placement(transformation(extent = {{0, 78}, {12, 90}})));
            Modelica.Blocks.Sources.Constant const1(k = wref) annotation(Placement(transformation(extent = {{-160, 60}, {-148, 72}})));
          equation
            deltaG = limiter1.y;
            G = add1.y;
            connect(gain1.y, feedback.u2) annotation(Line(points = {{-60.6, 42}, {-66, 42}, {-66, 57.2}}, color = {0, 0, 127}, smooth = Smooth.None));
            connect(feedback.y, integrator1.u) annotation(Line(points = {{-60.6, 62}, {-57.2, 62}}, color = {0, 0, 127}, smooth = Smooth.None));
            connect(gain.y, feedback.u1) annotation(Line(points = {{-75.4, 62}, {-70.8, 62}}, color = {0, 0, 127}, smooth = Smooth.None));
            connect(gain5.y, feedback1.u2) annotation(Line(points = {{-7.4, 8}, {10, 8}, {10, 21.2}}, color = {0, 0, 127}, smooth = Smooth.None));
            connect(feedback1.y, integrator2.u) annotation(Line(points = {{4.6, 26}, {-2.8, 26}}, color = {0, 0, 127}, smooth = Smooth.None));
            connect(integrator2.y, gain3.u) annotation(Line(points = {{-16.6, 26}, {-74.8, 26}}, color = {0, 0, 127}, smooth = Smooth.None));
            connect(gain4.y, feedback2.u2) annotation(Line(points = {{97.4, 10}, {86, 10}, {86, 25.2}}, color = {0, 0, 127}, smooth = Smooth.None));
            connect(feedback2.y, integrator3.u) annotation(Line(points = {{91.4, 30}, {96.8, 30}}, color = {0, 0, 127}, smooth = Smooth.None));
            connect(gain7.y, feedback2.u1) annotation(Line(points = {{78.6, 30}, {81.2, 30}}, color = {0, 0, 127}, smooth = Smooth.None));
            connect(gain1.u, integrator1.y) annotation(Line(points = {{-46.8, 42}, {-36, 42}, {-36, 62}, {-43.4, 62}}, color = {0, 0, 127}, smooth = Smooth.None));
            connect(integrator2.y, gain5.u) annotation(Line(points = {{-16.6, 26}, {-28, 26}, {-28, 8}, {-21.2, 8}}, color = {0, 0, 127}, smooth = Smooth.None));
            connect(integrator3.y, gain4.u) annotation(Line(points = {{110.6, 30}, {120, 30}, {120, 10}, {111.2, 10}}, color = {0, 0, 127}, smooth = Smooth.None));
            connect(integrator1.y, limiter.u) annotation(Line(points = {{-43.4, 62}, {-29.2, 62}}, color = {0, 0, 127}, smooth = Smooth.None));
            connect(limiter.y, integrator.u) annotation(Line(points = {{-15.4, 62}, {-9.2, 62}}, color = {0, 0, 127}, smooth = Smooth.None));
            connect(integrator.y, limiter1.u) annotation(Line(points = {{4.6, 62}, {12.8, 62}}, color = {0, 0, 127}, smooth = Smooth.None));
            connect(feedback1.u1, limiter1.y) annotation(Line(points = {{14.8, 26}, {32, 26}, {32, 62}, {26.6, 62}}, color = {0, 0, 127}, smooth = Smooth.None));
            connect(limiter1.y, gain2.u) annotation(Line(points = {{26.6, 62}, {32, 62}, {32, 82}, {-34.8, 82}}, color = {0, 0, 127}, smooth = Smooth.None));
            connect(w, add.u2) annotation(Line(points = {{-46, 0}, {-144, 0}, {-144, 58.4}, {-141.2, 58.4}}, color = {0, 0, 127}, smooth = Smooth.None));
            connect(gain2.y, add3_1.u1) annotation(Line(points = {{-48.6, 82}, {-120, 82}, {-120, 66.8}, {-111.2, 66.8}}, color = {0, 0, 127}, smooth = Smooth.None));
            connect(add.y, add3_1.u2) annotation(Line(points = {{-127.4, 62}, {-111.2, 62}}, color = {0, 0, 127}, smooth = Smooth.None));
            connect(gain3.y, add3_1.u3) annotation(Line(points = {{-88.6, 26}, {-122, 26}, {-122, 57.2}, {-111.2, 57.2}}, color = {0, 0, 127}, smooth = Smooth.None));
            connect(add3_1.y, gain.u) annotation(Line(points = {{-97.4, 62}, {-89.2, 62}}, color = {0, 0, 127}, smooth = Smooth.None));
            connect(limiter1.y, add1.u2) annotation(Line(points = {{26.6, 62}, {34, 62}, {34, 60.4}, {44.8, 60.4}}, color = {0, 0, 127}, smooth = Smooth.None));
            connect(add1.y, G6.u) annotation(Line(points = {{58.6, 64}, {78.8, 64}}, color = {0, 0, 127}, smooth = Smooth.None));
            connect(add1.y, gain7.u) annotation(Line(points = {{58.6, 64}, {62, 64}, {62, 30}, {64.8, 30}}, color = {0, 0, 127}, smooth = Smooth.None));
            connect(G6.y, add2.u1) annotation(Line(points = {{92.6, 64}, {123.6, 64}, {123.6, 65.6}, {124.8, 65.6}}, color = {0, 0, 127}, smooth = Smooth.None));
            connect(integrator3.y, add2.u2) annotation(Line(points = {{110.6, 30}, {122, 30}, {122, 58.4}, {124.8, 58.4}}, color = {0, 0, 127}, smooth = Smooth.None));
            connect(add2.y, Pm) annotation(Line(points = {{138.6, 62}, {144, 62}, {144, 0}, {106, 0}}, color = {0, 0, 127}, smooth = Smooth.None));
            connect(Pm, Pm) annotation(Line(points = {{106, 0}, {106, 0}}, color = {0, 0, 127}, smooth = Smooth.None));
            connect(const.y, add1.u1) annotation(Line(points = {{12.6, 84}, {26, 84}, {40, 84}, {40, 67.6}, {44.8, 67.6}}, color = {0, 0, 127}));
            connect(const1.y, add.u1) annotation(Line(points = {{-147.4, 66}, {-141.2, 66}, {-141.2, 65.6}}, color = {0, 0, 127}));
            annotation(Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Rectangle(extent = {{-100, 100}, {100, -100}}, lineColor = {0, 0, 255}), Text(extent = {{-44, 38}, {34, -30}}, lineColor = {0, 0, 255}, textString = "TGTypeIII"), Text(visible = true, origin = {-71, -1}, fillPattern = FillPattern.Solid, extent = {{-19, -11}, {19, 11}}, textString = "W", fontName = "Arial"), Text(visible = true, origin = {83.0002, 5}, fillPattern = FillPattern.Solid, extent = {{-15.0002, -11}, {15.0002, 11}}, fontName = "Arial", textString = "Pm", lineColor = {0, 0, 0})}), Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}})), Documentation(info = "<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\">
<tr>
<td><p>Reference</p></td>
<td>Hydro Turbine (Linear model) and Governor (Standard model) - control scheme Type 3, PSAT Manual</td>
</tr>
<tr>
<td><p>Last update</p></td>
<td>2015-10-02</td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p>Tetiana Bogodorova, SmarTS Lab, KTH Royal Institute of Technology</p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p><a href=\"mailto:luigiv@kth.se\">luigiv@kth.se</a></p></td>
</tr>
</table>
<p><br><span style=\"font-family: MS Shell Dlg 2;\">&LT;iPSL: iTesla Power System Library&GT;</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Copyright 2015 RTE (France), AIA (Spain), KTH (Sweden) and DTU (Denmark)</span></p>
<ul>
<li><span style=\"font-family: MS Shell Dlg 2;\">RTE: http://www.rte-france.com/ </span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">AIA: http://www.aia.es/en/energy/</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">KTH: https://www.kth.se/en</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">DTU:http://www.dtu.dk/english</span></li>
</ul>
<p><span style=\"font-family: MS Shell Dlg 2;\">The authors can be contacted by email: info at ipsl dot org</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">This package is part of the iTesla Power System Library (&QUOT;iPSL&QUOT;) .</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is free software: you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">You should have received a copy of the GNU Lesser General Public License along with the iPSL. If not, see &LT;http://www.gnu.org/licenses/&GT;.</span></p>
</html>"));
          end TGTypeIII;

          model TGTypeIV "Hydro Turbine (Linear model) and Governor (Standard model with PI controller)- control scheme Type 4"
            parameter Real wref "Reference speed (pu)";
            parameter Real Tg "Pilot valve droop (pu)";
            parameter Real gmax "Maximum gate opening (pu)";
            parameter Real gmin "Minimum gate opening (pu)";
            parameter Real vmax "Maxmimum gate opening rate (pu)";
            parameter Real vmin "Maximum gate opening rate (pu)";
            parameter Real Tp "Pilot valve time constant (s)";
            parameter Real Tr "Dashpot time constant (s)";
            parameter Real sigma "Permanent speed droop (p.u./p.u.)";
            parameter Real delta "Transient speed droop (p.u./p.u.)";
            parameter Real Tw "Water starting time (s)";
            parameter Real a11 "Deriv. of flow rate vs. turbine head";
            parameter Real a13 "Deriv. of flow rate vs. gate position";
            parameter Real a21 "Deriv. of torque vs. turbine head";
            parameter Real a23 "Deriv. of torque vs. gate position";
            parameter Real Kp "Proportional droop";
            parameter Real Ki "Integral droop";
            parameter Real Pref;
            Real deltaG "Gate position variation (pu)";
            Real v "Gate opening rate (pu)";
            Modelica.Blocks.Continuous.Integrator integrator3(initType = Modelica.Blocks.Types.Init.NoInit, y_start = int3) annotation(Placement(transformation(extent = {{34, 56}, {46, 68}})));
            Modelica.Blocks.Math.Gain gain(k = 1 / (Tg * Tp)) annotation(Placement(transformation(extent = {{-50, 56}, {-38, 68}})));
            Modelica.Blocks.Math.Gain gain1(k = 1 / Tp) annotation(Placement(transformation(extent = {{-6, -6}, {6, 6}}, rotation = 180, origin = {-16, 42})));
            Modelica.Blocks.Continuous.Integrator integrator2(initType = Modelica.Blocks.Types.Init.NoInit, y_start = int2) annotation(Placement(transformation(extent = {{-18, 56}, {-6, 68}})));
            Modelica.Blocks.Math.Feedback feedback annotation(Placement(transformation(extent = {{-34, 56}, {-22, 68}})));
            Modelica.Blocks.Math.Gain gain2(k = delta + sigma) annotation(Placement(transformation(extent = {{-6, -6}, {6, 6}}, rotation = 180, origin = {-4, 82})));
            Modelica.Blocks.Math.Gain gain3(k = delta / Tr) annotation(Placement(transformation(extent = {{-6, -6}, {6, 6}}, rotation = 180, origin = {-44, 26})));
            Modelica.Blocks.Math.Gain gain5(k = 1 / Tr) annotation(Placement(transformation(extent = {{-6, -6}, {6, 6}}, rotation = 0, origin = {24, 8})));
            Modelica.Blocks.Continuous.Integrator integrator4(initType = Modelica.Blocks.Types.Init.NoInit, y_start = int4) annotation(Placement(transformation(extent = {{-6, -6}, {6, 6}}, rotation = 180, origin = {22, 26})));
            Modelica.Blocks.Math.Feedback feedback1 annotation(Placement(transformation(extent = {{-6, 6}, {6, -6}}, rotation = 180, origin = {48, 26})));
            Modelica.Blocks.Math.Gain gain4(k = 1 / (a11 * Tw)) annotation(Placement(transformation(extent = {{-6, -6}, {6, 6}}, rotation = 180, origin = {138, 8})));
            Modelica.Blocks.Continuous.Integrator integrator5(initType = Modelica.Blocks.Types.Init.NoInit, y_start = int5) annotation(Placement(transformation(extent = {{-6, -6}, {6, 6}}, rotation = 0, origin = {142, 28})));
            Modelica.Blocks.Math.Feedback feedback2 annotation(Placement(transformation(extent = {{-6, -6}, {6, 6}}, rotation = 0, origin = {124, 28})));
            Modelica.Blocks.Math.Gain G6(k = (a11 * a23 - a13 * a21) / a11) annotation(Placement(transformation(extent = {{116, 56}, {128, 68}})));
            Modelica.Blocks.Math.Gain gain7(k = a13 * a21 / (a11 * a11 * Tw)) annotation(Placement(transformation(extent = {{104, 22}, {116, 34}})));
            Modelica.Blocks.Interfaces.RealInput w "Rotor speed (pu)" annotation(Placement(transformation(extent = {{-12, 4}, {-2, 14}}), iconTransformation(extent = {{-136, -20}, {-100, 16}})));
            Modelica.Blocks.Interfaces.RealOutput Pm "Mechanical power (pu)" annotation(Placement(transformation(extent = {{78, -8}, {90, 4}}), iconTransformation(extent = {{100, -10}, {120, 10}})));
            Modelica.Blocks.Continuous.Integrator integrator1(initType = Modelica.Blocks.Types.Init.NoInit, y_start = int1) annotation(Placement(transformation(extent = {{-122, 56}, {-110, 68}})));
            Modelica.Blocks.Math.Gain gain6(k = Ki) annotation(Placement(transformation(extent = {{-144, 56}, {-132, 68}})));
            Modelica.Blocks.Math.Gain gain8(k = Kp) annotation(Placement(transformation(extent = {{-144, 82}, {-132, 94}})));
            Modelica.Blocks.Nonlinear.Limiter limiter(uMax = vmax, uMin = vmin) annotation(Placement(transformation(extent = {{12, 56}, {24, 68}})));
            Modelica.Blocks.Nonlinear.Limiter limiter1(uMax = gmax, uMin = gmin) annotation(Placement(transformation(extent = {{56, 56}, {68, 68}})));
            Modelica.Blocks.Math.Add add1(k1 = +1, k2 = -1) annotation(Placement(transformation(extent = {{-172, 54}, {-158, 68}})));
            Modelica.Blocks.Math.Add add2 annotation(Placement(transformation(extent = {{-102, 60}, {-88, 74}})));
            Modelica.Blocks.Math.Add3 add3_1(k1 = -1, k2 = +1, k3 = +1) annotation(Placement(transformation(extent = {{-72, 60}, {-58, 74}})));
            Modelica.Blocks.Math.Add add3 annotation(Placement(transformation(extent = {{172, 52}, {184, 64}})));
            Modelica.Blocks.Sources.Constant const1(k = wref) annotation(Placement(transformation(extent = {{-210, 60}, {-198, 72}})));
          protected
            parameter Real int1 = sigma * Pref;
            parameter Real int2 = 0;
            parameter Real int3 = Pref;
            parameter Real int4 = Tr * Pref;
            parameter Real int5 = a13 * a21 / a11 * Pref;
          equation
            deltaG = limiter1.y;
            v = limiter.y;
            connect(gain1.y, feedback.u2) annotation(Line(points = {{-22.6, 42}, {-28, 42}, {-28, 57.2}}, color = {0, 0, 127}, smooth = Smooth.None));
            connect(feedback.y, integrator2.u) annotation(Line(points = {{-22.6, 62}, {-19.2, 62}}, color = {0, 0, 127}, smooth = Smooth.None));
            connect(gain.y, feedback.u1) annotation(Line(points = {{-37.4, 62}, {-32.8, 62}}, color = {0, 0, 127}, smooth = Smooth.None));
            connect(gain5.y, feedback1.u2) annotation(Line(points = {{30.6, 8}, {48, 8}, {48, 21.2}}, color = {0, 0, 127}, smooth = Smooth.None));
            connect(feedback1.y, integrator4.u) annotation(Line(points = {{42.6, 26}, {29.2, 26}}, color = {0, 0, 127}, smooth = Smooth.None));
            connect(integrator4.y, gain3.u) annotation(Line(points = {{15.4, 26}, {-36.8, 26}}, color = {0, 0, 127}, smooth = Smooth.None));
            connect(gain4.y, feedback2.u2) annotation(Line(points = {{131.4, 8}, {124, 8}, {124, 23.2}}, color = {0, 0, 127}, smooth = Smooth.None));
            connect(feedback2.y, integrator5.u) annotation(Line(points = {{129.4, 28}, {134.8, 28}}, color = {0, 0, 127}, smooth = Smooth.None));
            connect(gain7.y, feedback2.u1) annotation(Line(points = {{116.6, 28}, {119.2, 28}}, color = {0, 0, 127}, smooth = Smooth.None));
            connect(gain1.u, integrator2.y) annotation(Line(points = {{-8.8, 42}, {2, 42}, {2, 62}, {-5.4, 62}}, color = {0, 0, 127}, smooth = Smooth.None));
            connect(integrator4.y, gain5.u) annotation(Line(points = {{15.4, 26}, {10, 26}, {10, 8}, {16.8, 8}}, color = {0, 0, 127}, smooth = Smooth.None));
            connect(integrator5.y, gain4.u) annotation(Line(points = {{148.6, 28}, {156, 28}, {156, 8}, {145.2, 8}}, color = {0, 0, 127}, smooth = Smooth.None));
            connect(gain6.y, integrator1.u) annotation(Line(points = {{-131.4, 62}, {-123.2, 62}}, color = {0, 0, 127}, smooth = Smooth.None));
            connect(limiter.y, integrator3.u) annotation(Line(points = {{24.6, 62}, {32.8, 62}}, color = {0, 0, 127}, smooth = Smooth.None));
            connect(integrator2.y, limiter.u) annotation(Line(points = {{-5.4, 62}, {10.8, 62}}, color = {0, 0, 127}, smooth = Smooth.None));
            connect(integrator3.y, limiter1.u) annotation(Line(points = {{46.6, 62}, {54.8, 62}}, color = {0, 0, 127}, smooth = Smooth.None));
            connect(limiter1.y, gain2.u) annotation(Line(points = {{68.6, 62}, {70, 62}, {70, 82}, {3.2, 82}}, color = {0, 0, 127}, smooth = Smooth.None));
            connect(limiter1.y, feedback1.u1) annotation(Line(points = {{68.6, 62}, {70, 62}, {70, 26}, {52.8, 26}}, color = {0, 0, 127}, smooth = Smooth.None));
            connect(add1.y, gain8.u) annotation(Line(points = {{-157.3, 61}, {-151.65, 61}, {-151.65, 88}, {-145.2, 88}}, color = {0, 0, 127}, smooth = Smooth.None));
            connect(add1.y, gain6.u) annotation(Line(points = {{-157.3, 61}, {-145.2, 61.5}, {-145.2, 62}}, color = {0, 0, 127}, smooth = Smooth.None));
            connect(add1.u2, w) annotation(Line(points = {{-173.4, 56.8}, {-180, 56.8}, {-180, 9}, {-7, 9}}, color = {0, 0, 127}, smooth = Smooth.None));
            connect(integrator1.y, add2.u2) annotation(Line(points = {{-109.4, 62}, {-105.4, 62}, {-105.4, 62.8}, {-103.4, 62.8}}, color = {0, 0, 127}, smooth = Smooth.None));
            connect(add2.u1, gain8.y) annotation(Line(points = {{-103.4, 71.2}, {-106, 71.2}, {-106, 88}, {-131.4, 88}}, color = {0, 0, 127}, smooth = Smooth.None));
            connect(gain2.y, add3_1.u1) annotation(Line(points = {{-10.6, 82}, {-78, 82}, {-78, 72.6}, {-73.4, 72.6}}, color = {0, 0, 127}, smooth = Smooth.None));
            connect(add2.y, add3_1.u2) annotation(Line(points = {{-87.3, 67}, {-73.4, 67}}, color = {0, 0, 127}, smooth = Smooth.None));
            connect(add3_1.u3, gain3.y) annotation(Line(points = {{-73.4, 61.4}, {-78, 61.4}, {-78, 26}, {-50.6, 26}}, color = {0, 0, 127}, smooth = Smooth.None));
            connect(add3_1.y, gain.u) annotation(Line(points = {{-57.3, 67}, {-54, 67}, {-54, 62}, {-51.2, 62}}, color = {0, 0, 127}, smooth = Smooth.None));
            connect(G6.y, add3.u1) annotation(Line(points = {{128.6, 62}, {164, 62}, {164, 61.6}, {170.8, 61.6}}, color = {0, 0, 127}, smooth = Smooth.None));
            connect(integrator5.y, add3.u2) annotation(Line(points = {{148.6, 28}, {164, 28}, {164, 54.4}, {170.8, 54.4}}, color = {0, 0, 127}, smooth = Smooth.None));
            connect(add3.y, Pm) annotation(Line(points = {{184.6, 58}, {188, 58}, {188, -2}, {84, -2}}, color = {0, 0, 127}, smooth = Smooth.None));
            connect(limiter1.y, G6.u) annotation(Line(points = {{68.6, 62}, {114.8, 62}}, color = {0, 0, 127}, smooth = Smooth.None));
            connect(limiter1.y, gain7.u) annotation(Line(points = {{68.6, 62}, {92, 62}, {92, 28}, {102.8, 28}}, color = {0, 0, 127}, smooth = Smooth.None));
            connect(const1.y, add1.u1) annotation(Line(points = {{-197.4, 66}, {-173.4, 66}, {-173.4, 65.2}}, color = {0, 0, 127}));
            annotation(Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Rectangle(extent = {{-100, 100}, {100, -100}}, lineColor = {0, 0, 255}), Text(extent = {{-34, 20}, {32, -18}}, lineColor = {0, 0, 255}, textString = "TGTypeIV"), Text(visible = true, origin = {-81, -1}, fillPattern = FillPattern.Solid, extent = {{-23, -13}, {23, 13}}, textString = "W", fontName = "Arial"), Text(visible = true, origin = {81.0002, 1}, fillPattern = FillPattern.Solid, extent = {{-25.0002, -13}, {25.0002, 13}}, fontName = "Arial", textString = "Pm", lineColor = {0, 0, 0}), Text(visible = true, origin = {-69, -57}, fillPattern = FillPattern.Solid, extent = {{-23, -13}, {23, 13}}, fontName = "Arial", textString = "Wref", lineColor = {0, 0, 0})}), Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}})), Documentation(info = "<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\">
<tr>
<td><p>Reference</p></td>
<td>Hydro Turbine (Linear model) and Governor (Standard model) - control scheme Type 4, PSAT Manual</td>
</tr>
<tr>
<td><p>Last update</p></td>
<td>2015-10-02</td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p>Tetiana Bogodorova, SmarTS Lab, KTH Royal Institute of Technology</p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p><a href=\"mailto:luigiv@kth.se\">luigiv@kth.se</a></p></td>
</tr>
</table>
<p><br><span style=\"font-family: MS Shell Dlg 2;\">&LT;iPSL: iTesla Power System Library&GT;</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Copyright 2015 RTE (France), AIA (Spain), KTH (Sweden) and DTU (Denmark)</span></p>
<ul>
<li><span style=\"font-family: MS Shell Dlg 2;\">RTE: http://www.rte-france.com/ </span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">AIA: http://www.aia.es/en/energy/</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">KTH: https://www.kth.se/en</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">DTU:http://www.dtu.dk/english</span></li>
</ul>
<p><span style=\"font-family: MS Shell Dlg 2;\">The authors can be contacted by email: info at ipsl dot org</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">This package is part of the iTesla Power System Library (&QUOT;iPSL&QUOT;) .</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is free software: you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">You should have received a copy of the GNU Lesser General Public License along with the iPSL. If not, see &LT;http://www.gnu.org/licenses/&GT;.</span></p>
</html>"));
          end TGTypeIV;

          model TGTypeV "Hydro Turbine (Nonlinear model) and Governor (PI controller combined with servomotor)- control scheme Type 5"
            parameter Real Tg "Servomotor droop (pu)";
            parameter Real gmax "Maximum gate opening (pu)";
            parameter Real gmin "Minimum gate opening (pu)";
            parameter Real vmax "Maximum gate opening rate (pu)";
            parameter Real vmin "Minimum gate opening rate (pu)";
            parameter Real Tp "Pilot valve time constant (s)";
            parameter Real Tw "Water starting time (s)";
            parameter Real Kp "Proportional droop (p.u./p.u.)";
            parameter Real Ki "Integral droop (p.u./p.u.)";
            parameter Real sigma "Permanent speed droop (p.u./p.u.)";
            parameter Real Pref;
            Real G "Gate opening (pu)";
            Modelica.Blocks.Continuous.Integrator integrator(initType = Modelica.Blocks.Types.Init.NoInit, y_start = Pref) annotation(Placement(transformation(extent = {{68, 54}, {80, 66}})));
            Modelica.Blocks.Math.Gain gain(k = 1 / Tg, y(start = 0)) annotation(Placement(transformation(extent = {{28, 54}, {40, 66}})));
            Modelica.Blocks.Continuous.Integrator integrator3(initType = Modelica.Blocks.Types.Init.SteadyState, y_start = Pref) annotation(Placement(transformation(extent = {{-6, -6}, {6, 6}}, rotation = 0, origin = {218, 62})));
            Modelica.Blocks.Math.Gain gain7(k = 1 / Tw) annotation(Placement(transformation(extent = {{192, 56}, {204, 68}})));
            Modelica.Blocks.Math.MultiSum multiSum3(k = {-1, 1}, nu = 2) annotation(Placement(transformation(extent = {{172, 56}, {184, 68}})));
            Modelica.Blocks.Interfaces.RealInput w "Rotor speed (pu)" annotation(Placement(transformation(extent = {{-54, 16}, {-44, 26}}), iconTransformation(extent = {{-134, -8}, {-100, 26}})));
            Modelica.Blocks.Interfaces.RealOutput Pm "Power Pm (pu)" annotation(Placement(transformation(extent = {{20, 14}, {32, 26}}), iconTransformation(extent = {{100, 6}, {126, 32}})));
            Modelica.Blocks.Continuous.Integrator integrator4(initType = Modelica.Blocks.Types.Init.SteadyState, y_start = Pref) annotation(Placement(transformation(extent = {{-46, 58}, {-34, 70}})));
            Modelica.Blocks.Math.Gain Integral(k = Ki) annotation(Placement(transformation(extent = {{-64, 58}, {-52, 70}})));
            Modelica.Blocks.Math.Gain gain9(k = 1 / Tp) annotation(Placement(transformation(extent = {{-138, 60}, {-126, 72}})));
            Modelica.Blocks.Math.MultiSum multiSum6(nu = 2, k = {-1, 1}) annotation(Placement(transformation(extent = {{-158, 60}, {-146, 72}})));
            Modelica.Blocks.Math.Gain gain6(k = sigma) annotation(Placement(transformation(extent = {{-6, -6}, {6, 6}}, rotation = 180, origin = {-142, 86})));
            Modelica.Blocks.Continuous.Integrator integrator5(initType = Modelica.Blocks.Types.Init.NoInit, y_start = 0) annotation(Placement(transformation(extent = {{-94, 58}, {-82, 70}})));
            Modelica.Blocks.Math.Gain Proportional(k = Kp) annotation(Placement(transformation(extent = {{-54, 34}, {-42, 46}})));
            Modelica.Blocks.Math.Gain gain8(k = 1 / Tp) annotation(Placement(transformation(extent = {{-6, -6}, {6, 6}}, rotation = 180, origin = {-98, 40})));
            Modelica.Blocks.Math.Division division(y(start = 1)) annotation(Placement(transformation(extent = {{120, 58}, {132, 70}})));
            Modelica.Blocks.Math.Product product1 annotation(Placement(transformation(extent = {{244, 70}, {256, 82}})));
            Modelica.Blocks.Math.MultiProduct multiProduct(nu = 2) annotation(Placement(transformation(extent = {{146, 58}, {158, 70}})));
            Modelica.Blocks.Sources.Constant const1(k = 1) annotation(Placement(transformation(extent = {{-6, -6}, {6, 6}}, rotation = 90, origin = {168, 42})));
            Modelica.Blocks.Interfaces.RealInput w1 "Rotor speed (pu)" annotation(Placement(transformation(extent = {{-124, 110}, {-114, 120}}), iconTransformation(extent = {{-136, 58}, {-100, 94}})));
            Modelica.Blocks.Math.Add add(k1 = +1, k2 = -1) annotation(Placement(transformation(extent = {{-6, -6}, {6, 6}}, rotation = 180, origin = {-94, 86})));
            Modelica.Blocks.Nonlinear.Limiter limiter2(uMax = vmax, uMin = vmin) annotation(Placement(transformation(extent = {{46, 54}, {58, 66}})));
            Modelica.Blocks.Nonlinear.Limiter limiter3(uMax = gmax, uMin = gmin) annotation(Placement(transformation(extent = {{86, 54}, {98, 66}})));
            Modelica.Blocks.Math.Add add1 annotation(Placement(transformation(extent = {{-20, 56}, {-10, 66}})));
            Modelica.Blocks.Math.Add add2(k1 = +1, k2 = -1) annotation(Placement(transformation(extent = {{6, 54}, {18, 66}})));
            Modelica.Blocks.Math.Add add3(k1 = +1, k2 = -1) annotation(Placement(transformation(extent = {{-114, 58}, {-104, 68}})));
            Modelica.Blocks.Interfaces.RealInput wref "Reference rotor speed (pu)" annotation(Placement(transformation(extent = {{-54, 6}, {-44, 16}}), iconTransformation(extent = {{-134, -62}, {-100, -28}})));
            Modelica.Blocks.Math.Add add4(k1 = +1, k2 = -1) annotation(Placement(transformation(extent = {{-182, 56}, {-168, 70}})));
          equation
            G = limiter3.y;
            connect(multiSum3.y, gain7.u) annotation(Line(points = {{185.02, 62}, {190.8, 62}}, color = {0, 0, 127}, smooth = Smooth.None));
            connect(gain6.y, multiSum6.u[1]) annotation(Line(points = {{-148.6, 86}, {-160, 86}, {-160, 68.1}, {-158, 68.1}}, color = {0, 0, 127}, smooth = Smooth.None));
            connect(multiSum6.y, gain9.u) annotation(Line(points = {{-144.98, 66}, {-139.2, 66}}, color = {0, 0, 127}, smooth = Smooth.None));
            connect(integrator5.y, Integral.u) annotation(Line(points = {{-81.4, 64}, {-65.2, 64}}, color = {0, 0, 127}, smooth = Smooth.None));
            connect(Integral.y, integrator4.u) annotation(Line(points = {{-51.4, 64}, {-47.2, 64}}, color = {0, 0, 127}, smooth = Smooth.None));
            connect(Proportional.u, Integral.u) annotation(Line(points = {{-55.2, 40}, {-71.2, 40}, {-71.2, 64}, {-65.2, 64}}, color = {0, 0, 127}, smooth = Smooth.None));
            connect(gain8.u, integrator5.y) annotation(Line(points = {{-90.8, 40}, {-76, 40}, {-76, 64}, {-81.4, 64}}, color = {0, 0, 127}, smooth = Smooth.None));
            connect(division.y, multiProduct.u[1]) annotation(Line(points = {{132.6, 64}, {139.3, 64}, {139.3, 66.1}, {146, 66.1}}, color = {0, 0, 127}, smooth = Smooth.None));
            connect(division.y, multiProduct.u[2]) annotation(Line(points = {{132.6, 64}, {140, 64}, {140, 61.9}, {146, 61.9}}, color = {0, 0, 127}, smooth = Smooth.None));
            connect(multiProduct.y, product1.u1) annotation(Line(points = {{159.02, 64}, {164, 64}, {164, 79.6}, {242.8, 79.6}}, color = {0, 0, 127}, smooth = Smooth.None));
            connect(multiProduct.y, multiSum3.u[1]) annotation(Line(points = {{159.02, 64}, {165.51, 64}, {165.51, 64.1}, {172, 64.1}}, color = {0, 0, 127}, smooth = Smooth.None));
            connect(const1.y, multiSum3.u[2]) annotation(Line(points = {{168, 48.6}, {168, 59.9}, {172, 59.9}}, color = {0, 0, 127}, smooth = Smooth.None));
            connect(gain7.y, integrator3.u) annotation(Line(points = {{204.6, 62}, {210.8, 62}}, color = {0, 0, 127}, smooth = Smooth.None));
            connect(product1.u2, integrator3.y) annotation(Line(points = {{242.8, 72.4}, {240, 72}, {236, 72}, {236, 62}, {224.6, 62}}, color = {0, 0, 127}, smooth = Smooth.None));
            connect(product1.y, Pm) annotation(Line(points = {{256.6, 76}, {260, 76}, {260, 20}, {26, 20}}, color = {0, 0, 127}, smooth = Smooth.None));
            connect(integrator3.y, division.u1) annotation(Line(points = {{224.6, 62}, {232, 62}, {232, 32}, {112, 32}, {112, 67.6}, {118.8, 67.6}}, color = {0, 0, 127}, smooth = Smooth.None));
            connect(w1, add.u2) annotation(Line(points = {{-119, 115}, {-78, 115}, {-78, 89.6}, {-86.8, 89.6}}, color = {0, 0, 127}, smooth = Smooth.None));
            connect(add.y, gain6.u) annotation(Line(points = {{-100.6, 86}, {-134.8, 86}}, color = {0, 0, 127}, smooth = Smooth.None));
            connect(gain.y, limiter2.u) annotation(Line(points = {{40.6, 60}, {44.8, 60}}, color = {0, 0, 127}, smooth = Smooth.None));
            connect(limiter2.y, integrator.u) annotation(Line(points = {{58.6, 60}, {66.8, 60}}, color = {0, 0, 127}, smooth = Smooth.None));
            connect(integrator.y, limiter3.u) annotation(Line(points = {{80.6, 60}, {84.8, 60}}, color = {0, 0, 127}, smooth = Smooth.None));
            connect(limiter3.y, division.u2) annotation(Line(points = {{98.6, 60}, {108.7, 60}, {108.7, 60.4}, {118.8, 60.4}}, color = {0, 0, 127}, smooth = Smooth.None));
            connect(add2.y, gain.u) annotation(Line(points = {{18.6, 60}, {26.8, 60}}, color = {0, 0, 127}, smooth = Smooth.None));
            connect(limiter3.y, add2.u2) annotation(Line(points = {{98.6, 60}, {100, 60}, {100, 34}, {-2, 34}, {-2, 56.4}, {4.8, 56.4}}, color = {0, 0, 127}, smooth = Smooth.None));
            connect(add1.y, add2.u1) annotation(Line(points = {{-9.5, 61}, {-4, 61}, {-4, 63.6}, {4.8, 63.6}}, color = {0, 0, 127}, smooth = Smooth.None));
            connect(add1.y, add.u1) annotation(Line(points = {{-9.5, 61}, {-4, 61}, {-4, 82}, {-86.8, 82.4}}, color = {0, 0, 127}, smooth = Smooth.None));
            connect(Proportional.y, add1.u2) annotation(Line(points = {{-41.4, 40}, {-28, 40}, {-28, 58}, {-21, 58}}, color = {0, 0, 127}, smooth = Smooth.None));
            connect(integrator4.y, add1.u1) annotation(Line(points = {{-33.4, 64}, {-21, 64}}, color = {0, 0, 127}, smooth = Smooth.None));
            connect(gain8.y, add3.u2) annotation(Line(points = {{-104.6, 40}, {-124, 40}, {-124, 60}, {-115, 60}}, color = {0, 0, 127}, smooth = Smooth.None));
            connect(gain9.y, add3.u1) annotation(Line(points = {{-125.4, 66}, {-115, 66}}, color = {0, 0, 127}, smooth = Smooth.None));
            connect(add3.y, integrator5.u) annotation(Line(points = {{-103.5, 63}, {-102.75, 63}, {-102.75, 64}, {-95.2, 64}}, color = {0, 0, 127}, smooth = Smooth.None));
            connect(add4.y, multiSum6.u[2]) annotation(Line(points = {{-167.3, 63}, {-162.65, 63}, {-162.65, 63.9}, {-158, 63.9}}, color = {0, 0, 127}, smooth = Smooth.None));
            connect(add4.u1, wref) annotation(Line(points = {{-183.4, 67.2}, {-200, 67.2}, {-200, 11}, {-49, 11}}, color = {0, 0, 127}, smooth = Smooth.None));
            connect(add4.u2, w) annotation(Line(points = {{-183.4, 58.8}, {-194, 58.8}, {-194, 21}, {-49, 21}}, color = {0, 0, 127}, smooth = Smooth.None));
            annotation(Icon(coordinateSystem(extent = {{-100, -80}, {100, 120}}, preserveAspectRatio = false), graphics = {Rectangle(extent = {{-100, 120}, {100, -80}}, lineColor = {0, 0, 255}), Text(extent = {{-32, 44}, {34, -4}}, lineColor = {0, 0, 255}, textString = "TGTypeV"), Text(visible = true, origin = {-82, 9}, fillPattern = FillPattern.Solid, extent = {{-18, -13}, {18, 13}}, textString = "W", fontName = "Arial"), Text(visible = true, origin = {80.0002, 20}, fillPattern = FillPattern.Solid, extent = {{-18.0002, -14}, {18.0002, 14}}, fontName = "Arial", textString = "Pm", lineColor = {0, 0, 0}), Text(visible = true, origin = {-78, 76}, fillPattern = FillPattern.Solid, extent = {{-22, -14}, {22, 14}}, fontName = "Arial", textString = "P0", lineColor = {0, 0, 0}), Text(visible = true, origin = {-74, -47}, fillPattern = FillPattern.Solid, extent = {{-18, -13}, {18, 13}}, fontName = "Arial", textString = "Wref", lineColor = {0, 0, 0})}), Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -80}, {100, 120}})), Documentation(info = "<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\">
<tr>
<td><p>Reference</p></td>
<td>Hydro Turbine (Linear model) and Governor (Standard model) - control scheme Type 5, PSAT Manual</td>
</tr>
<tr>
<td><p>Last update</p></td>
<td>2015-10-02</td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p>Tetiana Bogodorova, SmarTS Lab, KTH Royal Institute of Technology</p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p><a href=\"mailto:luigiv@kth.se\">luigiv@kth.se</a></p></td>
</tr>
</table>
<p><br><span style=\"font-family: MS Shell Dlg 2;\">&LT;iPSL: iTesla Power System Library&GT;</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Copyright 2015 RTE (France), AIA (Spain), KTH (Sweden) and DTU (Denmark)</span></p>
<ul>
<li><span style=\"font-family: MS Shell Dlg 2;\">RTE: http://www.rte-france.com/ </span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">AIA: http://www.aia.es/en/energy/</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">KTH: https://www.kth.se/en</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">DTU:http://www.dtu.dk/english</span></li>
</ul>
<p><span style=\"font-family: MS Shell Dlg 2;\">The authors can be contacted by email: info at ipsl dot org</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">This package is part of the iTesla Power System Library (&QUOT;iPSL&QUOT;) .</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is free software: you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">You should have received a copy of the GNU Lesser General Public License along with the iPSL. If not, see &LT;http://www.gnu.org/licenses/&GT;.</span></p>
</html>"));
          end TGTypeV;

          model TGTypeVI "Hydro Turbine (Nonlinear model) and Governor (PID controller combined with servomotor)- control scheme Type 6"
            parameter Real gmax "Maximum gate opening (pu)";
            parameter Real gmin "Minimum gate opening (pu)";
            parameter Real vmax "Maximum gate opening rate (pu)";
            parameter Real vmin "Minimum gate opening rate (pu)";
            parameter Real Ta "Pilot valve time constant (s)";
            parameter Real Tw "Water starting time (s)";
            parameter Real beta "Transient speed droop (p.u./p.u.)";
            parameter Real Kp "Proportional droop (p.u./p.u.)";
            parameter Real Ki "Integral droop (p.u./p.u.)";
            parameter Real Kd "Derivative droop (p.u./p.u.)";
            parameter Real Td "Derivative droop time constant (s)";
            parameter Real Rp "Permanent droop (p.u./p.u.)";
            parameter Real Ka;
            parameter Real dref;
            parameter Real po;
            Real G "Gate opening (pu)";
            Modelica.Blocks.Continuous.Integrator integrator(initType = Modelica.Blocks.Types.Init.NoInit, y_start = po * (gmax - gmin)) annotation(Placement(transformation(extent = {{50, 52}, {62, 64}})));
            Modelica.Blocks.Sources.Step step(height = 1, offset = 0, startTime = 0) annotation(Placement(transformation(extent = {{-6, -6}, {6, 6}}, rotation = 180, origin = {258, -2})));
            Modelica.Blocks.Math.MultiSum multiSum1(k = {-1, 1}, nu = 2) annotation(Placement(transformation(extent = {{-152, -26}, {-140, -14}})));
            Modelica.Blocks.Continuous.Integrator integrator3(initType = Modelica.Blocks.Types.Init.NoInit, y_start = po) annotation(Placement(transformation(extent = {{-6, -6}, {6, 6}}, rotation = 180, origin = {166, -2})));
            Modelica.Blocks.Math.MultiSum multiSum3(nu = 2, k = {1, -1}) annotation(Placement(transformation(extent = {{212, 52}, {224, 64}})));
            Modelica.Blocks.Interfaces.RealOutput Pm "Mechanical power (pu)" annotation(Placement(transformation(extent = {{88, 14}, {100, 26}}), iconTransformation(extent = {{100, 24}, {126, 50}})));
            Modelica.Blocks.Math.Gain gain9(k = Kp) annotation(Placement(transformation(extent = {{-98, 74}, {-86, 86}})));
            Modelica.Blocks.Math.MultiSum multiSum5(nu = 3, k = {1, 1, 1}) annotation(Placement(transformation(extent = {{-52, 54}, {-40, 66}})));
            Modelica.Blocks.Math.MultiSum multiSum6(k = {1, -1}, nu = 2) annotation(Placement(transformation(extent = {{-130, 54}, {-118, 66}})));
            Modelica.Blocks.Math.Gain gain6(k = Rp) annotation(Placement(transformation(extent = {{-6, -6}, {6, 6}}, rotation = 180, origin = {-120, 18})));
            Modelica.Blocks.Math.MultiSum multiSum7(k = {1, -1}, nu = 2) annotation(Placement(transformation(extent = {{-6, -6}, {6, 6}}, rotation = 0, origin = {-148, 84})));
            Modelica.Blocks.Continuous.Integrator integrator5(initType = Modelica.Blocks.Types.Init.NoInit, y_start = po * (gmax - gmin)) annotation(Placement(transformation(extent = {{-76, 54}, {-64, 66}})));
            Modelica.Blocks.Math.Gain Proportional(k = beta) annotation(Placement(transformation(extent = {{80, 96}, {92, 108}})));
            Modelica.Blocks.Math.Gain gain8(k = Ki) annotation(Placement(transformation(extent = {{-6, -6}, {6, 6}}, rotation = 0, origin = {-92, 60})));
            Modelica.Blocks.Nonlinear.Limiter limiter(uMax = vmax, uMin = vmin) annotation(Placement(transformation(extent = {{26, 52}, {38, 64}})));
            Modelica.Blocks.Nonlinear.Limiter limiter1(uMax = gmax, uMin = gmin) annotation(Placement(transformation(extent = {{74, 52}, {86, 64}})));
            Modelica.Blocks.Math.Division division annotation(Placement(transformation(extent = {{158, 56}, {170, 68}})));
            Modelica.Blocks.Math.Product product1 annotation(Placement(transformation(extent = {{262, 64}, {274, 76}})));
            Modelica.Blocks.Math.MultiProduct multiProduct(nu = 2) annotation(Placement(transformation(extent = {{184, 56}, {196, 68}})));
            Modelica.Blocks.Interfaces.RealInput Pe "Active power (pu)" annotation(Placement(transformation(extent = {{-54, -46}, {-44, -36}}), iconTransformation(extent = {{-132, -18}, {-100, 14}})));
            Modelica.Blocks.Continuous.Derivative derivative(k = Kd, T = Td) annotation(Placement(transformation(extent = {{-90, 30}, {-78, 42}})));
            Modelica.Blocks.Continuous.TransferFunction transferFunction(a = {Ta, 1}, b = {Ka}) annotation(Placement(transformation(extent = {{0, 52}, {12, 64}})));
            Modelica.Blocks.Math.MultiSum multiSum2(nu = 2, k = {1, -1}) annotation(Placement(transformation(extent = {{-28, 52}, {-16, 64}})));
            Modelica.Blocks.Math.Gain Gain10(k = 1 / (gmax - gmin)) annotation(Placement(transformation(extent = {{114, 52}, {126, 64}})));
            Modelica.Blocks.Math.MultiSum multiSum4(nu = 2, k = {-1, 1}) annotation(Placement(transformation(extent = {{-6, -6}, {6, 6}}, rotation = 180, origin = {224, -2})));
            Modelica.Blocks.Math.Gain gain7(k = 1 / Tw) annotation(Placement(transformation(extent = {{-6, -6}, {6, 6}}, rotation = 180, origin = {192, -2})));
            Modelica.Blocks.Logical.Switch switch1 annotation(Placement(transformation(extent = {{-8, -8}, {8, 8}}, rotation = 180, origin = {-6, -32})));
            Modelica.Blocks.Math.RealToBoolean realToBoolean(threshold = 0.5) annotation(Placement(transformation(extent = {{-8, -8}, {8, 8}}, rotation = 180, origin = {38, -32})));
            Modelica.Blocks.Sources.Constant const(k = dref) annotation(Placement(transformation(extent = {{-6, -6}, {6, 6}}, rotation = 180, origin = {68, -32})));
            Modelica.Blocks.Interfaces.RealInput Pref "Active power reference (pu)" annotation(Placement(transformation(extent = {{-54, -36}, {-44, -26}}), iconTransformation(extent = {{-132, -60}, {-100, -28}})));
            Modelica.Blocks.Interfaces.RealInput wref "Rotor speed reference (pu)" annotation(Placement(transformation(extent = {{-54, 0}, {-44, 10}}), iconTransformation(extent = {{-132, 62}, {-100, 94}})));
            Modelica.Blocks.Interfaces.RealInput we "Rotor speed (pu)" annotation(Placement(transformation(extent = {{-54, -12}, {-44, -2}}), iconTransformation(extent = {{-132, 20}, {-100, 52}})));
          equation
            G = Gain10.y;
            connect(gain9.y, multiSum5.u[1]) annotation(Line(points = {{-85.4, 80}, {-57.7, 80}, {-57.7, 62.8}, {-52, 62.8}}, color = {0, 0, 127}, smooth = Smooth.None));
            connect(limiter.y, integrator.u) annotation(Line(points = {{38.6, 58}, {48.8, 58}}, color = {0, 0, 127}, smooth = Smooth.None));
            connect(integrator.y, limiter1.u) annotation(Line(points = {{62.6, 58}, {72.8, 58}}, color = {0, 0, 127}, smooth = Smooth.None));
            connect(division.y, multiProduct.u[1]) annotation(Line(points = {{170.6, 62}, {177.3, 62}, {177.3, 64.1}, {184, 64.1}}, color = {0, 0, 127}, smooth = Smooth.None));
            connect(division.y, multiProduct.u[2]) annotation(Line(points = {{170.6, 62}, {178, 62}, {178, 59.9}, {184, 59.9}}, color = {0, 0, 127}, smooth = Smooth.None));
            connect(multiProduct.y, multiSum3.u[1]) annotation(Line(points = {{197.02, 62}, {203.51, 62}, {203.51, 60.1}, {212, 60.1}}, color = {0, 0, 127}, smooth = Smooth.None));
            connect(product1.y, Pm) annotation(Line(points = {{274.6, 70}, {282, 70}, {282, 20}, {94, 20}}, color = {0, 0, 127}, smooth = Smooth.None));
            connect(gain8.y, integrator5.u) annotation(Line(points = {{-85.4, 60}, {-77.2, 60}}, color = {0, 0, 127}, smooth = Smooth.None));
            connect(integrator5.y, multiSum5.u[2]) annotation(Line(points = {{-63.4, 60}, {-52, 60}}, color = {0, 0, 127}, smooth = Smooth.None));
            connect(derivative.y, multiSum5.u[3]) annotation(Line(points = {{-77.4, 36}, {-58, 36}, {-58, 58}, {-52, 58}, {-52, 57.2}}, color = {0, 0, 127}, smooth = Smooth.None));
            connect(multiSum6.y, gain9.u) annotation(Line(points = {{-116.98, 60}, {-108, 60}, {-108, 80}, {-99.2, 80}}, color = {0, 0, 127}, smooth = Smooth.None));
            connect(multiSum6.y, gain8.u) annotation(Line(points = {{-116.98, 60}, {-99.2, 60}}, color = {0, 0, 127}, smooth = Smooth.None));
            connect(multiSum6.y, derivative.u) annotation(Line(points = {{-116.98, 60}, {-108, 60}, {-108, 36}, {-91.2, 36}}, color = {0, 0, 127}, smooth = Smooth.None));
            connect(multiSum5.y, multiSum2.u[1]) annotation(Line(points = {{-38.98, 60}, {-27.49, 60}, {-27.49, 60.1}, {-28, 60.1}}, color = {0, 0, 127}, smooth = Smooth.None));
            connect(multiSum2.y, transferFunction.u) annotation(Line(points = {{-14.98, 58}, {-1.2, 58}}, color = {0, 0, 127}, smooth = Smooth.None));
            connect(transferFunction.y, limiter.u) annotation(Line(points = {{12.6, 58}, {24.8, 58}}, color = {0, 0, 127}, smooth = Smooth.None));
            connect(Gain10.y, division.u2) annotation(Line(points = {{126.6, 58}, {144, 58}, {144, 58.4}, {156.8, 58.4}}, color = {0, 0, 127}, smooth = Smooth.None));
            connect(limiter1.y, Gain10.u) annotation(Line(points = {{86.6, 58}, {112.8, 58}}, color = {0, 0, 127}, smooth = Smooth.None));
            connect(multiSum2.u[2], limiter1.y) annotation(Line(points = {{-28, 55.9}, {-36, 55.9}, {-36, 40}, {96, 40}, {96, 58}, {86.6, 58}}, color = {0, 0, 127}, smooth = Smooth.None));
            connect(Proportional.y, multiSum3.u[2]) annotation(Line(points = {{92.6, 102}, {138, 102}, {138, 34}, {206, 34}, {206, 58}, {212, 58}, {212, 55.9}}, color = {0, 0, 127}, smooth = Smooth.None));
            connect(multiSum3.y, multiSum4.u[1]) annotation(Line(points = {{225.02, 58}, {238, 58}, {238, 4}, {230, 4}, {230, -4.1}}, color = {0, 0, 127}, smooth = Smooth.None));
            connect(step.y, multiSum4.u[2]) annotation(Line(points = {{251.4, -2}, {230, -2}, {230, 0.1}}, color = {0, 0, 127}, smooth = Smooth.None));
            connect(multiSum4.y, gain7.u) annotation(Line(points = {{216.98, -2}, {199.2, -2}}, color = {0, 0, 127}, smooth = Smooth.None));
            connect(gain7.y, integrator3.u) annotation(Line(points = {{185.4, -2}, {173.2, -2}}, color = {0, 0, 127}, smooth = Smooth.None));
            connect(integrator3.y, division.u1) annotation(Line(points = {{159.4, -2}, {148, -2}, {148, 66}, {156.8, 65.6}}, color = {0, 0, 127}, smooth = Smooth.None));
            connect(multiSum3.y, product1.u1) annotation(Line(points = {{225.02, 58}, {237.51, 58}, {237.51, 73.6}, {260.8, 73.6}}, color = {0, 0, 127}, smooth = Smooth.None));
            connect(integrator3.y, product1.u2) annotation(Line(points = {{159.4, -2}, {158, -2}, {158, 32}, {250, 32}, {250, 66.4}, {260.8, 66.4}}, color = {0, 0, 127}, smooth = Smooth.None));
            connect(switch1.y, gain6.u) annotation(Line(points = {{-14.8, -32}, {-24, -32}, {-24, 18}, {-112.8, 18}}, color = {0, 0, 127}, smooth = Smooth.None));
            connect(multiSum7.y, multiSum6.u[1]) annotation(Line(points = {{-140.98, 84}, {-136, 84}, {-136, 62.1}, {-130, 62.1}}, color = {0, 0, 127}, smooth = Smooth.None));
            connect(gain6.y, multiSum6.u[2]) annotation(Line(points = {{-126.6, 18}, {-136, 18}, {-136, 57.9}, {-130, 57.9}}, color = {0, 0, 127}, smooth = Smooth.None));
            connect(switch1.u3, multiSum1.y) annotation(Line(points = {{3.6, -25.6}, {8, -25.6}, {8, -20}, {-138.98, -20}}, color = {0, 0, 127}, smooth = Smooth.None));
            connect(limiter1.y, switch1.u1) annotation(Line(points = {{86.6, 58}, {102, 58}, {102, -48}, {4, -48}, {4, -38.4}, {3.6, -38.4}}, color = {0, 0, 127}, smooth = Smooth.None));
            connect(const.y, realToBoolean.u) annotation(Line(points = {{61.4, -32}, {47.6, -32}}, color = {0, 0, 127}, smooth = Smooth.None));
            connect(realToBoolean.y, switch1.u2) annotation(Line(points = {{29.2, -32}, {3.6, -32}}, color = {255, 0, 255}, smooth = Smooth.None));
            connect(wref, multiSum7.u[1]) annotation(Line(points = {{-49, 5}, {-168, 5}, {-168, 86.1}, {-154, 86.1}}, color = {0, 0, 127}, smooth = Smooth.None));
            connect(we, multiSum7.u[2]) annotation(Line(points = {{-49, -7}, {-162, -7}, {-162, 81.9}, {-154, 81.9}}, color = {0, 0, 127}, smooth = Smooth.None));
            connect(Pref, multiSum1.u[1]) annotation(Line(points = {{-49, -31}, {-162, -31}, {-162, -17.9}, {-152, -17.9}}, color = {0, 0, 127}, smooth = Smooth.None));
            connect(Pe, multiSum1.u[2]) annotation(Line(points = {{-49, -41}, {-158, -41}, {-158, -22.1}, {-152, -22.1}}, color = {0, 0, 127}, smooth = Smooth.None));
            connect(multiSum7.y, Proportional.u) annotation(Line(points = {{-140.98, 84}, {-136, 84}, {-136, 102}, {78.8, 102}}, color = {0, 0, 127}, smooth = Smooth.None));
            annotation(Icon(coordinateSystem(extent = {{-100, -80}, {100, 120}}, preserveAspectRatio = false), graphics = {Rectangle(extent = {{-100, 120}, {100, -80}}, lineColor = {0, 0, 255}), Text(extent = {{-38, 46}, {36, 0}}, lineColor = {0, 0, 255}, textString = "TGTypeVI"), Text(visible = true, origin = {-73, 78}, fillPattern = FillPattern.Solid, extent = {{-29, -10}, {29, 10}}, fontName = "Arial", lineColor = {0, 0, 0}, textString = "wref"), Text(visible = true, origin = {-76, 37}, fillPattern = FillPattern.Solid, extent = {{-28, -11}, {28, 11}}, fontName = "Arial", lineColor = {0, 0, 0}, textString = "we"), Text(visible = true, origin = {-73, -7}, fillPattern = FillPattern.Solid, extent = {{-21, -13}, {21, 13}}, fontName = "Arial", textString = "Pe", lineColor = {0, 0, 0}), Text(visible = true, origin = {-71, -42}, fillPattern = FillPattern.Solid, extent = {{-17, -12}, {17, 12}}, fontName = "Arial", textString = "Pref", lineColor = {0, 0, 0}), Text(visible = true, origin = {79.0002, 37}, fillPattern = FillPattern.Solid, extent = {{-21.0002, -13}, {21.0002, 13}}, fontName = "Arial", textString = "Pm", lineColor = {0, 0, 0})}), Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -80}, {100, 120}}), graphics), Documentation(info = "<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\">
<tr>
<td><p>Reference</p></td>
<td>Hydro Turbine (Linear model) and Governor (Standard model) - control scheme Type 6, PSAT Manual</td>
</tr>
<tr>
<td><p>Last update</p></td>
<td>2015-10-02</td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p>Tetiana Bogodorova, SmarTS Lab, KTH Royal Institute of Technology</p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p><a href=\"mailto:luigiv@kth.se\">luigiv@kth.se</a></p></td>
</tr>
</table>
<p><br><span style=\"font-family: MS Shell Dlg 2;\">&LT;iPSL: iTesla Power System Library&GT;</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Copyright 2015 RTE (France), AIA (Spain), KTH (Sweden) and DTU (Denmark)</span></p>
<ul>
<li><span style=\"font-family: MS Shell Dlg 2;\">RTE: http://www.rte-france.com/ </span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">AIA: http://www.aia.es/en/energy/</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">KTH: https://www.kth.se/en</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">DTU:http://www.dtu.dk/english</span></li>
</ul>
<p><span style=\"font-family: MS Shell Dlg 2;\">The authors can be contacted by email: info at ipsl dot org</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">This package is part of the iTesla Power System Library (&QUOT;iPSL&QUOT;) .</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is free software: you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">You should have received a copy of the GNU Lesser General Public License along with the iPSL. If not, see &LT;http://www.gnu.org/licenses/&GT;.</span></p>
</html>"));
          end TGTypeVI;
          annotation(Documentation(info = "<html>
<p><br><span style=\"font-family: MS Shell Dlg 2;\">&LT;iPSL: iTesla Power System Library&GT;</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Copyright 2015 RTE (France), AIA (Spain), KTH (Sweden) and DTU (Denmark)</span></p>
<ul>
<li><span style=\"font-family: MS Shell Dlg 2;\">RTE: http://www.rte-france.com/ </span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">AIA: http://www.aia.es/en/energy/</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">KTH: https://www.kth.se/en</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">DTU:http://www.dtu.dk/english</span></li>
</ul>
<p><span style=\"font-family: MS Shell Dlg 2;\">The authors can be contacted by email: info at ipsl dot org</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">This package is part of the iTesla Power System Library (&QUOT;iPSL&QUOT;) .</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is free software: you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">You should have received a copy of the GNU Lesser General Public License along with the iPSL. If not, see &LT;http://www.gnu.org/licenses/&GT;.</span></p>
</html>"));
        end TG;

        package AVR
          model AVRTypeI "PSAT Exciter Type 1"
            parameter Real vrmax = 7.57 "Maximum regulator voltage, p.u";
            parameter Real vrmin = 0 "Minimum regulator voltage, p.u";
            parameter Real K0 = 7.04 "Regulator gain, p.u/p.u";
            parameter Real T1 = 6.67 "First pole, s";
            parameter Real T2 = 1 "First zero, s";
            parameter Real T3 = 1 "Second pole, s";
            parameter Real T4 = 1 "Second pole, s";
            parameter Real Te = 0.4 "Field circuit time constant, s";
            parameter Real Tr = 0.05 "Measurement time constant, s";
            parameter Real Ae = 0 "1st ceiling coefficient";
            parameter Real Be = 0 "2nd ceiling coefficient";
            parameter Real v0 = 1.05 "Initialization";
            parameter Real vref0 = 1.198705028536746 "Initialization";
            parameter Real vf0 = 1.046883400898693 "Initialization";
            parameter Real vm0 = v0 "Initialization";
            parameter Real vr10 = K0 * (1 - T2 / T1) * (vref0 - vm0) "Initialization";
            parameter Real vr20 = 1 / K0 * (1 - T4 / T3) * (vr10 + K0 * (vref0 - vm0) * T2 / T1) "Initialization";
            parameter Real e = Modelica.Constants.e;
            Real Se;
            Real vm(start = vm0, fixed = true);
            Real vr1(start = vr10, fixed = true);
            Real vr2(start = vr20, fixed = true);
            Real vrs;
            Real vr;
            Modelica.Blocks.Interfaces.RealInput v annotation(Placement(transformation(extent = {{-144, -56}, {-104, -16}})));
            Modelica.Blocks.Interfaces.RealInput vref annotation(Placement(transformation(extent = {{-142, 36}, {-102, 76}})));
            Modelica.Blocks.Interfaces.RealOutput vf annotation(Placement(transformation(extent = {{100, -8}, {120, 12}})));
          equation
            der(vm) = (v - vm) / Tr;
            der(vr1) = (K0 * (1 - T2 / T1) * (vref - vm) - vr1) / T1;
            vrs = vr2 + T4 / T3 * (vr1 + K0 * T2 / T1 * (vref - vm));
            if vrs >= vrmin and vrs <= vrmax then
              vr = vrs;
            elseif vrs > vrmax then
              vr = vrmax;
            else
              vr = vrmin;
            end if;
            der(vr2) = ((1 - T4 / T3) * (vr1 + K0 * (vref - vm) * T2 / T1) - vr2) / T3;
            der(vf) = -(vf * (1 + Se) - vr) / Te;
            Se = Ae * e ^ (Be * abs(vf));
            annotation(Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}})), Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Rectangle(extent = {{-60, 70}, {70, -28}}, lineColor = {0, 0, 255}), Text(extent = {{-56, 68}, {-24, 46}}, lineColor = {0, 0, 255}, textString = "vref"), Text(extent = {{-64, 2}, {-32, -20}}, lineColor = {0, 0, 255}, textString = "v"), Text(extent = {{40, 40}, {72, 18}}, lineColor = {0, 0, 255}, textString = "vf"), Text(extent = {{-36, 44}, {40, -16}}, lineColor = {0, 0, 255}, textString = "AVR1")}), Documentation(info = "<html>
<table cellspacing=\"2\" cellpadding=\"0\" border=\"0\"<tr>
<td><p>Reference</p></td>
<td><p>PSAT Manual 2.1.8</p></td>
</tr>
<tr>
<td><p>Last update</p></td>
<td><p>15/07/2015</p></td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p>MAA Murad, SmarTS Lab, KTH Royal Institute of Technology</p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p><a href=\"mailto:luigiv@kth.se\">luigiv@kth.se</a></p></td>
</tr>
</table>
<p><br><span style=\"font-family: MS Shell Dlg 2;\">&LT;iPSL: iTesla Power System Library&GT;</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Copyright 2015 RTE (France), AIA (Spain), KTH (Sweden) and DTU (Denmark)</span></p>
<ul>
<li><span style=\"font-family: MS Shell Dlg 2;\">RTE: http://www.rte-france.com/ </span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">AIA: http://www.aia.es/en/energy/</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">KTH: https://www.kth.se/en</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">DTU:http://www.dtu.dk/english</span></li>
</ul>
<p><span style=\"font-family: MS Shell Dlg 2;\">The authors can be contacted by email: info at itesla-ipsl dot org</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">This package is part of the iTesla Power System Library (&QUOT;iPSL&QUOT;) .</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is free software: you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">You should have received a copy of the GNU Lesser General Public License along with the iPSL. If not, see &LT;http://www.gnu.org/licenses/&GT;.</span></p>
</html>"));
          end AVRTypeI;

          model AVRTypeII "PSAT AVR Type 2"
            Modelica.Blocks.Interfaces.RealInput v "Generator termminal voltage (pu)" annotation(Placement(transformation(extent = {{-98, -8}, {-78, 12}}), iconTransformation(extent = {{-98, -28}, {-62, 8}})));
            Modelica.Blocks.Interfaces.RealOutput vf "Filed voltage (pu)" annotation(Placement(transformation(extent = {{74, 22}, {94, 42}}), iconTransformation(extent = {{68, 8}, {102, 44}})));
            Modelica.Blocks.Interfaces.RealInput vref "Reference generator terminal voltage (pu)" annotation(Placement(transformation(extent = {{-96, 40}, {-76, 60}}), iconTransformation(extent = {{-98, 36}, {-62, 72}})));
            parameter Real vrmin "Minimum regulator voltage (pu)";
            parameter Real vrmax "Maximum regulator voltage (p.u..)";
            parameter Real Ka "Amplifier gain (p.u/p.u)";
            parameter Real Ta "Amplifier time constant (s)";
            parameter Real Kf "Stabilizer gain (p.u/p.u)";
            parameter Real Tf "Stabilizer time constant (s)";
            parameter Real Ke "Field circuit integral deviation (p.u/p.u)";
            parameter Real Te "Field circuit time constant (s)";
            parameter Real Tr "Measurement time constant (s)";
            parameter Real Ae = 0.0006 "1st ceiling coefficient";
            parameter Real Be = 0.9 "2nd ceiling coefficient";
            parameter Real v0 = 1 "Initialization";
            parameter Real vref0 "Initialization";
            parameter Real vf0 "Initialization";
            Real Se "Saturated field voltage (pu)";
            Real vr "Regulator voltage (pu)";
          protected
            parameter Real vm0 = v0 "Initialization";
            parameter Real vr10 = Ka * (vref0 - vm0 - vr20 - vf0 * Kf / Tf) "Initialization";
            parameter Real vr20 = -vf0 * Kf / Tf "Initialization";
            parameter Real e = Modelica.Constants.e;
            Real vm(start = vm0, fixed = true);
            Real vr1(start = vr10, fixed = true);
            Real vr2(start = vr20, fixed = true);
          equation
            der(vm) = (v - vm) / Tr;
            der(vr1) = (Ka * (vref - vm - vr2 - vf * Kf / Tf) - vr1) / Ta;
            if vr1 >= vrmin and vr1 <= vrmax then
              vr = vr1;
            elseif vr1 > vrmax then
              vr = vrmax;
            else
              vr = vrmin;
            end if;
            der(vr2) = -(vf * Kf / Tf + vr2) / Tf;
            der(vf) = -(vf * (Ke + Se) - vr) / Te;
            Se = Ae * e ^ (Be * abs(vf));
            annotation(Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}})), Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Rectangle(extent = {{-60, 70}, {70, -28}}, lineColor = {0, 0, 255}), Text(extent = {{-56, 68}, {-24, 46}}, lineColor = {0, 0, 255}, textString = "vref"), Text(extent = {{-64, 2}, {-32, -20}}, lineColor = {0, 0, 255}, textString = "v"), Text(extent = {{40, 40}, {72, 18}}, lineColor = {0, 0, 255}, textString = "vf"), Text(extent = {{-36, 44}, {40, -16}}, lineColor = {0, 0, 255}, textString = "AVR2")}), Documentation(info = "<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\">
<tr>
<td><p>Reference</p></td>
<td><p>AVR Type II, PSAT Manual 2.1.8</p></td>
</tr>
<tr>
<td><p>Last update</p></td>
<td>September 2015</td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p>Joan Russinol, SmarTS Lab, KTH Royal Institute of Technology</p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p><a href=\"mailto:luigiv@kth.se\">luigiv@kth.se</a></p></td>
</tr>
</table>
<p><br><span style=\"font-family: MS Shell Dlg 2;\">&LT;iPSL: iTesla Power System Library&GT;</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Copyright 2015 RTE (France), AIA (Spain), KTH (Sweden) and DTU (Denmark)</span></p>
<ul>
<li><span style=\"font-family: MS Shell Dlg 2;\">RTE: http://www.rte-france.com/ </span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">AIA: http://www.aia.es/en/energy/</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">KTH: https://www.kth.se/en</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">DTU:http://www.dtu.dk/english</span></li>
</ul>
<p><span style=\"font-family: MS Shell Dlg 2;\">The authors can be contacted by email: info at itesla-ipsl dot org</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">This package is part of the iTesla Power System Library (&QUOT;iPSL&QUOT;) .</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is free software: you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">You should have received a copy of the GNU Lesser General Public License along with the iPSL. If not, see &LT;http://www.gnu.org/licenses/&GT;.</span></p>
</html>"));
          end AVRTypeII;

          model AVRtypeIII
            parameter Real vref = 1;
            parameter Real v0 = 1 "initial voltage after power flow";
            parameter Real vfmax = 5;
            parameter Real vfmin = -5;
            parameter Real K0 = 20 "regulator gain";
            parameter Real T2 = 0.1 "regulator pole";
            parameter Real T1 = 0.45 "Regulator zero";
            parameter Real Te = 0.1 "Field circuit time constant";
            parameter Real vf0 "Initial field voltage";
            parameter Real Tr = 0.0015 "Measurement time constant";
            parameter Real s0;
            Real vm;
            Real vr;
            Real vf1;
            Modelica.Blocks.Nonlinear.Limiter limiter1(uMax = vfmax, uMin = vfmin) annotation(Placement(visible = true, transformation(origin = {5, 0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
            Modelica.Blocks.Interfaces.RealInput v(start = 1) annotation(Placement(visible = true, transformation(origin = {-157.972, 50}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0), iconTransformation(origin = {-120.0, 50.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)));
            Modelica.Blocks.Interfaces.RealOutput vf annotation(Placement(visible = true, transformation(origin = {160, 0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {110.0, 0.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
            Modelica.Blocks.Interfaces.RealInput vs annotation(Placement(transformation(extent = {{-140, -60}, {-100, -20}}), iconTransformation(extent = {{-140, -60}, {-100, -20}})));
          initial equation
            vf1 = vf0;
            vm = v0;
            vr = K0 * (1 - T1 / T2) * (vref + vs - vm);
          equation
            der(vm) = (v - vm) / Tr;
            der(vr) = (K0 * (1 - T1 / T2) * (vref + vs - vm) - vr) / T2;
            der(vf1) = ((vr + K0 * (T1 / T2) * (vref + vs - vm) + vf0) * (1 + s0 * (v / v0 - 1)) - vf1) / Te;
            limiter1.u = vf1;
            limiter1.y = vf;
            annotation(Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Rectangle(visible = true, fillColor = {255, 255, 255}, extent = {{-100.0, -100.0}, {100.0, 100.0}}), Text(visible = true, origin = {1.5941, 2.9728}, fillPattern = FillPattern.Solid, extent = {{-31.5941, -24.9719}, {31.5941, 24.9719}}, textString = "AVRtypeIII", fontName = "Arial"), Text(visible = true, origin = {-77.3525, 52.4473}, fillPattern = FillPattern.Solid, extent = {{-17.3525, -17.5527}, {17.3525, 17.5527}}, textString = "v", fontName = "Arial"), Text(visible = true, origin = {-74.7671, -32.7013}, fillPattern = FillPattern.Solid, extent = {{-11.7427, -9.8104}, {11.7427, 9.8104}}, textString = "vf0", fontName = "Arial"), Text(visible = true, origin = {84.2416, -0.0}, fillPattern = FillPattern.Solid, extent = {{-8.7313, -11.5403}, {8.7313, 11.5403}}, textString = "vf", fontName = "Arial")}), Diagram(coordinateSystem(extent = {{-148.5, -105}, {148.5, 105}}, preserveAspectRatio = false, initialScale = 0.1, grid = {5, 5})), Documentation(info = "<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\">
<tr>
<td><p>Reference</p></td>
<td><p>AVR Type III, PSAT Manual 2.1.8</p></td>
</tr>
<tr>
<td><p>Last update</p></td>
<td>September 2015</td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p>Joan Russinol, SmarTS Lab, KTH Royal Institute of Technology</p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p><a href=\"mailto:luigiv@kth.se\">luigiv@kth.se</a></p></td>
</tr>
</table>
<p><br><span style=\"font-family: MS Shell Dlg 2;\">&LT;iPSL: iTesla Power System Library&GT;</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Copyright 2015 RTE (France), AIA (Spain), KTH (Sweden) and DTU (Denmark)</span></p>
<ul>
<li><span style=\"font-family: MS Shell Dlg 2;\">RTE: http://www.rte-france.com/ </span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">AIA: http://www.aia.es/en/energy/</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">KTH: https://www.kth.se/en</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">DTU:http://www.dtu.dk/english</span></li>
</ul>
<p><span style=\"font-family: MS Shell Dlg 2;\">The authors can be contacted by email: info at itesla-ipsl dot org</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">This package is part of the iTesla Power System Library (&QUOT;iPSL&QUOT;) .</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is free software: you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">You should have received a copy of the GNU Lesser General Public License along with the iPSL. If not, see &LT;http://www.gnu.org/licenses/&GT;.</span></p>
</html>"));
          end AVRtypeIII;
          annotation(Documentation(info = "<html>
<p><br><span style=\"font-family: MS Shell Dlg 2;\">&LT;iPSL: iTesla Power System Library&GT;</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Copyright 2015 RTE (France), AIA (Spain), KTH (Sweden) and DTU (Denmark)</span></p>
<ul>
<li><span style=\"font-family: MS Shell Dlg 2;\">RTE: http://www.rte-france.com/ </span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">AIA: http://www.aia.es/en/energy/</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">KTH: https://www.kth.se/en</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">DTU:http://www.dtu.dk/english</span></li>
</ul>
<p><span style=\"font-family: MS Shell Dlg 2;\">The authors can be contacted by email: info at itesla-ipsl dot org</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">This package is part of the iTesla Power System Library (&QUOT;iPSL&QUOT;) .</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is free software: you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">You should have received a copy of the GNU Lesser General Public License along with the iPSL. If not, see &LT;http://www.gnu.org/licenses/&GT;.</span></p>
</html>"));
        end AVR;

        package OEL
          model OEL "PSAT Over Excitation Limiter"
            Modelica.Blocks.Interfaces.RealInput v "Generator terminal voltage (pu)" annotation(Placement(transformation(extent = {{-110, 68}, {-90, 88}}), iconTransformation(extent = {{-90, 66}, {-62, 98}})));
            Modelica.Blocks.Interfaces.RealInput p "Active power (pu)" annotation(Placement(transformation(extent = {{-110, 36}, {-90, 56}}), iconTransformation(extent = {{-90, 32}, {-62, 62}})));
            Modelica.Blocks.Interfaces.RealInput q "Reactive power (pu)" annotation(Placement(transformation(extent = {{-110, 4}, {-90, 24}}), iconTransformation(extent = {{-90, -6}, {-62, 24}})));
            FieldCurrent field_current(xd = xd, xq = xq) annotation(Placement(transformation(extent = {{-82, 38}, {-46, 72}})));
            Modelica.Blocks.Sources.Constant set(k = iflim) annotation(Placement(transformation(extent = {{-40, 0}, {-20, 20}})));
            //Ymin=0,
            //nStartValue=0,
            //Ymax=vOELmax,
            //K=1/T0)
            Modelica.Blocks.Interfaces.RealOutput v_OXL annotation(Placement(transformation(extent = {{98, 28}, {118, 48}}), iconTransformation(extent = {{66, 6}, {94, 38}})));
            parameter Real T0 "Integrator time constant (s)";
            parameter Real xd "d-axis estimated generator reactance (pu)";
            parameter Real xq "q-axis estimated generator reactance (pu)";
            parameter Real iflim "Maximum filed current (pu)";
            parameter Real vOELmax "Maximum output signal (pu)";
            Modelica.Blocks.Math.Add add(k2 = -1) annotation(Placement(transformation(extent = {{-40, 40}, {-20, 60}})));
            Modelica.Blocks.Sources.Constant const(k = iflim) annotation(Placement(transformation(extent = {{-74, 10}, {-54, 30}})));
            Modelica.Blocks.Logical.Greater greater annotation(Placement(transformation(extent = {{0, 40}, {20, 60}})));
            Modelica.Blocks.Logical.Switch switch1 annotation(Placement(transformation(extent = {{38, 0}, {58, 20}})));
            Modelica.Blocks.Sources.Constant set1(k = 0) annotation(Placement(transformation(extent = {{-40, -40}, {-20, -20}})));
            Modelica.Blocks.Continuous.LimIntegrator limIntegrator(k = 1 / T0, outMax = Modelica.Constants.inf, outMin = 0) annotation(Placement(transformation(extent = {{68, 0}, {88, 20}})));
          equation
            connect(v, field_current.v) annotation(Line(points = {{-100, 78}, {-86, 78}, {-86, 63.33}, {-75.88, 63.33}}, color = {0, 0, 127}, smooth = Smooth.None));
            connect(p, field_current.p) annotation(Line(points = {{-100, 46}, {-84, 46}, {-84, 56.19}, {-75.7, 56.19}}, color = {0, 0, 127}, smooth = Smooth.None));
            connect(q, field_current.q) annotation(Line(points = {{-100, 14}, {-84, 14}, {-84, 48.71}, {-75.7, 48.71}}, color = {0, 0, 127}, smooth = Smooth.None));
            connect(field_current.ifield, add.u1) annotation(Line(points = {{-50.68, 56.19}, {-48, 56.19}, {-48, 56}, {-42, 56}}, color = {0, 0, 127}));
            connect(const.y, add.u2) annotation(Line(points = {{-53, 20}, {-48, 20}, {-48, 44}, {-42, 44}}, color = {0, 0, 127}));
            connect(add.y, greater.u1) annotation(Line(points = {{-19, 50}, {-10.5, 50}, {-2, 50}}, color = {0, 0, 127}));
            connect(set.y, greater.u2) annotation(Line(points = {{-19, 10}, {-10, 10}, {-10, 42}, {-2, 42}}, color = {0, 0, 127}));
            connect(greater.y, switch1.u2) annotation(Line(points = {{21, 50}, {26, 50}, {26, 10}, {36, 10}}, color = {255, 0, 255}));
            connect(switch1.u1, greater.u1) annotation(Line(points = {{36, 18}, {-6, 18}, {-6, 50}, {-2, 50}}, color = {0, 0, 127}));
            connect(set1.y, switch1.u3) annotation(Line(points = {{-19, -30}, {20, -30}, {20, 2}, {36, 2}}, color = {0, 0, 127}));
            connect(switch1.y, limIntegrator.u) annotation(Line(points = {{59, 10}, {66, 10}}, color = {0, 0, 127}));
            connect(limIntegrator.y, v_OXL) annotation(Line(points = {{89, 10}, {92, 10}, {92, 38}, {108, 38}}, color = {0, 0, 127}));
            annotation(Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}})), Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Rectangle(extent = {{-60, 92}, {68, -48}}, lineColor = {0, 0, 255}), Text(extent = {{-68, 100}, {-30, 64}}, lineColor = {0, 0, 255}, fillPattern = FillPattern.Solid, textString = "v"), Text(extent = {{-64, 64}, {-30, 30}}, lineColor = {0, 0, 255}, fillPattern = FillPattern.Solid, textString = "p"), Text(extent = {{-62, 24}, {-34, -10}}, lineColor = {0, 0, 255}, fillPattern = FillPattern.Solid, textString = "q"), Text(extent = {{-52, -16}, {-16, -48}}, lineColor = {0, 0, 255}, fillPattern = FillPattern.Solid, textString = "vref0"), Text(extent = {{26, 46}, {60, 12}}, lineColor = {0, 0, 255}, fillPattern = FillPattern.Solid, textString = "v_OXL"), Text(extent = {{-18, 102}, {44, 24}}, lineColor = {0, 0, 255}, fillPattern = FillPattern.Solid, textString = "OXL")}), Documentation(info = "<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\">
<tr>
<td><p>Reference</p></td>
<td>Over Excitation Limiter, PSAT manual</td>
</tr>
<tr>
<td><p>Last update</p></td>
<td>2015-10-02</td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p>Le Qi, SmarTS Lab, KTH Royal Institute of Technology</p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p><a href=\"mailto:luigiv@kth.se\">luigiv@kth.se</a></p></td>
</tr>
</table>
<p><br><span style=\"font-family: MS Shell Dlg 2;\">&LT;iPSL: iTesla Power System Library&GT;</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Copyright 2015 RTE (France), AIA (Spain), KTH (Sweden) and DTU (Denmark)</span></p>
<ul>
<li><span style=\"font-family: MS Shell Dlg 2;\">RTE: http://www.rte-france.com/ </span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">AIA: http://www.aia.es/en/energy/</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">KTH: https://www.kth.se/en</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">DTU:http://www.dtu.dk/english</span></li>
</ul>
<p><span style=\"font-family: MS Shell Dlg 2;\">The authors can be contacted by email: info at itesla-ipsl dot org</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">This package is part of the iTesla Power System Library (&QUOT;iPSL&QUOT;) .</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is free software: you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">You should have received a copy of the GNU Lesser General Public License along with the iPSL. If not, see &LT;http://www.gnu.org/licenses/&GT;.</span></p>
</html>"));
          end OEL;

          model FieldCurrent
            Modelica.Blocks.Interfaces.RealInput v "generator terminal voltage" annotation(Placement(transformation(extent = {{-82, 32}, {-62, 52}}), iconTransformation(extent = {{-82, 32}, {-50, 66}})));
            Modelica.Blocks.Interfaces.RealInput p "active power " annotation(Placement(transformation(extent = {{-82, -4}, {-62, 16}}), iconTransformation(extent = {{-82, -10}, {-48, 24}})));
            Modelica.Blocks.Interfaces.RealInput q "reactive power" annotation(Placement(transformation(extent = {{-82, -38}, {-62, -18}}), iconTransformation(extent = {{-82, -54}, {-48, -20}})));
            Modelica.Blocks.Interfaces.RealOutput ifield annotation(Placement(transformation(extent = {{58, 4}, {78, 24}}), iconTransformation(extent = {{58, -10}, {90, 24}})));
            parameter Real xd;
            parameter Real xq;
            Real gamap;
            Real gamaq;
          equation
            gamap = xq * p / v;
            gamaq = xq * q / v;
            ifield = sqrt((v + gamaq) ^ 2 + p ^ 2) + (xd / xq + 1) * (gamaq * (v + gamaq) + gamap) / sqrt((v + gamaq) ^ 2 + p ^ 2);
            annotation(Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics), Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Rectangle(extent = {{-48, 66}, {60, -52}}, lineColor = {0, 0, 255}), Text(extent = {{-52, 62}, {-20, 42}}, lineColor = {0, 0, 255}, fillPattern = FillPattern.Solid, textString = "v"), Text(extent = {{-48, 14}, {-20, -2}}, lineColor = {0, 0, 255}, fillPattern = FillPattern.Solid, textString = "p"), Text(extent = {{-50, -28}, {-22, -44}}, lineColor = {0, 0, 255}, fillPattern = FillPattern.Solid, textString = "q"), Text(extent = {{36, 12}, {64, -4}}, lineColor = {0, 0, 255}, fillPattern = FillPattern.Solid, textString = "if")}), Documentation(info = "<html>
<p><br><span style=\"font-family: MS Shell Dlg 2;\">&LT;iPSL: iTesla Power System Library&GT;</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Copyright 2015 RTE (France), AIA (Spain), KTH (Sweden) and DTU (Denmark)</span></p>
<ul>
<li><span style=\"font-family: MS Shell Dlg 2;\">RTE: http://www.rte-france.com/ </span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">AIA: http://www.aia.es/en/energy/</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">KTH: https://www.kth.se/en</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">DTU:http://www.dtu.dk/english</span></li>
</ul>
<p><span style=\"font-family: MS Shell Dlg 2;\">The authors can be contacted by email: info at itesla-ipsl dot org</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">This package is part of the iTesla Power System Library (&QUOT;iPSL&QUOT;) .</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is free software: you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">You should have received a copy of the GNU Lesser General Public License along with the iPSL. If not, see &LT;http://www.gnu.org/licenses/&GT;.</span></p>
</html>"));
          end FieldCurrent;
          annotation(Documentation(info = "<html>
<p><br><span style=\"font-family: MS Shell Dlg 2;\">&LT;iPSL: iTesla Power System Library&GT;</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Copyright 2015 RTE (France), AIA (Spain), KTH (Sweden) and DTU (Denmark)</span></p>
<ul>
<li><span style=\"font-family: MS Shell Dlg 2;\">RTE: http://www.rte-france.com/ </span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">AIA: http://www.aia.es/en/energy/</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">KTH: https://www.kth.se/en</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">DTU:http://www.dtu.dk/english</span></li>
</ul>
<p><span style=\"font-family: MS Shell Dlg 2;\">The authors can be contacted by email: info at itesla-ipsl dot org</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">This package is part of the iTesla Power System Library (&QUOT;iPSL&QUOT;) .</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is free software: you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">You should have received a copy of the GNU Lesser General Public License along with the iPSL. If not, see &LT;http://www.gnu.org/licenses/&GT;.</span></p>
</html>"));
        end OEL;

        package FACTS
          package STATCOM
            model STATCOM "Static Synchronous Compensator model with equation"
              iPSL.Connectors.PwPin p(vr(start = vr0), vi(start = vi0)) annotation(Placement(transformation(extent = {{100, -10}, {120, 10}}), iconTransformation(extent = {{100, -10}, {120, 10}})));
              constant Real pi = Modelica.Constants.pi;
              parameter Real Sb = 100 "System base power (MVA)" annotation(Dialog(group = "Power flow data"));
              parameter Real Vbus = 400000 "Bus nominal voltage (V)" annotation(Dialog(group = "Power flow data"));
              parameter Real Sn = 100 "Power rating (MVA)" annotation(Dialog(group = "Power flow data"));
              parameter Real Vn = 400000 "Voltage rating (V)" annotation(Dialog(group = "Power flow data"));
              parameter Real fn = 50 "Frequency rating (Hz)" annotation(Dialog(group = "Power flow data"));
              parameter Real V_0 = 1 "Voltage magnitude (pu)" annotation(Dialog(group = "Power flow data"));
              parameter Real angle_0 = -0.000213067852480 "Voltage angle (deg.)" annotation(Dialog(group = "Power flow data"));
              parameter Real Qg = 0.139557595258338 "Reactive power injection(p.u.)" annotation(Dialog(group = "Power flow data"));
              //parameter Real v_ref=1.002791151905167 "Reference voltage of the STATCOM regulator (pu)" annotation(Dialog(group="Power flow data"));
              parameter Real Kr = 50 "Regulator gain (p.u./p.u.)";
              parameter Real Tr = 0.01 "Regulator time constant (s)";
              parameter Real i_Max = 0.7 "Maximum current (pu)";
              parameter Real i_Min = -0.1 "Minimum current (pu)";
              parameter Real v_POD = 0 "Power oscillation damper signal";
              Real i_SH "STATCOM current (pu)";
              Real v(start = V_0) "Bus voltage magnitude (pu)";
              Real Q "Injected reactive power (pu)";
            protected
              parameter Real Iold = Sn / Vn;
              parameter Real Inew = Sb / Vbus;
              parameter Real i_max = i_Max * Iold / Inew;
              parameter Real i_min = i_Min * Iold / Inew;
              parameter Real vr0 = V_0 * cos(angle_0) "Initialitation";
              parameter Real vi0 = V_0 * sin(angle_0) "Initialitation";
              //parameter Real io= Kr*(v_ref+v_POD-V_0) "Initialization";
              parameter Real io = Qg / V_0 "Initialization";
              parameter Real v_ref = io / Kr + V_0 - v_POD "Initialization";
            initial equation
              i_SH = io;
            equation
              v = sqrt(p.vr ^ 2 + p.vi ^ 2);
              0 = p.vr * p.ir + p.vi * p.ii;
              -Q = p.vi * p.ir - p.vr * p.ii;
              if i_SH > i_max and der(i_SH) > 0 then
                der(i_SH) = 0;
                Q = i_max * v;
              elseif i_SH < i_min and der(i_SH) < 0 then
                der(i_SH) = 0;
                Q = i_min * v;
              else
                der(i_SH) = (Kr * (v_ref + v_POD - v) - i_SH) / Tr;
                Q = i_SH * v;
              end if;
              annotation(Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics = {Rectangle(extent = {{-100, 100}, {100, -100}}, lineColor = {0, 0, 255}), Ellipse(extent = {{-2, 22}, {48, -22}}, lineColor = {0, 0, 0}, fillColor = {215, 215, 215}, fillPattern = FillPattern.Solid), Ellipse(extent = {{34, 24}, {84, -20}}, lineColor = {0, 0, 0}, fillPattern = FillPattern.Solid, fillColor = {215, 215, 215}), Line(points = {{-38, 0}, {-2, 0}, {-2, 0}}, color = {0, 0, 255}, smooth = Smooth.None), Line(points = {{84, 2}, {100, 2}, {100, 2}}, color = {0, 0, 255}, smooth = Smooth.None), Line(points = {{-90, 6}, {-82, 6}, {-76, 6}}, color = {255, 0, 0}, smooth = Smooth.None, thickness = 0.5), Line(points = {{-90, -6}, {-82, -6}, {-76, -6}}, color = {255, 0, 0}, smooth = Smooth.None, thickness = 0.5), Line(points = {{-38, 0}, {-46, 0}, {-46, 0}}, color = {0, 0, 255}, smooth = Smooth.None), Line(points = {{-84, 6}, {-84, 26}, {-46, 26}, {-46, -24}, {-82, -24}, {-84, -24}, {-84, -6}, {-84, -6}}, color = {255, 0, 0}, thickness = 0.5, smooth = Smooth.None), Text(extent = {{-34, -38}, {24, -68}}, lineColor = {0, 0, 0}, lineThickness = 0.5, fillColor = {255, 0, 0}, fillPattern = FillPattern.Solid, textString = "%Name")}), Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics), Documentation(info = "<html>
<table cellspacing=\"2\" cellpadding=\"0\" border=\"0\"<tr>
<td><p>Reference</p></td>
<td><p>PSAT Manual 2.1.8</p></td>
</tr>
<tr>
<td><p>Last update</p></td>
<td><p>15/07/2015</p></td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p>MAA Murad, SmarTS Lab, KTH Royal Institute of Technology</p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p><a href=\"mailto:luigiv@kth.se\">luigiv@kth.se</a></p></td>
</tr>
</table>
<p><br><span style=\"font-family: MS Shell Dlg 2;\">&LT;iPSL: iTesla Power System Library&GT;</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Copyright 2015 RTE (France), AIA (Spain), KTH (Sweden) and DTU (Denmark)</span></p>
<ul>
<li><span style=\"font-family: MS Shell Dlg 2;\">RTE: http://www.rte-france.com/ </span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">AIA: http://www.aia.es/en/energy/</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">KTH: https://www.kth.se/en</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">DTU:http://www.dtu.dk/english</span></li>
</ul>
<p><span style=\"font-family: MS Shell Dlg 2;\">The authors can be contacted by email: info at itesla-ipsl dot org</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">This package is part of the iTesla Power System Library (&QUOT;iPSL&QUOT;) .</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is free software: you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">You should have received a copy of the GNU Lesser General Public License along with the iPSL. If not, see &LT;http://www.gnu.org/licenses/&GT;.</span></p>
</html>"));
            end STATCOM;

            model STATCOMBlock "Static Synchronous Compensator model with Modelica components"
              parameter Real Sb = 100 "System base power (MVA)" annotation(Dialog(group = "Power flow data"));
              parameter Real Vbus = 400000 "Bus nominal voltage (V)" annotation(Dialog(group = "Power flow data"));
              parameter Real Sn = 100 "Power rating (MVA)" annotation(Dialog(group = "Power flow data"));
              parameter Real Vn = 400000 "Voltage rating (V)" annotation(Dialog(group = "Power flow data"));
              parameter Real fn = 50 "Frequency rating (Hz)" annotation(Dialog(group = "Power flow data"));
              parameter Real V_0 = 1 "Voltage magnitude (pu)" annotation(Dialog(group = "Power flow data"));
              parameter Real angle_0 = -0.000213067852480 "Voltage angle (deg.)" annotation(Dialog(group = "Power flow data"));
              parameter Real Qg = 0.139557595258338 "Reactive power injection(p.u.)" annotation(Dialog(group = "Power flow data"));
              //parameter Real v_ref=1.002791151905167 "Reference voltage of the STATCOM regulator (pu)" annotation(Dialog(group="Power flow data"));
              parameter Real Kr = 50 "Regulator gain (p.u./p.u.)";
              parameter Real Tr = 0.01 "Regulator time constant (s)";
              parameter Real i_Max = 0.7 "Maximum current (pu)";
              parameter Real i_Min = -0.1 "Minimum current (pu)";
              parameter Real v_POD = 0 "Power oscillation damper signal";
              Modelica.Blocks.Math.Add3 add3_1(k2 = -1) annotation(Placement(transformation(extent = {{-90, -10}, {-70, 10}})));
              Modelica.Blocks.Math.Gain gain(k = Kr) annotation(Placement(transformation(extent = {{-52, -10}, {-32, 10}})));
              Modelica.Blocks.Continuous.TransferFunction transferFunction(a = {Tr, 1}, initType = Modelica.Blocks.Types.Init.InitialState, y_start = io, b = {1}) annotation(Placement(transformation(extent = {{-8, -10}, {12, 10}})));
              Modelica.Blocks.Nonlinear.Limiter limiter(uMax = i_max, uMin = i_min, limitsAtInit = true) annotation(Placement(transformation(extent = {{36, -10}, {56, 10}})));
              Modelica.Blocks.Interfaces.RealOutput i_SH "STATCOM current (pu)" annotation(Placement(transformation(extent = {{70, -10}, {90, 10}})));
              Modelica.Blocks.Interfaces.RealInput v = volt "Bus voltage magnitude (pu)" annotation(Placement(visible = false, transformation(extent = {{-140, -20}, {-100, 20}}), iconTransformation(extent = {{-140, -20}, {-100, 20}})));
              iPSL.Connectors.PwPin p(vr(start = vr0), vi(start = vi0)) annotation(Placement(transformation(extent = {{100, -8}, {120, 12}})));
              Real Q "Injected reactive power";
              Real volt "Bus voltage magnitude (pu)";
              Real angle "Bus voltage angle (deg)";
              Modelica.Blocks.Interfaces.RealInput vs_POD "POD signal (pu)" annotation(Placement(transformation(extent = {{-20, -20}, {20, 20}}, rotation = 90, origin = {-108, -60})));
              Modelica.Blocks.Sources.Constant const(k = v_ref) annotation(Placement(transformation(extent = {{-128, 24}, {-108, 44}})));
            protected
              parameter Real Iold = Sn / Vn;
              parameter Real Inew = Sb / Vbus;
              parameter Real i_max = i_Max * Iold / Inew;
              parameter Real i_min = i_Min * Iold / Inew;
              parameter Real vr0 = V_0 * cos(angle_0) "Initialitation";
              parameter Real vi0 = V_0 * sin(angle_0) "Initialitation";
              //parameter Real io= Kr*(v_ref+v_POD-V_0) "Initialitation";
              parameter Real io = Qg / V_0 "Initialization";
              parameter Real v_ref = io / Kr + V_0 - v_POD "Initialization";
            equation
              0 = p.vr * p.ir + p.vi * p.ii;
              -Q = p.vi * p.ir - p.vr * p.ii;
              Q = i_SH * v;
              volt = sqrt(p.vr ^ 2 + p.vi ^ 2);
              angle = atan2(p.vi, p.vr);
              connect(add3_1.y, gain.u) annotation(Line(points = {{-69, 0}, {-54, 0}}, color = {0, 0, 127}, smooth = Smooth.None));
              connect(gain.y, transferFunction.u) annotation(Line(points = {{-31, 0}, {-10, 0}}, color = {0, 0, 127}, smooth = Smooth.None));
              connect(transferFunction.y, limiter.u) annotation(Line(points = {{13, 0}, {34, 0}}, color = {0, 0, 127}, smooth = Smooth.None));
              connect(limiter.y, i_SH) annotation(Line(points = {{57, 0}, {80, 0}}, color = {0, 0, 127}, smooth = Smooth.None));
              connect(i_SH, i_SH) annotation(Line(points = {{80, 0}, {80, 0}}, color = {0, 0, 127}, smooth = Smooth.None));
              connect(add3_1.u2, v) annotation(Line(points = {{-92, 0}, {-120, 0}}, color = {0, 0, 127}, smooth = Smooth.None));
              connect(vs_POD, add3_1.u3) annotation(Line(points = {{-108, -60}, {-106, -60}, {-106, -8}, {-92, -8}}, color = {0, 0, 127}, smooth = Smooth.None));
              connect(const.y, add3_1.u1) annotation(Line(points = {{-107, 34}, {-100, 34}, {-100, 8}, {-92, 8}}, color = {0, 0, 127}));
              annotation(Placement(transformation(extent = {{-82, 34}, {-62, 54}})), Placement(transformation(extent = {{-136, -22}, {-96, 18}})), Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}})), Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Text(extent = {{-26, -36}, {38, -66}}, lineColor = {0, 0, 0}, lineThickness = 0.5, fillColor = {255, 0, 0}, fillPattern = FillPattern.Solid, textString = "%StatcomBlock"), Rectangle(extent = {{-100, 100}, {100, -100}}, lineColor = {0, 0, 255}), Ellipse(extent = {{-16, 20}, {34, -24}}, lineColor = {0, 0, 0}, fillColor = {215, 215, 215}, fillPattern = FillPattern.Solid), Ellipse(extent = {{20, 22}, {70, -22}}, lineColor = {0, 0, 0}, fillPattern = FillPattern.Solid, fillColor = {215, 215, 215}), Line(points = {{-52, -2}, {-16, -2}, {-16, -2}}, color = {0, 0, 255}, smooth = Smooth.None), Line(points = {{70, 0}, {86, 0}, {96, 0}}, color = {0, 0, 255}, smooth = Smooth.None), Line(points = {{-104, 4}, {-96, 4}, {-90, 4}}, color = {255, 0, 0}, smooth = Smooth.None, thickness = 0.5), Line(points = {{-104, -8}, {-96, -8}, {-90, -8}}, color = {255, 0, 0}, smooth = Smooth.None, thickness = 0.5), Line(points = {{-52, -2}, {-60, -2}, {-60, -2}}, color = {0, 0, 255}, smooth = Smooth.None), Line(points = {{-98, 4}, {-98, 24}, {-60, 24}, {-60, -26}, {-96, -26}, {-98, -26}, {-98, -8}, {-98, -8}}, color = {255, 0, 0}, thickness = 0.5, smooth = Smooth.None)}), Documentation(info = "<html>
<table cellspacing=\"2\" cellpadding=\"0\" border=\"0\"<tr>
<td><p>Reference</p></td>
<td><p>PSAT Manual 2.1.8</p></td>
</tr>
<tr>
<td><p>Last update</p></td>
<td><p>15/07/2015</p></td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p>MAA Murad, SmarTS Lab, KTH Royal Institute of Technology</p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p><a href=\"mailto:luigiv@kth.se\">luigiv@kth.se</a></p></td>
</tr>
</table>
<p><br><span style=\"font-family: MS Shell Dlg 2;\">&LT;iPSL: iTesla Power System Library&GT;</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Copyright 2015 RTE (France), AIA (Spain), KTH (Sweden) and DTU (Denmark)</span></p>
<ul>
<li><span style=\"font-family: MS Shell Dlg 2;\">RTE: http://www.rte-france.com/ </span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">AIA: http://www.aia.es/en/energy/</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">KTH: https://www.kth.se/en</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">DTU:http://www.dtu.dk/english</span></li>
</ul>
<p><span style=\"font-family: MS Shell Dlg 2;\">The authors can be contacted by email: info at itesla-ipsl dot org</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">This package is part of the iTesla Power System Library (&QUOT;iPSL&QUOT;) .</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is free software: you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">You should have received a copy of the GNU Lesser General Public License along with the iPSL. If not, see &LT;http://www.gnu.org/licenses/&GT;.</span></p>
</html>"));
            end STATCOMBlock;
            annotation(Documentation(info = "<html>
<p><br><span style=\"font-family: MS Shell Dlg 2;\">&LT;iPSL: iTesla Power System Library&GT;</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Copyright 2015 RTE (France), AIA (Spain), KTH (Sweden) and DTU (Denmark)</span></p>
<ul>
<li><span style=\"font-family: MS Shell Dlg 2;\">RTE: http://www.rte-france.com/ </span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">AIA: http://www.aia.es/en/energy/</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">KTH: https://www.kth.se/en</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">DTU:http://www.dtu.dk/english</span></li>
</ul>
<p><span style=\"font-family: MS Shell Dlg 2;\">The authors can be contacted by email: info at itesla-ipsl dot org</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">This package is part of the iTesla Power System Library (&QUOT;iPSL&QUOT;) .</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is free software: you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">You should have received a copy of the GNU Lesser General Public License along with the iPSL. If not, see &LT;http://www.gnu.org/licenses/&GT;.</span></p>
</html>"));
          end STATCOM;

          package TCSC
            model TCSCReactance
              iPSL.Connectors.PwPin p annotation(Placement(transformation(extent = {{-119, -8}, {-99, 12}})));
              iPSL.Connectors.PwPin n annotation(Placement(transformation(extent = {{100, -10}, {120, 10}})));
              constant Real pi = Modelica.Constants.pi;
              parameter Real Sb = 100 "System base power (MVA)" annotation(Dialog(group = "Power flow data"));
              parameter Real Vbus = 400000 "Bus nominal voltage (V)" annotation(Dialog(group = "Power flow data"));
              parameter Real Sn = 100 "Power rating (MVA)" annotation(Dialog(group = "Power flow data"));
              parameter Real Vn = 400000 "Voltage rating (V)" annotation(Dialog(group = "Power flow data"));
              parameter Real f = 50 "Frequency rating (Hz)" annotation(Dialog(group = "Power flow data"));
              parameter Real x_TCSCO = 0.01 "Value of the state varialbe x1" annotation(Dialog(group = "Power flow data"));
              parameter Real x20 = 0.01 "Value of the state varible x2" annotation(Dialog(group = "Power flow data"));
              parameter Real pref = 0.080101913348342 "Reference power (pu)" annotation(Dialog(group = "Power flow data"));
              parameter Real Cp = 0.10 "Percentage of series compensation (%)";
              parameter Real Tr = 0.5 "Regulator time constant (s)";
              parameter Real xTCSCmax = 0.05 "Maximum reactance (pu)";
              parameter Real xTCSCmin = -0.05 "Minimum reactance (pu)";
              parameter Real Kp = 5 "Proportional gain of PI controller (p.u./p.u.)";
              parameter Real Ki = 1 "Integral gain of PI controller (p.u./p.u.)";
              parameter Real Vs_POD = 0 "Power oscillation damper signal";
              parameter Real x_L = 0.1 "Reactance (inductive) (pu)";
              parameter Real Kr = 10 "Gain of the stabilizing signal (p.u./p.u.)";
              parameter Real G = 0 "Shunt half conductance (pu)";
              parameter Real B = 0 "Shunt half susceptance (pu)";
              parameter Real rL = 0.01 "Line resistance (pu)";
              Real vk "Bus voltage of bus k (pu)";
              Real vm "Bus voltage of bus m (pu)";
              Real pkm "Active power flow from bus k to m (pu)";
              Real b "TCSC series susceptance (pu)";
              Real x_TCSC "TCSC series reactance (pu)";
            protected
              Real x2;
              Real x0;
            protected
              parameter Real Vb2new = Vbus * Vbus;
              parameter Real Vb2old = Vn * Vn;
              parameter Real R = rL * (Vb2old * Sb) / (Vb2new * Sn);
              parameter Real X = x_L * (Vb2old * Sb) / (Vb2new * Sn);
              parameter Real xTCSC_max = xTCSCmax * (Vb2old * Sb) / (Vb2new * Sn);
              parameter Real xTCSC_min = xTCSCmin * (Vb2old * Sb) / (Vb2new * Sn);
              parameter Real y = 1 / X;
            initial equation
              x_TCSC = x_TCSCO;
              x2 = x20;
            equation
              vk = sqrt(p.vr ^ 2 + p.vi ^ 2);
              vm = sqrt(n.vr ^ 2 + n.vi ^ 2);
              if x_TCSC > xTCSC_max and der(x_TCSC) > 0 and der(x2) > 0 then
                der(x_TCSC) = 0;
                der(x2) = -Ki * (pkm - pref);
                b = -xTCSC_max / X / (X * (1 - xTCSC_max / X));
              elseif x_TCSC < xTCSC_min and der(x_TCSC) < 0 and der(x2) < 0 then
                der(x_TCSC) = 0;
                der(x2) = -Ki * (pkm - pref);
                b = -xTCSC_min / X / (X * (1 - xTCSC_min / X));
              else
                der(x_TCSC) = (Kr * Vs_POD - Kp * (pkm - pref) + x2 - x_TCSC) / Tr;
                der(x2) = -Ki * (pkm - pref);
                b = -x_TCSC / X / (X * (1 - x_TCSC / X));
              end if;
              pkm = p.vr * p.ir + p.vi * p.ii;
              x0 = -(Kp * (pkm - pref) - x2);
              n.ii - B * n.vr - G * n.vi = (y - b) * (p.vr - n.vr);
              n.ir - G * n.vr + B * n.vi = (y - b) * (n.vi - p.vi);
              p.ii - B * p.vr - G * p.vi = (y - b) * (n.vr - p.vr);
              p.ir - G * p.vr + B * p.vi = (y - b) * (p.vi - n.vi);
              annotation(Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics), Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics = {Rectangle(extent = {{-60, 38}, {60, -40}}, lineColor = {0, 0, 255}, fillColor = {175, 175, 175}, fillPattern = FillPattern.Solid), Line(points = {{-60, 0}, {-100, 0}, {-100, 0}}, color = {0, 0, 255}, smooth = Smooth.None), Line(points = {{100, 0}, {60, 0}, {60, 0}}, color = {0, 0, 255}, smooth = Smooth.None), Line(points = {{-58, -60}, {-42, -60}, {40, 58}, {60, 58}, {60, 58}}, smooth = Smooth.None, color = {255, 0, 0}, thickness = 0.5), Text(extent = {{-24, 62}, {20, 52}}, lineColor = {0, 0, 255}, fillColor = {175, 175, 175}, fillPattern = FillPattern.Solid, textString = "%TCSC_XC%")}), Documentation(info = "<html>
<table cellspacing=\"2\" cellpadding=\"0\" border=\"0\"<tr>
<td><p>Reference</p></td>
<td><p>PSAT Manual 2.1.8</p></td>
</tr>
<tr>
<td><p>Last update</p></td>
<td><p>15/07/2015</p></td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p>MAA Murad, SmarTS Lab, KTH Royal Institute of Technology</p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p><a href=\"mailto:luigiv@kth.se\">luigiv@kth.se</a></p></td>
</tr>
</table>
<p><br><span style=\"font-family: MS Shell Dlg 2;\">&LT;iPSL: iTesla Power System Library&GT;</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Copyright 2015 RTE (France), AIA (Spain), KTH (Sweden) and DTU (Denmark)</span></p>
<ul>
<li><span style=\"font-family: MS Shell Dlg 2;\">RTE: http://www.rte-france.com/ </span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">AIA: http://www.aia.es/en/energy/</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">KTH: https://www.kth.se/en</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">DTU:http://www.dtu.dk/english</span></li>
</ul>
<p><span style=\"font-family: MS Shell Dlg 2;\">The authors can be contacted by email: info at itesla-ipsl dot org</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">This package is part of the iTesla Power System Library (&QUOT;iPSL&QUOT;) .</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is free software: you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">You should have received a copy of the GNU Lesser General Public License along with the iPSL. If not, see &LT;http://www.gnu.org/licenses/&GT;.</span></p>
</html>"));
            end TCSCReactance;

            model TCSCAlpha
              iPSL.Connectors.PwPin p annotation(Placement(transformation(extent = {{-119, -10}, {-99, 10}})));
              iPSL.Connectors.PwPin n annotation(Placement(transformation(extent = {{100, -10}, {120, 10}})));
              constant Real pi = Modelica.Constants.pi;
              parameter Real SystemBase = 100 "System base power (MVA)" annotation(Dialog(group = "Power flow data"));
              parameter Real Vbus = 400000 "Bus nominal voltage (V)" annotation(Dialog(group = "Power flow data"));
              parameter Real Sn = 100 "Power rating (MVA)" annotation(Dialog(group = "Power flow data"));
              parameter Real Vn = 400000 "Voltage rating (V)" annotation(Dialog(group = "Power flow data"));
              parameter Real f = 50 "Frequency rating (Hz)" annotation(Dialog(group = "Power flow data"));
              parameter Real alpha_TCSCO = 0.826168365308219 "Value of state variable x1" annotation(Dialog(group = "Power flow data"));
              parameter Real x20 = 0.826168365308219 "Value of the state varible x2" annotation(Dialog(group = "Power flow data"));
              parameter Real x0i = 0.826168365308219 "Value of x0" annotation(Dialog(group = "Power flow data"));
              parameter Real pref = 0.080101913348342 "Reference power (pu)" annotation(Dialog(group = "Power flow data"));
              parameter Real Cp = 0.10 "Percentage of series compensation (%)";
              parameter Real Tr = 0.5 "Regulator time constant (s)";
              parameter Real alpha_max = 0.85 " Maximum firing angle (rad)";
              parameter Real alpha_min = 0.72 "Minimum firing angle (rad)";
              parameter Real Kp = 5 "Proportional gain of PI controller (p.u./p.u.)";
              parameter Real Ki = 1 "Integral gain of PI controller (p.u./p.u.)";
              parameter Real Kr = 10 "Gain of stabilizing signal (p.u./p.u.)";
              parameter Real Vs_POD = 0 "Power oscillation damper signal";
              parameter Real x_L = 0.2 "Reactance (inductive) (pu)";
              parameter Real x_C = 0.1 "Reactance (capacitive) (pu)";
              parameter Real XL = 0.1 "Line reactance (pu)";
              parameter Real G = 0 "Shunt half conductance (pu)";
              parameter Real B = 0 "Shunt half susceptance (pu)";
              parameter Real rL = 0.01 "Line resistance, (pu)";
              Real vk "Bus voltage of bus k (pu)";
              Real vm "Bus voltage of bus m (pu)";
              Real pkm(start = pref) "Active power flow from bus k to m (pu)";
              Real b "TCSC series susceptance (pu)";
              Real alpha_TCSC "TCSC series reactance (pu)";
            protected
              Real x0(start = x0i);
              Real x2(start = x20);
            protected
              parameter Real Vb2new = Vbus * Vbus;
              parameter Real Vb2old = Vn * Vn;
              parameter Real xL = x_L * (Vb2old * SystemBase) / (Vb2new * Sn) "Reactance(inductive),p.u";
              parameter Real xC = x_C * (Vb2old * SystemBase) / (Vb2new * Sn) "Reactance(capacitive),p.u";
              parameter Real X = XL * (Vb2old * SystemBase) / (Vb2new * Sn) "Line Reactance,p.u";
              parameter Real kx = sqrt(xC / xL);
              parameter Real XL2 = (1 - Cp) * XL;
              parameter Real y = 1 / X;
            initial equation
              alpha_TCSC = alpha_TCSCO;
            equation
              vk = sqrt(p.vr ^ 2 + p.vi ^ 2);
              vm = sqrt(n.vr ^ 2 + n.vi ^ 2);
              pkm = p.vr * p.ir + p.vi * p.ii;
              x0 = -(Kp * (pkm - pref) - x2);
              if alpha_TCSC > alpha_max and der(alpha_TCSC) > 0 and der(x2) > 0 then
                der(alpha_TCSC) = 0;
                der(x2) = -Ki * (pkm - pref);
                b = pi * (kx ^ 4 - 2 * kx ^ 2 + 1) * cos(kx * (pi - alpha_max)) / (xC * (pi * kx ^ 4 * cos(kx * (pi - alpha_max))) - pi * cos(kx * (pi - alpha_max)) - 2 * kx ^ 4 * alpha_max * cos(kx * (pi - alpha_max)) + 2 * kx ^ 2 * alpha_max * cos(kx * (pi - alpha_max)) - kx ^ 4 * sin(2 * alpha_max) * cos(kx * (pi - alpha_max)) + kx ^ 2 * sin(2 * alpha_max) * cos(kx * (pi - alpha_max)) - 4 * kx ^ 3 * cos(alpha_max) ^ 2 * sin(kx * (pi - alpha_max)) - 4 * kx ^ 2 * cos(alpha_max) * sin(alpha_max) * cos(kx * (pi - alpha_max)));
              elseif alpha_TCSC < alpha_min and der(alpha_TCSC) < 0 and der(x2) < 0 then
                der(alpha_TCSC) = 0;
                der(x2) = -Ki * (pkm - pref);
                b = pi * (kx ^ 4 - 2 * kx ^ 2 + 1) * cos(kx * (pi - alpha_min)) / (xC * (pi * kx ^ 4 * cos(kx * (pi - alpha_min))) - pi * cos(kx * (pi - alpha_min)) - 2 * kx ^ 4 * alpha_min * cos(kx * (pi - alpha_min)) + 2 * kx ^ 2 * alpha_min * cos(kx * (pi - alpha_min)) - kx ^ 4 * sin(2 * alpha_min) * cos(kx * (pi - alpha_min)) + kx ^ 2 * sin(2 * alpha_min) * cos(kx * (pi - alpha_min)) - 4 * kx ^ 3 * cos(alpha_min) ^ 2 * sin(kx * (pi - alpha_min)) - 4 * kx ^ 2 * cos(alpha_min) * sin(alpha_min) * cos(kx * (pi - alpha_min)));
              else
                der(alpha_TCSC) = (Kr * Vs_POD - Kp * (pkm - pref) + x2 - alpha_TCSC) / Tr;
                der(x2) = -Ki * (pkm - pref);
                b = pi * (kx ^ 4 - 2 * kx ^ 2 + 1) * cos(kx * (pi - alpha_TCSC)) / (xC * (pi * kx ^ 4 * cos(kx * (pi - alpha_TCSC))) - pi * cos(kx * (pi - alpha_TCSC)) - 2 * kx ^ 4 * alpha_TCSC * cos(kx * (pi - alpha_TCSC)) + 2 * kx ^ 2 * alpha_TCSC * cos(kx * (pi - alpha_TCSC)) - kx ^ 4 * sin(2 * alpha_TCSC) * cos(kx * (pi - alpha_TCSC)) + kx ^ 2 * sin(2 * alpha_TCSC) * cos(kx * (pi - alpha_TCSC)) - 4 * kx ^ 3 * cos(alpha_TCSC) ^ 2 * sin(kx * (pi - alpha_TCSC)) - 4 * kx ^ 2 * cos(alpha_TCSC) * sin(alpha_TCSC) * cos(kx * (pi - alpha_TCSC)));
              end if;
              n.ii - B * n.vr - G * n.vi = (y + b) * (p.vr - n.vr);
              n.ir - G * n.vr + B * n.vi = (y + b) * (n.vi - p.vi);
              p.ii - B * p.vr - G * p.vi = (y + b) * (n.vr - p.vr);
              p.ir - G * p.vr + B * p.vi = (y + b) * (p.vi - n.vi);
              annotation(Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics), Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics = {Rectangle(extent = {{-4, 46}, {-4, 34}}, lineColor = {0, 0, 255}, fillColor = {175, 175, 175}, fillPattern = FillPattern.Solid), Rectangle(extent = {{6, 46}, {6, 34}}, lineColor = {0, 0, 255}, fillColor = {175, 175, 175}, fillPattern = FillPattern.Solid), Line(points = {{-60, 40}, {-20, 40}, {-4, 40}}, color = {0, 0, 255}, smooth = Smooth.None), Line(points = {{-60, 40}, {-60, -40}, {-22, -40}, {-22, -40}}, color = {0, 0, 255}, smooth = Smooth.None), Polygon(points = {{4, -16}, {18, -20}, {4, -24}, {4, -24}, {4, -16}}, lineColor = {0, 0, 255}, smooth = Smooth.None, fillColor = {175, 175, 175}, fillPattern = FillPattern.Solid), Polygon(points = {{-7, 4}, {7, 0}, {-7, -4}, {-7, -4}, {-7, 4}}, lineColor = {0, 0, 255}, smooth = Smooth.None, fillColor = {175, 175, 175}, fillPattern = FillPattern.Solid, origin = {9, -58}, rotation = 180), Line(points = {{18, -16}, {18, -24}}, color = {0, 0, 255}, smooth = Smooth.None), Line(points = {{2, -54}, {2, -62}}, color = {0, 0, 255}, smooth = Smooth.None), Line(points = {{-22, -20}, {-22, -58}, {-22, -56}}, color = {0, 0, 255}, smooth = Smooth.None), Line(points = {{-22, -58}, {2, -58}, {2, -58}}, color = {0, 0, 255}, smooth = Smooth.None), Line(points = {{-22, -20}, {4, -20}, {4, -20}}, color = {0, 0, 255}, smooth = Smooth.None), Line(points = {{18, -20}, {40, -20}, {40, -58}, {16, -58}, {16, -58}}, color = {0, 0, 255}, smooth = Smooth.None), Line(points = {{6, 40}, {60, 40}, {60, -40}, {40, -40}}, color = {0, 0, 255}, smooth = Smooth.None), Line(points = {{-100, 0}, {-62, 0}, {-60, 0}, {-60, 0}}, color = {0, 0, 255}, smooth = Smooth.None), Line(points = {{60, 0}, {100, 0}, {100, 0}}, color = {0, 0, 255}, smooth = Smooth.None), Text(extent = {{-18, 68}, {16, 60}}, lineColor = {0, 0, 255}, fillColor = {175, 175, 175}, fillPattern = FillPattern.Solid, textString = "%TCSC_Alpha%")}), Documentation(info = "<html>
<table cellspacing=\"2\" cellpadding=\"0\" border=\"0\"<tr>
<td><p>Reference</p></td>
<td><p>PSAT Manual 2.1.8</p></td>
</tr>
<tr>
<td><p>Last update</p></td>
<td><p>15/07/2015</p></td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p>MAA Murad, SmarTS Lab, KTH Royal Institute of Technology</p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p><a href=\"mailto:luigiv@kth.se\">luigiv@kth.se</a></p></td>
</tr>
</table>
<p><br><span style=\"font-family: MS Shell Dlg 2;\">&LT;iPSL: iTesla Power System Library&GT;</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Copyright 2015 RTE (France), AIA (Spain), KTH (Sweden) and DTU (Denmark)</span></p>
<ul>
<li><span style=\"font-family: MS Shell Dlg 2;\">RTE: http://www.rte-france.com/ </span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">AIA: http://www.aia.es/en/energy/</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">KTH: https://www.kth.se/en</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">DTU:http://www.dtu.dk/english</span></li>
</ul>
<p><span style=\"font-family: MS Shell Dlg 2;\">The authors can be contacted by email: info at itesla-ipsl dot org</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">This package is part of the iTesla Power System Library (&QUOT;iPSL&QUOT;) .</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is free software: you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">You should have received a copy of the GNU Lesser General Public License along with the iPSL. If not, see &LT;http://www.gnu.org/licenses/&GT;.</span></p>
</html>"));
            end TCSCAlpha;
            annotation(Documentation(info = "<html>
<p><br><span style=\"font-family: MS Shell Dlg 2;\">&LT;iPSL: iTesla Power System Library&GT;</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Copyright 2015 RTE (France), AIA (Spain), KTH (Sweden) and DTU (Denmark)</span></p>
<ul>
<li><span style=\"font-family: MS Shell Dlg 2;\">RTE: http://www.rte-france.com/ </span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">AIA: http://www.aia.es/en/energy/</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">KTH: https://www.kth.se/en</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">DTU:http://www.dtu.dk/english</span></li>
</ul>
<p><span style=\"font-family: MS Shell Dlg 2;\">The authors can be contacted by email: info at itesla-ipsl dot org</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">This package is part of the iTesla Power System Library (&QUOT;iPSL&QUOT;) .</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is free software: you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">You should have received a copy of the GNU Lesser General Public License along with the iPSL. If not, see &LT;http://www.gnu.org/licenses/&GT;.</span></p>
</html>"));
          end TCSC;
          annotation(Documentation(info = "<html>
<p><br><span style=\"font-family: MS Shell Dlg 2;\">&LT;iPSL: iTesla Power System Library&GT;</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Copyright 2015 RTE (France), AIA (Spain), KTH (Sweden) and DTU (Denmark)</span></p>
<ul>
<li><span style=\"font-family: MS Shell Dlg 2;\">RTE: http://www.rte-france.com/ </span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">AIA: http://www.aia.es/en/energy/</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">KTH: https://www.kth.se/en</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">DTU:http://www.dtu.dk/english</span></li>
</ul>
<p><span style=\"font-family: MS Shell Dlg 2;\">The authors can be contacted by email: info at itesla-ipsl dot org</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">This package is part of the iTesla Power System Library (&QUOT;iPSL&QUOT;) .</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is free software: you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">You should have received a copy of the GNU Lesser General Public License along with the iPSL. If not, see &LT;http://www.gnu.org/licenses/&GT;.</span></p>
</html>"));
        end FACTS;

        package PSS
          model PSSTypeII "PSAT PSS TypeII"
            parameter Real vsmax "Max stabilizer output signal (pu)";
            parameter Real vsmin "Min stabilizer output signal (pu)";
            parameter Real Kw "Stabilizer gain (pu/pu)";
            parameter Real Tw "Wash-out time constant (s)";
            parameter Real T1 "First stabilizer time constant (s)";
            parameter Real T2 "Second stabilizer time constant (s)";
            parameter Real T3 "Third stabilizer time constant (s)";
            parameter Real T4 "Fourth stabilizer time constant (s)";
            Modelica.Blocks.Interfaces.RealInput vSI "PSS input signal " annotation(Placement(transformation(extent = {{-130, -20}, {-90, 20}})));
            Modelica.Blocks.Interfaces.RealOutput vs "PSS output signal" annotation(Placement(transformation(extent = {{100, -10}, {120, 10}})));
            Modelica.Blocks.Continuous.Derivative derivative(T = Tw, initType = Modelica.Blocks.Types.Init.InitialOutput, y_start = 0, k = Kw * Tw) annotation(Placement(transformation(extent = {{-60, -10}, {-40, 10}})));
            NonElectrical.Continuous.LeadLag imLeadLag(K = 1, T1 = T1, T2 = T2, y_start = 0, x_start = 0) annotation(Placement(transformation(extent = {{-10, -10}, {10, 10}})));
            NonElectrical.Continuous.LeadLag imLeadLag1(K = 1, T1 = T3, T2 = T4, y_start = 0, x_start = 0) annotation(Placement(transformation(extent = {{28, -10}, {48, 10}})));
            Modelica.Blocks.Nonlinear.Limiter limiter(uMax = vsmax, uMin = vsmin) annotation(Placement(transformation(extent = {{60, -10}, {80, 10}})));
          equation
            connect(vSI, derivative.u) annotation(Line(points = {{-110, 0}, {-62, 0}}, color = {0, 0, 127}));
            connect(vs, limiter.y) annotation(Line(points = {{110, 0}, {96, 0}, {81, 0}}, color = {0, 0, 127}));
            connect(imLeadLag1.y, limiter.u) annotation(Line(points = {{49, 0}, {53.5, 0}, {58, 0}}, color = {0, 0, 127}));
            connect(imLeadLag.y, imLeadLag1.u) annotation(Line(points = {{11, 0}, {26, 0}}, color = {0, 0, 127}));
            connect(derivative.y, imLeadLag.u) annotation(Line(points = {{-39, 0}, {-12, 0}}, color = {0, 0, 127}));
            annotation(Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}})), Documentation(info = "<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\">
<tr>
<td><p>Reference</p></td>
<td>PSS Type II, PSAT manual</td>
</tr>
<tr>
<td><p>Last update</p></td>
<td>2015-08-24</td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p>Tin Rabuzin, SmarTS Lab, KTH Royal Institute of Technology</p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p><a href=\"mailto:luigiv@kth.se\">luigiv@kth.se</a></p></td>
</tr>
</table>
<p><br><span style=\"font-family: MS Shell Dlg 2;\">&LT;iPSL: iTesla Power System Library&GT;</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Copyright 2015 RTE (France), AIA (Spain), KTH (Sweden) and DTU (Denmark)</span></p>
<ul>
<li><span style=\"font-family: MS Shell Dlg 2;\">RTE: http://www.rte-france.com/ </span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">AIA: http://www.aia.es/en/energy/</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">KTH: https://www.kth.se/en</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">DTU:http://www.dtu.dk/english</span></li>
</ul>
<p><span style=\"font-family: MS Shell Dlg 2;\">The authors can be contacted by email: info at ipsl dot org</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">This package is part of the iTesla Power System Library (&QUOT;iPSL&QUOT;) .</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is free software: you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">You should have received a copy of the GNU Lesser General Public License along with the iPSL. If not, see &LT;http://www.gnu.org/licenses/&GT;.</span></p>
</html>"));
          end PSSTypeII;
          annotation(Documentation(info = "<html>
<p><br><span style=\"font-family: MS Shell Dlg 2;\">&LT;iPSL: iTesla Power System Library&GT;</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Copyright 2015 RTE (France), AIA (Spain), KTH (Sweden) and DTU (Denmark)</span></p>
<ul>
<li><span style=\"font-family: MS Shell Dlg 2;\">RTE: http://www.rte-france.com/ </span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">AIA: http://www.aia.es/en/energy/</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">KTH: https://www.kth.se/en</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">DTU:http://www.dtu.dk/english</span></li>
</ul>
<p><span style=\"font-family: MS Shell Dlg 2;\">The authors can be contacted by email: info at ipsl dot org</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">This package is part of the iTesla Power System Library (&QUOT;iPSL&QUOT;) .</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is free software: you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">You should have received a copy of the GNU Lesser General Public License along with the iPSL. If not, see &LT;http://www.gnu.org/licenses/&GT;.</span></p>
</html>"));
        end PSS;
        annotation(Documentation(info = "<html>
<p><br><span style=\"font-family: MS Shell Dlg 2;\">&LT;iPSL: iTesla Power System Library&GT;</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Copyright 2015 RTE (France), AIA (Spain), KTH (Sweden) and DTU (Denmark)</span></p>
<ul>
<li><span style=\"font-family: MS Shell Dlg 2;\">RTE: http://www.rte-france.com/ </span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">AIA: http://www.aia.es/en/energy/</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">KTH: https://www.kth.se/en</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">DTU:http://www.dtu.dk/english</span></li>
</ul>
<p><span style=\"font-family: MS Shell Dlg 2;\">The authors can be contacted by email: info at itesla-ipsl dot org</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">This package is part of the iTesla Power System Library (&QUOT;iPSL&QUOT;) .</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is free software: you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">You should have received a copy of the GNU Lesser General Public License along with the iPSL. If not, see &LT;http://www.gnu.org/licenses/&GT;.</span></p>
</html>"));
      end PSAT;
      annotation(Documentation(info = "<html>
<p><br><span style=\"font-family: MS Shell Dlg 2;\">&LT;iPSL: iTesla Power System Library&GT;</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Copyright 2015 RTE (France), AIA (Spain), KTH (Sweden) and DTU (Denmark)</span></p>
<ul>
<li><span style=\"font-family: MS Shell Dlg 2;\">RTE: http://www.rte-france.com/ </span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">AIA: http://www.aia.es/en/energy/</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">KTH: https://www.kth.se/en</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">DTU:http://www.dtu.dk/english</span></li>
</ul>
<p><span style=\"font-family: MS Shell Dlg 2;\">The authors can be contacted by email: info at itesla-ipsl dot org</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">This package is part of the iTesla Power System Library (&QUOT;iPSL&QUOT;) .</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is free software: you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">You should have received a copy of the GNU Lesser General Public License along with the iPSL. If not, see &LT;http://www.gnu.org/licenses/&GT;.</span></p>
</html>"));
    end Controls;

    package Loads
      package PSAT
        model ExponentialRecovery "Exponential Recovery Load"
          extends BaseClasses.baseLoad;
          parameter Real Tp = 1 "Active power time constant (s)";
          parameter Real Tq = 1 "Reactive power time constant (s)";
          parameter Real alpha_s = 2 "Static active power exponent";
          parameter Real alpha_t = 1.5 "Dynamic active power exponent";
          parameter Real beta_s = 2 "Static reactive power exponent";
          parameter Real beta_t = 1.5 "Dynamic reactive power exponent";
          Real ps "Static real power absorption (pu)";
          Real pt "Transient real power absorption (pu)";
          Real qs "Static imaginary power absorption (pu)";
          Real qt "Transient imaginary power absorption (pu)";
        protected
          Real xp(start = 0);
          Real xq(start = 0);
        equation
          der(xp) = (-xp / Tp) + ps - pt;
          P = xp / Tp + pt;
          ps = P_0 / S_b * (V / V_0) ^ alpha_s;
          pt = P_0 / S_b * (V / V_0) ^ alpha_t;
          der(xq) = (-xq / Tq) + qs - qt;
          Q = xq / Tq + qt;
          qs = Q_0 / S_b * (V / V_0) ^ beta_s;
          qt = Q_0 / S_b * (V / V_0) ^ beta_t;
          annotation(Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10})), Diagram(coordinateSystem(extent = {{-148.5, -105.0}, {148.5, 105.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5}), graphics = {Rectangle(visible = true, origin = {10.0, -2.5}, lineColor = {0, 0, 128}, fillColor = {255, 255, 255}, extent = {{-90.0, -82.5}, {90.0, 82.5}})}), Documentation(info = "<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\">
<tr>
<td><p>Reference</p></td>
<td><p>Exponential Recovery Load, PSAT Manual 2.1.8</p></td>
</tr>
<tr>
<td><p>Last update</p></td>
<td>September 2015</td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p>Joan Russinol, SmarTS Lab, KTH Royal Institute of Technology</p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p><a href=\"mailto:luigiv@kth.se\">luigiv@kth.se</a></p></td>
</tr>
</table>
<p><br><span style=\"font-family: MS Shell Dlg 2;\">&LT;iPSL: iTesla Power System Library&GT;</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Copyright 2015 RTE (France), AIA (Spain), KTH (Sweden) and DTU (Denmark)</span></p>
<ul>
<li><span style=\"font-family: MS Shell Dlg 2;\">RTE: http://www.rte-france.com/ </span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">AIA: http://www.aia.es/en/energy/</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">KTH: https://www.kth.se/en</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">DTU:http://www.dtu.dk/english</span></li>
</ul>
<p><span style=\"font-family: MS Shell Dlg 2;\">The authors can be contacted by email: info at itesla-ipsl dot org</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">This package is part of the iTesla Power System Library (&QUOT;iPSL&QUOT;) .</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is free software: you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">You should have received a copy of the GNU Lesser General Public License along with the iPSL. If not, see &LT;http://www.gnu.org/licenses/&GT;.</span></p>
</html>"));
        end ExponentialRecovery;

        model FrequencyDependentLoad "Frequency Dependent Load"
          import Modelica.Constants.pi;
          extends BaseClasses.baseLoad;
          parameter Real alpha_p = 0 "Active power voltage coefficient";
          parameter Real alpha_q = 0 "Reactive power voltage coefficient";
          parameter Real beta_p = 1.3 "Active power frequency coefficient";
          parameter Real beta_q = 1.3 "Reactive power frequency coefficient";
          parameter Real Tf = 0.1 "Filter time constant (s)";
          Real deltaw "Frequency deviation (pu)";
        protected
          Real a "Auxiliary variable, voltage division";
          Real x(start = 0) "auxiliary variable";
        initial equation
          der(x) = 0;
        equation
          a = V / V_0;
          der(x) = -deltaw / Tf;
          0 = x + 1 / (2 * pi * fn) * 1 / Tf * (Angle_V - angle_0) - deltaw;
          P = P_0 / S_b * a ^ alpha_p * (1 + deltaw) ^ beta_p;
          Q = Q_0 / S_b * a ^ alpha_q * (1 + deltaw) ^ beta_q;
          annotation(Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10})), Diagram(coordinateSystem(extent = {{-148.5, -105.0}, {148.5, 105.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5}), graphics = {Rectangle(visible = true, origin = {10.0, -2.5}, lineColor = {0, 0, 128}, fillColor = {255, 255, 255}, extent = {{-90.0, -82.5}, {90.0, 82.5}})}), Documentation(info = "<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\">
<tr>
<td><p>Reference</p></td>
<td><p>Frequency Dependent Load, PSAT Manual 2.1.8</p></td>
</tr>
<tr>
<td><p>Last update</p></td>
<td>September 2015</td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p>Joan Russinol, SmarTS Lab, KTH Royal Institute of Technology</p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p><a href=\"mailto:luigiv@kth.se\">luigiv@kth.se</a></p></td>
</tr>
</table>
<p><br><span style=\"font-family: MS Shell Dlg 2;\">&LT;iPSL: iTesla Power System Library&GT;</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Copyright 2015 RTE (France), AIA (Spain), KTH (Sweden) and DTU (Denmark)</span></p>
<ul>
<li><span style=\"font-family: MS Shell Dlg 2;\">RTE: http://www.rte-france.com/ </span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">AIA: http://www.aia.es/en/energy/</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">KTH: https://www.kth.se/en</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">DTU:http://www.dtu.dk/english</span></li>
</ul>
<p><span style=\"font-family: MS Shell Dlg 2;\">The authors can be contacted by email: info at itesla-ipsl dot org</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">This package is part of the iTesla Power System Library (&QUOT;iPSL&QUOT;) .</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is free software: you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">You should have received a copy of the GNU Lesser General Public License along with the iPSL. If not, see &LT;http://www.gnu.org/licenses/&GT;.</span></p>
</html>"));
        end FrequencyDependentLoad;

        model Mixed_Load "Mixed Load"
          import Modelica.Constants.pi;
          extends BaseClasses.baseLoad;
          parameter Real Kpf = 0 "Frequency coefficient for the active power (pu)";
          parameter Real alpha = 0 "Voltage exponent for the active power";
          parameter Real Tpv = 0.12 "Time constant of dV/dt for the active power (s)";
          parameter Real Kqf = 0 "Frequency coefficient for the reactive power (pu)";
          parameter Real beta = 0 "Voltage exponent for the reactive power";
          parameter Real Tqv = 0.075 "Time constant of dV/dt for the reactive power (s)";
          parameter Real Tfv = 0.005 "Time constant of voltage magnitude filter (s)";
          parameter Real Tft = 0.007 "Time constant of voltage angle filter (s)";
          Real deltaw "Frequency deviation (pu)";
        protected
          Real a "Auxiliary variable, voltage division";
          Real b "Auxiliary variable, derivation";
          Real x(start = -V_0 / Tfv);
          Real y(start = 0);
        equation
          a = V / V_0;
          der(x) = ((-V / Tfv) - x) / Tfv;
          b = x + V / Tfv;
          der(y) = -1 / Tft * (1 / (2 * pi * fn * Tft) * (Angle_V - angle_0) + y);
          deltaw = y + 1 / (2 * pi * fn * Tft) * (Angle_V - angle_0);
          P = Kpf * deltaw + P_0 / S_b * (a ^ alpha + Tpv * b);
          Q = Kqf * deltaw + Q_0 / S_b * (a ^ beta + Tqv * b);
          annotation(Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10})), Diagram(coordinateSystem(extent = {{-148.5, -105.0}, {148.5, 105.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})), Documentation(info = "<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\">
<tr>
<td><p>Reference</p></td>
<td><p>Mixed Load, PSAT Manual 2.1.8</p></td>
</tr>
<tr>
<td><p>Last update</p></td>
<td>September 2015</td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p>Joan Russinol, SmarTS Lab, KTH Royal Institute of Technology</p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p><a href=\"mailto:luigiv@kth.se\">luigiv@kth.se</a></p></td>
</tr>
</table>
<p><br><span style=\"font-family: MS Shell Dlg 2;\">&LT;iPSL: iTesla Power System Library&GT;</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Copyright 2015 RTE (France), AIA (Spain), KTH (Sweden) and DTU (Denmark)</span></p>
<ul>
<li><span style=\"font-family: MS Shell Dlg 2;\">RTE: http://www.rte-france.com/ </span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">AIA: http://www.aia.es/en/energy/</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">KTH: https://www.kth.se/en</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">DTU:http://www.dtu.dk/english</span></li>
</ul>
<p><span style=\"font-family: MS Shell Dlg 2;\">The authors can be contacted by email: info at itesla-ipsl dot org</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">This package is part of the iTesla Power System Library (&QUOT;iPSL&QUOT;) .</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is free software: you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">You should have received a copy of the GNU Lesser General Public License along with the iPSL. If not, see &LT;http://www.gnu.org/licenses/&GT;.</span></p>
</html>", revisions = "<html>
<pre><span style=\"font-family: Courier New,courier; color: #006400;\">Remember:&nbsp;Pz+Pi+Pp=1&nbsp;and&nbsp;Qz+Qi+Qp=1&QUOT;</span></pre>
</html>"));
        end Mixed_Load;

        model VoltDependant "Voltage Dependent Load"
          extends BaseClasses.baseLoad;
          parameter Real alphap = 2.0 "Active power exponent";
          parameter Real alphaq = 2.0 "Reactive power exponent";
        protected
          Real a "Auxiliary variable, voltage division";
        equation
          a = V / V_0;
          P = P_0 / S_b * a ^ alphap;
          Q = Q_0 / S_b * a ^ alphaq;
          annotation(Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10})), Documentation(info = "<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\">
<tr>
<td><p>Reference</p></td>
<td><p>Voltage Dependent Load, PSAT Manual 2.1.8</p></td>
</tr>
<tr>
<td><p>Last update</p></td>
<td>September 2015</td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p>Joan Russinol, SmarTS Lab, KTH Royal Institute of Technology</p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p><a href=\"mailto:luigiv@kth.se\">luigiv@kth.se</a></p></td>
</tr>
</table>
<p><br><span style=\"font-family: MS Shell Dlg 2;\">&LT;iPSL: iTesla Power System Library&GT;</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Copyright 2015 RTE (France), AIA (Spain), KTH (Sweden) and DTU (Denmark)</span></p>
<ul>
<li><span style=\"font-family: MS Shell Dlg 2;\">RTE: http://www.rte-france.com/ </span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">AIA: http://www.aia.es/en/energy/</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">KTH: https://www.kth.se/en</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">DTU:http://www.dtu.dk/english</span></li>
</ul>
<p><span style=\"font-family: MS Shell Dlg 2;\">The authors can be contacted by email: info at itesla-ipsl dot org</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">This package is part of the iTesla Power System Library (&QUOT;iPSL&QUOT;) .</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is free software: you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">You should have received a copy of the GNU Lesser General Public License along with the iPSL. If not, see &LT;http://www.gnu.org/licenses/&GT;.</span></p>
</html>"));
        end VoltDependant;

        model ZIP "ZIP Load"
          extends BaseClasses.baseLoad;
          parameter Real Pz = 0.33 "Conductance (pu)";
          parameter Real Pi = 0.33 "Active current (pu)";
          parameter Real Pp = 1 - Pz - Pi "Active power (pu)";
          parameter Real Qz = 0.33 "Susceptance (pu)";
          parameter Real Qi = 0.33 "Reactive current (pu)";
          parameter Real Qp = 1 - Qz - Qi "Reactive power (pu)";
        protected
          Real a "Auxiliary variable, voltage division";
        equation
          a = V / V_0;
          P = P_0 / S_b * (Pz * a ^ 2 + Pi * a + Pp);
          Q = Q_0 / S_b * (Qz * a ^ 2 + Qi * a + Qp);
          annotation(Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10})), Diagram(coordinateSystem(extent = {{-148.5, -105.0}, {148.5, 105.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})), Documentation(info = "<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\">
<tr>
<td><p>Reference</p></td>
<td><p>ZIP Load, PSAT Manual 2.1.8</p></td>
</tr>
<tr>
<td><p>Last update</p></td>
<td>September 2015</td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p>Joan Russinol, SmarTS Lab, KTH Royal Institute of Technology</p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p><a href=\"mailto:luigiv@kth.se\">luigiv@kth.se</a></p></td>
</tr>
</table>
<p><br><span style=\"font-family: MS Shell Dlg 2;\">&LT;iPSL: iTesla Power System Library&GT;</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Copyright 2015 RTE (France), AIA (Spain), KTH (Sweden) and DTU (Denmark)</span></p>
<ul>
<li><span style=\"font-family: MS Shell Dlg 2;\">RTE: http://www.rte-france.com/ </span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">AIA: http://www.aia.es/en/energy/</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">KTH: https://www.kth.se/en</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">DTU:http://www.dtu.dk/english</span></li>
</ul>
<p><span style=\"font-family: MS Shell Dlg 2;\">The authors can be contacted by email: info at itesla-ipsl dot org</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">This package is part of the iTesla Power System Library (&QUOT;iPSL&QUOT;) .</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is free software: you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">You should have received a copy of the GNU Lesser General Public License along with the iPSL. If not, see &LT;http://www.gnu.org/licenses/&GT;.</span></p>
</html>"));
        end ZIP;

        model ZIP_Jimma "Jimma's Load"
          extends BaseClasses.baseLoad;
          parameter Real Tf = 0.01 "Time constant of the high-pass filter (s)";
          parameter Real Pz = 0.33 "Conductance";
          parameter Real Pi = 0.33 "Active current";
          parameter Real Pp = 1 - Pz - Pi "Active power";
          parameter Real Qz = 0.33 "Susceptance";
          parameter Real Qi = 0.33 "Reactive current";
          parameter Real Qp = 1 - Qz - Qi "Reactive power";
          parameter Real Kv = 100 "coefficient of the voltage time derivative (1/s)";
        protected
          Real a "Auxiliary variable, voltage division";
          Real b "Auxiliary variable, derivation";
          Real x(start = 0);
        initial equation
          der(x) = 0;
        equation
          a = V / V_0;
          der(x) = ((-V / Tf) - x) / Tf;
          b = x + V / Tf;
          P = P_0 / S_b * (Pz * a ^ 2 + Pi * a + Pp);
          Q = Q_0 / S_b * (Qz * a ^ 2 + Qi * a + Qp + Kv * b);
          annotation(Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10})), Diagram(coordinateSystem(extent = {{-148.5, -105.0}, {148.5, 105.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})), Documentation(info = "<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\">
<tr>
<td><p>Reference</p></td>
<td><p>Jimma's Load, PSAT Manual 2.1.8</p></td>
</tr>
<tr>
<td><p>Last update</p></td>
<td>September 2015</td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p>Joan Russinol, SmarTS Lab, KTH Royal Institute of Technology</p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p><a href=\"mailto:luigiv@kth.se\">luigiv@kth.se</a></p></td>
</tr>
</table>
<p><br><span style=\"font-family: MS Shell Dlg 2;\">&LT;iPSL: iTesla Power System Library&GT;</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Copyright 2015 RTE (France), AIA (Spain), KTH (Sweden) and DTU (Denmark)</span></p>
<ul>
<li><span style=\"font-family: MS Shell Dlg 2;\">RTE: http://www.rte-france.com/ </span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">AIA: http://www.aia.es/en/energy/</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">KTH: https://www.kth.se/en</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">DTU:http://www.dtu.dk/english</span></li>
</ul>
<p><span style=\"font-family: MS Shell Dlg 2;\">The authors can be contacted by email: info at itesla-ipsl dot org</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">This package is part of the iTesla Power System Library (&QUOT;iPSL&QUOT;) .</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is free software: you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">You should have received a copy of the GNU Lesser General Public License along with the iPSL. If not, see &LT;http://www.gnu.org/licenses/&GT;.</span></p>
</html>", revisions = "<html>
<pre><span style=\"font-family: Courier New,courier; color: #006400;\">Remember:&nbsp;Pz+Pi+Pp=1&nbsp;and&nbsp;Qz+Qi+Qp=1</span></pre>
</html>"));
        end ZIP_Jimma;

        model LOADPQ "Constant PQ Load"
          extends BaseClasses.baseLoad;
        equation
          P = P_0 * Sn / S_b;
          Q = Q_0 * Sn / S_b;
          annotation(Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10})), Diagram(coordinateSystem(extent = {{-148.5, -105.0}, {148.5, 105.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})), Documentation(info = "<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\">
<tr>
<td><p>Reference</p></td>
<td><p>No Reference identified</p></td>
</tr>
<tr>
<td><p>Last update</p></td>
<td>September 2015</td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p>Joan Russinol, SmarTS Lab, KTH Royal Institute of Technology</p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p><a href=\"mailto:luigiv@kth.se\">luigiv@kth.se</a></p></td>
</tr>
</table>
<p><br><span style=\"font-family: MS Shell Dlg 2;\">&LT;iPSL: iTesla Power System Library&GT;</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Copyright 2015 RTE (France), AIA (Spain), KTH (Sweden) and DTU (Denmark)</span></p>
<ul>
<li><span style=\"font-family: MS Shell Dlg 2;\">RTE: http://www.rte-france.com/ </span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">AIA: http://www.aia.es/en/energy/</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">KTH: https://www.kth.se/en</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">DTU:http://www.dtu.dk/english</span></li>
</ul>
<p><span style=\"font-family: MS Shell Dlg 2;\">The authors can be contacted by email: info at itesla-ipsl dot org</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">This package is part of the iTesla Power System Library (&QUOT;iPSL&QUOT;) .</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is free software: you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">You should have received a copy of the GNU Lesser General Public License along with the iPSL. If not, see &LT;http://www.gnu.org/licenses/&GT;.</span></p>
</html>", revisions = "<html>
<pre><span style=\"font-family: Courier New,courier; color: #006400;\">Equations&nbsp;come&nbsp;from&nbsp;the&nbsp;mathematical&nbsp;separation&nbsp;in&nbsp;between&nbsp;reals&nbsp;and&nbsp;imaginary&nbsp;of&nbsp;S=P+jQ=UI*</span></pre>
</html>"));
        end LOADPQ;

        model LOADPQ_variation "Equations come from the mathematical separation in between reals and imaginary of S=P+jQ=UI*"
          extends BaseClasses.baseLoad;
          parameter Real t_start_1 "Start time of first load variation (s)" annotation(Dialog(group = "Variation 1"));
          parameter Real t_end_1 "End time of first load variation (s)" annotation(Dialog(group = "Variation 1"));
          parameter Real dP1 "First active load variation  (pu)" annotation(Dialog(group = "Variation 1"));
          parameter Real dQ1 "First reactive load variation (p)" annotation(Dialog(group = "Variation 1"));
          parameter Real t_start_2 "Start time of second Load variation (s)" annotation(Dialog(group = "Variation 2"));
          parameter Real t_end_2 "End time of second load variation (s)" annotation(Dialog(group = "Variation 2"));
          parameter Real dP2 "Second active load variation  (pu)" annotation(Dialog(group = "Variation 2"));
          parameter Real dQ2 "Second reactive load variation (pu)" annotation(Dialog(group = "Variation 2"));
        equation
          if time >= t_start_1 and time <= t_end_1 then
            P = (P_0 + dP1) / S_b;
            Q = (Q_0 + dQ1) / S_b;
          elseif time >= t_start_2 and time <= t_end_2 then
            P = (P_0 + dP2) / S_b;
            Q = (Q_0 + dQ2) / S_b;
          else
            P = P_0 / S_b;
            Q = Q_0 / S_b;
          end if;
          annotation(Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10})), Diagram(coordinateSystem(extent = {{-148.5, -105.0}, {148.5, 105.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})), Documentation(info = "<html>
<p><br><span style=\"font-family: MS Shell Dlg 2;\">&LT;iPSL: iTesla Power System Library&GT;</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Copyright 2015 RTE (France), AIA (Spain), KTH (Sweden) and DTU (Denmark)</span></p>
<ul>
<li><span style=\"font-family: MS Shell Dlg 2;\">RTE: http://www.rte-france.com/ </span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">AIA: http://www.aia.es/en/energy/</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">KTH: https://www.kth.se/en</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">DTU:http://www.dtu.dk/english</span></li>
</ul>
<p><span style=\"font-family: MS Shell Dlg 2;\">The authors can be contacted by email: info at itesla-ipsl dot org</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">This package is part of the iTesla Power System Library (&QUOT;iPSL&QUOT;) .</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is free software: you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">You should have received a copy of the GNU Lesser General Public License along with the iPSL. If not, see &LT;http://www.gnu.org/licenses/&GT;.</span></p>
</html>"));
        end LOADPQ_variation;

        package BaseClasses
          partial model baseLoad
            import Modelica.Constants.pi;
            extends iPSL.Electrical.Essentials.pfComponent;
            parameter Real Sn = S_b "Power rating (MVA)";
            iPSL.Connectors.PwPin p annotation(Placement(transformation(extent = {{-56.0, -10.0}, {-36.0, 10.0}}, origin = {0.0, 0.0}, rotation = 0), iconTransformation(extent = {{-80.0, 0.0}, {-60.0, 20.0}}, origin = {70, 100}, rotation = 0), visible = true));
            Real V "Voltage magnitude (pu)";
            Real Angle_V "voltage angle (rad)";
            Real P "Active power (pu)";
            Real Q "Reactive power (pu)";
          protected
            parameter Real CoB = Sn / S_b "Change of base between Machine and System";
          equation
            P = p.vr * p.ir + p.vi * p.ii;
            Q = p.vi * p.ir - p.vr * p.ii;
            V = sqrt(p.vr ^ 2 + p.vi ^ 2);
            Angle_V = atan2(p.vi, p.vr);
            annotation(Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Line(points = {{-100, 100}, {100, 100}, {0, -100}, {-100, 100}}, color = {28, 108, 200}), Text(extent = {{-62, 66}, {66, 34}}, lineColor = {28, 108, 200}, textString = "%P_0+j%Q_0")}), Documentation(info = "<html>
<p><br><span style=\"font-family: MS Shell Dlg 2;\">&LT;iPSL: iTesla Power System Library&GT;</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Copyright 2015 RTE (France), AIA (Spain), KTH (Sweden) and DTU (Denmark)</span></p>
<ul>
<li><span style=\"font-family: MS Shell Dlg 2;\">RTE: http://www.rte-france.com/ </span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">AIA: http://www.aia.es/en/energy/</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">KTH: https://www.kth.se/en</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">DTU:http://www.dtu.dk/english</span></li>
</ul>
<p><span style=\"font-family: MS Shell Dlg 2;\">The authors can be contacted by email: info at itesla-ipsl dot org</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">This package is part of the iTesla Power System Library (&QUOT;iPSL&QUOT;) .</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is free software: you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">You should have received a copy of the GNU Lesser General Public License along with the iPSL. If not, see &LT;http://www.gnu.org/licenses/&GT;.</span></p>
</html>"));
          end baseLoad;
          annotation(Documentation(info = "<html>
<p><br><span style=\"font-family: MS Shell Dlg 2;\">&LT;iPSL: iTesla Power System Library&GT;</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Copyright 2015 RTE (France), AIA (Spain), KTH (Sweden) and DTU (Denmark)</span></p>
<ul>
<li><span style=\"font-family: MS Shell Dlg 2;\">RTE: http://www.rte-france.com/ </span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">AIA: http://www.aia.es/en/energy/</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">KTH: https://www.kth.se/en</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">DTU:http://www.dtu.dk/english</span></li>
</ul>
<p><span style=\"font-family: MS Shell Dlg 2;\">The authors can be contacted by email: info at itesla-ipsl dot org</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">This package is part of the iTesla Power System Library (&QUOT;iPSL&QUOT;) .</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is free software: you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">You should have received a copy of the GNU Lesser General Public License along with the iPSL. If not, see &LT;http://www.gnu.org/licenses/&GT;.</span></p>
</html>"));
        end BaseClasses;
        annotation(Documentation(info = "<html>
<p><br><span style=\"font-family: MS Shell Dlg 2;\">&LT;iPSL: iTesla Power System Library&GT;</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Copyright 2015 RTE (France), AIA (Spain), KTH (Sweden) and DTU (Denmark)</span></p>
<ul>
<li><span style=\"font-family: MS Shell Dlg 2;\">RTE: http://www.rte-france.com/ </span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">AIA: http://www.aia.es/en/energy/</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">KTH: https://www.kth.se/en</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">DTU:http://www.dtu.dk/english</span></li>
</ul>
<p><span style=\"font-family: MS Shell Dlg 2;\">The authors can be contacted by email: info at itesla-ipsl dot org</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">This package is part of the iTesla Power System Library (&QUOT;iPSL&QUOT;) .</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is free software: you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">You should have received a copy of the GNU Lesser General Public License along with the iPSL. If not, see &LT;http://www.gnu.org/licenses/&GT;.</span></p>
</html>"));
      end PSAT;
      annotation(Documentation(info = "<html>
<p><br><span style=\"font-family: MS Shell Dlg 2;\">&LT;iPSL: iTesla Power System Library&GT;</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Copyright 2015 RTE (France), AIA (Spain), KTH (Sweden) and DTU (Denmark)</span></p>
<ul>
<li><span style=\"font-family: MS Shell Dlg 2;\">RTE: http://www.rte-france.com/ </span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">AIA: http://www.aia.es/en/energy/</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">KTH: https://www.kth.se/en</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">DTU:http://www.dtu.dk/english</span></li>
</ul>
<p><span style=\"font-family: MS Shell Dlg 2;\">The authors can be contacted by email: info at itesla-ipsl dot org</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">This package is part of the iTesla Power System Library (&QUOT;iPSL&QUOT;) .</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is free software: you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">You should have received a copy of the GNU Lesser General Public License along with the iPSL. If not, see &LT;http://www.gnu.org/licenses/&GT;.</span></p>
</html>"));
    end Loads;

    package Events
      model PwFault "Transitory short-circuit on a node. Shunt impedance connected only during a specified interval of time.
                                                  Developed by AIA. 2014/12/16"
        iPSL.Connectors.PwPin p annotation(Placement(transformation(extent = {{-80, -10}, {-60, 10}}), iconTransformation(extent = {{-80, -10}, {-60, 10}})));
        parameter Real R "Resistance (pu)";
        parameter Real X "Conductance (pu)";
        parameter Real t1 "Start time of the fault (s)";
        parameter Real t2 "End time of the fault (s)";
      protected
        parameter Real ground = if R == 0 and X == 0 then 0 else 1;
      equation
        if time < t1 then
          p.ii = 0;
          p.ir = 0;
        elseif time < t2 and ground == 0 then
          p.vr = 1E-10;
          // This is to avoid numerical problems
          p.vi = 0;
        elseif time < t2 then
          p.ii = (R * p.vi - X * p.vr) / (X * X + R * R);
          p.ir = (R * p.vr + X * p.vi) / (R * R + X * X);
        else
          p.ii = 0;
          p.ir = 0;
        end if;
        annotation(Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-60, -60}, {60, 60}}, initialScale = 0.1), graphics = {Rectangle(extent = {{-60, 60}, {60, -60}}, lineColor = {0, 0, 255}), Rectangle(extent = {{-28, 26}, {12, 6}}, lineColor = {0, 0, 0}, fillColor = {95, 95, 95}, fillPattern = FillPattern.Solid), Line(points = {{12, 16}, {26, 16}, {26, -24}}, color = {0, 0, 255}, smooth = Smooth.None), Line(points = {{14, -24}, {38, -24}}, color = {0, 0, 255}, smooth = Smooth.None), Line(points = {{16, -28}, {36, -28}}, color = {0, 0, 255}, smooth = Smooth.None), Line(points = {{20, -32}, {34, -32}}, color = {0, 0, 255}, smooth = Smooth.None), Line(points = {{22, -36}, {30, -36}}, color = {0, 0, 255}, smooth = Smooth.None), Rectangle(extent = {{-38, 18}, {-28, 14}}, lineColor = {0, 0, 0}, fillColor = {0, 0, 0}, fillPattern = FillPattern.Solid), Line(points = {{-12, 34}, {-4, 16}, {-18, 16}, {-6, -6}}, color = {255, 0, 0}, smooth = Smooth.None, thickness = 0.5), Line(points = {{-12, -4}, {-6, -6}, {-6, 0}}, color = {255, 0, 0}, smooth = Smooth.None)}), Diagram(coordinateSystem(extent = {{-60, -60}, {60, 60}}, preserveAspectRatio = true, initialScale = 0.1), graphics), Documentation(info = "<html>
<p><br><span style=\"font-family: MS Shell Dlg 2;\">&LT;iPSL: iTesla Power System Library&GT;</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Copyright 2015 RTE (France), AIA (Spain), KTH (Sweden) and DTU (Denmark)</span></p>
<ul>
<li><span style=\"font-family: MS Shell Dlg 2;\">RTE: http://www.rte-france.com/ </span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">AIA: http://www.aia.es/en/energy/</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">KTH: https://www.kth.se/en</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">DTU:http://www.dtu.dk/english</span></li>
</ul>
<p><span style=\"font-family: MS Shell Dlg 2;\">The authors can be contacted by email: info at itesla-ipsl dot org</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">This package is part of the iTesla Power System Library (&QUOT;iPSL&QUOT;) .</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is free software: you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">You should have received a copy of the GNU Lesser General Public License along with the iPSL. If not, see &LT;http://www.gnu.org/licenses/&GT;.</span></p>
</html>"));
      end PwFault;

      model PwFaultPQ
        iPSL.Connectors.PwPin p annotation(Placement(transformation(extent = {{-40, -10}, {-20, 10}}), iconTransformation(extent = {{-80, -10}, {-60, 10}})));
        parameter Real R "Resistance (pu)";
        parameter Real X "Reactance (pu)";
        parameter Real t1 "Start time of the fault (s)";
        parameter Real t2 "End time of the fault (s)";
        Real P "Active power supplied to the fault (pu)";
        Real Q "Reactive power supplied to the fault (pu)";
      equation
        p.ir = if time < t1 then 0 else if time < t2 then 1 / X * (p.vi - R * p.ii) else 0;
        p.ii = if time < t1 then 0 else if time < t2 then (R * p.vi - X * p.vr) / (X * X + R * R) else 0;
        P = p.vr * p.ir + p.vi * p.ii;
        Q = (-p.vr * p.ii) + p.vi * p.ir;
        annotation(Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-60, -60}, {60, 60}}, initialScale = 0.1), graphics = {Rectangle(extent = {{-60, 60}, {60, -60}}, lineColor = {0, 0, 255}), Rectangle(extent = {{-28, 26}, {12, 6}}, lineColor = {0, 0, 0}, fillColor = {95, 95, 95}, fillPattern = FillPattern.Solid), Line(points = {{12, 16}, {26, 16}, {26, -24}}, color = {0, 0, 255}, smooth = Smooth.None), Line(points = {{14, -24}, {38, -24}}, color = {0, 0, 255}, smooth = Smooth.None), Line(points = {{16, -28}, {36, -28}}, color = {0, 0, 255}, smooth = Smooth.None), Line(points = {{20, -32}, {34, -32}}, color = {0, 0, 255}, smooth = Smooth.None), Line(points = {{22, -36}, {30, -36}}, color = {0, 0, 255}, smooth = Smooth.None), Rectangle(extent = {{-38, 18}, {-28, 14}}, lineColor = {0, 0, 0}, fillColor = {0, 0, 0}, fillPattern = FillPattern.Solid), Line(points = {{-12, 34}, {-4, 16}, {-18, 16}, {-6, -6}}, color = {255, 0, 0}, smooth = Smooth.None, thickness = 0.5), Line(points = {{-12, -4}, {-6, -6}, {-6, 0}}, color = {255, 0, 0}, smooth = Smooth.None)}), Diagram(coordinateSystem(extent = {{-60, -60}, {60, 60}}, preserveAspectRatio = true, initialScale = 0.1), graphics), Documentation(info = "<html>
<p><br><span style=\"font-family: MS Shell Dlg 2;\">&LT;iPSL: iTesla Power System Library&GT;</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Copyright 2015 RTE (France), AIA (Spain), KTH (Sweden) and DTU (Denmark)</span></p>
<ul>
<li><span style=\"font-family: MS Shell Dlg 2;\">RTE: http://www.rte-france.com/ </span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">AIA: http://www.aia.es/en/energy/</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">KTH: https://www.kth.se/en</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">DTU:http://www.dtu.dk/english</span></li>
</ul>
<p><span style=\"font-family: MS Shell Dlg 2;\">The authors can be contacted by email: info at itesla-ipsl dot org</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">This package is part of the iTesla Power System Library (&QUOT;iPSL&QUOT;) .</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is free software: you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">You should have received a copy of the GNU Lesser General Public License along with the iPSL. If not, see &LT;http://www.gnu.org/licenses/&GT;.</span></p>
</html>"));
      end PwFaultPQ;

      model PwLineFault "Transitory short-circuit on a line at the point of location from the sending node
                                       given by parameter k. A fictitious node is created with where a shunt impedance is connected only 
                                       during a specified interval of time. Developed by AIA. 2015/03/20."
        iPSL.Connectors.PwPin p annotation(Placement(transformation));
        iPSL.Connectors.PwPin n annotation(Placement(transformation));
        parameter Real R1 "Resistance";
        parameter Real X1 "Conductance";
        parameter Real G1 "Shunt half conductance p.u.";
        parameter Real B1 "Shunt half susceptance p.u.";
        parameter Real k "Point of the line where the short circuit occurs (between 0.1 and 0.99)";
        parameter Real Rfault "Fault resistance";
        parameter Real Xfault "Fault reactance";
        parameter Real time_1 "Start time of the fault";
        parameter Real time_2 "End time of the fault";
        parameter Real Vo_real1 "Initial real voltage at Sending node";
        parameter Real Vo_img1 "Initial imaginary voltage at Sending node";
        parameter Real Vo_real2 "Initial real voltage at Receiving node";
        parameter Real Vo_img2 "Initial imaginay voltage at Receiving node";
        parameter Complex Z(re = R1, im = X1);
        parameter Complex Y(re = G1, im = B1);
        parameter Complex V1(re = Vo_real1, im = Vo_img1);
        parameter Complex V2(re = Vo_real2, im = Vo_img2);
        parameter Complex V0fict = ((1 - k) * V1 + k * V2) / (1 + k * (1 - k) * Z * Y);
        parameter Real V0fict_real = V0fict.re;
        parameter Real V0fict_img = V0fict.im;
        // FICTITIOUS BUS
        iPSL.Electrical.Buses.Bus FICT(V_0 = V0fict_real ^ 2 + V0fict_img ^ 2, angle_0 = atan2(V0fict_real ^ 2, V0fict_img)) annotation(Placement(transformation));
        // THE ORIGINAL LINE IS SEPARATED IN TWO PARTS
        iPSL.Electrical.Branches.PwLine_2 Line_1(R = k * R1, X = k * X1, G = k * G1, B = k * B1) annotation(Placement(transformation));
        iPSL.Electrical.Branches.PwLine_2 Line_2(R = (1 - k) * R1, X = (1 - k) * X1, G = (1 - k) * G1, B = (1 - k) * B1) annotation(Placement(transformation));
        // FAULT ADDED TO FICTITIOUS BUS
        iPSL.Electrical.Events.PwFault Fault(R = Rfault, X = Xfault, t1 = time_1, t2 = time_2) annotation(Placement(transformation));
      equation
        connect(p, Line_1.p) annotation(Line);
        connect(Line_1.n, FICT.p) annotation(Line);
        connect(FICT.p, Line_2.p) annotation(Line);
        connect(Line_2.n, n) annotation(Line);
        connect(Fault.p, FICT.p) annotation(Icon(graphics = {Rectangle(extent = {{-60, 60}, {60, -60}}, lineColor = {0, 0, 255}), Rectangle(extent = {{-28, 30}, {12, 10}}, lineColor = {0, 0, 0}, fillColor = {95, 95, 95}, fillPattern = FillPattern.Solid), Line(points = {{12, 20}, {26, 20}, {26, -20}}, color = {0, 0, 255}, smooth = Smooth.None), Line(points = {{14, -20}, {38, -20}}, color = {0, 0, 255}, smooth = Smooth.None), Line(points = {{16, -24}, {36, -24}}, color = {0, 0, 255}, smooth = Smooth.None), Line(points = {{20, -28}, {34, -28}}, color = {0, 0, 255}, smooth = Smooth.None), Line(points = {{22, -32}, {30, -32}}, color = {0, 0, 255}, smooth = Smooth.None), Rectangle(extent = {{-38, 22}, {-28, 18}}, lineColor = {0, 0, 0}, fillColor = {0, 0, 0}, fillPattern = FillPattern.Solid), Line(points = {{-12, 38}, {-4, 20}, {-18, 20}, {-6, -2}}, color = {255, 0, 0}, smooth = Smooth.None, thickness = 0.5), Line(points = {{-12, 0}, {-6, -2}, {-6, 4}}, color = {255, 0, 0}, smooth = Smooth.None)}), Diagram(graphics), uses(Modelica(version = "3.2")));
        annotation(Diagram(coordinateSystem(extent = {{-80, -100}, {100, 100}})), Icon(coordinateSystem(extent = {{-80, -100}, {100, 100}})), Documentation(info = "<html>
<p><br><span style=\"font-family: MS Shell Dlg 2;\">&LT;iPSL: iTesla Power System Library&GT;</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Copyright 2015 RTE (France), AIA (Spain), KTH (Sweden) and DTU (Denmark)</span></p>
<ul>
<li><span style=\"font-family: MS Shell Dlg 2;\">RTE: http://www.rte-france.com/ </span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">AIA: http://www.aia.es/en/energy/</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">KTH: https://www.kth.se/en</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">DTU:http://www.dtu.dk/english</span></li>
</ul>
<p><span style=\"font-family: MS Shell Dlg 2;\">The authors can be contacted by email: info at itesla-ipsl dot org</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">This package is part of the iTesla Power System Library (&QUOT;iPSL&QUOT;) .</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is free software: you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">You should have received a copy of the GNU Lesser General Public License along with the iPSL. If not, see &LT;http://www.gnu.org/licenses/&GT;.</span></p>
</html>"));
      end PwLineFault;
      annotation(Documentation(info = "<html>
<p><br><span style=\"font-family: MS Shell Dlg 2;\">&LT;iPSL: iTesla Power System Library&GT;</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Copyright 2015 RTE (France), AIA (Spain), KTH (Sweden) and DTU (Denmark)</span></p>
<ul>
<li><span style=\"font-family: MS Shell Dlg 2;\">RTE: http://www.rte-france.com/ </span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">AIA: http://www.aia.es/en/energy/</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">KTH: https://www.kth.se/en</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">DTU:http://www.dtu.dk/english</span></li>
</ul>
<p><span style=\"font-family: MS Shell Dlg 2;\">The authors can be contacted by email: info at itesla-ipsl dot org</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">This package is part of the iTesla Power System Library (&QUOT;iPSL&QUOT;) .</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is free software: you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">You should have received a copy of the GNU Lesser General Public License along with the iPSL. If not, see &LT;http://www.gnu.org/licenses/&GT;.</span></p>
</html>"));
    end Events;

    package Essentials
      partial model pfComponent "Partial model containing all the Data for entering Power Flow data"
        outer iPSL.Electrical.SystemBase SysData "Must add this line in all models";
        parameter Real V_b = 400 "Base voltage of the bus (kV)" annotation(Dialog(group = "Power flow data"));
        parameter Real V_0 = 1 "Voltage magnitude (pu)" annotation(Dialog(group = "Power flow data"));
        parameter Real angle_0 = 0 "Voltage angle (deg)" annotation(Dialog(group = "Power flow data"));
        parameter Real P_0 = 1 "Active power (MW)" annotation(Dialog(group = "Power flow data"));
        parameter Real Q_0 = 0 "Reactive power (MVAr)" annotation(Dialog(group = "Power flow data"));
        parameter Real S_b = SysData.S_b "System base power (MVA)" annotation(Dialog(group = "Power flow data", enable = false));
        parameter Real fn = SysData.fn "System Frequency (Hz)" annotation(Dialog(group = "Power flow data", enable = false));
        annotation(Documentation(info = "<html>
<p><br><span style=\"font-family: MS Shell Dlg 2;\">&LT;iPSL: iTesla Power System Library&GT;</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Copyright 2015 RTE (France), AIA (Spain), KTH (Sweden) and DTU (Denmark)</span></p>
<ul>
<li><span style=\"font-family: MS Shell Dlg 2;\">RTE: http://www.rte-france.com/ </span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">AIA: http://www.aia.es/en/energy/</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">KTH: https://www.kth.se/en</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">DTU:http://www.dtu.dk/english</span></li>
</ul>
<p><span style=\"font-family: MS Shell Dlg 2;\">The authors can be contacted by email: info at itesla-ipsl dot org</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">This package is part of the iTesla Power System Library (&QUOT;iPSL&QUOT;) .</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is free software: you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">You should have received a copy of the GNU Lesser General Public License along with the iPSL. If not, see &LT;http://www.gnu.org/licenses/&GT;.</span></p>
</html>"));
      end pfComponent;
      annotation(Documentation(info = "<html>
<p><br><span style=\"font-family: MS Shell Dlg 2;\">&LT;iPSL: iTesla Power System Library&GT;</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Copyright 2015 RTE (France), AIA (Spain), KTH (Sweden) and DTU (Denmark)</span></p>
<ul>
<li><span style=\"font-family: MS Shell Dlg 2;\">RTE: http://www.rte-france.com/ </span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">AIA: http://www.aia.es/en/energy/</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">KTH: https://www.kth.se/en</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">DTU:http://www.dtu.dk/english</span></li>
</ul>
<p><span style=\"font-family: MS Shell Dlg 2;\">The authors can be contacted by email: info at itesla-ipsl dot org</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">This package is part of the iTesla Power System Library (&QUOT;iPSL&QUOT;) .</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is free software: you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">You should have received a copy of the GNU Lesser General Public License along with the iPSL. If not, see &LT;http://www.gnu.org/licenses/&GT;.</span></p>
</html>"));
    end Essentials;

    model SystemBase "System Base Definition"
      parameter Real S_b = 100 "System base in MVA";
      parameter Real fn = 50 "System Frequency in Hz";
      annotation(Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {140, 100}}), graphics = {Rectangle(extent = {{-100, 100}, {140, -100}}, lineColor = {28, 108, 200}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid), Text(extent = {{-90, 40}, {40, 20}}, lineColor = {28, 108, 200}, horizontalAlignment = TextAlignment.Left, textString = "System Base"), Text(extent = {{88, 40}, {124, 20}}, lineColor = {28, 108, 200}, horizontalAlignment = TextAlignment.Left, textString = "MVA"), Text(extent = {{20, 40}, {72, 20}}, lineColor = {28, 108, 200}, horizontalAlignment = TextAlignment.Right, textString = DynamicSelect("0.0", String(S_b))), Text(extent = {{-90, 0}, {40, -20}}, lineColor = {28, 108, 200}, horizontalAlignment = TextAlignment.Left, textString = "Frequency"), Text(extent = {{40, 0}, {72, -20}}, lineColor = {28, 108, 200}, horizontalAlignment = TextAlignment.Right, textString = DynamicSelect("0.0", String(fn))), Text(extent = {{88, 0}, {118, -20}}, lineColor = {28, 108, 200}, horizontalAlignment = TextAlignment.Left, textString = "Hz"), Text(extent = {{-42, 80}, {88, 60}}, lineColor = {28, 108, 200}, horizontalAlignment = TextAlignment.Left, textString = "System Data")}), defaultComponentName = "SysData", defaultAttributes = "inner", missingInnerMessage = "
No 'System Data' component is defined. A default component will be used, and generate a system base of 100 MVA, and a frequency of 50 Hz", Diagram(coordinateSystem(extent = {{-100, -100}, {140, 100}})), Documentation(info = "<html>
<p><br><span style=\"font-family: MS Shell Dlg 2;\">&LT;iPSL: iTesla Power System Library&GT;</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Copyright 2015 RTE (France), AIA (Spain), KTH (Sweden) and DTU (Denmark)</span></p>
<ul>
<li><span style=\"font-family: MS Shell Dlg 2;\">RTE: http://www.rte-france.com/ </span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">AIA: http://www.aia.es/en/energy/</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">KTH: https://www.kth.se/en</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">DTU:http://www.dtu.dk/english</span></li>
</ul>
<p><span style=\"font-family: MS Shell Dlg 2;\">The authors can be contacted by email: info at itesla-ipsl dot org</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">This package is part of the iTesla Power System Library (&QUOT;iPSL&QUOT;) .</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is free software: you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">You should have received a copy of the GNU Lesser General Public License along with the iPSL. If not, see &LT;http://www.gnu.org/licenses/&GT;.</span></p>
</html>"));
    end SystemBase;
    annotation(Documentation(info = "<html>
<p><br><span style=\"font-family: MS Shell Dlg 2;\">&LT;iPSL: iTesla Power System Library&GT;</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Copyright 2015 RTE (France), AIA (Spain), KTH (Sweden) and DTU (Denmark)</span></p>
<ul>
<li><span style=\"font-family: MS Shell Dlg 2;\">RTE: http://www.rte-france.com/ </span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">AIA: http://www.aia.es/en/energy/</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">KTH: https://www.kth.se/en</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">DTU:http://www.dtu.dk/english</span></li>
</ul>
<p><span style=\"font-family: MS Shell Dlg 2;\">The authors can be contacted by email: info at itesla-ipsl dot org</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">This package is part of the iTesla Power System Library (&QUOT;iPSL&QUOT;) .</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is free software: you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">You should have received a copy of the GNU Lesser General Public License along with the iPSL. If not, see &LT;http://www.gnu.org/licenses/&GT;.</span></p>
</html>"));
  end Electrical;

  package NonElectrical
    package Logical
      model NegCurLogic
        Modelica.Blocks.Interfaces.RealInput Vd(start = nstartvalue) annotation(Placement(transformation(extent = {{-76, 10}, {-56, 30}}), iconTransformation(extent = {{-80, 10}, {-60, 30}})));
        Modelica.Blocks.Interfaces.RealOutput Efd(start = nstartvalue) annotation(Placement(transformation(extent = {{62, -24}, {82, -4}}), iconTransformation(extent = {{60, -10}, {80, 10}})));
        Modelica.Blocks.Interfaces.RealInput XadIfd(start = nstartvalue) annotation(Placement(transformation(extent = {{-76, -46}, {-56, -26}}), iconTransformation(extent = {{-80, -30}, {-60, -10}})));
        parameter Real RC_rfd;
        parameter Real nstartvalue;
        Real Crowbar_V;
      equation
        Efd = if XadIfd < 0 then Crowbar_V else Vd;
        Crowbar_V = if RC_rfd == 0 then 0 else (-1) * RC_rfd * XadIfd;
        annotation(Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-60, -40}, {60, 40}}), graphics), Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-60, -40}, {60, 40}}), graphics = {Rectangle(extent = {{-60, 40}, {60, -40}}, lineColor = {0, 0, 255}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid), Text(extent = {{-52, 46}, {54, -42}}, lineColor = {0, 0, 255}, textString = "Negative Current Logic")}), Documentation(info = "<html>
<p><br><span style=\"font-family: MS Shell Dlg 2;\">&LT;iPSL: iTesla Power System Library&GT;</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Copyright 2015 RTE (France), AIA (Spain), KTH (Sweden) and DTU (Denmark)</span></p>
<ul>
<li><span style=\"font-family: MS Shell Dlg 2;\">RTE: http://www.rte-france.com/ </span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">AIA: http://www.aia.es/en/energy/</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">KTH: https://www.kth.se/en</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">DTU:http://www.dtu.dk/english</span></li>
</ul>
<p><span style=\"font-family: MS Shell Dlg 2;\">The authors can be contacted by email: info at itesla-ipsl dot org</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">This package is part of the iTesla Power System Library (&QUOT;iPSL&QUOT;) .</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is free software: you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">You should have received a copy of the GNU Lesser General Public License along with the iPSL. If not, see &LT;http://www.gnu.org/licenses/&GT;.</span></p>
</html>"));
      end NegCurLogic;

      model HV_GATE
        Modelica.Blocks.Interfaces.RealInput n1 annotation(Placement(transformation(extent = {{-86, -2}, {-46, 38}}), iconTransformation(extent = {{-100, 10}, {-80, 30}})));
        Modelica.Blocks.Interfaces.RealInput n2 annotation(Placement(transformation(extent = {{-86, -50}, {-46, -10}}), iconTransformation(extent = {{-100, -30}, {-80, -10}})));
        Modelica.Blocks.Interfaces.RealOutput p annotation(Placement(transformation(extent = {{-208, 54}, {-188, 74}}), iconTransformation(extent = {{60, -10}, {80, 10}})));
      equation
        p = if n1 < n2 then n2 else n1;
        annotation(Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-80, -40}, {80, 40}}), graphics), Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-80, -40}, {80, 40}}), graphics = {Polygon(points = {{-80, 40}, {-80, -40}, {0, -40}, {80, 0}, {0, 40}, {-80, 40}}, lineColor = {0, 0, 255}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid), Text(extent = {{-64, 14}, {-2, -14}}, lineColor = {0, 0, 255}, textString = "HV
Gate")}), Documentation(info = "<html>
<p><br><span style=\"font-family: MS Shell Dlg 2;\">&LT;iPSL: iTesla Power System Library&GT;</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Copyright 2015 RTE (France), AIA (Spain), KTH (Sweden) and DTU (Denmark)</span></p>
<ul>
<li><span style=\"font-family: MS Shell Dlg 2;\">RTE: http://www.rte-france.com/ </span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">AIA: http://www.aia.es/en/energy/</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">KTH: https://www.kth.se/en</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">DTU:http://www.dtu.dk/english</span></li>
</ul>
<p><span style=\"font-family: MS Shell Dlg 2;\">The authors can be contacted by email: info at itesla-ipsl dot org</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">This package is part of the iTesla Power System Library (&QUOT;iPSL&QUOT;) .</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is free software: you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">You should have received a copy of the GNU Lesser General Public License along with the iPSL. If not, see &LT;http://www.gnu.org/licenses/&GT;.</span></p>
</html>"));
      end HV_GATE;

      model LV_GATE
        Modelica.Blocks.Interfaces.RealInput n1 annotation(Placement(transformation(extent = {{-86, -2}, {-46, 38}}), iconTransformation(extent = {{-100, 10}, {-80, 30}})));
        Modelica.Blocks.Interfaces.RealInput n2 annotation(Placement(transformation(extent = {{-86, -50}, {-46, -10}}), iconTransformation(extent = {{-100, -30}, {-80, -10}})));
        Modelica.Blocks.Interfaces.RealOutput p annotation(Placement(transformation(extent = {{-208, 58}, {-188, 78}}), iconTransformation(extent = {{60, -10}, {80, 10}})));
      equation
        p = if n1 > n2 then n2 else n1;
        annotation(Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-80, -40}, {80, 40}}), graphics), Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-80, -40}, {80, 40}}), graphics = {Polygon(points = {{-80, 40}, {-80, -40}, {0, -40}, {80, 0}, {0, 40}, {-80, 40}}, lineColor = {0, 0, 255}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid), Text(extent = {{-60, 20}, {0, -20}}, lineColor = {0, 0, 255}, textString = "LV
Gate")}), Documentation(info = "<html>
<p><br><span style=\"font-family: MS Shell Dlg 2;\">&LT;iPSL: iTesla Power System Library&GT;</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Copyright 2015 RTE (France), AIA (Spain), KTH (Sweden) and DTU (Denmark)</span></p>
<ul>
<li><span style=\"font-family: MS Shell Dlg 2;\">RTE: http://www.rte-france.com/ </span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">AIA: http://www.aia.es/en/energy/</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">KTH: https://www.kth.se/en</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">DTU:http://www.dtu.dk/english</span></li>
</ul>
<p><span style=\"font-family: MS Shell Dlg 2;\">The authors can be contacted by email: info at itesla-ipsl dot org</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">This package is part of the iTesla Power System Library (&QUOT;iPSL&QUOT;) .</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is free software: you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">You should have received a copy of the GNU Lesser General Public License along with the iPSL. If not, see &LT;http://www.gnu.org/licenses/&GT;.</span></p>
</html>"));
      end LV_GATE;

      model Relay "Relay"
        Modelica.Blocks.Interfaces.RealInput u1 annotation(Placement(transformation(extent = {{-61, 20}, {-41, 40}}), iconTransformation(extent = {{-60, 20}, {-40, 40}})));
        Modelica.Blocks.Interfaces.RealInput u2 annotation(Placement(transformation(extent = {{-61, -10}, {-41, 10}}), iconTransformation(extent = {{-60, -10}, {-40, 10}})));
        Modelica.Blocks.Interfaces.RealInput u3 annotation(Placement(transformation(extent = {{-61, -40}, {-41, -20}}), iconTransformation(extent = {{-60, -40}, {-40, -20}})));
        Modelica.Blocks.Interfaces.RealOutput y annotation(Placement(transformation(extent = {{39, -10}, {59, 10}}), iconTransformation(extent = {{40, -8}, {56, 8}})));
      equation
        y = if u1 > 0 then u2 else u3;
        annotation(Icon(coordinateSystem(extent = {{-40, -40}, {40, 40}}, preserveAspectRatio = true), graphics = {Rectangle(extent = {{-40, 40}, {40, -40}}, lineColor = {0, 0, 0}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid), Line(points = {{-28, 0}, {-8, 0}}, color = {0, 0, 255}, smooth = Smooth.None), Line(points = {{-28, -20}, {-8, -20}}, color = {0, 0, 255}, smooth = Smooth.None), Line(points = {{-12, -2}, {4, -12}, {24, -12}}, color = {0, 0, 255}, smooth = Smooth.None), Ellipse(extent = {{-8, 2}, {-4, -2}}, lineColor = {0, 0, 255}), Ellipse(extent = {{-8, -18}, {-4, -22}}, lineColor = {0, 0, 255}), Rectangle(extent = {{-12, 36}, {12, 24}}, lineColor = {0, 0, 255}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid), Line(points = {{-12, 30}, {-28, 30}}, color = {0, 0, 255}), Line(points = {{28, 30}, {12, 30}}, color = {0, 0, 255}), Line(points = {{0, 24}, {0, -10}}, color = {0, 0, 255}, pattern = LinePattern.Dash), Text(extent = {{-110, 58}, {110, 42}}, lineColor = {0, 0, 255}, textString = "%name")}), Diagram(coordinateSystem(extent = {{-40, -40}, {40, 40}}, preserveAspectRatio = true)), Documentation(info = "<html>
<p><br><span style=\"font-family: MS Shell Dlg 2;\">&LT;iPSL: iTesla Power System Library&GT;</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Copyright 2015 RTE (France), AIA (Spain), KTH (Sweden) and DTU (Denmark)</span></p>
<ul>
<li><span style=\"font-family: MS Shell Dlg 2;\">RTE: http://www.rte-france.com/ </span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">AIA: http://www.aia.es/en/energy/</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">KTH: https://www.kth.se/en</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">DTU:http://www.dtu.dk/english</span></li>
</ul>
<p><span style=\"font-family: MS Shell Dlg 2;\">The authors can be contacted by email: info at itesla-ipsl dot org</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">This package is part of the iTesla Power System Library (&QUOT;iPSL&QUOT;) .</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is free software: you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">You should have received a copy of the GNU Lesser General Public License along with the iPSL. If not, see &LT;http://www.gnu.org/licenses/&GT;.</span></p>
</html>"));
      end Relay;

      model Relay3 "input dependent output"
        input Modelica.Blocks.Interfaces.RealInput u1 annotation(Placement(transformation(extent = {{-54, -40}, {-41, -26}}), iconTransformation(extent = {{-56, -38}, {-40, -22}})));
        input Modelica.Blocks.Interfaces.RealInput u2 annotation(Placement(transformation(extent = {{-54, 26}, {-41, 40}}), iconTransformation(extent = {{-56, 22}, {-40, 38}})));
        input Modelica.Blocks.Interfaces.RealInput u3 annotation(Placement(transformation(extent = {{-54, 4}, {-41, 18}}), iconTransformation(extent = {{-56, 2}, {-40, 18}})));
        output Modelica.Blocks.Interfaces.RealOutput y annotation(Placement(transformation(extent = {{41, -8}, {61, 12}}), iconTransformation(extent = {{40, -6}, {52, 6}})));
        parameter Real Vov = 0.5;
        input Modelica.Blocks.Interfaces.RealInput u4 annotation(Placement(transformation(extent = {{-54, -16}, {-40, -2}}), iconTransformation(extent = {{-56, -18}, {-40, -2}})));
      equation
        y = if u1 > Vov then u3 elseif u1 < (-Vov) then u4 else u2;
        annotation(Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-40, -40}, {40, 40}}), graphics = {Rectangle(extent = {{-40, 40}, {40, -40}}, lineColor = {0, 0, 255}), Line(points = {{-34, 30}, {-14, 30}}, color = {0, 0, 255}, smooth = Smooth.None), Line(points = {{-34, 10}, {-14, 10}}, color = {0, 0, 255}, smooth = Smooth.None), Line(points = {{-12, 14}, {14, 10}, {34, 10}}, color = {0, 0, 255}, smooth = Smooth.None), Ellipse(extent = {{-14, 32}, {-10, 28}}, lineColor = {0, 0, 255}), Ellipse(extent = {{-14, 12}, {-10, 8}}, lineColor = {0, 0, 255}), Line(points = {{-34, -10}, {-14, -10}}, color = {0, 0, 255}, smooth = Smooth.None), Ellipse(extent = {{-14, -8}, {-10, -12}}, lineColor = {0, 0, 255}), Rectangle(extent = {{-12, -24}, {12, -36}}, lineColor = {0, 0, 255}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid), Line(points = {{-12, -30}, {-28, -30}}, color = {0, 0, 255}), Line(points = {{28, -30}, {12, -30}}, color = {0, 0, 255}), Line(points = {{0, 12}, {0, -24}}, color = {0, 0, 255}, pattern = LinePattern.Dash)}), Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-40, -40}, {40, 40}}), graphics), Documentation(info = "<html>
<p><br><span style=\"font-family: MS Shell Dlg 2;\">&LT;iPSL: iTesla Power System Library&GT;</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Copyright 2015 RTE (France), AIA (Spain), KTH (Sweden) and DTU (Denmark)</span></p>
<ul>
<li><span style=\"font-family: MS Shell Dlg 2;\">RTE: http://www.rte-france.com/ </span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">AIA: http://www.aia.es/en/energy/</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">KTH: https://www.kth.se/en</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">DTU:http://www.dtu.dk/english</span></li>
</ul>
<p><span style=\"font-family: MS Shell Dlg 2;\">The authors can be contacted by email: info at itesla-ipsl dot org</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">This package is part of the iTesla Power System Library (&QUOT;iPSL&QUOT;) .</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is free software: you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">You should have received a copy of the GNU Lesser General Public License along with the iPSL. If not, see &LT;http://www.gnu.org/licenses/&GT;.</span></p>
</html>"));
      end Relay3;

      model Relay4
        Modelica.Blocks.Interfaces.RealInput in1 annotation(Placement(transformation(extent = {{-5, -6}, {5, 6}}, rotation = -90, origin = {-40, 46}), iconTransformation(extent = {{-5.5, -6}, {5.5, 6}}, rotation = -90, origin = {-30, 45.5})));
        Modelica.Blocks.Interfaces.RealInput in2 annotation(Placement(transformation(extent = {{-5, -6}, {5, 6}}, rotation = -90, origin = {-14, 46}), iconTransformation(extent = {{-5.5, -6}, {5.5, 6}}, rotation = -90, origin = {-12, 45.5})));
        Modelica.Blocks.Interfaces.RealInput in3 annotation(Placement(transformation(extent = {{-5, -6}, {5, 6}}, rotation = -90, origin = {14, 46}), iconTransformation(extent = {{-5.5, -6}, {5.5, 6}}, rotation = -90, origin = {10, 45.5})));
        Modelica.Blocks.Interfaces.RealInput in4 annotation(Placement(transformation(extent = {{-5, -6}, {5, 6}}, rotation = -90, origin = {38, 46}), iconTransformation(extent = {{-5.5, -6}, {5.5, 6}}, rotation = -90, origin = {30, 45.5})));
        Modelica.Blocks.Interfaces.RealInput p1 annotation(Placement(transformation(extent = {{-50, 14}, {-40, 26}})));
        Modelica.Blocks.Interfaces.RealInput p2 annotation(Placement(transformation(extent = {{-50, -26}, {-40, -14}})));
        Modelica.Blocks.Interfaces.RealOutput n annotation(Placement(transformation(extent = {{41, -6}, {51, 6}}), iconTransformation(extent = {{40, -4}, {48, 4}})));
      equation
        n = if in1 == 0 and in2 == 1 and in3 == 0 and in4 == 0 then p1 else p2;
        annotation(Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-40, -40}, {40, 40}}), graphics), Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-40, -40}, {40, 40}}), graphics = {Rectangle(extent = {{-40, 40}, {40, -40}}, lineColor = {0, 0, 255}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid), Line(points = {{-34, 20}, {-6, 20}}, color = {0, 0, 255}, smooth = Smooth.None, thickness = 0.5), Line(points = {{-34, -20}, {-6, -20}}, color = {0, 0, 255}, smooth = Smooth.None, thickness = 0.5), Ellipse(extent = {{-6, 23}, {0, 17}}, lineColor = {0, 0, 255}, lineThickness = 0.5), Ellipse(extent = {{-6, -17}, {0, -23}}, lineColor = {0, 0, 255}, lineThickness = 0.5), Line(points = {{0, 16}, {12, 0}, {40, 0}}, color = {0, 0, 255}, smooth = Smooth.None, thickness = 0.5)}), Documentation(info = "<html>
<p><br><span style=\"font-family: MS Shell Dlg 2;\">&LT;iPSL: iTesla Power System Library&GT;</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Copyright 2015 RTE (France), AIA (Spain), KTH (Sweden) and DTU (Denmark)</span></p>
<ul>
<li><span style=\"font-family: MS Shell Dlg 2;\">RTE: http://www.rte-france.com/ </span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">AIA: http://www.aia.es/en/energy/</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">KTH: https://www.kth.se/en</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">DTU:http://www.dtu.dk/english</span></li>
</ul>
<p><span style=\"font-family: MS Shell Dlg 2;\">The authors can be contacted by email: info at itesla-ipsl dot org</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">This package is part of the iTesla Power System Library (&QUOT;iPSL&QUOT;) .</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is free software: you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">You should have received a copy of the GNU Lesser General Public License along with the iPSL. If not, see &LT;http://www.gnu.org/licenses/&GT;.</span></p>
</html>"));
      end Relay4;
      annotation(Documentation(info = "<html>
<p><br><span style=\"font-family: MS Shell Dlg 2;\">&LT;iPSL: iTesla Power System Library&GT;</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Copyright 2015 RTE (France), AIA (Spain), KTH (Sweden) and DTU (Denmark)</span></p>
<ul>
<li><span style=\"font-family: MS Shell Dlg 2;\">RTE: http://www.rte-france.com/ </span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">AIA: http://www.aia.es/en/energy/</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">KTH: https://www.kth.se/en</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">DTU:http://www.dtu.dk/english</span></li>
</ul>
<p><span style=\"font-family: MS Shell Dlg 2;\">The authors can be contacted by email: info at itesla-ipsl dot org</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">This package is part of the iTesla Power System Library (&QUOT;iPSL&QUOT;) .</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is free software: you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">You should have received a copy of the GNU Lesser General Public License along with the iPSL. If not, see &LT;http://www.gnu.org/licenses/&GT;.</span></p>
</html>"));
    end Logical;

    package Continuous
      block IntegratorLimVar "Integrator with a non windup limiter and variable limits"
        extends Modelica.Blocks.Interfaces.SISO;
        parameter Real K "Gain" annotation(Evaluate = false);
        parameter Real y_start "Output start value" annotation(Dialog(group = "Initialization"));
        Modelica.Blocks.Interfaces.RealInput outMax annotation(Placement(transformation(extent = {{98, 106}, {138, 146}}), iconTransformation(extent = {{-20, -20}, {20, 20}}, rotation = -90, origin = {80, 140})));
        Modelica.Blocks.Interfaces.RealInput outMin annotation(Placement(transformation(extent = {{-90, -6}, {-50, 34}}), iconTransformation(extent = {{-20, -20}, {20, 20}}, rotation = 90, origin = {-80, -140})));
      initial equation
        y = y_start;
      equation
        assert(outMax > outMin, "Upper limit must be greater than lower limit", AssertionLevel.error);
        if y >= outMax and u > 0 then
          der(y) = 0;
        elseif y <= outMin and u < 0 then
          der(y) = 0;
        else
          der(y) = K * u;
        end if;
        annotation(Icon(graphics = {Line(points = {{40, 100}, {60, 140}, {100, 140}}, color = {0, 0, 0}), Text(extent = {{-20, 68}, {20, 8}}, lineColor = {0, 0, 255}, textString = "K"), Line(points = {{-80, 0}, {78, 0}}, color = {0, 0, 255}, smooth = Smooth.Bezier, thickness = 0.5), Text(extent = {{-70, -20}, {70, -80}}, lineColor = {0, 0, 255}, textString = "s"), Line(points = {{-100, -140}, {-60, -140}, {-40, -100}}, color = {0, 0, 0})}), Diagram, Documentation(info = "<html>
<p><br><span style=\"font-family: MS Shell Dlg 2;\">&LT;iPSL: iTesla Power System Library&GT;</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Copyright 2015 RTE (France), AIA (Spain), KTH (Sweden) and DTU (Denmark)</span></p>
<ul>
<li><span style=\"font-family: MS Shell Dlg 2;\">RTE: http://www.rte-france.com/ </span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">AIA: http://www.aia.es/en/energy/</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">KTH: https://www.kth.se/en</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">DTU:http://www.dtu.dk/english</span></li>
</ul>
<p><span style=\"font-family: MS Shell Dlg 2;\">The authors can be contacted by email: info at itesla-ipsl dot org</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">This package is part of the iTesla Power System Library (&QUOT;iPSL&QUOT;) .</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is free software: you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">You should have received a copy of the GNU Lesser General Public License along with the iPSL. If not, see &LT;http://www.gnu.org/licenses/&GT;.</span></p>
</html>"));
      end IntegratorLimVar;

      block SimpleLag "First order lag transfer function block"
        extends Modelica.Blocks.Interfaces.SISO(y(start = y_start));
        Modelica.Blocks.Sources.RealExpression const(y = T) annotation(Placement(transformation(extent = {{-58, 32}, {-38, 52}})));
        Real state(start = y_start);
        parameter Real K "Gain";
        parameter Modelica.SIunits.Time T "Lag time constant";
        parameter Real y_start "Output start value";
      protected
        parameter Real T_mod = if T < Modelica.Constants.eps then 1000 else T;
      equation
        T_mod * der(state) = K * u - state;
        if abs(const.y) <= Modelica.Constants.eps then
          y = u * K;
        else
          y = state;
        end if;
        annotation(Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics = {Text(extent = {{-18, 68}, {22, 8}}, lineColor = {0, 0, 255}, textString = "K"), Text(extent = {{-68, -20}, {72, -80}}, lineColor = {0, 0, 255}, textString = "1 + Ts"), Line(points = {{-78, 0}, {80, 0}}, color = {0, 0, 255}, smooth = Smooth.Bezier, thickness = 0.5)}), Diagram(graphics), Documentation(info = "<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\">
<tr>
<td><p>Reference</p></td>
<td></td>
</tr>
<tr>
<td><p>Last update</p></td>
<td>2015-11-24</td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p>Tin Rabuzin, SmarTS Lab, KTH Royal Institute of Technology</p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p><a href=\"mailto:luigiv@kth.se\">luigiv@kth.se</a></p></td>
</tr>
</table>
<p><br><span style=\"font-family: MS Shell Dlg 2;\">&LT;iPSL: iTesla Power System Library&GT;</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Copyright 2015 RTE (France), AIA (Spain), KTH (Sweden) and DTU (Denmark)</span></p>
<ul>
<li><span style=\"font-family: MS Shell Dlg 2;\">RTE: http://www.rte-france.com/ </span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">AIA: http://www.aia.es/en/energy/</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">KTH: https://www.kth.se/en</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">DTU:http://www.dtu.dk/english</span></li>
</ul>
<p><span style=\"font-family: MS Shell Dlg 2;\">The authors can be contacted by email: info at itesla-ipsl dot org</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">This package is part of the iTesla Power System Library (&QUOT;iPSL&QUOT;) .</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is free software: you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">You should have received a copy of the GNU Lesser General Public License along with the iPSL. If not, see &LT;http://www.gnu.org/licenses/&GT;.</span></p>
</html>"));
      end SimpleLag;

      block SimpleLagLim "First order lag transfer function block with a non windup limiter"
        extends Modelica.Blocks.Interfaces.SISO(y(start = y_start));
        Modelica.Blocks.Sources.RealExpression const(y = T) annotation(Placement(transformation(extent = {{-58, 32}, {-38, 52}})));
        Real state;
        parameter Real K "Gain";
        parameter Modelica.SIunits.Time T "Lag time constant";
        parameter Real y_start "Output start value";
        parameter Real outMax "Maximum output value";
        parameter Real outMin "Minimum output value";
      protected
        parameter Real T_mod = if T < Modelica.Constants.eps then 1000 else T;
      initial equation
        state = y_start;
      equation
        T_mod * der(state) = K * u - state;
        when state > outMax and K * u - state < 0 then
          reinit(state, outMax);
        elsewhen state < outMin and K * u - state > 0 then
          reinit(state, outMin);
        end when;
        if abs(const.y) <= Modelica.Constants.eps then
          y = max(min(u * K, outMax), outMin);
        else
          y = max(min(state, outMax), outMin);
        end if;
        annotation(Documentation(info = "<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\">
<tr>
<td><p>Reference</p></td>
<td>IEEE Std. 421.5-2005, Annex E</td>
</tr>
<tr>
<td><p>Last update</p></td>
<td>2015-11-25</td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p>Tin Rabuzin,SmarTS Lab, KTH Royal Institute of Technology</p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p><a href=\"mailto:luigiv@kth.se\">luigiv@kth.se</a></p></td>
</tr>
</table>
<p><br><span style=\"font-family: MS Shell Dlg 2;\">&LT;iPSL: iTesla Power System Library&GT;</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Copyright 2015 RTE (France), AIA (Spain), KTH (Sweden) and DTU (Denmark)</span></p>
<ul>
<li><span style=\"font-family: MS Shell Dlg 2;\">RTE: http://www.rte-france.com/ </span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">AIA: http://www.aia.es/en/energy/</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">KTH: https://www.kth.se/en</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">DTU:http://www.dtu.dk/english</span></li>
</ul>
<p><span style=\"font-family: MS Shell Dlg 2;\">The authors can be contacted by email: info at itesla-ipsl dot org</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">This package is part of the iTesla Power System Library (&QUOT;iPSL&QUOT;) .</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is free software: you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">You should have received a copy of the GNU Lesser General Public License along with the iPSL. If not, see &LT;http://www.gnu.org/licenses/&GT;.</span></p>
</html>"), Icon(graphics = {Line(points = {{40, 100}, {60, 140}, {100, 140}}, color = {0, 0, 0}), Text(extent = {{-20, 68}, {20, 8}}, lineColor = {0, 0, 255}, textString = "K"), Line(points = {{-80, 0}, {78, 0}}, color = {0, 0, 255}, smooth = Smooth.Bezier, thickness = 0.5), Text(extent = {{-70, -20}, {70, -80}}, lineColor = {0, 0, 255}, textString = "1 + Ts"), Line(points = {{-100, -140}, {-60, -140}, {-40, -100}}, color = {0, 0, 0})}));
      end SimpleLagLim;

      block SimpleLagLimVar "First order lag transfer function block with a non windup limiter and variable limits"
        extends Modelica.Blocks.Interfaces.SISO(y(start = y_start));
        Modelica.Blocks.Interfaces.RealInput outMax annotation(Placement(transformation(extent = {{98, 106}, {138, 146}}), iconTransformation(extent = {{-20, -20}, {20, 20}}, rotation = -90, origin = {80, 140})));
        Modelica.Blocks.Interfaces.RealInput outMin annotation(Placement(transformation(extent = {{-90, -6}, {-50, 34}}), iconTransformation(extent = {{-20, -20}, {20, 20}}, rotation = 90, origin = {-80, -140})));
        Modelica.Blocks.Sources.RealExpression const(y = T) annotation(Placement(transformation(extent = {{-58, 32}, {-38, 52}})));
        Real state(start = y_start);
        parameter Real K "Gain";
        parameter Modelica.SIunits.Time T "Lag time constant";
        parameter Real y_start "Output start value";
      protected
        parameter Real T_mod = if T < Modelica.Constants.eps then 1000 else T;
      equation
        T_mod * der(state) = K * u - state;
        when state > outMax and K * u - state < 0 then
          reinit(state, outMax);
        elsewhen state < outMin and K * u - state > 0 then
          reinit(state, outMin);
        end when;
        if abs(const.y) <= Modelica.Constants.eps then
          y = max(min(u * K, outMax), outMin);
        else
          y = max(min(state, outMax), outMin);
        end if;
        annotation(Documentation(info = "<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\">
<tr>
<td><p>Reference</p></td>
<td>IEEE Std. 421.5-2005, Annex E</td>
</tr>
<tr>
<td><p>Last update</p></td>
<td>2015-11-25</td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p>Tin Rabuzin,SmarTS Lab, KTH Royal Institute of Technology</p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p><a href=\"mailto:luigiv@kth.se\">luigiv@kth.se</a></p></td>
</tr>
</table>
<p><br><span style=\"font-family: MS Shell Dlg 2;\">&LT;iPSL: iTesla Power System Library&GT;</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Copyright 2015 RTE (France), AIA (Spain), KTH (Sweden) and DTU (Denmark)</span></p>
<ul>
<li><span style=\"font-family: MS Shell Dlg 2;\">RTE: http://www.rte-france.com/ </span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">AIA: http://www.aia.es/en/energy/</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">KTH: https://www.kth.se/en</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">DTU:http://www.dtu.dk/english</span></li>
</ul>
<p><span style=\"font-family: MS Shell Dlg 2;\">The authors can be contacted by email: info at itesla-ipsl dot org</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">This package is part of the iTesla Power System Library (&QUOT;iPSL&QUOT;) .</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is free software: you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">You should have received a copy of the GNU Lesser General Public License along with the iPSL. If not, see &LT;http://www.gnu.org/licenses/&GT;.</span></p>
</html>"), Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics = {Line(points = {{40, 100}, {60, 140}, {100, 140}}, color = {0, 0, 0}), Text(extent = {{-20, 68}, {20, 8}}, lineColor = {0, 0, 255}, textString = "K"), Line(points = {{-80, 0}, {78, 0}}, color = {0, 0, 255}, smooth = Smooth.Bezier, thickness = 0.5), Text(extent = {{-70, -20}, {70, -80}}, lineColor = {0, 0, 255}, textString = "1 + Ts"), Line(points = {{-100, -140}, {-60, -140}, {-40, -100}}, color = {0, 0, 0})}), Diagram);
      end SimpleLagLimVar;

      block SimpleLagRateLimBlock "First order lag transfer function block with a non windup limiter, rate limits and blocking input"
        extends Modelica.Blocks.Interfaces.SISO(y(start = y_start));
        parameter Real K "Gain" annotation(Evaluate = false);
        parameter Modelica.SIunits.Time T "Lag time constant" annotation(Evaluate = false);
        parameter Real y_start "Output start value" annotation(Dialog(group = "Initialization"));
        parameter Real outMax "Maximum output value" annotation(Evaluate = false);
        parameter Real outMin "Minimum output value" annotation(Evaluate = false);
        parameter Real rmin "Minimum rate limit" annotation(Evaluate = false);
        parameter Real rmax "Maximum rate limit" annotation(Evaluate = false);
        Real x;
        Real rate;
        Modelica.Blocks.Interfaces.RealInput Block annotation(Placement(transformation(extent = {{-140, 60}, {-100, 100}}), iconTransformation(extent = {{-140, 60}, {-100, 100}})));
      initial equation
        y = y_start;
      equation
        assert(T >= 1e-10, "Time constant must be greater than 0", AssertionLevel.error);
        assert(outMax > outMin, "Upper limit must be greater than lower limit", AssertionLevel.error);
        rate = if u > outMax then (outMax - x) / T elseif u < outMin then (outMin - x) / T else (u - x) / T;
        if Block > 0 then
          der(x) = 0;
        else
          der(x) = if rate > rmax then rmax elseif rate < rmin then rmin else rate;
        end if;
        y = if x > outMax then outMax elseif x < outMin then outMin else x;
        annotation(Documentation(info = "<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\">
<tr>
<td><p>Reference</p></td>
<td>IEEE Std. 421.5-2005, Annex E</td>
</tr>
<tr>
<td><p>Last update</p></td>
<td>2015-11-25</td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p>Tin Rabuzin,SmarTS Lab, KTH Royal Institute of Technology</p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p><a href=\"mailto:luigiv@kth.se\">luigiv@kth.se</a></p></td>
</tr>
</table>
<p><br><span style=\"font-family: MS Shell Dlg 2;\">&LT;iPSL: iTesla Power System Library&GT;</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Copyright 2015 RTE (France), AIA (Spain), KTH (Sweden) and DTU (Denmark)</span></p>
<ul>
<li><span style=\"font-family: MS Shell Dlg 2;\">RTE: http://www.rte-france.com/ </span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">AIA: http://www.aia.es/en/energy/</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">KTH: https://www.kth.se/en</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">DTU:http://www.dtu.dk/english</span></li>
</ul>
<p><span style=\"font-family: MS Shell Dlg 2;\">The authors can be contacted by email: info at itesla-ipsl dot org</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">This package is part of the iTesla Power System Library (&QUOT;iPSL&QUOT;) .</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is free software: you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">You should have received a copy of the GNU Lesser General Public License along with the iPSL. If not, see &LT;http://www.gnu.org/licenses/&GT;.</span></p>

</html>"), Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics = {Line(points = {{40, 100}, {60, 140}, {100, 140}}, color = {0, 0, 0}), Text(extent = {{-20, 68}, {20, 8}}, lineColor = {0, 0, 255}, textString = "K"), Line(points = {{-80, 0}, {78, 0}}, color = {0, 0, 255}, smooth = Smooth.Bezier, thickness = 0.5), Text(extent = {{-70, -20}, {70, -80}}, lineColor = {0, 0, 255}, textString = "1 + Ts"), Line(points = {{-100, -140}, {-60, -140}, {-40, -100}}, color = {0, 0, 0}), Ellipse(extent = {{-82, 86}, {-96, 72}}, lineColor = {255, 0, 0}, fillColor = {255, 0, 0}, fillPattern = FillPattern.Solid), Rectangle(extent = {{-94, 80}, {-84, 78}}, lineColor = {255, 0, 0}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid)}), Diagram);
      end SimpleLagRateLimBlock;

      block SimpleLagRateLimVar "First order lag transfer function block with a non windup limiter, rate limits, variable output limits and blocking input"
        extends Modelica.Blocks.Interfaces.SISO;
        parameter Modelica.SIunits.Time T "Lag time constant" annotation(Evaluate = false);
        parameter Real y_start "Output start value" annotation(Dialog(group = "Initialization"));
        parameter Real rmin "Minimum rate limit";
        parameter Real rmax "Maximum rate limit";
        Real rate "Rate";
        Real x;
        Modelica.Blocks.Interfaces.RealInput outMin annotation(Placement(transformation(extent = {{-90, -6}, {-50, 34}}), iconTransformation(extent = {{-20, -20}, {20, 20}}, rotation = 90, origin = {-80, -140})));
        Modelica.Blocks.Interfaces.RealInput outMax annotation(Placement(transformation(extent = {{98, 106}, {138, 146}}), iconTransformation(extent = {{-20, -20}, {20, 20}}, rotation = -90, origin = {80, 140})));
      initial equation
        x = y_start;
        y = y_start;
      equation
        assert(T >= 1e-10, "Time constant must be greater than 0", AssertionLevel.error);
        rate = if u > outMax then (outMax - x) / T elseif u < outMin then (outMin - x) / T else (u - x) / T;
        der(x) = if rate > rmax then rmax elseif rate < rmin then rmin else rate;
        y = if x > outMax then outMax elseif x < outMin then outMin else x;
        annotation(Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics), Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics = {Line(points = {{-100, -140}, {-60, -140}, {-40, -100}}, color = {0, 0, 0}), Line(points = {{40, 100}, {60, 140}, {100, 140}}, color = {0, 0, 0}), Text(extent = {{-20, 68}, {20, 8}}, lineColor = {0, 0, 255}, textString = "K"), Line(points = {{-80, 0}, {78, 0}}, color = {0, 0, 255}, smooth = Smooth.Bezier, thickness = 0.5), Text(extent = {{-70, -20}, {70, -80}}, lineColor = {0, 0, 255}, textString = "1 + Ts"), Line(points = {{-60, 100}, {-80, 140}, {-120, 140}}, color = {255, 0, 0}), Line(points = {{120, -140}, {80, -140}, {60, -100}}, color = {255, 0, 0})}), Documentation(info = "<html>
<p><br><span style=\"font-family: MS Shell Dlg 2;\">&LT;iPSL: iTesla Power System Library&GT;</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Copyright 2015 RTE (France), AIA (Spain), KTH (Sweden) and DTU (Denmark)</span></p>
<ul>
<li><span style=\"font-family: MS Shell Dlg 2;\">RTE: http://www.rte-france.com/ </span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">AIA: http://www.aia.es/en/energy/</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">KTH: https://www.kth.se/en</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">DTU:http://www.dtu.dk/english</span></li>
</ul>
<p><span style=\"font-family: MS Shell Dlg 2;\">The authors can be contacted by email: info at itesla-ipsl dot org</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">This package is part of the iTesla Power System Library (&QUOT;iPSL&QUOT;) .</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is free software: you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">You should have received a copy of the GNU Lesser General Public License along with the iPSL. If not, see &LT;http://www.gnu.org/licenses/&GT;.</span></p>
</html>"));
      end SimpleLagRateLimVar;

      block SimpleLead "First order lead transfer function block"
        extends Modelica.Blocks.Interfaces.SISO;
        parameter Real K "Gain" annotation(Evaluate = false);
        parameter Modelica.SIunits.Time T "Lead time constant" annotation(Evaluate = false);
        parameter Real y_start "Output start value" annotation(Dialog(group = "Initialization"));
      initial equation
        y = y_start;
      equation
        assert(T >= 1e-10, "Time constant must be greater than 0", AssertionLevel.error);
        T * der(u) = K * y - u;
        annotation(Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics = {Text(extent = {{-56, 68}, {58, 8}}, lineColor = {0, 0, 255}, textString = "1+Ts"), Line(points = {{-76, 0}, {82, 0}}, color = {0, 0, 255}, smooth = Smooth.Bezier, thickness = 0.5), Text(extent = {{-66, -20}, {74, -80}}, lineColor = {0, 0, 255}, textString = "K")}), Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics), Documentation(info = "<html>
<p><br><span style=\"font-family: MS Shell Dlg 2;\">&LT;iPSL: iTesla Power System Library&GT;</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Copyright 2015 RTE (France), AIA (Spain), KTH (Sweden) and DTU (Denmark)</span></p>
<ul>
<li><span style=\"font-family: MS Shell Dlg 2;\">RTE: http://www.rte-france.com/ </span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">AIA: http://www.aia.es/en/energy/</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">KTH: https://www.kth.se/en</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">DTU:http://www.dtu.dk/english</span></li>
</ul>
<p><span style=\"font-family: MS Shell Dlg 2;\">The authors can be contacted by email: info at itesla-ipsl dot org</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">This package is part of the iTesla Power System Library (&QUOT;iPSL&QUOT;) .</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is free software: you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">You should have received a copy of the GNU Lesser General Public License along with the iPSL. If not, see &LT;http://www.gnu.org/licenses/&GT;.</span></p>
</html>"));
      end SimpleLead;

      block LeadLag "Lead-Lag filter"
        extends Modelica.Blocks.Interfaces.SISO;
        parameter Real K "Gain";
        parameter Modelica.SIunits.Time T1 "Lead time constant";
        parameter Modelica.SIunits.Time T2 "Lag time constant";
        parameter Real y_start "Output start value" annotation(Dialog(group = "Initialization"));
        parameter Real x_start "Start value of state variable" annotation(Dialog(group = "Initialization"));
      protected
        parameter Modelica.SIunits.Time T2_dummy = if abs(T1 - T2) < Modelica.Constants.eps then 1000 else T2 "Lead time constant";
      public
        Modelica.Blocks.Sources.RealExpression par1(y = T1) annotation(Placement(transformation(extent = {{-80, 54}, {-60, 74}})));
        Modelica.Blocks.Sources.RealExpression par2(y = T2) annotation(Placement(transformation(extent = {{-80, 34}, {-60, 54}})));
        Modelica.Blocks.Continuous.TransferFunction TF(b = {K * T1, K}, a = {T2_dummy, 1}, y_start = y_start, initType = Modelica.Blocks.Types.Init.InitialOutput, x_start = {x_start}) annotation(Placement(transformation(extent = {{-8, -10}, {12, 10}})));
      equation
        if abs(par1.y - par2.y) < Modelica.Constants.eps then
          y = K * u;
        else
          y = TF.y;
        end if;
        connect(TF.u, u) annotation(Line(points = {{-10, 0}, {-120, 0}}, color = {0, 0, 127}));
        annotation(Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}})), Documentation(info = "<html>
<p><br><span style=\"font-family: MS Shell Dlg 2;\">&LT;iPSL: iTesla Power System Library&GT;</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Copyright 2015 RTE (France), AIA (Spain), KTH (Sweden) and DTU (Denmark)</span></p>
<ul>
<li><span style=\"font-family: MS Shell Dlg 2;\">RTE: http://www.rte-france.com/ </span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">AIA: http://www.aia.es/en/energy/</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">KTH: https://www.kth.se/en</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">DTU:http://www.dtu.dk/english</span></li>
</ul>
<p><span style=\"font-family: MS Shell Dlg 2;\">The authors can be contacted by email: info at itesla-ipsl dot org</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">This package is part of the iTesla Power System Library (&QUOT;iPSL&QUOT;) .</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is free software: you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">You should have received a copy of the GNU Lesser General Public License along with the iPSL. If not, see &LT;http://www.gnu.org/licenses/&GT;.</span></p>
</html>"), Icon(graphics = {Text(extent = {{-44, 82}, {76, 22}}, lineColor = {0, 0, 255}, textString = "1+sT"), Line(points = {{-46, 0}, {82, 0}}, color = {0, 0, 255}, smooth = Smooth.Bezier, thickness = 0.5), Text(extent = {{-44, -20}, {76, -80}}, lineColor = {0, 0, 255}, textString = "1+sT"), Text(extent = {{-100, 28}, {-40, -32}}, lineColor = {0, 0, 255}, textString = "K"), Text(extent = {{62, 44}, {82, 24}}, lineColor = {0, 0, 255}, textString = "1"), Text(extent = {{64, -58}, {84, -78}}, lineColor = {0, 0, 255}, textString = "2")}));
      end LeadLag;

      block LeadLagLim "Lead-Lag filter with a non-windup limiter"
        extends Modelica.Blocks.Interfaces.SISO;
        parameter Real K "Gain";
        parameter Modelica.SIunits.Time T1 "Lead time constant";
        parameter Modelica.SIunits.Time T2 "Lag time constant";
        parameter Real outMax "Maximum output value";
        parameter Real outMin "Minimum output value";
        parameter Real y_start "Output start value" annotation(Dialog(group = "Initialization"));
      protected
        Real x1(start = y_start);
        Real x2(start = y_start);
        parameter Modelica.SIunits.Time T2_dummy = if abs(T1 - T2) < Modelica.Constants.eps then 1000 else T2 "Lead time constant";
      public
        Modelica.Blocks.Sources.RealExpression par1(y = T1) annotation(Placement(transformation(extent = {{-80, 54}, {-60, 74}})));
        Modelica.Blocks.Sources.RealExpression par2(y = T2) annotation(Placement(transformation(extent = {{-80, 34}, {-60, 54}})));
      equation
        x1 + der(x1) * T2_dummy = u * K;
        x1 + T1 / T2_dummy * (u * K - x1) = x2;
        when y >= outMax and der(x1) < 0 then
          reinit(x1, outMax);
        elsewhen y <= outMin and der(x1) > 0 then
          reinit(x1, outMin);
        end when;
        if abs(par1.y - par2.y) < Modelica.Constants.eps then
          y = max(min(K * u, outMax), outMin);
        else
          y = max(min(x2, outMax), outMin);
        end if;
        annotation(Icon(graphics = {Line(points = {{38, 100}, {58, 140}, {98, 140}}, color = {0, 0, 0}), Line(points = {{-102, -140}, {-62, -140}, {-42, -100}}, color = {0, 0, 0}), Text(extent = {{-50, 82}, {70, 22}}, lineColor = {0, 0, 255}, textString = "1+sT"), Text(extent = {{56, 44}, {76, 24}}, lineColor = {0, 0, 255}, textString = "1"), Line(points = {{-52, 0}, {76, 0}}, color = {0, 0, 255}, smooth = Smooth.Bezier, thickness = 0.5), Text(extent = {{-50, -20}, {70, -80}}, lineColor = {0, 0, 255}, textString = "1+sT"), Text(extent = {{58, -58}, {78, -78}}, lineColor = {0, 0, 255}, textString = "2"), Text(extent = {{-106, 28}, {-46, -32}}, lineColor = {0, 0, 255}, textString = "K")}), Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}})), Documentation(info = "<html>
<p><br><span style=\"font-family: MS Shell Dlg 2;\">&LT;iPSL: iTesla Power System Library&GT;</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Copyright 2015 RTE (France), AIA (Spain), KTH (Sweden) and DTU (Denmark)</span></p>
<ul>
<li><span style=\"font-family: MS Shell Dlg 2;\">RTE: http://www.rte-france.com/ </span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">AIA: http://www.aia.es/en/energy/</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">KTH: https://www.kth.se/en</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">DTU:http://www.dtu.dk/english</span></li>
</ul>
<p><span style=\"font-family: MS Shell Dlg 2;\">The authors can be contacted by email: info at itesla-ipsl dot org</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">This package is part of the iTesla Power System Library (&QUOT;iPSL&QUOT;) .</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is free software: you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">You should have received a copy of the GNU Lesser General Public License along with the iPSL. If not, see &LT;http://www.gnu.org/licenses/&GT;.</span></p>

</html>"));
      end LeadLagLim;
      annotation(Documentation(info = "<html>

All of the transfer functions found in this package are also available in the Modelica Standard Library (MSL). However, some of the models require the time constants of the functions in this package to be set to zero. This is not supported by MSL and, thus, this is supported by functions in this package.

<p><br><span style=\"font-family: MS Shell Dlg 2;\">&LT;iPSL: iTesla Power System Library&GT;</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Copyright 2015 RTE (France), AIA (Spain), KTH (Sweden) and DTU (Denmark)</span></p>
<ul>
<li><span style=\"font-family: MS Shell Dlg 2;\">RTE: http://www.rte-france.com/ </span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">AIA: http://www.aia.es/en/energy/</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">KTH: https://www.kth.se/en</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">DTU:http://www.dtu.dk/english</span></li>
</ul>
<p><span style=\"font-family: MS Shell Dlg 2;\">The authors can be contacted by email: info at itesla-ipsl dot org</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">This package is part of the iTesla Power System Library (&QUOT;iPSL&QUOT;) .</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is free software: you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">You should have received a copy of the GNU Lesser General Public License along with the iPSL. If not, see &LT;http://www.gnu.org/licenses/&GT;.</span></p>
</html>"));
    end Continuous;

    package Nonlinear
      model FEX "FEX=f(IN)"
        Modelica.Blocks.Interfaces.RealInput u annotation(Placement(transformation(extent = {{-70, -10}, {-50, 10}}), iconTransformation(extent = {{-110, -10}, {-90, 10}})));
        Modelica.Blocks.Interfaces.RealOutput y annotation(Placement(transformation(extent = {{58, -10}, {78, 10}}), iconTransformation(extent = {{100, -10}, {120, 10}})));
      equation
        if u <= 0 then
          y = 1;
        elseif u > 0 and u <= 0.433 then
          y = 1 - 0.577 * u;
        elseif u > 0.433 and u < 0.75 then
          y = sqrt(0.75 - u ^ 2);
        elseif u >= 0.75 and u <= 1 then
          y = 1.732 * (1 - u);
        else
          y = 0;
        end if;
        annotation(Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics), Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics = {Rectangle(extent = {{-100, 100}, {100, -100}}, lineColor = {0, 0, 255}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid), Text(extent = {{-62, 28}, {64, -30}}, lineColor = {0, 0, 255}, textString = "FEX=f(IN)")}), Documentation(info = "<html>
<p><br><span style=\"font-family: MS Shell Dlg 2;\">&LT;iPSL: iTesla Power System Library&GT;</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Copyright 2015 RTE (France), AIA (Spain), KTH (Sweden) and DTU (Denmark)</span></p>
<ul>
<li><span style=\"font-family: MS Shell Dlg 2;\">RTE: http://www.rte-france.com/ </span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">AIA: http://www.aia.es/en/energy/</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">KTH: https://www.kth.se/en</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">DTU:http://www.dtu.dk/english</span></li>
</ul>
<p><span style=\"font-family: MS Shell Dlg 2;\">The authors can be contacted by email: info at itesla-ipsl dot org</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">This package is part of the iTesla Power System Library (&QUOT;iPSL&QUOT;) .</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is free software: you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">You should have received a copy of the GNU Lesser General Public License along with the iPSL. If not, see &LT;http://www.gnu.org/licenses/&GT;.</span></p>
</html>"));
      end FEX;

      model SaturationBlockTan "Block 1 in the OEL to decide the input signal of MIN Gate"
        parameter Real r "Exiciter parameter";
        parameter Real f "Exiciter parameter";
        Modelica.Blocks.Interfaces.RealInput p1 annotation(Placement(transformation(extent = {{-86, -10}, {-66, 10}}), iconTransformation(extent = {{-80, -10}, {-60, 10}})));
        Modelica.Blocks.Interfaces.RealOutput n1 annotation(Placement(transformation(extent = {{46, -10}, {66, 10}}), iconTransformation(extent = {{60, -6}, {72, 6}})));
      equation
        if p1 <= (-0.1) then
          n1 = -1;
        elseif p1 > (-0.1) and p1 < 0 then
          n1 = 0;
        else
          n1 = tan(r) * p1 + f;
        end if;
        annotation(Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-60, -60}, {60, 60}}), graphics), Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-60, -60}, {60, 60}}), graphics = {Rectangle(extent = {{-60, 60}, {60, -60}}, lineColor = {0, 0, 255}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid), Line(points = {{-42, 0}, {36, 0}, {38, 0}, {40, 0}}, color = {0, 0, 255}, thickness = 0.5, smooth = Smooth.None, arrow = {Arrow.None, Arrow.Open}), Line(points = {{0, -30}, {0, 36}}, color = {0, 0, 255}, thickness = 0.5, smooth = Smooth.None, arrow = {Arrow.None, Arrow.Open}), Line(points = {{0, 12}, {34, 12}}, color = {0, 0, 255}, smooth = Smooth.None), Text(extent = {{22, 22}, {38, 12}}, lineColor = {0, 0, 0}, fillColor = {0, 0, 255}, fillPattern = FillPattern.Solid, textStyle = {TextStyle.Italic}, textString = "r"), Text(extent = {{-12, 16}, {4, 6}}, lineColor = {0, 0, 0}, fillColor = {0, 0, 255}, fillPattern = FillPattern.Solid, textString = "f", textStyle = {TextStyle.Italic}), Text(extent = {{-2, 0}, {12, -8}}, lineColor = {0, 0, 0}, fillColor = {0, 0, 255}, fillPattern = FillPattern.Solid, textString = "0"), Text(extent = {{-26, 8}, {-12, 0}}, lineColor = {0, 0, 0}, fillColor = {0, 0, 255}, fillPattern = FillPattern.Solid, textString = "-0.1"), Line(points = {{-20, -20}, {-2, -20}, {0, -20}}, color = {0, 0, 255}, pattern = LinePattern.Dot, smooth = Smooth.None), Text(extent = {{-2, -16}, {12, -24}}, lineColor = {0, 0, 0}, fillColor = {0, 0, 255}, fillPattern = FillPattern.Solid, textString = "-1"), Line(points = {{-34, -20}, {-20, -20}, {-20, 0}, {0, 0}, {0, 12}, {32, 22}}, color = {0, 0, 0}, thickness = 0.5, smooth = Smooth.None)}), Documentation(info = "<html>
<p><br><span style=\"font-family: MS Shell Dlg 2;\">&LT;iPSL: iTesla Power System Library&GT;</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Copyright 2015 RTE (France), AIA (Spain), KTH (Sweden) and DTU (Denmark)</span></p>
<ul>
<li><span style=\"font-family: MS Shell Dlg 2;\">RTE: http://www.rte-france.com/ </span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">AIA: http://www.aia.es/en/energy/</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">KTH: https://www.kth.se/en</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">DTU:http://www.dtu.dk/english</span></li>
</ul>
<p><span style=\"font-family: MS Shell Dlg 2;\">The authors can be contacted by email: info at ipsl dot org</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">This package is part of the iTesla Power System Library (&QUOT;iPSL&QUOT;) .</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is free software: you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">You should have received a copy of the GNU Lesser General Public License along with the iPSL. If not, see &LT;http://www.gnu.org/licenses/&GT;.</span></p>
</html>"));
      end SaturationBlockTan;
      annotation(Documentation(info = "<html>
<p><br><span style=\"font-family: MS Shell Dlg 2;\">&LT;iPSL: iTesla Power System Library&GT;</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Copyright 2015 RTE (France), AIA (Spain), KTH (Sweden) and DTU (Denmark)</span></p>
<ul>
<li><span style=\"font-family: MS Shell Dlg 2;\">RTE: http://www.rte-france.com/ </span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">AIA: http://www.aia.es/en/energy/</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">KTH: https://www.kth.se/en</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">DTU:http://www.dtu.dk/english</span></li>
</ul>
<p><span style=\"font-family: MS Shell Dlg 2;\">The authors can be contacted by email: info at itesla-ipsl dot org</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">This package is part of the iTesla Power System Library (&QUOT;iPSL&QUOT;) .</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is free software: you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">You should have received a copy of the GNU Lesser General Public License along with the iPSL. If not, see &LT;http://www.gnu.org/licenses/&GT;.</span></p>
</html>"));
    end Nonlinear;

    package Functions
      function SE "Scaled Quadratic Saturation Function (PTI PSS/E) "
        extends Modelica.Icons.Function;
        input Real u "Unsaturated Input";
        input Real SE1;
        input Real SE2;
        input Real E1;
        input Real E2;
        output Real sys "Saturated Output";
      protected
        parameter Real a = sqrt(SE1 * E1 / (SE2 * E2));
        parameter Real A = E2 - (E1 - E2) / (a - 1);
        parameter Real B = SE2 * E2 * (a - 1) ^ 2 / (E1 - E2) ^ 2;
      algorithm
        if SE1 == 0.0 or u <= 0.0 then
          sys := 0.0;
        else
          if u <= A then
            sys := 0.0;
          else
            sys := B * (u - A) ^ 2 / u;
          end if;
        end if;
        annotation(Documentation(info = "<html>
<p><br><span style=\"font-family: MS Shell Dlg 2;\">&LT;iPSL: iTesla Power System Library&GT;</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Copyright 2015 RTE (France), AIA (Spain), KTH (Sweden) and DTU (Denmark)</span></p>
<ul>
<li><span style=\"font-family: MS Shell Dlg 2;\">RTE: http://www.rte-france.com/ </span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">AIA: http://www.aia.es/en/energy/</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">KTH: https://www.kth.se/en</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">DTU:http://www.dtu.dk/english</span></li>
</ul>
<p><span style=\"font-family: MS Shell Dlg 2;\">The authors can be contacted by email: info at ipsl dot org</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">This package is part of the iTesla Power System Library (&QUOT;iPSL&QUOT;) .</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is free software: you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">You should have received a copy of the GNU Lesser General Public License along with the iPSL. If not, see &LT;http://www.gnu.org/licenses/&GT;.</span></p>
</html>"));
      end SE;

      function SE_exp "Exponential Saturation Function (PTI PSS/E) "
        extends Modelica.Icons.Function;
        input Real u "Unsaturated Input";
        input Real S_EE_1 "Saturation factor at point E_1";
        input Real S_EE_2 "Saturation factor at point E_2";
        input Real E_1 "First saturation point";
        input Real E_2 "Second saturation point";
        output Real sys "Saturated Output";
      protected
        parameter Real X = log(S_EE_2 / S_EE_1) / log(E_2);
      algorithm
        sys := S_EE_1 * u ^ X;
        annotation(Documentation(info = "<html>
<p><br><span style=\"font-family: MS Shell Dlg 2;\">&LT;iPSL: iTesla Power System Library&GT;</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Copyright 2015 RTE (France), AIA (Spain), KTH (Sweden) and DTU (Denmark)</span></p>
<ul>
<li><span style=\"font-family: MS Shell Dlg 2;\">RTE: http://www.rte-france.com/ </span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">AIA: http://www.aia.es/en/energy/</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">KTH: https://www.kth.se/en</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">DTU:http://www.dtu.dk/english</span></li>
</ul>
<p><span style=\"font-family: MS Shell Dlg 2;\">The authors can be contacted by email: info at itesla-ipsl dot org</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">This package is part of the iTesla Power System Library (&QUOT;iPSL&QUOT;) .</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is free software: you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">You should have received a copy of the GNU Lesser General Public License along with the iPSL. If not, see &LT;http://www.gnu.org/licenses/&GT;.</span></p>
</html>"));
      end SE_exp;

      block ImSE "Block for Saturation function of Exc "
        input Modelica.Blocks.Interfaces.RealInput VE_IN "Unsaturated Input" annotation(Placement(transformation(extent = {{-120, -20}, {-110, -10}}), iconTransformation(extent = {{-120, -10}, {-100, 10}})));
        output Modelica.Blocks.Interfaces.RealOutput VE_OUT "Saturated Output" annotation(Placement(transformation(extent = {{100, -2}, {110, 8}}), iconTransformation(extent = {{100, -6}, {112, 6}})));
        parameter Real SE1 "Saturation at E1";
        parameter Real SE2 "Saturation at E2";
        parameter Real E1;
        parameter Real E2;
      equation
        VE_OUT = iPSL.NonElectrical.Functions.SE(VE_IN, SE1, SE2, E1, E2);
        annotation(Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -60}, {100, 60}}), graphics), Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -60}, {100, 60}}), graphics = {Ellipse(extent = {{-100, 60}, {100, -60}}, lineColor = {0, 0, 255}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid), Text(extent = {{-88, 40}, {82, -40}}, lineColor = {0, 0, 255}, textString = "SE(Efd)")}), Documentation(info = "<html>
<p><br><span style=\"font-family: MS Shell Dlg 2;\">&LT;iPSL: iTesla Power System Library&GT;</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Copyright 2015 RTE (France), AIA (Spain), KTH (Sweden) and DTU (Denmark)</span></p>
<ul>
<li><span style=\"font-family: MS Shell Dlg 2;\">RTE: http://www.rte-france.com/ </span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">AIA: http://www.aia.es/en/energy/</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">KTH: https://www.kth.se/en</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">DTU:http://www.dtu.dk/english</span></li>
</ul>
<p><span style=\"font-family: MS Shell Dlg 2;\">The authors can be contacted by email: info at itesla-ipsl dot org</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">This package is part of the iTesla Power System Library (&QUOT;iPSL&QUOT;) .</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is free software: you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">You should have received a copy of the GNU Lesser General Public License along with the iPSL. If not, see &LT;http://www.gnu.org/licenses/&GT;.</span></p>
</html>"));
      end ImSE;

      model ImSE_exp "Block for Saturation function of Exc "
        Modelica.Blocks.Interfaces.RealInput VE_IN "Unsaturated Input" annotation(Placement(transformation(extent = {{-140, -20}, {-130, -10}}), iconTransformation(extent = {{-120, -10}, {-100, 10}})));
        Modelica.Blocks.Interfaces.RealOutput VE_OUT "Saturated Output" annotation(Placement(transformation(extent = {{100, -2}, {110, 8}}), iconTransformation(extent = {{100, -6}, {112, 6}})));
        parameter Real SE1 "Saturation at E1";
        parameter Real SE2 "Saturation at E2";
        parameter Real E1;
        parameter Real E2;
      equation
        VE_OUT = iPSL.NonElectrical.Functions.SE_exp(VE_IN, SE1, SE2, E1, E2);
        annotation(Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -60}, {100, 60}}), graphics), Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -60}, {100, 60}}), graphics = {Ellipse(extent = {{-100, 60}, {100, -60}}, lineColor = {0, 0, 255}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid), Text(extent = {{-88, 38}, {82, -42}}, lineColor = {0, 0, 255}, textString = "SE(Efd)")}), Documentation(info = "<html>
<p><br><span style=\"font-family: MS Shell Dlg 2;\">&LT;iPSL: iTesla Power System Library&GT;</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Copyright 2015 RTE (France), AIA (Spain), KTH (Sweden) and DTU (Denmark)</span></p>
<ul>
<li><span style=\"font-family: MS Shell Dlg 2;\">RTE: http://www.rte-france.com/ </span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">AIA: http://www.aia.es/en/energy/</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">KTH: https://www.kth.se/en</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">DTU:http://www.dtu.dk/english</span></li>
</ul>
<p><span style=\"font-family: MS Shell Dlg 2;\">The authors can be contacted by email: info at itesla-ipsl dot org</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">This package is part of the iTesla Power System Library (&QUOT;iPSL&QUOT;) .</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is free software: you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">You should have received a copy of the GNU Lesser General Public License along with the iPSL. If not, see &LT;http://www.gnu.org/licenses/&GT;.</span></p>
</html>"));
      end ImSE_exp;
      annotation(Documentation(info = "<html>
<p><br><span style=\"font-family: MS Shell Dlg 2;\">&LT;iPSL: iTesla Power System Library&GT;</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Copyright 2015 RTE (France), AIA (Spain), KTH (Sweden) and DTU (Denmark)</span></p>
<ul>
<li><span style=\"font-family: MS Shell Dlg 2;\">RTE: http://www.rte-france.com/ </span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">AIA: http://www.aia.es/en/energy/</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">KTH: https://www.kth.se/en</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">DTU:http://www.dtu.dk/english</span></li>
</ul>
<p><span style=\"font-family: MS Shell Dlg 2;\">The authors can be contacted by email: info at itesla-ipsl dot org</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">This package is part of the iTesla Power System Library (&QUOT;iPSL&QUOT;) .</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is free software: you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">You should have received a copy of the GNU Lesser General Public License along with the iPSL. If not, see &LT;http://www.gnu.org/licenses/&GT;.</span></p>
</html>"));
    end Functions;
    annotation(Documentation(info = "<html>
<p><br><span style=\"font-family: MS Shell Dlg 2;\">&LT;iPSL: iTesla Power System Library&GT;</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Copyright 2015 RTE (France), AIA (Spain), KTH (Sweden) and DTU (Denmark)</span></p>
<ul>
<li><span style=\"font-family: MS Shell Dlg 2;\">RTE: http://www.rte-france.com/ </span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">AIA: http://www.aia.es/en/energy/</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">KTH: https://www.kth.se/en</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">DTU:http://www.dtu.dk/english</span></li>
</ul>
<p><span style=\"font-family: MS Shell Dlg 2;\">The authors can be contacted by email: info at itesla-ipsl dot org</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">This package is part of the iTesla Power System Library (&QUOT;iPSL&QUOT;) .</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is free software: you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">You should have received a copy of the GNU Lesser General Public License along with the iPSL. If not, see &LT;http://www.gnu.org/licenses/&GT;.</span></p>
</html>"));
  end NonElectrical;

  package Connectors
    connector PwPin "connector for electrical blocks treating voltage and current as complex variables"
      Real vr;
      // real part of the voltage
      Real vi;
      // imaginary part of the voltage
      flow Real ir;
      // real part of the current
      flow Real ii;
      // imaginary part of the current
      annotation(Icon(graphics = {Rectangle(extent = {{-100, 98}, {100, -102}}, lineColor = {0, 0, 255}, fillColor = {0, 0, 255}, fillPattern = FillPattern.Solid)}), Documentation(info = "<html>
<p><br><span style=\"font-family: MS Shell Dlg 2;\">&LT;iPSL: iTesla Power System Library&GT;</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Copyright 2015 RTE (France), AIA (Spain), KTH (Sweden) and DTU (Denmark)</span></p>
<ul>
<li><span style=\"font-family: MS Shell Dlg 2;\">RTE: http://www.rte-france.com/ </span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">AIA: http://www.aia.es/en/energy/</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">KTH: https://www.kth.se/en</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">DTU:http://www.dtu.dk/english</span></li>
</ul>
<p><span style=\"font-family: MS Shell Dlg 2;\">The authors can be contacted by email: info at itesla-ipsl dot org</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">This package is part of the iTesla Power System Library (&QUOT;iPSL&QUOT;) .</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is free software: you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">You should have received a copy of the GNU Lesser General Public License along with the iPSL. If not, see &LT;http://www.gnu.org/licenses/&GT;.</span></p>
</html>"));
    end PwPin;

    expandable connector PwPinExt "connector for electrical blocks treating voltage and current as complex variables"
      iPSL.Connectors.PwPin p;
      annotation(defaultComponentName = "u", Icon(graphics = {Ellipse(extent = {{-100, 100}, {100, -100}}, lineColor = {0, 0, 127}, fillColor = {0, 0, 127}, fillPattern = FillPattern.Solid)}, coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.2)), Diagram(coordinateSystem(preserveAspectRatio = false, initialScale = 0.2, extent = {{-100, -100}, {100, 100}}, grid = {1, 1}), graphics = {Text(extent = {{-10, 85}, {-10, 60}}, lineColor = {0, 0, 127}, textString = "%name"), Ellipse(extent = {{-50, 50}, {50, -50}}, lineColor = {0, 0, 127}, fillColor = {0, 0, 127}, fillPattern = FillPattern.Solid)}), Documentation(info = "<html>
<p>
Connector of type V, I.
</p>
<p><br><span style=\"font-family: MS Shell Dlg 2;\">&LT;iPSL: iTesla Power System Library&GT;</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Copyright 2015 RTE (France), AIA (Spain), KTH (Sweden) and DTU (Denmark)</span></p>
<ul>
<li><span style=\"font-family: MS Shell Dlg 2;\">RTE: http://www.rte-france.com/ </span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">AIA: http://www.aia.es/en/energy/</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">KTH: https://www.kth.se/en</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">DTU:http://www.dtu.dk/english</span></li>
</ul>
<p><span style=\"font-family: MS Shell Dlg 2;\">The authors can be contacted by email: info at itesla-ipsl dot org</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">This package is part of the iTesla Power System Library (&QUOT;iPSL&QUOT;) .</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is free software: you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">You should have received a copy of the GNU Lesser General Public License along with the iPSL. If not, see &LT;http://www.gnu.org/licenses/&GT;.</span></p>
</html>"));
    end PwPinExt;

    model PwCoBPin "connector for change from machine power base to system power base "
      parameter Real mbase "machine base power rating MVA";
      parameter Real Sbase "system base power rating MVA";
      parameter Real CoB = mbase / Sbase "change of base ratio";
      iPSL.Connectors.PwPin p "machine base" annotation(Placement(transformation(extent = {{-32, -4}, {-12, 16}}), iconTransformation(extent = {{-32, -4}, {-12, 16}})));
      iPSL.Connectors.PwPin n "system base" annotation(Placement(transformation(extent = {{8, -4}, {28, 16}}), iconTransformation(extent = {{8, -4}, {28, 16}})));
    equation
      0 = n.vr - p.vr;
      // real part of the voltage
      0 = n.vi - p.vi;
      // imaginary part of the voltage
      0 = p.ir * CoB + n.ir;
      // real part of the current
      0 = p.ii * CoB + n.ii;
      // imaginary part of the current
      annotation(Icon(graphics = {Rectangle(extent = {{-100, 98}, {100, -102}}, lineColor = {0, 0, 255}, fillColor = {0, 0, 255}, fillPattern = FillPattern.None)}), Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics), Documentation(info = "<html>
<p><br><span style=\"font-family: MS Shell Dlg 2;\">&LT;iPSL: iTesla Power System Library&GT;</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Copyright 2015 RTE (France), AIA (Spain), KTH (Sweden) and DTU (Denmark)</span></p>
<ul>
<li><span style=\"font-family: MS Shell Dlg 2;\">RTE: http://www.rte-france.com/ </span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">AIA: http://www.aia.es/en/energy/</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">KTH: https://www.kth.se/en</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">DTU:http://www.dtu.dk/english</span></li>
</ul>
<p><span style=\"font-family: MS Shell Dlg 2;\">The authors can be contacted by email: info at itesla-ipsl dot org</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">This package is part of the iTesla Power System Library (&QUOT;iPSL&QUOT;) .</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is free software: you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">You should have received a copy of the GNU Lesser General Public License along with the iPSL. If not, see &LT;http://www.gnu.org/licenses/&GT;.</span></p>
</html>"));
    end PwCoBPin;
    annotation(Documentation(info = "<html>
<p><br><span style=\"font-family: MS Shell Dlg 2;\">&LT;iPSL: iTesla Power System Library&GT;</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Copyright 2015 RTE (France), AIA (Spain), KTH (Sweden) and DTU (Denmark)</span></p>
<ul>
<li><span style=\"font-family: MS Shell Dlg 2;\">RTE: http://www.rte-france.com/ </span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">AIA: http://www.aia.es/en/energy/</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">KTH: https://www.kth.se/en</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">DTU:http://www.dtu.dk/english</span></li>
</ul>
<p><span style=\"font-family: MS Shell Dlg 2;\">The authors can be contacted by email: info at itesla-ipsl dot org</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">This package is part of the iTesla Power System Library (&QUOT;iPSL&QUOT;) .</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is free software: you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">You should have received a copy of the GNU Lesser General Public License along with the iPSL. If not, see &LT;http://www.gnu.org/licenses/&GT;.</span></p>
</html>"));
  end Connectors;

  package Interfaces
    model InPutPort
      input Real vi;
      Real vo;
    equation
      vi = vo;
      annotation(Icon(graphics = {Rectangle(extent = {{-20, 20}, {20, -20}}, lineColor = {0, 0, 255}), Text(extent = {{-18, 8}, {18, -6}}, lineColor = {0, 0, 255}, textString = "Input")}), Diagram(graphics = {Rectangle(extent = {{-20, 20}, {20, -20}}, lineColor = {0, 0, 255}), Text(extent = {{-18, 8}, {18, -6}}, lineColor = {0, 0, 255}, textString = "Input")}), Documentation(info = "<html>
<p><br><span style=\"font-family: MS Shell Dlg 2;\">&LT;iPSL: iTesla Power System Library&GT;</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Copyright 2015 RTE (France), AIA (Spain), KTH (Sweden) and DTU (Denmark)</span></p>
<ul>
<li><span style=\"font-family: MS Shell Dlg 2;\">RTE: http://www.rte-france.com/ </span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">AIA: http://www.aia.es/en/energy/</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">KTH: https://www.kth.se/en</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">DTU:http://www.dtu.dk/english</span></li>
</ul>
<p><span style=\"font-family: MS Shell Dlg 2;\">The authors can be contacted by email: info at itesla-ipsl dot org</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">This package is part of the iTesla Power System Library (&QUOT;iPSL&QUOT;) .</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is free software: you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">You should have received a copy of the GNU Lesser General Public License along with the iPSL. If not, see &LT;http://www.gnu.org/licenses/&GT;.</span></p>
</html>"));
    end InPutPort;

    model OutPutPort "OutPutPort for plotting output results"
      output Real vo;
      input Real vi;
    equation
      vi = vo;
      annotation(Icon(graphics = {Rectangle(extent = {{-20, 20}, {40, -20}}, lineColor = {0, 0, 255}), Text(extent = {{-8, 10}, {26, -8}}, lineColor = {0, 0, 255}, textString = "Out")}), Diagram(graphics = {Rectangle(extent = {{-30, 20}, {30, -20}}, lineColor = {0, 0, 255}), Text(extent = {{-18, 10}, {16, -8}}, lineColor = {0, 0, 255}, textString = "Out")}), Documentation(info = "<html>
<p><br><span style=\"font-family: MS Shell Dlg 2;\">&LT;iPSL: iTesla Power System Library&GT;</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Copyright 2015 RTE (France), AIA (Spain), KTH (Sweden) and DTU (Denmark)</span></p>
<ul>
<li><span style=\"font-family: MS Shell Dlg 2;\">RTE: http://www.rte-france.com/ </span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">AIA: http://www.aia.es/en/energy/</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">KTH: https://www.kth.se/en</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">DTU:http://www.dtu.dk/english</span></li>
</ul>
<p><span style=\"font-family: MS Shell Dlg 2;\">The authors can be contacted by email: info at itesla-ipsl dot org</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">This package is part of the iTesla Power System Library (&QUOT;iPSL&QUOT;) .</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is free software: you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">You should have received a copy of the GNU Lesser General Public License along with the iPSL. If not, see &LT;http://www.gnu.org/licenses/&GT;.</span></p>
</html>"));
    end OutPutPort;
    annotation(Documentation(info = "<html>
<p><br><span style=\"font-family: MS Shell Dlg 2;\">&LT;iPSL: iTesla Power System Library&GT;</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Copyright 2015 RTE (France), AIA (Spain), KTH (Sweden) and DTU (Denmark)</span></p>
<ul>
<li><span style=\"font-family: MS Shell Dlg 2;\">RTE: http://www.rte-france.com/ </span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">AIA: http://www.aia.es/en/energy/</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">KTH: https://www.kth.se/en</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">DTU:http://www.dtu.dk/english</span></li>
</ul>
<p><span style=\"font-family: MS Shell Dlg 2;\">The authors can be contacted by email: info at itesla-ipsl dot org</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">This package is part of the iTesla Power System Library (&QUOT;iPSL&QUOT;) .</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is free software: you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">You should have received a copy of the GNU Lesser General Public License along with the iPSL. If not, see &LT;http://www.gnu.org/licenses/&GT;.</span></p>
</html>"));
  end Interfaces;
  annotation(uses(Modelica(version = "3.2.1"), Complex(version = "3.2.1"), IEEE9(version = "1")), version = "0.8.1", conversion(noneFromVersion = "0.8"), Documentation(info = "<html>
<p>&LT;iPSL: iTesla Power System Library&GT;</p>
<p>Copyright 2015 RTE (France), AIA (Spain), KTH (Sweden) and DTU (Denmark)</p>
<ul>
<li>RTE: http://www.rte-france.com/ </li>
<li>AIA: http://www.aia.es/en/energy/</li>
<li>KTH: https://www.kth.se/en</li>
<li>DTU:http://www.dtu.dk/english</li>
</ul>
<p>The authors can be contacted by email: info at itesla-ipsl dot org</p>
<p>This package is part of the iTesla Power System Library (&QUOT;iPSL&QUOT;) .</p>
<p>The iPSL is free software: you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.</p>
<p>The iPSL is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.</p>
<p>You should have received a copy of the GNU Lesser General Public License along with the iPSL. If not, see &LT;http://www.gnu.org/licenses/&GT;.</p>
</html>"));
end iPSL;