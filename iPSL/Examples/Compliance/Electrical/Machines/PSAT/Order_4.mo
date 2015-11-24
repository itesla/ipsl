within iPSL.Examples.Compliance.Electrical.Machines.PSAT;
model Order_4

   iPSL.Electrical.Loads.PSAT.LOADPQ pwLoadPQ2(P_0 = 0.08, Q_0 = 0.06,
    V_0=1,
    angle_0=0)                                                          annotation(Placement(visible = true, transformation(origin = {-22.5, 67.5}, extent = {{-12.5, -12.5}, {12.5, 12.5}}, rotation = 0)));
   iPSL.Electrical.Branches.PwLinewithOpeningReceiving
    pwLinewithOpening1(
    B=0.001/2,
    G=0,
    R=0.01,
    X=0.1,
    t1=8,
    t2=8.1) annotation (Placement(visible=true, transformation(
        origin={-45,55},
        extent={{-10.0,-10.0},{10.0,10.0}},
        rotation=0)));
   iPSL.Electrical.Branches.PwLine pwLine4(
    B=0.001/2,
    G=0,
    R=0.01,
    X=0.1) annotation (Placement(visible=true, transformation(
        origin={-45,70},
        extent={{-10.0,-10.0},{10.0,10.0}},
        rotation=0)));
   iPSL.Electrical.Branches.PwLine pwLine3(
    B=0.001/2,
    G=0,
    R=0.01,
    X=0.1) annotation (Placement(visible=true, transformation(
        origin={-45,35},
        extent={{-10.0,-10.0},{10.0,10.0}},
        rotation=0)));
   iPSL.Electrical.Loads.PSAT.LOADPQ pwLoadPQ1(P_0 = 0.08, Q_0 = 0.06,
    V_0=1,
    angle_0=0)                                                            annotation(Placement(visible = true, transformation(origin = {-22.5, 42.5}, extent = {{-12.5, -12.5}, {12.5, 12.5}}, rotation = 0)));
   iPSL.Electrical.Branches.PwLine pwLine2(
    B=0.001/2,
    G=0,
    R=0.01,
    X=0.1) annotation (Placement(visible=true, transformation(
        origin={-70,60},
        extent={{-10.0,-10.0},{10.0,10.0}},
        rotation=0)));
   iPSL.Electrical.Branches.PwLine pwLine1(
    B=0.001/2,
    G=0,
    R=0.01,
    X=0.1) annotation (Placement(visible=true, transformation(
        origin={-70,45},
        extent={{-10.0,-10.0},{10.0,10.0}},
        rotation=0)));
   iPSL.Electrical.Events.PwFault pwFault(X = 0.001, t1 = 3, t2 = 3.1, R = 10) annotation(Placement(transformation(extent={{-25,-15},
            {0,10}})));
   iPSL.Electrical.Machines.PSAT.FourthOrder.Order4 Generator(Sn = 100, P_0 = 0.160352698692006, Q_0 = 0.11859436505981, Vn = 20, V_b = 400,
    V_0=1,
    angle_0=0,
    ra=0.001,
    M=10,
    D=0,
    xd1=0.302)                                                                                                     annotation(Placement(transformation(extent = {{-120, 40}, {-90, 70}})));
  inner iPSL.Electrical.SystemBase  SysData
    annotation (Placement(transformation(extent={{50,80},{75,100}})));
equation
  connect(pwLinewithOpening1.n, pwLine4.n) annotation(Line(visible = true, origin = {-38, 62.5}, points = {{0, -7.5}, {0, 7.5}}));
  connect(pwLine4.p, pwLinewithOpening1.p) annotation(Line(visible = true, origin = {-52, 62.5}, points = {{0, 7.5}, {0, -7.5}}));
  connect(pwLine1.n, pwLine2.n) annotation(Line(points = {{-63, 45}, {-63, 60}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(pwLine2.n, pwLine4.p) annotation(Line(points = {{-63, 60}, {-60, 60}, {-60, 70}, {-52, 70}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(pwLine1.n, pwLine3.p) annotation(Line(points = {{-63, 45}, {-60, 45}, {-60, 35}, {-52, 35}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(Generator.p, pwLine2.p) annotation(Line(points={{-88.5,55.0745},{
          -80,55.0745},{-80,60},{-77,60}},                                                                           color = {0, 0, 255}, smooth = Smooth.None));
  connect(Generator.p, pwLine1.p) annotation(Line(points={{-88.5,55.0745},{
          -80,55.0745},{-80,45},{-77,45}},                                                                           color = {0, 0, 255}, smooth = Smooth.None));
  connect(pwLine3.n, pwLoadPQ1.p) annotation(Line(points={{-38,35},{-22.5,35},{-22.5,
          56.25}},                                                                                     color = {0, 0, 255}, smooth = Smooth.None));
  connect(pwLine4.n, pwLoadPQ2.p) annotation(Line(points={{-38,70},{-32.125,70},{-32.125,
          81.25},{-22.5,81.25}},                                                                                          color = {0, 0, 255}, smooth = Smooth.None));
  connect(pwLine3.n, pwFault.p) annotation(Line(points={{-38,35},{-35,35},{
          -35,-2.5},{-27.0833,-2.5}},                                                                           color = {0, 0, 255}, smooth = Smooth.None));
  connect(Generator.vf0, Generator.vf) annotation (Line(points={{-117,71.5},{
          -117,75},{-130,75},{-130,62.5},{-120,62.5}},
                                              color={0,0,127}));
  connect(Generator.pm, Generator.pm0) annotation (Line(points={{-120,47.5},{-125,47.5},
          {-125,50},{-125,38.5},{-117,38.5}}, color={0,0,127}));
  annotation(Diagram(coordinateSystem(extent={{-148.5,-105},{148.5,105}},      preserveAspectRatio=false,   initialScale = 0.1, grid = {5, 5}), graphics={                                                                                           Text(extent=  {{-120, 85}, {-20, 80}}, lineColor=  {0, 0, 255}, textString=  "GenOrder4: LineOpening and Line-to-Ground Fault")}), experiment(StopTime = 20), __Dymola_experimentSetupOutput,
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
end Order_4;
