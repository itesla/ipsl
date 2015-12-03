within iPSL.Examples.DevelopmentExamples.Electrical.Controls.PSSE.TG;
model IEESGO
  "Simple Machine Infinite Bus with Machine, Governor and Excitation system"
  iPSL.Electrical.Machines.PSSE.GENROU.GENROU generator(
    Xppd=0.2,
    Xppq=0.2,
    Xpp=0.2,
    Xl=0.12,
    M_b=100,
    Tpd0=5,
    Tppd0=0.50000E-01,
    Tppq0=0.1,
    H=4.0000,
    D=0,
    Xd=1.41,
    Xq=1.3500,
    Xpd=0.3,
    S10=0.1,
    S12=0.5,
    Xpq=0.6,
    Tpq0=0.7,
    V_0=1,
    angle_0=4.05,
    P_0=39.99995,
    Q_0=5.416571)
    annotation (Placement(transformation(extent={{-76,0},{-50,22}})));
  iPSL.Electrical.Branches.PwLine pwLine(
    R=0.001,
    X=0.2,
    G=0,
    B=0) annotation (Placement(transformation(extent={{-18,0},{2,20}})));
  iPSL.Electrical.Branches.PwLine pwLine1(
    R=0.001,
    X=0.2,
    G=0,
    B=0) annotation (Placement(transformation(extent={{26,14},{46,34}})));
  iPSL.Electrical.Branches.PwLine2Openings pwLine3(
    t1=2.15,
    t2=100,
    R=0.0005,
    X=0.1,
    G=0,
    B=0) annotation (Placement(transformation(extent={{16,-20},{36,0}})));
  iPSL.Electrical.Branches.PwLine2Openings pwLine4(
    t1=2.15,
    t2=100,
    R=0.0005,
    X=0.1,
    G=0,
    B=0) annotation (Placement(transformation(extent={{42,-20},{62,0}})));
  iPSL.Electrical.Machines.PSSE.GENCLS.GENCLS gENCLS(
    X_d=0.2,
    P_0=10.01716,
    Q_0=8.006525,
    V_0=1,
    angle_0=0,
    M_b=100,
    H=0,
    D=0) annotation (Placement(transformation(extent={{108,0},{86,22}})));
  iPSL.Electrical.Loads.PSSE.Load_variation constantLoad(
    angle_0=-0.57627,
    S_p(re=0.5, im=0.1),
    S_i(im=0, re=0),
    S_y(re=0, im=0),
    a(re=1, im=0),
    b(re=0, im=1),
    PQBRAK=0.7,
    V_0=0.991992,
    t1=2,
    d_P=5*0.01,
    d_t=0) annotation (Placement(transformation(extent={{26,-40},{48,-16}})));
  iPSL.Electrical.Events.PwFault pwFault(
    R=0,
    t1=2,
    t2=2.15,
    X=0.2e-11)
    annotation (Placement(transformation(extent={{56,-32},{70,-18}})));
  iPSL.Electrical.Controls.PSSE.TG.IEESGO iEEESGO annotation (Placement(
        transformation(
        extent={{-19,-8},{19,8}},
        rotation=180,
        origin={-69,36})));
  iPSL.Electrical.Controls.PSSE.ES.IEEET2.IEEET2 iEEET2_1(
    V_RMAX=4,
    V_RMIN=-4,
    K_E=1,
    T_R=0,
    K_A=100,
    T_A=0.014,
    T_E=0.62,
    K_F=0.12,
    T_F1=1.0,
    T_F2=0.1,
    E_1=2.31,
    S_EE_1=0.08,
    E_2=3.08,
    S_EE_2=0.3,
    V_0=1) annotation (Placement(transformation(
        extent={{-17,-32},{17,32}},
        rotation=180,
        origin={-73,-24})));
  Modelica.Blocks.Sources.Constant const(k=0) annotation (Placement(
        transformation(
        extent={{-2,-2},{2,2}},
        rotation=180,
        origin={-38,-8})));
  Modelica.Blocks.Sources.Step step(height=-0.002, startTime=10)
    annotation (Placement(transformation(extent={{-22,40},{-36,54}})));
  Modelica.Blocks.Math.Add add
    annotation (Placement(transformation(extent={{-78,60},{-58,80}})));
equation
  connect(generator.p, pwLine.p) annotation (Line(
      points={{-48.7,11},{-20.6,11},{-20.6,10},{-15,10}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pwLine.n, pwLine1.p) annotation (Line(
      points={{-1,10},{3.5,10},{3.5,24},{29,24}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pwLine1.n, gENCLS.p) annotation (Line(
      points={{43,24},{74,24},{74,10.8346},{83.8,10.8346}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pwLine3.p, pwLine.n) annotation (Line(
      points={{19,-10},{2.5,-10},{2.5,10},{-1,10}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pwLine3.n, pwLine4.p) annotation (Line(
      points={{33,-10},{45,-10}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pwLine4.n, gENCLS.p) annotation (Line(
      points={{59,-10},{74,-10},{74,10.8346},{83.8,10.8346}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(constantLoad.p, pwLine3.p) annotation (Line(
      points={{37,-14.8},{37,-25.5},{19,-25.5},{19,-10}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pwFault.p, pwLine4.p) annotation (Line(
      points={{54.8333,-25},{54.8333,-25.5},{45,-25.5},{45,-10}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(iEEET2_1.VUEL, const.y) annotation (Line(
      points={{-56.5667,-11.2},{-43.67,-11.2},{-43.67,-8},{-40.2,-8}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(iEEET2_1.VOEL, const.y) annotation (Line(
      points={{-56.5667,-24},{-43.67,-24},{-43.67,-8},{-40.2,-8}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(iEEET2_1.VOTHSG, const.y) annotation (Line(
      points={{-56.5667,-36.8},{-43.67,-36.8},{-43.67,-8},{-40.2,-8}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(iEEET2_1.EFD, generator.EFD) annotation (Line(
      points={{-91.275,-24},{-86,-24},{-86,5.5},{-75.74,5.5}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(generator.SPEED, iEEESGO.SPEED) annotation (Line(
      points={{-48.96,20.9},{-52,20.9},{-52,33.7143},{-50.95,33.7143}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(iEEESGO.PMECH, generator.PMECH) annotation (Line(
      points={{-89.1875,37.1429},{-88,37.1429},{-88,16.5},{-75.74,16.5}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(generator.EFD0, iEEET2_1.EFD0) annotation (Line(
      points={{-48.96,3.3},{-32,3.3},{-32,1.6},{-56.5667,1.6}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(generator.ETERM, iEEET2_1.ECOMP) annotation (Line(points={{-48.96,
          16.5},{-28,16.5},{-28,-49.6},{-56.5667,-49.6}}, color={0,0,127}));
  connect(add.u1, step.y) annotation (Line(points={{-80,76},{-86,76},{-86,74},{
          -94,74},{-94,47},{-36.7,47}}, color={0,0,127}));
  connect(add.u2, generator.PMECH0) annotation (Line(points={{-80,64},{-92,64},
          {-92,66},{-112,66},{-112,7.7},{-48.96,7.7}}, color={0,0,127}));
  connect(iEEESGO.PMECH0, add.y) annotation (Line(points={{-50.95,41.7143},{-48,
          41.7143},{-48,70},{-57,70}}, color={0,0,127}));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}})), Documentation(info="<html>
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
end IEESGO;

