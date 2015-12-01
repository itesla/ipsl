within IEEE14;
model IEEE_14_Buses
  iPSL.Electrical.Buses.Bus B1 annotation(Placement(transformation(extent = {{-15, -15}, {15, 15}}, rotation = 90, origin={-135,-31})));
  iPSL.Electrical.Buses.Bus B2 annotation(Placement(transformation(extent = {{-15, -15}, {15, 15}}, rotation = 90, origin={-60,-128})));
  iPSL.Electrical.Buses.Bus B3 annotation(Placement(transformation(extent = {{-15, -15}, {15, 15}}, rotation = 90, origin={44,-122})));
  iPSL.Electrical.Buses.Bus B4 annotation(Placement(transformation(extent = {{-15, -15}, {15, 15}}, rotation = 90, origin = {32, -32})));
  iPSL.Electrical.Buses.Bus B5 annotation(Placement(transformation(extent = {{-15, -15}, {15, 15}}, rotation = 90, origin = {-24, -40})));
  iPSL.Electrical.Buses.Bus B6 annotation(Placement(transformation(extent = {{-15, -15}, {15, 15}}, rotation = 90, origin={-47,19})));
  iPSL.Electrical.Buses.Bus B7 annotation(Placement(transformation(extent={{-15,-15},
            {15,15}},                                                                                       rotation = 90, origin={91,1})));
  iPSL.Electrical.Buses.Bus B8 annotation(Placement(transformation(extent = {{-15, -15}, {15, 15}}, rotation = 180, origin={149,-37})));
  iPSL.Electrical.Buses.Bus B9 annotation(Placement(transformation(extent={{-15,-15},
            {15,15}},                                                                                       rotation = 90, origin={86,44})));
  iPSL.Electrical.Buses.Bus B10 annotation(Placement(transformation(extent = {{-15, -15}, {15, 15}}, rotation = 90, origin={16,110})));
  iPSL.Electrical.Buses.Bus B11 annotation(Placement(transformation(extent={{-15,-15},
            {15,15}},                                                                                        rotation = 90, origin={16,40})));
  iPSL.Electrical.Buses.Bus B12 annotation(Placement(transformation(extent={{-15,-15},
            {15,15}},                                                                                        rotation = 90, origin={-128,68})));
  iPSL.Electrical.Buses.Bus B13 annotation(Placement(transformation(extent = {{-15, -15}, {15, 15}}, rotation = 90, origin={-64,110})));
  iPSL.Electrical.Buses.Bus B14 annotation(Placement(transformation(extent = {{-15, -15}, {15, 15}}, rotation = 90, origin={104,108})));
  iPSL.Electrical.Branches.PwLine L1(R = 0.05695, X = 0.17388, G = 0, B = 0.034 / 2) annotation(Placement(transformation(extent={{-14,-11},
            {14,11}},                                                                                                   rotation = 90, origin={-35,-82})));
  iPSL.Electrical.Branches.PwLine L7(G = 0, R = 0.05403, X = 0.22304, B = 0.0492 / 2) annotation(Placement(transformation(extent={{-14,-11},
            {14,11}},                                                                                                    rotation = 0, origin={-70,-53})));
  iPSL.Electrical.Branches.PwLine L3(G = 0, R = 0.01938, X = 0.05917, B = 0.0528 / 2) annotation(Placement(transformation(extent={{-14,-11},
            {14,11}},                                                                                                    rotation = 270, origin={-73,-88})));
  iPSL.Electrical.Branches.PwLine L6(G = 0, R = 0.06701, X = 0.17103, B = 0.0346 / 2) annotation(Placement(transformation(extent={{-14,-11},
            {14,11}},                                                                                                    rotation = 90, origin={51,-60})));
  iPSL.Electrical.Branches.PwLine L8(G = 0, R = 0.01335, X = 0.04211, B = 0.0128 / 2) annotation(Placement(transformation(extent={{-14,-11},
            {14,11}},                                                                                                  rotation = 0, origin={6,-50})));
  iPSL.Electrical.Branches.PwLine L13(G = 0, R = 0.09498, X = 0.1989, B = 0) annotation(Placement(transformation(extent={{-14,-11},
            {14,11}},                                                                                                   rotation=0,    origin={-1,22})));
  iPSL.Electrical.Branches.PwLine L10(G = 0, R = 0.12291, X = 0.25581, B = 0) annotation(Placement(transformation(extent={{-14,-11},
            {14,11}},                                                                                                    rotation = 90, origin={-128,42})));
  iPSL.Electrical.Branches.PwLine L12(G = 0, R = 0.06615, X = 0.13027, B = 0) annotation(Placement(transformation(extent={{-14,-11},
            {14,11}},                                                                                                    rotation = 90, origin={-55,68})));
  iPSL.Electrical.Branches.PwLine L14(G = 0, B = 0, R = 0.08205, X = 0.19207) annotation(Placement(transformation(extent={{-14,-11},
            {14,11}},                                                                                                    rotation = 90, origin={1,69})));
  iPSL.Electrical.Branches.PwLine L15(G = 0, B = 0, R = 0.03181, X = 0.0845) annotation(Placement(transformation(extent={{-14,-11},
            {14,11}},                                                                                                    rotation = 90, origin={63,72})));
  iPSL.Electrical.Branches.PwLine L16(G = 0, B = 0, R = 0.12711, X = 0.27038) annotation(Placement(transformation(extent={{-14,-11},
            {14,11}},                                                                                                    rotation = 90, origin={103,71})));
  iPSL.Electrical.Branches.PwLine L17(G = 0, B = 0, R = 0.17093, X = 0.34802) annotation(Placement(transformation(extent={{-14,-11},
            {14,11}},                                                                                                    rotation = 180, origin={53,103})));
  iPSL.Electrical.Branches.PwLine L2(G = 0, B = 0, R = 0, X = 0.11001) annotation(Placement(transformation(extent={{-14,-11},
            {14,11}},                                                                                                    rotation = 90, origin={90,23})));
  iPSL.Electrical.Branches.PwLine L5(G = 0, R = 0.04699, X = 0.19797, B = 0.0438 / 2) annotation(Placement(transformation(extent={{-14,-11},
            {14,11}},                                                                                                   rotation = 180, origin={16,-93})));
  iPSL.Electrical.Branches.PwLine L11(G = 0, B = 0, R = 0.22092, X = 0.19988) annotation(Placement(transformation(extent={{-14,-11},
            {14,11}},                                                                                                    rotation = 90, origin={-91,82})));
  iPSL.Electrical.Loads.PSAT.VoltDependant lPQ2(P_0 = 1.4 * 0.076, Q_0 = 1.4 * 0.016,
    V_0=1.002918521543744,
    V_b=69,
    angle_0=-0.226950235044097)                                            annotation(Placement(transformation(extent={{-6,-6},
            {6,6}},                                                                                                    rotation=180,  origin={-41,-15})));
  iPSL.Electrical.Loads.PSAT.VoltDependant lPQ3(P_0 = 1.4 * 0.217, Q_0 = 1.4 * 0.127, V_0 = 1.045,
    V_b=69,
    angle_0=-0.135677901384789)                                                                    annotation(Placement(transformation(extent={{-6,-6},
            {6,6}},                                                                                                    rotation=180,  origin={-28,-118})));
  iPSL.Electrical.Loads.PSAT.VoltDependant lPQ12(P_0 = 1.4 * 0.942, Q_0 = 1.4 * 0.19, V_0 = 1.01,
    V_b=69,
    angle_0=-0.332124297307116)                                                                   annotation(Placement(transformation(extent={{-6,-6},
            {6,6}},                                                                                                    rotation=180,  origin={71,-101})));
  iPSL.Electrical.Loads.PSAT.VoltDependant lPQ9(P_0 = 1.4 * 0.295, Q_0 = 1.4 * 0.166,
    V_0=1.012902425305420,
    V_b=13.8,
    angle_0=-0.379076293864958)                                             annotation(Placement(transformation(extent={{-6,-6},
            {6,6}},                                                                                                    rotation=180,  origin={138,62})));
  iPSL.Electrical.Loads.PSAT.VoltDependant lPQ6(P_0 = 1.4 * 0.149, Q_0 = 1.4 * 0.05,
    V_0=0.996954035152595,
    V_b=13.8,
    angle_0=-0.410560994783472)                                             annotation(Placement(transformation(extent={{-6,-6},
            {6,6}},                                                                                                    rotation=180,  origin={106,132})));
  iPSL.Electrical.Loads.PSAT.VoltDependant lPQ8(P_0 = 1.4 * 0.09, Q_0 = 1.4 * 0.058,
    V_0=1.012187694288416,
    V_b=13.8,
    angle_0=-0.384463531221708)                                            annotation(Placement(transformation(extent={{-6,-6},
            {6,6}},                                                                                                    rotation=180,  origin={17,131})));
  iPSL.Electrical.Loads.PSAT.VoltDependant lPQ11(P_0 = 1.4 * 0.135, Q_0 = 1.4 * 0.058,
    V_0=1.036593776863207,
    V_b=13.8,
    angle_0=-0.391472739421350)                                              annotation(Placement(transformation(extent={{-6,-6},
            {6,6}},                                                                                                    rotation=180,  origin={-62,132})));
  iPSL.Electrical.Loads.PSAT.VoltDependant lPQ7(Q_0 = 1.4 * 0.016, P_0 = 1.4 * 0.061,
    V_0=1.046151564164931,
    V_b=13.8,
    angle_0=-0.390590184761169)                                             annotation(Placement(transformation(extent={{-6,-6},
            {6,6}},                                                                                                    rotation=180,  origin={-143,101})));
  iPSL.Electrical.Loads.PSAT.VoltDependant lPQ10(P_0 = 1.4 * 0.035, Q_0 = 1.4 * 0.018,
    V_0=1.035651856727375,
    V_b=13.8,
    angle_0=-0.379841137315380)                                              annotation(Placement(transformation(extent={{-6,-6},
            {6,6}},                                                                                                    rotation=180,  origin={36,58})));
  iPSL.Electrical.Loads.PSAT.VoltDependant lPQ4(P_0 = 1.4 * 0.112, Q_0 = 1.4 * 0.075, V_0 = 1.07,
    V_b=13.8,
    angle_0=-0.369562610674901)                                                                   annotation(Placement(transformation(extent={{-6,-6},
            {6,6}},                                                                                                    rotation=180,  origin={-39,73})));
  iPSL.Electrical.Loads.PSAT.VoltDependant lPQ5(P_0 = 1.4 * 0.478, Q_0 = 1.4 * 0.04,
    V_0=0.997818344821604,
    V_b=69,
    angle_0=-0.264411509112328)                                            annotation(Placement(transformation(extent={{-6,-6},
            {6,6}},                                                                                                    rotation=180,  origin={7,-11})));
  iPSL.Electrical.Branches.PSAT.TwoWindingTransformer twoWindingTransformer(V_b = 18000, Vn = 18000, fn = 60, kT = 18 / 13.8, x = 0.17615, r = 0) annotation(Placement(transformation(extent={{-14,-14},
            {14,14}},                                                                                                    rotation = 180, origin={119,-38})));
  iPSL.Electrical.Branches.PSAT.TWTransformerWithFixedTapRatio
    tWTransformerWithFixedTapRatio(
    Vbus=69000,
    Vn1=69000,
    fn=60,
    kT=69/13.8,
    R=0,
    m=0.932,
    X=0.25202) annotation (Placement(transformation(
        extent={{-14,-14},{14,14}},
        rotation=90,
        origin={-18,-6})));
  iPSL.Electrical.Branches.PSAT.TWTransformerWithFixedTapRatio
    tWTransformerWithFixedTapRatio1(
    Vbus=69000,
    Vn1=69000,
    fn=60,
    kT=69/13.8,
    R=0,
    X=0.55618,
    m=0.969) annotation (Placement(transformation(
        extent={{-14,-14},{14,14}},
        rotation=90,
        origin={42,16})));
  iPSL.Electrical.Branches.PSAT.TWTransformerWithFixedTapRatio
    tWTransformerWithFixedTapRatio2(
    Vbus=69000,
    Vn1=69000,
    fn=60,
    kT=69/13.8,
    R=0,
    X=0.20912,
    m=0.978) annotation (Placement(transformation(
        extent={{-14,-14},{14,14}},
        rotation=0,
        origin={62,-18})));
  IEEE14.Generation_Groups.GroupBus1 groupBus1_1
    annotation (Placement(transformation(extent={{-160,-24},{-140,-4}})));
  IEEE14.Generation_Groups.GroupBus2 groupBus2_1
    annotation (Placement(transformation(extent={{-84,-160},{-64,-140}})));
  IEEE14.Generation_Groups.GroupBus3 groupBus3_1
    annotation (Placement(transformation(extent={{10,-162},{32,-142}})));
  IEEE14.Generation_Groups.GroupBus6 groupBus6_1
    annotation (Placement(transformation(extent={{-96,-10},{-76,10}})));
  IEEE14.Generation_Groups.GroupBus8 groupBus8_1 annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={172,-36})));
  iPSL.Electrical.Branches.PwLinewithOpeningSending
    pwLinewithOpeningSending(
    R=0.05811,
    X=0.17632,
    G=0,
    B=0.0374/2,
    t2=25,
    t1=11)
    annotation (Placement(transformation(extent={{-20,-89},{8,-67}})));
  iPSL.Electrical.Events.PwFault pwFault(
    ground=1,
    R=0.01,
    X=0.001,
    t1=1,
    t2=1.2)   annotation (Placement(transformation(extent={{68,-40},{78,-30}})));
  inner iPSL.Electrical.SystemBase SysData(S_b=100, fn=60)
    annotation (Placement(transformation(extent={{-194,126},{-128,154}})));
equation
  connect(B12.p, L11.p) annotation(Line(points={{-128,68},{-128,72.2},{-91,72.2}},      color = {0, 0, 255}, smooth = Smooth.None));
  connect(L10.p, B6.p) annotation(Line(points={{-128,32.2},{-128,26},{-47,26},{-47,
          19}},                                                                                 color = {0, 0, 255}, smooth = Smooth.None));
  connect(B3.p, L6.p) annotation(Line(points={{44,-122},{44,-70},{51,-70},{51,-69.8}},         color = {0, 0, 255}, smooth = Smooth.None));
  connect(B1.p, L3.p) annotation(Line(points={{-135,-31},{-135,-74},{-73,-74},{-73,-78.2}},          color = {0, 0, 255}, smooth = Smooth.None));
  connect(B4.p, L6.n) annotation(Line(points={{32,-32},{32,-42},{51,-42},{51,-50.2}},          color = {0, 0, 255}, smooth = Smooth.None));
  connect(B4.p, L8.n) annotation(Line(points={{32,-32},{32,-42},{18,-42},{18,-50},{15.8,-50}},            color = {0, 0, 255}, smooth = Smooth.None));
  connect(B5.p, lPQ2.p) annotation(Line(points={{-24,-40},{-24,-21.6},{-41,
          -21.6}},                                                                         color = {0, 0, 255}, smooth = Smooth.None));
  connect(lPQ5.p, B4.p) annotation(Line(points={{7,-17.6},{7,-24},{32,-24},{32,
          -32}},                                                                               color = {0, 0, 255}, smooth = Smooth.None));
  connect(lPQ11.p, B13.p) annotation(Line(points={{-62,125.4},{-62,118},{-64,
          118},{-64,110}},                                                                   color = {0, 0, 255}, smooth = Smooth.None));
  connect(B10.p, L15.n) annotation(Line(points={{16,110},{16,84},{63,84},{63,81.8}},       color = {0, 0, 255}, smooth = Smooth.None));
  connect(B10.p, L14.n) annotation(Line(points={{16,110},{16,82},{1,82},{1,78.8}},         color = {0, 0, 255}, smooth = Smooth.None));
  connect(B13.p, L12.n) annotation(Line(points={{-64,110},{-64,80},{-55,80},{-55,77.8}},          color = {0, 0, 255}, smooth = Smooth.None));
  connect(L16.n, B14.p) annotation (Line(points={{103,80.8},{103,88.05},{104,88.05},{104,108}},
                     color={0,0,255}));
  connect(B9.p, lPQ9.p) annotation (Line(points={{86,44},{86,44},{86,50},{138,
          50},{138,55.4}},
                       color={0,0,255}));
  connect(B11.p, lPQ10.p) annotation (Line(points={{16,40},{16,40},{16,51.4},{
          36,51.4}},
                  color={0,0,255}));
  connect(B11.p, L14.p) annotation (Line(points={{16,40},{16,40},{16,59.2},{1,59.2}},
        color={0,0,255}));
  connect(lPQ4.p, B6.p) annotation (Line(points={{-39,66.4},{-39,44.75},{-47,
          44.75},{-47,19}},
                     color={0,0,255}));
  connect(B6.p, L12.p) annotation (Line(points={{-47,19},{-47,40.5},{-55,40.5},{-55,58.2}},
                      color={0,0,255}));
  connect(lPQ7.p, B12.p) annotation (Line(points={{-143,94.4},{-143,82},{-128,
          82},{-128,68}},
                      color={0,0,255}));
  connect(B13.p, L11.n) annotation (Line(points={{-64,110},{-64,98},{-91,98},{-91,
          91.8}}, color={0,0,255}));
  connect(L10.n, B12.p)
    annotation (Line(points={{-128,51.8},{-128,68}}, color={0,0,255}));
  connect(B3.p, lPQ12.p) annotation (Line(points={{44,-122},{44,-122},{44,-106},
          {44,-107.6},{71,-107.6}}, color={0,0,255}));
  connect(B3.p, L5.p)
    annotation (Line(points={{44,-122},{44,-93},{25.8,-93}}, color={0,0,255}));
  connect(B7.p, L2.p) annotation (Line(points={{91,1},{91,9.5},{90,9.5},{90,13.2}},
                     color={0,0,255}));
  connect(B9.p, L2.n) annotation (Line(points={{86,44},{90,44},{90,32.8}},
        color={0,0,255}));
  connect(B2.p, lPQ3.p) annotation (Line(points={{-60,-128},{-60,-124.6},{-28,
          -124.6}},              color={0,0,255}));
  connect(B2.p, L1.p) annotation (Line(points={{-60,-128},{-60,-91.8},{-35,-91.8}},
                               color={0,0,255}));
  connect(L1.n, B5.p) annotation (Line(points={{-35,-72.2},{-35,-59.8},{-24,-59.8},{-24,-40}},
                                 color={0,0,255}));
  connect(B2.p, L3.n) annotation (Line(points={{-60,-128},{-60,-97.8},{-73,-97.8}},
                               color={0,0,255}));
  connect(B1.p, L7.p) annotation (Line(points={{-135,-31},{-135,-53},{
          -79.8,-53}}, color={0,0,255}));
  connect(B5.p, L7.n) annotation (Line(points={{-24,-40},{-24,-53},{-60.2,
          -53}}, color={0,0,255}));
  connect(B7.p, twoWindingTransformer.n) annotation (Line(points={{91,1},{91,
          -38},{103.6,-38}},     color={0,0,255}));
  connect(twoWindingTransformer.p, B8.p) annotation (Line(points={{134.4,-38},{
          149,-38},{149,-37}},       color={0,0,255}));
  connect(B4.p, tWTransformerWithFixedTapRatio1.p) annotation (Line(
        points={{32,-32},{32,-32},{32,-4},{32,0.6},{42,0.6}},
                                                          color={0,0,255}));
  connect(B5.p, tWTransformerWithFixedTapRatio.p) annotation (Line(points={{-24,-40},
          {-22,-40},{-22,-21.4},{-18,-21.4}},       color={0,0,255}));
  connect(B6.p, tWTransformerWithFixedTapRatio.n) annotation (Line(points={{-47,19},
          {-47,12},{-18,12},{-18,9.4}},        color={0,0,255}));
  connect(groupBus2_1.pwPin, B2.p) annotation (Line(points={{-63,-150},{-60,-150},{-60,-128}},
                                       color={0,0,255}));
  connect(groupBus3_1.pwPin, B3.p) annotation (Line(points={{33,-152.2},{44,-152.2},
          {44,-122}},          color={0,0,255}));
  connect(groupBus6_1.pwPin, B6.p) annotation (Line(points={{-75,0},{-47,0},{-47,
          19}},               color={0,0,255}));
  connect(B4.p, tWTransformerWithFixedTapRatio2.p) annotation (Line(
        points={{32,-32},{36,-32},{36,-18},{46.6,-18}},
                                                      color={0,0,255}));
  connect(B7.p, tWTransformerWithFixedTapRatio2.n) annotation (Line(
        points={{91,1},{91,-8.5},{77.4,-8.5},{77.4,-18}},
                                                      color={0,0,255}));
  connect(B9.p, tWTransformerWithFixedTapRatio1.n) annotation (Line(
        points={{86,44},{86,44},{86,36},{86,34},{42,34},{42,31.4}},
                                                                  color={
          0,0,255}));
  connect(B6.p, L13.p) annotation (Line(points={{-47,19},{-47,28},{-14,28},{-14,22},{-10.8,22}},
                               color={0,0,255}));
  connect(L13.n, B11.p) annotation (Line(points={{8.8,22},{16,22},{16,40}},
        color={0,0,255}));
  connect(B5.p, L8.p) annotation (Line(points={{-24,-40},{-24,-40},{-24,-32},{-6,-32},{-6,-50},{-3.8,-50}},
                                              color={0,0,255}));
  connect(groupBus1_1.pwPin, B1.p) annotation (Line(points={{-139,-14.2},{-135,
          -14.2},{-135,-31}},
                       color={0,0,255}));
  connect(B8.p, groupBus8_1.pwPin) annotation (Line(points={{149,-37},{159.5,
          -37},{159.5,-36.2},{160.8,-36.2}},
                                        color={0,0,255}));
  connect(L15.p, B9.p)
    annotation (Line(points={{63,62.2},{86,62.2},{86,44}}, color={0,0,255}));
  connect(B9.p, L16.p) annotation (Line(points={{86,44},{86,44},{86,64},{86,61.2},{103,61.2}},
                       color={0,0,255}));
  connect(B14.p, L17.p) annotation (Line(points={{104,108},{104,118},{74,118},{74,103},{62.8,103}},
                            color={0,0,255}));
  connect(B13.p, L17.n) annotation (Line(points={{-64,110},{-64,103},{43.2,103}},
        color={0,0,255}));
  connect(lPQ8.p, B10.p) annotation (Line(points={{17,124.4},{17,114.65},{16,
          114.65},{16,110}},
                     color={0,0,255}));
  connect(lPQ6.p, L17.p) annotation (Line(points={{106,125.4},{106,118},{74,118},
          {74,103},{62.8,103}}, color={0,0,255}));
  connect(B2.p, pwLinewithOpeningSending.p)
    annotation (Line(points={{-60,-128},{-60,-128},{-60,-100},{-60,-102},{-15.8,-102},{-15.8,-78}}, color={0,0,255}));
  connect(B4.p, pwLinewithOpeningSending.n) annotation (Line(points={{32,-32},{32,-32},{32,-76},{3.8,-76},{3.8,-78}}, color={0,0,255}));
  connect(L5.n, B2.p) annotation (Line(points={{6.2,-93},{-6,-93},{-6,-134},{
          -60,-134},{-60,-128}}, color={0,0,255}));
  connect(B4.p, pwFault.p) annotation (Line(points={{32,-32},{32,-26},{67.1667,
          -26},{67.1667,-35}}, color={0,0,255}));
  annotation(Diagram(coordinateSystem(preserveAspectRatio=false,   extent={{-200,
            -180},{200,160}})),                                                                           Icon(coordinateSystem(extent={{-200,
            -180},{200,160}})),                                                                                                    Documentation(info="<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\">
<tr>
<td><p>Reference</p></td>
<td>PSAT Manual 2.1.8</td>
</tr>
<tr>
<td><p>Last update</p></td>
<td>13/07/2015</td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p>MAA Murad,SmarTS Lab, KTH Royal Institute of Technology</p></td>
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
end IEEE_14_Buses;
