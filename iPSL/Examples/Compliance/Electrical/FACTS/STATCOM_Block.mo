within iPSL.Examples.Compliance.Electrical.FACTS;
model STATCOM_Block

   iPSL.Electrical.Branches.PwLine pwLine4(
    B=0.001/2,
    G=0,
    R=0.01,
    X=0.1) annotation (Placement(visible=true, transformation(
        origin={-29,17},
        extent={{-10.0,-10.0},{10.0,10.0}},
        rotation=0)));
   iPSL.Electrical.Branches.PwLine pwLine2(
    B=0.001/2,
    G=0,
    R=0.01,
    X=0.1) annotation (Placement(visible=true, transformation(
        origin={-29,-21},
        extent={{-10.0,-10.0},{10.0,10.0}},
        rotation=0)));
   iPSL.Electrical.Machines.PSAT.SecondOrder.Order2 Syn2(
    D=1,
    Sn=370,
    V_0=1.027606413803688,
    angle_0=0.036282466109908,
    P_0=0.800000000076548,
    Q_0=0.500000000133379,
    Vn=400,
    ra=0.001,
    xd1=0.302,
    M=10)                  annotation (Placement(transformation(
        extent={{-15,-16},{15,16}},
        rotation=180,
        origin={97,0})));
   iPSL.Electrical.Branches.PwLine pwLine1(
    B=0.001/2,
    G=0,
    R=0.01,
    X=0.1) annotation (Placement(visible=true, transformation(
        origin={55,19},
        extent={{-10.0,-10.0},{10.0,10.0}},
        rotation=0)));
   iPSL.Electrical.Branches.PwLine pwLine3(
    B=0.001/2,
    G=0,
    R=0.01,
    X=0.1) annotation (Placement(visible=true, transformation(
        origin={57,-21},
        extent={{-10.0,-10.0},{10.0,10.0}},
        rotation=0)));
   iPSL.Electrical.Machines.PSAT.SecondOrder.Order2
    order2_Inputs_Outputs(
    Sn=370,
    D=5,
    Q_0=-0.001317396836878,
    P_0=0.004219210312137,
    V_b=400,
    V_0=1,
    angle_0=0,
    Vn=400,
    ra=0.001,
    xd1=0.302,
    M=10)
    annotation (Placement(transformation(extent={{-80,-10},{-60,10}})));
  Modelica.Blocks.Sources.Pulse pulse(
    period=10,
    startTime=4.2,
    amplitude=0.045,
    width=58,
    offset=0.999893364166223,
    nperiod=-1)
    annotation (Placement(transformation(extent={{-156,16},{-136,36}})));
  Modelica.Blocks.Sources.Pulse pulse1(
    period=10,
    amplitude=-0.045,
    width=42,
    startTime=0,
    nperiod=-1)
    annotation (Placement(transformation(extent={{-156,-16},{-136,4}})));
  Modelica.Blocks.Math.Add3 add3_1(
    k3=0,
    k1=1,
    k2=1)
    annotation (Placement(transformation(extent={{-118,-10},{-98,10}})));
  Modelica.Blocks.Sources.Constant vpod(k=0)
    annotation (Placement(transformation(extent={{-56,-62},{-46,-52}})));
   iPSL.Electrical.Controls.PSAT.FACTS.STATCOM.STATCOMBlock statcomBlock(
    Vbus=400000,
    Vn=400000,
    V_0=1,
    angle_0=-0.000213067852480)
    annotation (Placement(transformation(extent={{-18,-50},{2,-30}})));
   iPSL.Electrical.Loads.PSAT.LOADPQ_variation lOADPQ(
    P2=0,
    P3=0,
    t1=7,
    t3=8,
    t4=30,
    Q3=+0.42,
    Q2=0.1,
    t2=7.001,
    P_0=0.8,
    Q_0=0.6)  annotation (Placement(transformation(extent={{22,-52},{42,-32}})));
   iPSL.Electrical.Buses.Bus B1
    annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  inner iPSL.Electrical.SystemBase  SysData
    annotation (Placement(transformation(extent={{-100,60},{-76,80}})));
equation

  connect(pwLine1.n, pwLine3.n) annotation (Line(
      points={{62,19},{70,19},{70,-21},{64,-21}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pwLine1.p, pwLine3.p) annotation (Line(
      points={{48,19},{40,19},{40,-21},{50,-21}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(Syn2.p, pwLine3.n) annotation (Line(
      points={{80.5,-0.079424},{70,-0.079424},{70,-21},{64,-21}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pwLine2.n, pwLine4.n) annotation (Line(
      points={{-22,-21},{-16,-21},{-16,17},{-22,17}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pwLine4.p, pwLine2.p) annotation (Line(
      points={{-36,17},{-42,17},{-42,-21},{-36,-21}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(add3_1.y, order2_Inputs_Outputs.vf) annotation (Line(
      points={{-97,0},{-92,0},{-92,5},{-80,5}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(order2_Inputs_Outputs.pm0, order2_Inputs_Outputs.pm)
    annotation (Line(
      points={{-78,-11},{-54,-11},{-54,-24},{-94,-24},{-94,-5},{-80,-5}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(order2_Inputs_Outputs.vf0, add3_1.u3) annotation (Line(
      points={{-78,11},{-52,11},{-52,16},{-96,16},{-96,-18},{-128,-18},{
          -128,-8},{-120,-8}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(order2_Inputs_Outputs.p, pwLine2.p) annotation (Line(
      points={{-59,0.04964},{-42,0.04964},{-42,-21},{-36,-21}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pulse1.y, add3_1.u2) annotation (Line(
      points={{-135,-6},{-126,-6},{-126,0},{-120,0}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(pulse.y, add3_1.u1) annotation (Line(
      points={{-135,26},{-130,26},{-130,8},{-120,8}},
      color={0,0,127},
      smooth=Smooth.None));

  connect(vpod.y, statcomBlock.vs_POD) annotation (Line(
      points={{-45.5,-57},{-18.8,-57},{-18.8,-46}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(B1.p, pwLine3.p) annotation (Line(points={{0,0},{40,0},{40,-21},{50,
          -21}}, color={0,0,255}));
  connect(B1.p, lOADPQ.p) annotation (Line(points={{0,0},{16,0},{16,-31},{32,
          -31}}, color={0,0,255}));
  connect(B1.p, pwLine4.n) annotation (Line(points={{0,0},{-16,0},{-16,17},{-22,
          17}}, color={0,0,255}));
  connect(B1.p, statcomBlock.p) annotation (Line(points={{0,0},{8,0},{8,-39.8},
          {3,-39.8}}, color={0,0,255}));
  connect(Syn2.pm0, Syn2.pm) annotation (Line(points={{109,17.6},{109,24},{
          122,24},{122,8},{112,8}}, color={0,0,127}));
  connect(Syn2.vf, Syn2.vf0) annotation (Line(points={{112,-8},{120,-8},{120,
          -24},{109,-24},{109,-17.6}}, color={0,0,127}));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false,extent={{-160,
            -100},{160,100}})),                Icon(coordinateSystem(
          extent={{-160,-100},{160,100}})),
    Documentation(info="<html>
<table cellspacing=\"2\" cellpadding=\"1\" border=\"1\"><tr>
<td><p>Reference</p></td>
<td><p>KTH own Model, PSAT Manual 2.1.8</p></td>
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
end STATCOM_Block;
