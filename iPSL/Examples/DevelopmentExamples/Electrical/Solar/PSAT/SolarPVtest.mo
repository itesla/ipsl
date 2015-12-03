within iPSL.Examples.DevelopmentExamples.Electrical.Solar.PSAT;


model SolarPVtest
  iPSL.Electrical.Branches.PwLine pwLine1(
    B=0.001/2,
    G=0,
    R=0.01,
    X=0.1) annotation (Placement(visible=true, transformation(
        origin={-70.0,-10.0},
        extent={{-10.0,-10.0},{10.0,10.0}},
        rotation=0)));
  iPSL.Electrical.Events.PwFault pwFault1(
    R=20,
    X=1,
    t1=3,
    t2=3.1) annotation (Placement(visible=true, transformation(
        origin={20.0,-57.3},
        extent={{-10.0,-10.0},{10.0,10.0}},
        rotation=0)));
  iPSL.Electrical.Branches.PwLinewithOpeningReceiving pwLinewithOpening1(
    B=0.001/2,
    G=0,
    R=0.01,
    X=0.1,
    t1=8,
    t2=8.1) annotation (Placement(visible=true, transformation(
        origin={-25.0,0.0},
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
  iPSL.Electrical.Machines.PSAT.ThirdOrder.Order3 order31(
    Sn=20,
    P_0=0.0401256732154526,
    Q_0=0.0262725307404601,
    V_b=400,
    V_0=1,
    angle_0=0,
    Vn=400,
    ra=0.001,
    xd1=0.302,
    M=10,
    D=0,
    xd=1.9,
    Td10=8,
    xq=1.7) annotation (Placement(visible=true, transformation(
        origin={-110.0,10.0},
        extent={{-10.0,-10.0},{10.0,10.0}},
        rotation=0)));
  iPSL.Electrical.Buses.Bus bus1 annotation (Placement(visible=true,
        transformation(
        origin={-87.5421,10.0},
        extent={{-10.0,-10.0},{10.0,10.0}},
        rotation=0)));
  iPSL.Electrical.Buses.Bus bus2 annotation (Placement(visible=true,
        transformation(
        origin={-46.7243,11.8063},
        extent={{-10.0,-10.0},{10.0,10.0}},
        rotation=0)));
  iPSL.Electrical.Buses.Bus bus3 annotation (Placement(visible=true,
        transformation(
        origin={5.0,12.1033},
        extent={{-10.0,-10.0},{10.0,10.0}},
        rotation=0)));
  iPSL.Electrical.Buses.Bus bus4 annotation (Placement(visible=true,
        transformation(
        origin={-3.3112,-30.0},
        extent={{-10.0,-10.0},{10.0,10.0}},
        rotation=0)));
  iPSL.Electrical.Solar.PSAT.ConstantPQPV.PV1 PV11(
    Q_0=0.283430554716626,
    angle_0=-0.00000839852213846341,
    V_0=1.00002,
    vref=1.00002,
    P_0=0.4) annotation (Placement(visible=true, transformation(
        origin={30.0,12.1033},
        extent={{-10.0,-10.0},{10.0,10.0}},
        rotation=0)));
  inner iPSL.Electrical.SystemBase SysData
    annotation (Placement(transformation(extent={{55,50},{80,70}})));
equation
  connect(bus3.p, PV11.p) annotation (Line(
      visible=true,
      origin={12.0,12.1033},
      points={{-7,0},{7,0}}));
  connect(pwLine2.p, pwLine1.p) annotation (Line(
      visible=true,
      origin={-77.0,0.0},
      points={{0.0,10.0},{0.0,-10.0}}));
  connect(pwLine1.n, pwLine2.n) annotation (Line(
      visible=true,
      origin={-63.0,0.0},
      points={{0.0,-10.0},{0.0,10.0}}));
  connect(pwLine4.p, pwLinewithOpening1.p) annotation (Line(
      visible=true,
      origin={-32.0,7.5},
      points={{0.0,7.5},{0.0,-7.5}}));
  connect(pwLinewithOpening1.n, pwLine4.n) annotation (Line(
      visible=true,
      origin={-18.0,7.5},
      points={{0.0,-7.5},{0.0,7.5}}));
  connect(bus1.p, pwLine2.p) annotation (Line(
      visible=true,
      origin={-82.2711,10.0},
      points={{-5.271,0},{5.2711,0}}));
  connect(pwLine2.n, bus2.p) annotation (Line(
      visible=true,
      origin={-52.1495,10.6021},
      points={{-10.8505,-0.6021},{5.4252,-0.6021},{5.4252,1.2042}}));
  connect(bus2.p, pwLine4.p) annotation (Line(
      visible=true,
      origin={-41.8162,13.9354},
      points={{-4.9081,-2.1291},{-4.9081,1.0646},{9.8162,1.0646}}));
  connect(bus2.p, pwLine3.p) annotation (Line(
      visible=true,
      origin={-41.8162,-16.0646},
      points={{-4.9081,27.8709},{-4.9081,-13.9354},{9.8162,-13.9354}}));
  connect(pwLine4.n, bus3.p) annotation (Line(
      visible=true,
      origin={-7.25,13.5517},
      points={{-10.75,1.4483},{-0.75,1.4483},{-0.75,-1.4484},{12.25,-1.4484}}));
  connect(pwLine3.n, bus4.p) annotation (Line(
      visible=true,
      origin={-10.6556,-30.0},
      points={{-7.3444,0},{7.3444,0}}));
  connect(bus4.p, pwLoadPQ2.p) annotation (Line(
      visible=true,
      origin={0.4592,-29.3333},
      points={{-3.7704,-0.6667},{-3.7704,10.3333},{14.5408,10.3333}}));
  connect(bus4.p, pwFault1.p) annotation (Line(
      visible=true,
      origin={2.1259,-47.5333},
      points={{-5.4371,17.5333},{-5.4371,-9.7667},{6.20743,-9.7667}}));
  connect(bus1.p, order31.p) annotation (Line(
      visible=true,
      origin={-91.3614,9.8998},
      points={{3.8193,0.1002},{3.8193,0.14984},{-7.6386,0.14984}}));
  connect(order31.vf0, order31.vf) annotation (Line(points={{-118,21},{-118,25},
          {-130,25},{-130,15},{-120,15}}, color={0,0,127}));
  connect(order31.pm, order31.pm0) annotation (Line(points={{-120,5},{-130,5},{
          -130,-5},{-118,-5},{-118,-1}}, color={0,0,127}));
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
end SolarPVtest;
