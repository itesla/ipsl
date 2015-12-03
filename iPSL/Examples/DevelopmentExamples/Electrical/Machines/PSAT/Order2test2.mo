within iPSL.Examples.DevelopmentExamples.Electrical.Machines.PSAT;
model Order2test2
  iPSL.Electrical.Loads.PSAT.LOADPQ pwLoadPQ1(
    P_0=0.08,
    Q_0=0.06,
    V_0=1,
    angle_0=0) annotation (Placement(visible=true, transformation(
        origin={13.2834,10.0},
        extent={{-10.0,-10.0},{10.0,10.0}},
        rotation=0)));
  iPSL.Electrical.Branches.PwLine pwLine1(
    X=0.1,
    R=0.01,
    G=0,
    B=0.001/2) annotation (Placement(visible=true, transformation(
        origin={-70.0,-10.0},
        extent={{-10.0,-10.0},{10.0,10.0}},
        rotation=0)));
  iPSL.Electrical.Events.PwFault pwFault1(
    R=10,
    X=1,
    t1=25,
    t2=25.01) annotation (Placement(visible=true, transformation(
        origin={20.0,-57.3},
        extent={{-10.0,-10.0},{10.0,10.0}},
        rotation=0)));
  iPSL.Electrical.Machines.PSAT.SecondOrder.Order2 order21(
    Sn=20,
    Q_0=0.11859436505981,
    P_0=0.160352698692006,
    V_b=400,
    V_0=1,
    angle_0=0,
    Vn=400,
    ra=0.001,
    xd1=0.302,
    M=10,
    D=0) annotation (Placement(visible=true, transformation(
        origin={-116.9458,10.0},
        extent={{-10.0,-10.0},{10.0,10.0}},
        rotation=0)));
  iPSL.Electrical.Branches.PwLinewithOpeningReceiving pwLinewithOpening1(
    B=0.001/2,
    G=0,
    R=0.01,
    X=0.1,
    t1=21,
    t2=21.02) annotation (Placement(visible=true, transformation(
        origin={-25.0,-0.0},
        extent={{-10.0,-10.0},{10.0,10.0}},
        rotation=0)));
  iPSL.Electrical.Branches.PwLine pwLine2(
    B=0.001/2,
    G=0,
    R=0.01,
    X=0.1) annotation (Placement(visible=true, transformation(
        origin={-70.0,10.0},
        extent={{-10.0,-10.0},{10.0,10.0}},
        rotation=0)));
  iPSL.Electrical.Branches.PwLine pwLine3(
    B=0.001/2,
    G=0,
    R=0.01,
    X=0.1) annotation (Placement(visible=true, transformation(
        origin={-25.0,-30.0},
        extent={{-10.0,-10.0},{10.0,10.0}},
        rotation=0)));
  iPSL.Electrical.Branches.PwLine pwLine4(
    B=0.001/2,
    G=0,
    R=0.01,
    X=0.1) annotation (Placement(visible=true, transformation(
        origin={-25.0,15.0},
        extent={{-10.0,-10.0},{10.0,10.0}},
        rotation=0)));
  iPSL.Electrical.Loads.PSAT.LOADPQ pwLoadPQ2(
    P_0=0.08,
    Q_0=0.06,
    V_0=1,
    angle_0=0) annotation (Placement(visible=true, transformation(
        origin={15.0,-30.0},
        extent={{-10.0,-10.0},{10.0,10.0}},
        rotation=0)));
  inner iPSL.Electrical.SystemBase SysData
    annotation (Placement(transformation(extent={{100,80},{135,100}})));
equation
  connect(pwFault1.p, pwLine3.n) annotation (Line(
      visible=true,
      origin={-7.25,-43.15},
      points={{15.5833,-14.15},{-4.75,-14.15},{-4.75,13.15},{-10.75,13.15}}));
  connect(pwLine3.n, pwLoadPQ2.p) annotation (Line(
      visible=true,
      origin={-1.5,-29.5},
      points={{-16.5,-0.5},{3.5,-0.5},{3.5,10.5},{16.5,10.5}}));
  connect(pwLine1.n, pwLine3.p) annotation (Line(
      visible=true,
      origin={-42.75,-20.0},
      points={{-20.25,10.0},{4.75,10.0},{4.75,-10.0},{10.75,-10.0}}));
  connect(pwLine4.n, pwLoadPQ1.p) annotation (Line(
      visible=true,
      origin={-2.7875,13.0},
      points={{-15.2125,2},{3.0708,2},{3.0708,8},{16.0709,8}}));
  connect(pwLinewithOpening1.n, pwLine4.n) annotation (Line(
      visible=true,
      origin={-18.0,7.5},
      points={{0.0,-7.5},{0.0,7.5}}));
  connect(pwLine4.p, pwLinewithOpening1.p) annotation (Line(
      visible=true,
      origin={-32.0,7.5},
      points={{0.0,7.5},{0.0,-7.5}}));
  connect(pwLine2.n, pwLine4.p) annotation (Line(
      visible=true,
      origin={-42.75,12.5},
      points={{-20.25,-2.5},{4.75,-2.5},{4.75,2.5},{10.75,2.5}}));
  connect(pwLine1.n, pwLine2.n) annotation (Line(
      visible=true,
      origin={-63.0,0.0},
      points={{0.0,-10.0},{0.0,10.0}}));
  connect(pwLine2.p, pwLine1.p) annotation (Line(
      visible=true,
      origin={-77.0,0.0},
      points={{0.0,10.0},{0.0,-10.0}}));
  connect(order21.p, pwLine2.p) annotation (Line(
      visible=true,
      origin={-98.2365,9.9248},
      points={{-7.7093,0.12484},{-6.7635,0.12484},{-6.7635,0.0752},{21.2365,
          0.0752}}));
  connect(order21.vf, order21.vf0) annotation (Line(points={{-126.946,15},{-130,
          15},{-130,25},{-124.946,25},{-124.946,21}}, color={0,0,127}));
  connect(order21.pm, order21.pm0) annotation (Line(points={{-126.946,5},{-130,
          5},{-130,-5},{-124.946,-5},{-124.946,-1}}, color={0,0,127}));
  annotation (Diagram(coordinateSystem(
        extent={{-148.5,-105},{148.5,105}},
        preserveAspectRatio=false,
        initialScale=0.1,
        grid={5,5}), graphics={Text(
          visible=true,
          origin={-70.0,29.1417},
          fillPattern=FillPattern.Solid,
          extent={{-35.0,-5.8583},{35.0,5.8583}},
          textString="SystemSbase=100 MVA",
          fontName="Arial")}), Documentation(info="<html>
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
end Order2test2;

