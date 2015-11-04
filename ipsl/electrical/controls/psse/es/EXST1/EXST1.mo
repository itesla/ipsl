within iPSL.Electrical.Controls.PSSE.ES.EXST1;
model EXST1 "IEEE Type AC2A Excitation System"
  parameter Real T_R=0.02;
  parameter Real V_IMAX=0.2;
  parameter Real V_IMIN=0;
  parameter Real T_C=1;
  parameter Real T_B=1;
  parameter Real K_A=80;
  parameter Real T_A=0.05;
  parameter Real V_RMAX=8;
  parameter Real V_RMIN=-3;
  parameter Real K_C=0.2;
  parameter Real K_F=0.1;
  parameter Real T_F=1;
protected
   parameter Real VREF(fixed=false);
   parameter Real Vm0(fixed=false);
   parameter Real Efd0(fixed=false);
public
  iPSL.NonElectrical.Continuous.ImLeadLag imLeadLag(
    K=1,
    T1=T_C,
    T2=T_B,
    nStartValue=Efd0/K_A)
    annotation (Placement(transformation(extent={{104,-48},{156,8}})));
  NonElectrical.Continuous.ImSimpleLag                       Vm(
      nStartValue=Vm0,
    K=1,
    T=T_R)
    annotation (Placement(transformation(
        extent={{-25,-19},{25,19}},
        rotation=0,
        origin={1,-23})));
  Modelica.Blocks.Interfaces.RealInput ECOMP
    annotation (Placement(transformation(extent={{-136,48},{-98,86}}),
        iconTransformation(extent={{-132,52},{-98,86}})));
  Modelica.Blocks.Sources.Constant V_REF(k=VREF)
    annotation (Placement(transformation(extent={{4,8},{16,20}})));
  Modelica.Blocks.Interfaces.RealInput XADIFD annotation (Placement(transformation(
        extent={{-19,-19},{19,19}},
        rotation=0,
        origin={-119,-69}), iconTransformation(extent={{-17,-17},{17,17}},
          origin={-115,-9})));
  Modelica.Blocks.Interfaces.RealOutput EFD
    annotation (Placement(transformation(extent={{280,-50},{300,-30}}),
        iconTransformation(extent={{280,-50},{300,-30}})));

  Modelica.Blocks.Interfaces.RealInput EFD0
                                           annotation (Placement(transformation(
        extent={{-17,-17},{17,17}},
        rotation=0,
        origin={-119,-179}),iconTransformation(extent={{-17,-17},{17,17}},
          origin={-39,-165},
        rotation=90)));
  Modelica.Blocks.Interfaces.RealInput ETERM annotation (Placement(transformation(
        extent={{-19,-19},{19,19}},
        rotation=0,
        origin={-117,31}),  iconTransformation(extent={{-17,-17},{17,17}},
          origin={-115,33})));
  Modelica.Blocks.Math.Add VERR(k1=-1, k2=1) annotation (Placement(
        transformation(
        extent={{-6,6},{6,-6}},
        rotation=0,
        origin={34,-20})));
  iPSL.NonElectrical.Math.ImSum3 imSum3_1(
    a0=0,
    a1=1,
    a2=1,
    a3=-1) annotation (Placement(transformation(extent={{46,-30},{66,-10}})));
  Modelica.Blocks.Nonlinear.Limiter limiter(uMax=V_IMAX, uMin=V_IMIN)
    annotation (Placement(transformation(extent={{78,-30},{98,-10}})));
  NonElectrical.Continuous.ImSimpleLag                        Vm1(
      nStartValue=Efd0,
    K=1,
    T=T_A)
    annotation (Placement(transformation(
        extent={{-16,-14},{16,14}},
        rotation=0,
        origin={192,-20})));
  Modelica.Blocks.Math.Gain K_a(k=K_A) annotation (Placement(transformation(
        extent={{-4,-4},{4,4}},
        rotation=0,
        origin={164,-20})));

protected
  Modelica.Blocks.Interfaces.RealOutput EFD1
    annotation (Placement(transformation(extent={{230,-30},{250,-10}}),
        iconTransformation(extent={{302,-64},{322,-44}})));

public
  Modelica.Blocks.Interfaces.RealInput VOTHSG annotation (Placement(
        transformation(extent={{-138,-52},{-98,-12}}),
        iconTransformation(extent={{-132,-68},{-98,-34}})));
  Modelica.Blocks.Interfaces.RealInput VOEL
    "Input from voltage over excitation limiter" annotation (
      Placement(transformation(extent={{-138,-110},{-98,-70}}),
        iconTransformation(extent={{-132,-104},{-98,-70}})));
  Modelica.Blocks.Interfaces.RealInput VUEL
    "Input from voltage under excitation limiter" annotation (
      Placement(transformation(extent={{-140,-158},{-100,-118}}),
        iconTransformation(extent={{-132,-142},{-98,-108}})));
  iPSL.NonElectrical.Math.ImSum3 imSum3_2(
    a0=0,
    a1=1,
    a2=1,
    a3=-1) annotation (Placement(transformation(extent={{-26,-128},{-6,-108}})));
  NonElectrical.Continuous.ImDerivativeLag imDerivativeLag(
    K=K_F,
    T=T_F,
    pStartValue=Efd0)
    annotation (Placement(transformation(extent={{142,-90},{122,-70}})));
initial equation
  Vm0=ECOMP;
  Efd0=EFD0;
  VREF=Efd0/K_A+Vm0;
equation
  if EFD> (ETERM*V_RMAX-K_C*XADIFD) then
    EFD=ETERM*V_RMAX-K_C*XADIFD;
  elseif EFD<(ETERM*V_RMIN-K_C*XADIFD) then
    EFD=ETERM*V_RMIN-K_C*XADIFD;
  else
    EFD=EFD1;
  end if;
  connect(ECOMP, Vm.p1) annotation (Line(
      points={{-117,67},{-8,67},{-8,-23},{-6.75,-23}},
      color={0,0,127},
      smooth=Smooth.None));

  connect(V_REF.y, VERR.u2) annotation (Line(
      points={{16.6,14},{24,14},{24,-16.4},{26.8,-16.4}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Vm.n1, VERR.u1) annotation (Line(
      points={{18.5,-23},{21.39,-23},{21.39,-23.6},{26.8,-23.6}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(VERR.y, imSum3_1.p2) annotation (Line(
      points={{40.6,-20},{50.9,-20}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(imSum3_1.n1, limiter.u) annotation (Line(
      points={{60.9,-20},{76,-20}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(limiter.y, imLeadLag.p1) annotation (Line(
      points={{99,-20},{116.74,-20}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(imLeadLag.n1, K_a.u) annotation (Line(
      points={{142.74,-20},{159.2,-20}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(K_a.y, Vm1.p1) annotation (Line(
      points={{168.4,-20},{187.04,-20}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Vm1.n1, EFD1) annotation (Line(
      points={{203.2,-20},{240,-20}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(VUEL, imSum3_2.p3) annotation (Line(
      points={{-120,-138},{-36,-138},{-36,-121},{-21.1,-121}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(VOTHSG, imSum3_2.p1) annotation (Line(
      points={{-118,-32},{-38,-32},{-38,-115},{-21.1,-115}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(VOEL, imSum3_2.p2) annotation (Line(
      points={{-118,-90},{-70,-90},{-70,-118},{-21.1,-118}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(imSum3_2.n1, imSum3_1.p1) annotation (Line(
      points={{-11.1,-118},{44,-118},{44,-17},{50.9,-17}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(imDerivativeLag.p1, EFD1) annotation (Line(points={{141.9,-80},{214,
          -80},{214,-20},{240,-20}}, color={0,0,127}));
  connect(imDerivativeLag.n1, imSum3_1.p3) annotation (Line(points={{121.9,-80},
          {92,-80},{92,-82},{48,-82},{48,-23},{50.9,-23}}, color={0,0,127}));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false,extent={{-120,
            -200},{300,100}}), graphics={
        Text(
          extent={{50,-2},{56,-12}},
          lineColor={255,0,0},
          textString="VS"),
        Text(
          extent={{24,0},{38,-16}},
          lineColor={255,0,0},
          textString="VERR")}),Icon(coordinateSystem(extent={{-120,
            -200},{300,100}},
          preserveAspectRatio=true), graphics={
        Text(
          extent={{28,-18},{188,-60}},
          lineColor={0,0,255},
          textString="EXST1"),
        Rectangle(extent={{-100,82},{280,-160}},
                                               lineColor={0,0,255}),
        Text(
          extent={{-90,100},{-30,38}},
          lineColor={0,0,255},
          textString="ECOMP"),
        Text(
          extent={{-88,24},{-28,-40}},
          lineColor={0,0,255},
          textString="XADIFD"),
        Text(
          extent={{-44,-124},{18,-146}},
          lineColor={0,0,255},
          textString="EFD0"),
        Text(
          extent={{-90,46},{-32,20}},
          lineColor={0,0,255},
          textString="ETERM"),
        Text(
          extent={{-92,-18},{-26,-82}},
          lineColor={0,0,255},
          textString="VOTHSG"),
        Text(
          extent={{-94,-52},{-48,-116}},
          lineColor={0,0,255},
          textString="VOEL"),
        Text(
          extent={{-94,-94},{-46,-156}},
          lineColor={0,0,255},
          textString="VUEL"),
        Text(
          extent={{238,-10},{274,-74}},
          lineColor={0,0,255},
          textString="EFD")}),
    Documentation(info="<html>
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
end EXST1;
