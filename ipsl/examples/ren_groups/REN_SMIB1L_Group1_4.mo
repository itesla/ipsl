within iPSL.Examples.REN_Groups;
model REN_SMIB1L_Group1_4

  Electrical.Branches.PwLine2Openings pwLine(
    X=0.1,
    t1=100,
    t2=100,
    G=0,
    B=0,
    R=0.01) annotation (Placement(transformation(extent={{-21,-10},{-1,10}})));
  Electrical.Events.PwFault              pwFault(
    R = 0,
    X = -0.5,
    t1=10,
    t2=10.15) annotation(Placement(transformation(extent={{45,-58},{56,-46}})));
  Electrical.Branches.PwLine2Openings pwLine1(
    X=0.1,
    t1=100,
    t2=100,
    R=0.01,
    G=0,
    B=0) annotation (Placement(transformation(extent={{23,4},{43,24}})));
  Electrical.Branches.PwLine2Openings pwLine3(
    t2=100,
    t1=100,
    G=0,
    B=0,
    X=0.05,
    R=0.005) annotation (Placement(transformation(extent={{7,-30},{27,-10}})));
  Electrical.Loads.PSSE.Load_variation              constantLoad(
    S_i(im = 0, re = 0),
    S_y(re = 0, im = 0),
    a(re = 1, im = 0),
    b(re = 0, im = 1),
    PQBRAK = 0.7,
    d_t = 0,
    d_P=0,
    t1=0,
    V_0=0.9981618,
    angle_0=-0.119942,
    S_p(re=50/1000, im=50/1000))
             annotation(Placement(transformation(extent={{11,-12},
            {-11,12}},
        rotation=180,
        origin={20,-44})));
  Electrical.Branches.PwLine2Openings pwLine4(
    t2=100,
    t1=100,
    G=0,
    B=0,
    R=0.005,
    X=0.05) annotation (Placement(transformation(extent={{33,-30},{53,-10}})));
  Electrical.Machines.PSSE.GENCLS.GENCLS              gENCLS(
    X_d = 0.2,
    D = 0,
    V_0=1,
    angle_0=0,
    M_b=1000,
    H=4,
    P_0=45.0213,
    Q_0=32.30648)        annotation(Placement(transformation(extent={{105,-10},
            {83,12}})));

  iPSL.Examples.REN_Groups.Configuration.RGroup1_4 group1_4 annotation (
      Placement(transformation(rotation=0, extent={{-84,-10},{-64,10}})));
  inner Electrical.SystemBase SysData(S_b=1000)
    annotation (Placement(transformation(extent={{-46,52},{-22,72}})));
equation

  connect(pwLine.n,pwLine1. p) annotation (Line(
      points={{-4,0},{3,0},{3,14},{26,14}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pwLine3.p,pwLine1. p) annotation (Line(
      points={{10,-20},{3,-20},{3,14},{26,14}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pwLine3.n,pwLine4. p) annotation (Line(
      points={{24,-20},{36,-20}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pwLine1.n,gENCLS. p) annotation (Line(
      points={{40,14},{67,14},{67,0.834604},{80.8,0.834604}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pwLine4.n,gENCLS. p) annotation (Line(
      points={{50,-20},{67,-20},{67,0.834604},{80.8,0.834604}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pwLine3.p,constantLoad. p) annotation (Line(
      points={{10,-20},{9,-20},{9,-57.2},{20,-57.2}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(group1_4.p, pwLine.p) annotation (Line(
      points={{-63,0},{-18,0}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pwFault.p, pwLine4.p) annotation (Line(points={{44.0833,-52},{
          44.0833,-49},{36,-49},{36,-20}},
                                   color={0,0,255}));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,
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
end REN_SMIB1L_Group1_4;
