within iPSL.Electrical.Controls.PSSE.ES.ESST4B;
model ESST4B " IEEE type ST4B potential or compounded
source-controlled rectifier exciter "
  parameter Real T_R=0.3;
  parameter Real K_PR=2.97;
  parameter Real K_IR=2.97;
  parameter Real V_RMAX=1;
  parameter Real V_RMIN=-0.87;
  parameter Real T_A=0.01;
  parameter Real K_PM=1;
  parameter Real K_IM=0.2;
  parameter Real V_MMAX=1;
  parameter Real V_MMIN=-0.87;
   parameter Real K_G=0.1;
   parameter Real K_P=6.73;
   parameter Real K_I=0.1;
   parameter Real V_BMAX=8.41;
   parameter Real K_C=0.1;
   parameter Real X_L=0;
   parameter Real THETAP=0;

public
  NonElectrical.Continuous.ImSimpleLag                        Vm(
      nStartValue=V0,
    K=1,
    T=T_R)
    annotation (Placement(transformation(
        extent={{-22,-19},{22,19}},
        rotation=0,
        origin={-72,59})));
  iPSL.NonElectrical.Math.ImSum4 imSum4_1(
    a0=0,
    a1=1,
    a2=-1,
    a3=1,
    a4=1) annotation (Placement(transformation(extent={{-56,36},{-20,76}})));
  Modelica.Blocks.Interfaces.RealInput ECOMP
    annotation (Placement(transformation(extent={{-138,-4},{-100,34}}),
        iconTransformation(extent={{-138,-54},{-100,-16}})));
  Modelica.Blocks.Interfaces.RealInput VOTHSG annotation (Placement(
        transformation(extent={{-138,44},{-100,82}}),iconTransformation(extent={{-138,-6},
            {-100,32}})));
  Modelica.Blocks.Sources.Constant V_REF(k=VREF)
    annotation (Placement(transformation(extent={{-80,32},{-68,44}})));
  NonElectrical.Logical.LV_GATE
          lV_Gate
    annotation (Placement(transformation(extent={{264,46},{286,68}})));
  Modelica.Blocks.Sources.Constant V_OEL(k=1000)
    annotation (Placement(transformation(extent={{232,22},{244,34}})));
  Modelica.Blocks.Interfaces.RealInput XADIFD annotation (Placement(transformation(
        extent={{-19,-19},{19,19}},
        rotation=0,
        origin={-119,-91}), iconTransformation(extent={{-17,-17},{17,17}},
          origin={-119,-117})));
  NonElectrical.Logical.IN
     iN(       nStartValue=KCIFD0/VE0, KC=K_C)
               annotation (Placement(transformation(
        extent={{-32,-23},{32,23}},
        rotation=0,
        origin={64,-85})));
  NonElectrical.Nonlinear.ImFEX
      fEX annotation (Placement(transformation(extent={{76,-104},{134,-66}})));
  Modelica.Blocks.Math.Product product
    annotation (Placement(transformation(extent={{292,46},{306,60}})));
  Modelica.Blocks.Interfaces.RealOutput EFD
    annotation (Placement(transformation(extent={{340,42},{360,62}}),
        iconTransformation(extent={{230,-100},{250,-80}})));

  Modelica.Blocks.Interfaces.RealInput EFD0
                                           annotation (Placement(transformation(
        extent={{-17,-17},{17,17}},
        rotation=90,
        origin={-59,-135}), iconTransformation(extent={{-17,-17},{17,17}},
          origin={-121,-161})));
  Modelica.Blocks.Interfaces.RealInput VUEL
                                           annotation (Placement(transformation(
        extent={{-19,-19},{19,19}},
        rotation=0,
        origin={-123,-27}), iconTransformation(extent={{-17,-17},{17,17}},
          origin={-121,-75})));
  NonElectrical.Continuous.ImSimpleLag                        VA(
    K=1,
    T=T_A,
    nStartValue=Efd0*K_G)
                        annotation (Placement(transformation(
        extent={{-28,-22},{28,22}},
        rotation=0,
        origin={100,54})));
  iPSL.NonElectrical.Continuous.ImIntegratornonwindup VR1(
    Ymax=V_RMAX/K_PR,
    Ymin=V_RMIN/K_PR,
    K=K_IR,
    nStartValue=Efd0*K_G)
    annotation (Placement(transformation(extent={{-26,12},{20,56}})));
  Modelica.Blocks.Math.Gain Gain1(k=K_PR)
    annotation (Placement(transformation(extent={{-12,62},{8,82}})));
  Modelica.Blocks.Nonlinear.Limiter limiter(uMax=V_RMAX, uMin=V_RMIN)
    annotation (Placement(transformation(extent={{54,44},{74,64}})));
  Modelica.Blocks.Math.Add add
    annotation (Placement(transformation(extent={{34,48},{46,60}})));
  Modelica.Blocks.Math.Add add1(k1=-1)
    annotation (Placement(transformation(extent={{128,52},{138,62}})));
  Modelica.Blocks.Math.Gain gain(k=K_G)
                                       annotation (Placement(transformation(
        extent={{-9,-9},{9,9}},
        rotation=180,
        origin={195,109})));
  iPSL.NonElectrical.Continuous.ImIntegratornonwindup VM1(
    nStartValue=Efd0/VB0,
    Ymax=V_MMAX/K_PM,
    Ymin=V_MMIN/K_PM,
    K=K_IR) annotation (Placement(transformation(extent={{148,8},{194,52}})));
  Modelica.Blocks.Math.Gain Gain2(k=K_PM)
    annotation (Placement(transformation(extent={{164,62},{184,82}})));
  Modelica.Blocks.Nonlinear.Limiter limiter1(uMax=V_RMAX, uMin=V_RMIN)
    annotation (Placement(transformation(extent={{230,52},{250,72}})));
  Modelica.Blocks.Math.Add add2
    annotation (Placement(transformation(extent={{210,56},{222,68}})));
  VE vE annotation (Placement(transformation(extent={{-14,-44},{50,-8}})));
  Modelica.Blocks.Math.Product product1
    annotation (Placement(transformation(extent={{146,-36},{160,-22}})));
  Modelica.Blocks.Nonlinear.Limiter
             maxLimiter(            uMin=-Modelica.Constants.inf, uMax=V_BMAX)
    annotation (Placement(transformation(extent={{176,-40},{198,-18}})));
  Sensors.PwVoltageCurrent
                   pwVoltageCurrent
    annotation (Placement(transformation(extent={{-98,-68},{-34,32}})));
  iPSL.Connectors.PwPin Gen_terminal(
    vr(start=Vr0),
    vi(start=Vi0),
    ir(start=Ir0),
    ii(start=Ii0)) annotation (Placement(transformation(extent={{-94,88},{-74,
            108}}),iconTransformation(extent={{-94,38},{-74,58}})));
  iPSL.Connectors.PwPin Bus annotation (Placement(transformation(extent={{204,88},
            {224,108}}),    iconTransformation(extent={{204,38},{224,58}})));
protected
        parameter Real Vr0(fixed=false);
        parameter Real Vi0(fixed=false);
        parameter Real Ir0(fixed=false);
        parameter Real Ii0(fixed=false);
        parameter Real Efd0(fixed=false);
         parameter Real VREF(fixed=false);
          parameter Real V0(fixed=false);
   parameter Real Re(fixed=false);
  parameter Real Im(fixed=false);
  parameter Real KPr=K_P*cos(THETAP);
  parameter Real KPi=K_P*sin(THETAP);
  parameter Real VE0(fixed=false);
  parameter Real IN0(fixed=false);
parameter Real VB0(fixed=false);
  parameter Real KCIFD0(fixed=false);
  function FEX_INI
    input Real IN;
    output Real FEX;
  algorithm
   if IN <= 0 then
    FEX := 1;
  elseif IN > 0 and IN <= 0.433 then
    FEX := 1 - 0.577 * IN;
  elseif IN > 0.433 and IN < 0.75 then
    FEX := sqrt(0.75 - IN ^ 2);
  elseif IN >= 0.75 and IN <= 1 then
    FEX := 1.732 * (1 - IN);
  else
    FEX := 0;
  end if;
  end FEX_INI;
initial equation
  KCIFD0=K_C*XADIFD;
  Efd0=EFD0;

   V0=sqrt(Vr0*Vr0+Vi0*Vi0);
   VREF=V0;
    Re=KPr*Vr0-KPi*Vi0-K_I*Ii0-X_L*(KPr*Ii0+KPi*Ir0);
    Im=KPr*Vi0+KPi*Vr0+K_I*Ir0+X_L*(KPr*Ir0-KPi*Ii0);
  VE0=sqrt(Re*Re+Im*Im);
  IN0=KCIFD0/VE0;
  VB0=VE0*FEX_INI(IN0);

equation
  connect(ECOMP,Vm.p1) annotation (Line(
      points={{-119,15},{-94,15},{-94,59},{-78.82,59}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(VOTHSG, imSum4_1.p1) annotation (Line(
      points={{-119,63},{-94,63},{-94,62.4},{-47.18,62.4}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Vm.n1, imSum4_1.p2) annotation (Line(
      points={{-56.6,59},{-55.61,59},{-55.61,57.6},{-47.18,57.6}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(V_REF.y, imSum4_1.p3) annotation (Line(
      points={{-67.4,38},{-58,38},{-58,53.2},{-47.18,53.2}},
      color={0,0,127},
      smooth=Smooth.None));

  connect(product.y, EFD) annotation (Line(
      points={{306.7,53},{336,53},{336,52},{350,52}},
      color={0,0,127},
      smooth=Smooth.None));

  connect(iN.I_N, fEX.IN) annotation (Line(
      points={{79.68,-85},{87.6,-85}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(XADIFD, iN.IFD) annotation (Line(
      points={{-119,-91},{-92.5,-91},{-92.5,-90.98},{47.68,-90.98}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(VUEL, imSum4_1.p4) annotation (Line(
      points={{-123,-27},{-90,-27},{-90,48.8},{-47.18,48.8}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Gain1.y, add.u1) annotation (Line(
      points={{9,72},{26,72},{26,57.6},{32.8,57.6}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(VR1.n0, add.u2) annotation (Line(
      points={{8.27,34},{24,34},{24,50.4},{32.8,50.4}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Gain1.u, imSum4_1.n1) annotation (Line(
      points={{-14,72},{-30,72},{-30,56},{-29.18,56}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(VR1.p1, imSum4_1.n1) annotation (Line(
      points={{-14.73,34},{-30,34},{-30,56},{-29.18,56}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(add.y, limiter.u) annotation (Line(
      points={{46.6,54},{52,54}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(limiter.y, VA.p1) annotation (Line(
      points={{75,54},{91.32,54}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(VA.n1, add1.u2) annotation (Line(
      points={{119.6,54},{127,54}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Gain2.y, add2.u1) annotation (Line(
      points={{185,72},{198,72},{198,65.6},{208.8,65.6}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(VM1.n0, add2.u2) annotation (Line(
      points={{182.27,30},{198,30},{198,58.4},{208.8,58.4}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(add2.y, limiter1.u) annotation (Line(
      points={{222.6,62},{228,62}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Gain2.u, add1.y) annotation (Line(
      points={{162,72},{142,72},{142,57},{138.5,57}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(VM1.p1, add1.y) annotation (Line(
      points={{159.27,30},{142,30},{142,57},{138.5,57}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(add1.u1, gain.y) annotation (Line(
      points={{127,60},{124,60},{124,109},{185.1,109}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(gain.u, EFD) annotation (Line(
      points={{205.8,109},{336,109},{336,52},{350,52}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(vE.VE, product1.u1) annotation (Line(
      points={{56.4,-25.64},{81.2,-25.64},{81.2,-24.8},{144.6,-24.8}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(iN.VE, vE.VE) annotation (Line(
      points={{47.68,-79.48},{16,-79.48},{16,-54},{56.4,-54},{56.4,-25.64}},
      color={0,0,127},
      smooth=Smooth.None));

  connect(product1.u2, fEX.FEX) annotation (Line(
      points={{144.6,-33.2},{138,-33.2},{138,-85},{124.72,-85}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(product1.y, maxLimiter.u) annotation (Line(
      points={{160.7,-29},{173.8,-29}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(maxLimiter.y, product.u2) annotation (Line(
      points={{199.1,-29},{280,-29},{280,48.8},{290.6,48.8}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(pwVoltageCurrent.Vi, vE.Vi) annotation (Line(
      points={{-51.6,-20.5},{-40,-20.5},{-40,-20.6},{-20.4,-20.6}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(pwVoltageCurrent.Ir, vE.Ir) annotation (Line(
      points={{-51.6,-27.5},{-34.525,-27.5},{-34.525,-28.88},{-20.4,-28.88}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(pwVoltageCurrent.Ii, vE.Ii) annotation (Line(
      points={{-51.28,-35},{-35.37,-35},{-35.37,-37.52},{-20.4,-37.52}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(pwVoltageCurrent.Vr, vE.Vr) annotation (Line(
      points={{-51.6,-13.5},{-41.525,-13.5},{-41.525,-12.32},{-20.4,-12.32}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(pwVoltageCurrent.p, Gen_terminal) annotation (Line(
      points={{-82,-33},{-84,-33},{-84,98}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pwVoltageCurrent.n, Bus) annotation (Line(
      points={{-50,-3},{-42,-3},{-42,98},{214,98}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(limiter1.y, lV_Gate.n1) annotation (Line(
      points={{251,62},{260,62},{260,58.98},{267.3,58.98}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(V_OEL.y, lV_Gate.n2) annotation (Line(
      points={{244.6,28},{256,28},{256,54.14},{267.3,54.14}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(lV_Gate.p, product.u1) annotation (Line(
      points={{281.49,56.45},{285.745,56.45},{285.745,57.2},{290.6,57.2}},
      color={0,0,127},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false,extent={{-100,
            -160},{340,160}}), graphics={
        Text(
          extent={{70,76},{94,62}},
          lineColor={255,0,0},
          textString="VR"),
        Text(
          extent={{44,44},{50,34}},
          lineColor={255,0,0},
          textString="VH"),
        Text(
          extent={{116,-90},{142,-98}},
          lineColor={255,0,0},
          textString="FEX"),
        Text(
          extent={{66,-2},{90,-16}},
          lineColor={255,0,0},
          textString="VE"),
        Text(
          extent={{210,-4},{234,-18}},
          lineColor={255,0,0},
          textString="VB")}),  Icon(coordinateSystem(extent={{-100,-160},{340,
            160}},
          preserveAspectRatio=true), graphics={
        Text(
          extent={{-18,-10},{190,-106}},
          lineColor={0,0,255},
          textString="ESST4B"),
        Rectangle(extent={{-98,62},{228,-178}},lineColor={0,0,255}),
        Text(
          extent={{-88,8},{-22,-72}},
          lineColor={0,0,255},
          textString="ECOMP"),
        Text(
          extent={{-90,52},{-18,-32}},
          lineColor={0,0,255},
          textString="VOTHSG"),
        Text(
          extent={{-88,-88},{-38,-146}},
          lineColor={0,0,255},
          textString="XadIfd"),
        Text(
          extent={{-92,-150},{-34,-174}},
          lineColor={0,0,255},
          textString="EFD0"),
        Text(
          extent={{-84,-46},{-34,-104}},
          lineColor={0,0,255},
          textString="VUEL"),
        Text(
          extent={{-60,76},{-10,18}},
          lineColor={0,0,255},
          textString="GenT")}),
    Documentation(info="<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\">
<tr>
<td><p>Reference</p></td>
<td>PSS/E Manual</td>
</tr>
<tr>
<td><p>Last update</p></td>
<td>Unknown</td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p>Mengjia Zhang,SmarTS Lab, KTH Royal Institute of Technology</p></td>
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
end ESST4B;
