within iPSL.Electrical.Controls.Simulink.ES;


model ExcitationSystem "This ES is composed by the OEL and PSS and exitation part"
  parameter Real V0=1 "Reference value of terminal voltage";
  parameter Real L2=4 "Exciter parameter";
  parameter Real G=70 "Exciter parameter";
  parameter Real Ta=10 "Exciter parameter";
  parameter Real Tb=20 "Exciter parameter";
  parameter Real vfd0 "Initial Filed voltage";
  parameter Real r "OEL parameter";
  parameter Real f "OEL parameter";
  parameter Real L1 "OEL parameter";
  parameter Real ifd_lim "OEL parameter";
  parameter Real Kp "Washout gain";
  parameter Real Tw "Washout time constant";
  parameter Real T1 "Lead-lag filter time constant";
  parameter Real T2 "Lead-lag filter time constant";
  parameter Real C "PSS output limiation";
  iPSL.Electrical.Controls.Simulink.OEL.OEL oEL(
    init_OEL_Timer=0,
    ifd_lim=ifd_lim,
    r=r,
    f=f,
    L1=L1) annotation (Placement(transformation(extent={{-28,40},{20,76}})));
  Modelica.Blocks.Sources.Constant V_0(k=V0) "Reference terminal voltage " annotation (Placement(transformation(extent={{-88,34},{-70,52}})));
  Modelica.Blocks.Interfaces.RealInput ifd "Field current" annotation (Placement(transformation(extent={{-96,62},{-84,74}})));
  Modelica.Blocks.Interfaces.RealInput V "Terminal voltage " annotation (Placement(transformation(extent={{-96,22},{-84,34}})));
  Modelica.Blocks.Interfaces.RealInput omega "Speed" annotation (Placement(transformation(extent={{-96,-10},{-84,2}})));
  Modelica.Blocks.Interfaces.RealOutput vfd "Field voltage" annotation (Placement(transformation(extent={{128,22},{140,34}})));
  Modelica.Blocks.Math.Gain Ka(k=10) annotation (Placement(transformation(extent={{88,48},{100,60}})));
  Modelica.Blocks.Continuous.LimIntegrator imLimitedIntegrator(
    outMin=0,
    outMax=L2,
    k=1,
    y_start=vfd0,
    initType=Modelica.Blocks.Types.Init.InitialOutput) annotation (Placement(transformation(extent={{108,46},{124,62}})));
  iPSL.NonElectrical.Continuous.LeadLag tgr(
    K=G,
    T1=Ta,
    T2=Tb,
    y_start=vfd0) "Transient gain rudection" annotation (Placement(transformation(extent={{36,44},{56,64}})));
  iPSL.Electrical.Controls.Simulink.PSS.PSS pSS(
    Kp=Kp,
    Tw=Tw,
    T1=T1,
    T2=T2,
    C=C) annotation (Placement(transformation(extent={{-78,-28},{-44,14}})));
  Modelica.Blocks.Math.Feedback feedback annotation (Placement(transformation(extent={{62,44},{82,64}})));
  Modelica.Blocks.Math.Add3 add3_1(k2=-1) annotation (Placement(transformation(extent={{-46,18},{-26,38}})));
equation
  connect(oEL.ifd, ifd) annotation (Line(
      points={{-24.4,59.08},{-77.44,59.08},{-77.44,68},{-90,68}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(omega, pSS.omega) annotation (Line(
      points={{-90,-4},{-84,-4},{-84,-4.06},{-76.98,-4.06}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(imLimitedIntegrator.y, vfd) annotation (Line(points={{124.8,54},{134,54},{134,28}}, color={0,0,127}));
  connect(Ka.y, imLimitedIntegrator.u) annotation (Line(points={{100.6,54},{106.4,54},{106.4,54}}, color={0,0,127}));
  connect(oEL.OEL_output, tgr.u) annotation (Line(points={{16.16,54.4},{25.08,54.4},{25.08,54},{34,54}}, color={0,0,127}));
  connect(feedback.y, Ka.u) annotation (Line(points={{81,54},{86.8,54},{86.8,54}}, color={0,0,127}));
  connect(tgr.y, feedback.u1) annotation (Line(points={{57,54},{64,54},{64,54}}, color={0,0,127}));
  connect(feedback.u2, vfd) annotation (Line(points={{72,46},{72,40},{134,40},{134,28}}, color={0,0,127}));
  connect(V, add3_1.u2) annotation (Line(points={{-90,28},{-74,28},{-48,28}}, color={0,0,127}));
  connect(V_0.y, add3_1.u1) annotation (Line(points={{-69.1,43},{-48,43},{-48,36}}, color={0,0,127}));
  connect(pSS.Upss, add3_1.u3) annotation (Line(points={{-50.46,-4.48},{-48,-4.48},{-48,20}}, color={0,0,127}));
  connect(add3_1.y, oEL.VolContinput) annotation (Line(points={{-25,28},{-18,28},{-18,42},{-24.4,42},{-24.4,51.16}}, color={0,0,127}));
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{140,100}})),
    Icon(coordinateSystem(extent={{-100,-100},{140,100}}, preserveAspectRatio=false), graphics={Rectangle(extent={{-84,78},{128,-20}}, lineColor={0,0,255}),Text(
          extent={{-80,72},{-62,60}},
          lineColor={0,0,255},
          textString="ifd"),Text(
          extent={{-80,34},{-62,22}},
          lineColor={0,0,255},
          textString="V "),Text(
          extent={{-78,2},{-54,-12}},
          lineColor={0,0,255},
          textString="omega"),Text(
          extent={{106,36},{130,22}},
          lineColor={0,0,255},
          textString="vfd"),Text(
          extent={{-34,58},{88,0}},
          lineColor={0,0,255},
          textString="Exciter AVR OEL PSS")}),
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
end ExcitationSystem;
