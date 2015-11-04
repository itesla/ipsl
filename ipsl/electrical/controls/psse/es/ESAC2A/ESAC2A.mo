within iPSL.Electrical.Controls.PSSE.ES.ESAC2A;
model ESAC2A "IEEE Type AC2A Excitation System"
  parameter Real T_R=0.1;
  parameter Real T_B=8;
  parameter Real T_C=19.99;
  parameter Real K_A=80;
  parameter Real T_A=0.01;
  parameter Real V_AMAX=8;
  parameter Real V_AMIN=-8;
  parameter Real K_B=25;
  parameter Real V_RMAX=15;
  parameter Real V_RMIN=-95;
  parameter Real T_E=0.2;
   parameter Real V_FEMAX=7;
   parameter Real K_H=1;
   parameter Real K_F=0.01;
   parameter Real T_F=1;
   parameter Real K_C=0.5;
   parameter Real K_D=0.35;
   parameter Real K_E=1;
   parameter Real E_1=4;
   parameter Real S_EE_1=0.4;
   parameter Real E_2=5;
   parameter Real S_EE_2=0.5;

protected
   parameter Real VREF(fixed=false);
   parameter Real Vm0(fixed=false);
   parameter Real VA0(fixed=false);
   parameter Real VFE0(fixed=false);
    parameter Real KCIFD0(fixed=false);
    parameter Real VE_0(fixed=false);

   function VE_ini
    input Real KCIFD0 "Psipp";
    input Real EFD0;
    output Real VE0;
   algorithm
    if KCIFD0 < 0 then
    VE0:=EFD0;
    elseif KCIFD0 >= 0 and KCIFD0 < 0.577*EFD0 then
    VE0:=EFD0+0.577*KCIFD0;
    elseif KCIFD0 >= 0.577*EFD0 and KCIFD0 < 1.732*EFD0 then
    VE0:=sqrt((EFD0^2+KCIFD0^2)/0.75);
    else
    VE0:=EFD0/1.732+KCIFD0;
    end if;
   end VE_ini;
public
  iPSL.NonElectrical.Continuous.ImLeadLag imLeadLag(
    K=1,
    T1=T_C,
    T2=T_B,
    nStartValue=VA0/K_A)
    annotation (Placement(transformation(extent={{-44,-20},{8,36}})));
  iPSL.NonElectrical.Math.ImSum2 imSum2_1(
    a0=0,
    a1=1,
    a2=-1) annotation (Placement(transformation(
        extent={{-9,10},{9,-10}},
        rotation=180,
        origin={21,-60})));
  iPSL.NonElectrical.Continuous.ImSimpleLag imSimpleLag(
    K=1,
    T=T_F,
    nStartValue=K_F*VFE0/T_F) annotation (Placement(transformation(
        extent={{23,-18},{-23,18}},
        rotation=0,
        origin={47,-74})));
  NonElectrical.Continuous.ImSimpleLag                        Vm(
      nStartValue=Vm0,
    K=1,
    T=T_R)
    annotation (Placement(transformation(
        extent={{-22,-19},{22,19}},
        rotation=0,
        origin={-72,9})));
  NonElectrical.Functions.ImSE
     se1(
    SE1=S_EE_1,
    SE2=S_EE_2,
    E1=E_1,
    E2=E_2)                                      annotation(Placement(transformation(extent={{-2,-2},
            {2,2}},                                                                                                 rotation = 180, origin={186,-54})));
  Modelica.Blocks.Math.Product VX annotation(Placement(transformation(extent={{-3,-3},
            {3,3}},                                                                                rotation = 180, origin={177,-51})));
  NonElectrical.Continuous.ImSimpleLag_nowinduplimit
                VR1(
    nStartValue=VA0,
    Ymin=V_AMIN,
    Ymax=V_AMAX,
    K=K_A,
    T=T_A)                                                                          annotation(Placement(transformation(extent={{-8,-16},
            {44,32}})));
  Modelica.Blocks.Math.Gain imGain1(k=K_F/T_F)  annotation(Placement(transformation(extent={{-4,-4},
            {4,4}},                                                                                              rotation=180,   origin={100,-62})));
  iPSL.NonElectrical.Math.ImSum4 imSum4_1(
    a0=0,
    a1=1,
    a2=-1,
    a3=1,
    a4=-1) annotation (Placement(transformation(extent={{-56,-4},{-32,20}})));
  Modelica.Blocks.Interfaces.RealInput ECOMP
    annotation (Placement(transformation(extent={{-134,22},{-96,60}}),
        iconTransformation(extent={{-134,22},{-96,60}})));
  Modelica.Blocks.Interfaces.RealInput VOTHSG annotation (Placement(
        transformation(extent={{-134,64},{-96,102}}),iconTransformation(extent={{-134,64},
            {-96,102}})));
  Modelica.Blocks.Sources.Constant V_REF(k=VREF)
    annotation (Placement(transformation(extent={{-80,-18},{-68,-6}})));
  Modelica.Blocks.Math.Add               imSum2_2(k1=-1, k2=1)             annotation(Placement(transformation(extent={{-4,4},{
            4,-4}},                                                                                                    rotation=0,     origin={42,6})));
  Modelica.Blocks.Math.Gain K_b(k=K_B)
                                      annotation (Placement(transformation(
        extent={{-4,-4},{4,4}},
        rotation=0,
        origin={58,6})));
  NonElectrical.Logical.HV_GATE
          hV_Gate
    annotation (Placement(transformation(extent={{74,-8},{98,26}})));
  NonElectrical.Logical.LV_GATE
          lV_Gate
    annotation (Placement(transformation(extent={{98,-14},{118,16}})));
  iPSL.NonElectrical.Continuous.ImLimited imLimited(Ymin=V_RMIN, Ymax=V_RMAX)
    annotation (Placement(transformation(extent={{120,-8},{136,8}})));
  iPSL.NonElectrical.Math.ImSum2 imSum2_3(
    a0=0,
    a1=1,
    a2=-1) annotation (Placement(transformation(
        extent={{-8,-9},{8,9}},
        rotation=0,
        origin={146,1})));
  Modelica.Blocks.Math.Gain imGain3(k=K_H)      annotation(Placement(transformation(extent={{-4,-4},
            {4,4}},                                                                                              rotation=180,   origin={60,-44})));
  NonElectrical.Continuous.ImIntegrator_adpt
                    imIntegrator_adpt(
    nStartValue=VE_0,
    TE=T_E,
    VFEMAX=V_FEMAX,
    KD=K_D,
    KE=K_E,
    E1=E_1,
    SE1=S_EE_1,
    E2=E_2,
    SE2=S_EE_2)
             annotation (Placement(transformation(extent={{152,-10},{190,14}})));
  Modelica.Blocks.Math.Gain imGain2(k=K_E)      annotation(Placement(transformation(extent={{-3,-3},
            {3,3}},                                                                                              rotation=180,   origin={179,-65})));
  iPSL.NonElectrical.Math.ImSum2 imSum2_4(
    a0=0,
    a1=1,
    a2=1) annotation (Placement(transformation(
        extent={{-4,6},{4,-6}},
        rotation=180,
        origin={166,-62})));
  iPSL.NonElectrical.Math.ImSum2 imSum2_5(
    a0=0,
    a1=1,
    a2=1) annotation (Placement(transformation(
        extent={{-6,8},{6,-8}},
        rotation=180,
        origin={156,-62})));
  Modelica.Blocks.Math.Gain imGain4(k=K_D)      annotation(Placement(transformation(extent={{-3,-3},
            {3,3}},                                                                                              rotation=180,   origin={179,-77})));
  Modelica.Blocks.Interfaces.RealInput XADIFD annotation (Placement(transformation(
        extent={{-19,-19},{19,19}},
        rotation=0,
        origin={-119,-93}), iconTransformation(extent={{-17,-17},{17,17}},
          origin={-117,-1})));
  NonElectrical.Logical.IN
     iN(       nStartValue=KCIFD0/VE_0, KC=K_C)
               annotation (Placement(transformation(
        extent={{-12,-19},{12,19}},
        rotation=90,
        origin={209,-30})));
  NonElectrical.Nonlinear.ImFEX
      fEX annotation (Placement(transformation(extent={{208,-28},{246,4}})));
  Modelica.Blocks.Math.Product product
    annotation (Placement(transformation(extent={{254,-8},{266,4}})));
  Modelica.Blocks.Interfaces.RealOutput EFD
    annotation (Placement(transformation(extent={{302,-64},{322,-44}}),
        iconTransformation(extent={{302,-64},{322,-44}})));

  Modelica.Blocks.Interfaces.RealInput EFD0
                                           annotation (Placement(transformation(
        extent={{-17,-17},{17,17}},
        rotation=90,
        origin={-61,-207}), iconTransformation(extent={{-17,-17},{17,17}},
          origin={-117,-213})));
  Modelica.Blocks.Interfaces.RealInput VOEL
                                           annotation (Placement(transformation(
        extent={{-19,-19},{19,19}},
        rotation=0,
        origin={-117,-45}), iconTransformation(extent={{-17,-17},{17,17}},
          origin={-115,-43})));
  Modelica.Blocks.Interfaces.RealInput VUEL
                                           annotation (Placement(transformation(
        extent={{-19,-19},{19,19}},
        rotation=0,
        origin={-117,-145}),iconTransformation(extent={{-17,-17},{17,17}},
          origin={-115,-85})));
initial equation
   Vm0=EFD0;
   VREF=VA0/K_A+EFD0;
   KCIFD0=K_C*XADIFD;
   VE_0=VE_ini(KCIFD0,EFD0);
  VFE0 = VE_0*(iPSL.NonElectrical.Functions.SE(
    VE_0,
    S_EE_1,
    S_EE_2,
    E_1,
    E_2) + K_E) + K_D*XADIFD;
   VA0=VFE0*(1/K_B+K_H);

equation
  connect(imSimpleLag.n1,imSum2_1. p2) annotation(Line(points={{30.9,
          -74},{28,-74},{28,-62},{25.59,-62}},                                                                     color = {0, 0, 127}, smooth = Smooth.None));
  connect(imLeadLag.n1, VR1.p1) annotation (Line(
      points={{-5.26,8},{4.74,8}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(imSum4_1.n1, imLeadLag.p1) annotation (Line(
      points={{-38.12,8},{-31.26,8}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(ECOMP, Vm.p1) annotation (Line(
      points={{-115,41},{-102,41},{-102,9},{-78.82,9}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(VOTHSG, imSum4_1.p1) annotation (Line(
      points={{-115,83},{-52,83},{-52,11.84},{-50.12,11.84}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Vm.n1, imSum4_1.p2) annotation (Line(
      points={{-56.6,9},{-55.61,9},{-55.61,8.96},{-50.12,8.96}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(V_REF.y, imSum4_1.p3) annotation (Line(
      points={{-67.4,-12},{-58,-12},{-58,6.32},{-50.12,6.32}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(imSum2_1.n1, imSum4_1.p4) annotation (Line(
      points={{16.59,-60},{-54,-60},{-54,3.68},{-50.12,3.68}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(imSum2_4.p2, imGain2.y) annotation (Line(
      points={{168.04,-63.2},{172,-63.2},{172,-65},{175.7,-65}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(imSum2_4.p1,VX. y) annotation (Line(
      points={{168.04,-60.8},{170,-60.8},{170,-51},{173.7,-51}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(imSum2_5.p1, imSum2_4.n1) annotation (Line(
      points={{159.06,-60.4},{162.02,-60.4},{162.02,-62},{164.04,-62}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(imGain4.y, imSum2_5.p2) annotation (Line(
      points={{175.7,-77},{159.06,-77},{159.06,-63.6}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(XADIFD, iN.IFD) annotation (Line(
      points={{-119,-93},{214,-93},{214,-36.12},{213.94,-36.12}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(imGain4.u, iN.IFD) annotation (Line(
      points={{182.6,-77},{214,-77},{214,-36.12},{213.94,-36.12}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(fEX.FEX, product.u2) annotation (Line(
      points={{239.92,-12},{252.8,-12},{252.8,-5.6}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(imIntegrator_adpt.IFD, iN.IFD) annotation (Line(
      points={{161.69,-4.12},{146,-4.12},{146,-92},{214,-92},{214,-36.12},{213.94,
          -36.12}},
      color={0,0,127},
      smooth=Smooth.None));

  connect(product.y, EFD) annotation (Line(
      points={{266.6,-2},{290,-2},{290,-54},{312,-54}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(imSum2_1.p1, imGain1.y) annotation (Line(
      points={{25.59,-58},{82,-58},{82,-62},{95.6,-62}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(imSimpleLag.p1, imGain1.y) annotation (Line(
      points={{54.13,-74},{82,-74},{82,-62},{95.6,-62}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(iN.I_N, fEX.IN) annotation (Line(
      points={{209,-24.12},{209,-12},{215.6,-12}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(imIntegrator_adpt.VE, product.u1) annotation (Line(
      points={{180.31,2},{252.8,2},{252.8,1.6}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(imIntegrator_adpt.VE,VX. u2) annotation (Line(
      points={{180.31,2},{192,2},{192,-49.2},{180.6,-49.2}},
      color={0,0,127},
      smooth=Smooth.None));

  connect(imSum2_3.n1, imIntegrator_adpt.p1) annotation (Line(
      points={{149.92,1},{154.96,1},{154.96,1.88},{161.025,1.88}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(imLimited.n1, imSum2_3.p1) annotation (Line(
      points={{131.92,0},{140,0},{140,2.8},{141.92,2.8}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(imSum2_3.p2, imGain1.u) annotation (Line(
      points={{141.92,-0.8},{141.92,-62},{104.8,-62}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(imGain3.u, imGain1.u) annotation (Line(
      points={{64.8,-44},{142,-44},{142,-62},{104.8,-62}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(imSum2_5.n1, imGain1.u) annotation (Line(
      points={{153.06,-62},{104.8,-62}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(VR1.n0, imSum2_2.u2) annotation (Line(
      points={{30.74,8},{32,8},{32,8.4},{37.2,8.4}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(imSum2_2.y, K_b.u) annotation (Line(
      points={{46.4,6},{53.2,6}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(imSum2_2.u1, imGain3.y) annotation (Line(
      points={{37.2,3.6},{34,3.6},{34,-44},{55.6,-44}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(imGain2.u, product.u1) annotation (Line(
      points={{182.6,-65},{192,-65},{192,2},{254,2},{254,1.6},{252.8,1.6}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(iN.VE, product.u1) annotation (Line(
      points={{204.44,-36.12},{204.44,-64},{200,-64},{200,2},{254,2},{254,1.6},{
          252.8,1.6}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(se1.VE_IN, product.u1) annotation (Line(
      points={{188.1,-53.98},{192,-53.98},{192,2},{254,2},{254,1.6},{252.8,1.6}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(K_b.y, hV_Gate.n1) annotation (Line(
      points={{62.4,6},{70,6},{70,12.06},{77.6,12.06}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(VUEL, hV_Gate.n2) annotation (Line(
      points={{-117,-145},{74.5,-145},{74.5,4.58},{77.6,4.58}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(lV_Gate.p, imLimited.p1) annotation (Line(
      points={{113.9,0.25},{118.95,0.25},{118.95,0},{123.92,0}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(hV_Gate.p, lV_Gate.n1) annotation (Line(
      points={{93.08,8.15},{96.54,8.15},{96.54,3.7},{101,3.7}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(lV_Gate.n2, VOEL) annotation (Line(
      points={{101,-2.9},{96.5,-2.9},{96.5,-45},{-117,-45}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(VX.u1, se1.VE_OUT) annotation (Line(
      points={{180.6,-52.8},{183.3,-52.8},{183.3,-53.98},{183.9,-53.98}},
      color={0,0,127},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,
            -200},{300,100}}), graphics={                                                                                                    Text(extent={{
              162,-44},{190,-48}},                                                                                                lineColor=
              {0,0,255},
          textString="VX=SE*VE"),
        Text(
          extent={{32,20},{38,10}},
          lineColor={255,0,0},
          textString="VA"),
        Text(
          extent={{-48,-6},{-42,-16}},
          lineColor={255,0,0},
          textString="VF"),
        Text(
          extent={{44,-6},{50,-16}},
          lineColor={255,0,0},
          textString="VH"),
        Text(
          extent={{140,18},{146,8}},
          lineColor={255,0,0},
          textString="VR"),
        Text(
          extent={{176,18},{182,8}},
          lineColor={255,0,0},
          textString="VE"),
        Text(
          extent={{164,-50},{168,-58}},
          lineColor={255,0,0},
          textString="VX"),
        Text(
          extent={{156,-68},{166,-76}},
          lineColor={255,0,0},
          textString="VFE"),
        Text(
          extent={{202,-14},{208,-24}},
          lineColor={255,0,0},
          textString="I_N"),
        Text(
          extent={{224,-24},{250,-32}},
          lineColor={255,0,0},
          textString="FEX")}), Icon(coordinateSystem(extent={{-100,-200},{300,100}},
          preserveAspectRatio=true), graphics={
        Text(
          extent={{32,-2},{240,-98}},
          lineColor={0,0,255},
          textString="ESAC2A"),
        Rectangle(extent={{-98,92},{298,-222}},lineColor={0,0,255}),
        Text(
          extent={{-90,80},{-24,0}},
          lineColor={0,0,255},
          textString="ECOMP"),
        Text(
          extent={{-90,122},{-24,42}},
          lineColor={0,0,255},
          textString="VOTHSG"),
        Text(
          extent={{-88,32},{-28,-32}},
          lineColor={0,0,255},
          textString="XadIfd"),
        Text(
          extent={{-96,-198},{-32,-224}},
          lineColor={0,0,255},
          textString="EFD0"),
        Text(
          extent={{-86,-10},{-26,-74}},
          lineColor={0,0,255},
          textString="VOEL"),
        Text(
          extent={{-88,-52},{-28,-116}},
          lineColor={0,0,255},
          textString="VUEL")}),
    Documentation(info="<html>
<p><br><span style=\"font-family: MS Shell Dlg 2;\">&LT;iPSL: iTesla Power System Library&GT;</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Copyright 2015 RTE (France), AIA (Spain), KTH (Sweden) and DTU (Denmark)</span></p>
<ul>
<li><span style=\"font-family: MS Shell Dlg 2;\">RTE: http://www.rte-france.com/ </span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">AIA: http://www.aia.es/en/energy/</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">KTH: https://www.kth.se/en</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">DTU:http://www.dtu.dk/english</span></li>
</ul>
<p><span style=\"font-family: MS Shell Dlg 2;\">The authors can be contacted by email: info at ipsl dot org</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">This package is part of the iTesla Power System Library (&QUOT;iPSL&QUOT;) .</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is free software: you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">You should have received a copy of the GNU Lesser General Public License along with the iPSL. If not, see &LT;http://www.gnu.org/licenses/&GT;.</span></p>
</html>"));
end ESAC2A;
