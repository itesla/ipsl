within iPSL.Examples.DevelopmentExamples.Electrical.Solar.PSAT;
model testIrradation

  Modelica.Blocks.Sources.Constant const(k = 25) annotation(Placement(visible = true, transformation(origin = {-59.5887, -17.0499}, extent = {{-3.3987, -3.3987}, {3.3987, 3.3987}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const1(k = 1000) annotation(Placement(visible = true, transformation(origin = {-87.9874, 22.9501}, extent = {{-3.3987, -3.3987}, {3.3987, 3.3987}}, rotation = 0)));
   iPSL.Electrical.Branches.PwLine pwLine13(
    B=0,
    G=0,
    R=0,
    X=0.04*1/0.63) annotation (Placement(visible=true, transformation(
        origin={49.0376,0.0024},
        extent={{-10.0,-10.0},{10.0,10.0}},
        rotation=0)));
   iPSL.Electrical.Branches.PwLine pwLine14(
    B=0.001884956/2*100,
    G=0,
    R=0,
    X=0.848230016469244/100) annotation (Placement(visible=true, transformation(
        origin={83.1777,5.4501},
        extent={{-10.0,-10.0},{10.0,10.0}},
        rotation=0)));
   iPSL.Electrical.Buses.InfiniteBus infiniteBus8(angle = 0, V = 1) annotation(Placement(visible = true, transformation(origin = {117.9874, -1.1504}, extent = {{10.0, -10.0}, {-10.0, 10.0}}, rotation = 0)));
   iPSL.Electrical.Branches.PwLine pwLine15(
    B=0.001884956/2*100,
    G=0,
    R=0,
    X=0.848230016469244/100) annotation (Placement(visible=true, transformation(
        origin={83.2752,-9.5499},
        extent={{-10.0,-10.0},{10.0,10.0}},
        rotation=0)));
  Modelica.Blocks.Math.Add add1 annotation(Placement(visible = true, transformation(origin = {-52.9874, 14.9248}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
  Modelica.Blocks.Sources.Step step1(startTime = 0.3, height = -500) annotation(Placement(visible = true, transformation(origin = {-113.885, 0.0201}, extent = {{-4.1024, -4.1024}, {4.1024, 4.1024}}, rotation = 0)));
  Modelica.Blocks.Sources.Step step2(startTime = 0.7, height = 500) annotation(Placement(visible = true, transformation(origin = {-112.9874, -30.0}, extent = {{-5.0, -5.0}, {5.0, 5.0}}, rotation = 0)));
  Modelica.Blocks.Math.Add add2 annotation(Placement(visible = true, transformation(origin = {-85.1206, -12.0499}, extent = {{-2.8669, -2.8669}, {2.8669, 2.8669}}, rotation = 0)));
   iPSL.Electrical.Solar.KTH.PFmodelmpptCorrected05MW PFmodel1(anglev0 = 0.030372922116265, p0 = 0.44884, q0 = 0.00003, v0 = 1.00034051839501) annotation(Placement(visible = true, transformation(origin = {-7.9875, 0.2883}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
  inner iPSL.Electrical.SystemBase  SysData
    annotation (Placement(transformation(extent={{50,50},{75,70}})));
equation
  connect(const1.y, add1.u1) annotation(Line(visible = true, origin = {-71.3029, 21.9375}, points={{
          -12.9459,1.0126},{3.3154,1.0126},{3.3154,-1.0127},{6.3155,-1.0127}},                                                                                                    color = {0, 0, 127}));
  connect(add2.y, add1.u2) annotation(Line(visible = true, origin = {-76.3072, 1.9333}, points = {{-5.65981, -13.9832}, {-5.65981, 6.9915}, {11.3198, 6.9915}}, color = {0, 0, 127}));
  connect(step1.y, add2.u1) annotation(Line(visible = true, origin = {-95.2638, -5.1548}, points={{
          -14.1086,5.1749},{3.7029,5.1749},{3.7029,-5.17496},{6.70292,
          -5.17496}},                                                                                                    color = {0, 0, 127}));
  connect(add2.u2, step2.y) annotation(Line(visible = true, origin = {-101.2558, -21.885}, points={{12.6949,
          8.11496},{-3.2317,8.11496},{-3.2317,-8.115},{-6.2316,-8.115}},                                                                                                    color = {0, 0, 127}));
  connect(pwLine13.n, pwLine14.p) annotation(Line(visible = true, origin = {68.1427, 2.7263}, points = {{-12.1051, -2.7239}, {2.035, -2.7238}, {2.035, 2.7238}, {8.035, 2.7238}}));
  connect(pwLine14.n, pwLine15.n) annotation(Line(visible = true, origin = {90.2103, -4.5499}, points = {{-0.0326, 10}, {-0.0326, -5}, {0.0649, -5}}));
  connect(pwLine14.p, pwLine15.p) annotation(Line(visible = true, origin = {76.2102, -4.5499}, points = {{-0.0325, 10.0}, {-0.0325, -5.0}, {0.065, -5.0}}));
  connect(infiniteBus8.p, pwLine14.n) annotation(Line(visible = true, origin = {97.3801, 2.1498}, points = {{9.6073, -3.3002}, {-1.2024, -3.3002}, {-1.2024, 3.3002}, {-7.2024, 3.3003}}));
  connect(const.y, PFmodel1.T) annotation(Line(visible = true, origin = {-30.4532, -10.8808}, points={{
          -25.3969,-6.1691},{7.4657,-6.1691},{7.4657,6.1691},{10.4657,
          6.1691}},                                                                                                    color = {0, 0, 127}));
  connect(PFmodel1.pwPin1, pwLine13.p) annotation(Line(visible = true, origin = {32.2688, 0.1454}, points = {{-29.2563, 0.1429}, {9.7437, 0.1429}, {9.7437, -0.143}, {9.7688, -0.143}}));
  connect(add1.y, PFmodel1.E) annotation(Line(visible = true, origin = {-26.9875, 10.1066}, points = {{-14.9999, 4.8182}, {4, 4.8183}, {4, -4.8183}, {7, -4.8183}}, color = {0, 0, 127}));
  annotation(Diagram(coordinateSystem(extent = {{-148.5, -105.0}, {148.5, 105.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5}), graphics={                                                                                     Text(visible=  true, origin=  {136.1319, 30.0},
            fillPattern=                                                                                                    FillPattern.Solid, extent=  {{-41.1319, -13.2857}, {41.1319, 13.2857}}, textString=  "VoltageGrid=10000 (1p.u.)", fontName=  "Arial")}),
      Documentation(info="<html>
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
end testIrradation;
