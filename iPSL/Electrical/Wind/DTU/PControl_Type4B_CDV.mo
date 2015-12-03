within iPSL.Electrical.Wind.DTU;


model PControl_Type4B_CDV "Active Power Control for IEC Type4B Model. Developed by DTU"
  parameter Real w_init "Initial steady state generator speed";
  parameter Real T_Ufilt "Voltage measurement filter time constant";
  parameter Real dPmax "Wind turbine maximum power ramp rate";
  parameter Real ini_Pcmd(fixed=false) "Initial Active Power";
  parameter Real ini_Uwtt(fixed=false) "Initial Voltage Magnitude";
  parameter Real ini_iPcmd(fixed=false) "Initial Active Current Magnitude";
  parameter Real Tpord "Time constant in power order lag";
  parameter Real Tpaero "Time constant in aerodynamic power response";
  Modelica.Blocks.Interfaces.RealInput iPmax annotation (Placement(transformation(extent={{-61,5},{-51,15}}), iconTransformation(extent={{-61,5},{-51,15}})));
  Modelica.Blocks.Interfaces.RealInput Uwtt annotation (Placement(transformation(extent={{-61,27},{-51,37}}), iconTransformation(extent={{-61,27},{-51,37}})));
  Modelica.Blocks.Interfaces.RealInput w_gen annotation (Placement(transformation(extent={{-61,-15},{-51,-5}}), iconTransformation(extent={{-61,-15},{-51,-5}})));
  Modelica.Blocks.Interfaces.RealInput Pwtt_ref annotation (Placement(transformation(extent={{-61,-37},{-51,-27}}), iconTransformation(extent={{-61,-37},{-51,-27}})));
  Modelica.Blocks.Interfaces.RealOutput iPcmd annotation (Placement(transformation(extent={{39,-5},{49,5}}), iconTransformation(extent={{39,-5},{49,5}})));
  iPSL.NonElectrical.Continuous.SimpleLag imSimpleLag(
    K=1,
    T=T_Ufilt,
    y_start=ini_Uwtt) annotation (Placement(transformation(extent={{-32,33},{-18,48}})));
  Modelica.Blocks.Math.Gain imGain(k=1/w_init) annotation (Placement(transformation(extent={{-42,-50},{-28,-36}})));
  Modelica.Blocks.Nonlinear.Limiter imLimiter(uMin=0.01, uMax=999) annotation (Placement(transformation(extent={{-8,36},{2,46}})));
  Modelica.Blocks.Sources.Constant imSetPoint(k=-999) annotation (Placement(transformation(extent={{12,-56},{24,-44}})));
  iPSL.NonElectrical.Continuous.SimpleLagRateLimVar imSimpleLag_varnonwindup(
    y_start=ini_Pcmd,
    rmin=-999,
    rmax=dPmax,
    T=Tpord) annotation (Placement(transformation(extent={{30,-46},{44,-32}})));
  iPSL.NonElectrical.Continuous.SimpleLag imSimpleLag1(
    K=1,
    y_start=ini_Pcmd,
    T=Tpaero) annotation (Placement(transformation(extent={{64,-74},{72,-66}})));
  Modelica.Blocks.Interfaces.RealOutput imPin annotation (Placement(transformation(
        extent={{-5,-6},{5,6}},
        rotation=-90,
        origin={-1,-36})));
  Modelica.Blocks.Math.Division division annotation (Placement(transformation(extent={{22,-6},{34,6}})));
  Modelica.Blocks.Math.Product product annotation (Placement(transformation(extent={{-32,10},{-18,24}})));
  Modelica.Blocks.Math.Product product1 annotation (Placement(transformation(extent={{-22,-46},{-8,-32}})));
initial equation
  ini_Uwtt = Uwtt;
  ini_Pcmd = Pwtt_ref;
equation
  connect(iPcmd, iPcmd) annotation (Line(
      points={{44,0},{44,0}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(imSetPoint.y, imSimpleLag_varnonwindup.outMin) annotation (Line(points={{24.6,-50},{32,-50},{31.4,-50},{31.4,-48.8}}, color={0,0,127}));
  connect(imSimpleLag1.y, imPin) annotation (Line(points={{72.4,-70},{80,-70},{80,-80},{-1,-80},{-1,-36}}, color={0,0,127}));
  connect(division.u1, imSimpleLag_varnonwindup.y) annotation (Line(points={{20.8,3.6},{12,3.6},{12,-14},{60,-14},{60,-39},{44.7,-39}}, color={0,0,127}));
  connect(imSimpleLag1.u, imSimpleLag_varnonwindup.y) annotation (Line(points={{63.2,-70},{60,-70},{60,-39},{44.7,-39}}, color={0,0,127}));
  connect(imLimiter.y, division.u2) annotation (Line(points={{2.5,41},{14,41},{14,-3.6},{20.8,-3.6}}, color={0,0,127}));
  connect(division.y, iPcmd) annotation (Line(points={{34.6,0},{44,0},{44,0}}, color={0,0,127}));
  connect(imSimpleLag.y, imLimiter.u) annotation (Line(points={{-17.3,40.5},{-12.65,40.5},{-12.65,41},{-9,41}}, color={0,0,127}));
  connect(imSimpleLag.u, Uwtt) annotation (Line(points={{-33.4,40.5},{-56,40.5},{-56,32}}, color={0,0,127}));
  connect(product.u1, Uwtt) annotation (Line(points={{-33.4,21.2},{-40,21.2},{-40,32},{-56,32}}, color={0,0,127}));
  connect(iPmax, product.u2) annotation (Line(points={{-56,10},{-40,10},{-40,12.8},{-33.4,12.8}}, color={0,0,127}));
  connect(product.y, imSimpleLag_varnonwindup.outMax) annotation (Line(points={{-17.3,17},{-4,17},{-4,-22},{42.6,-22},{42.6,-29.2}}, color={0,0,127}));
  connect(product1.y, imSimpleLag_varnonwindup.u) annotation (Line(points={{-7.3,-39},{12,-39},{28.6,-39}}, color={0,0,127}));
  connect(w_gen, product1.u1) annotation (Line(points={{-56,-10},{-28,-10},{-28,-34.8},{-23.4,-34.8}}, color={0,0,127}));
  connect(imGain.y, product1.u2) annotation (Line(points={{-27.3,-43},{-25.65,-43},{-25.65,-43.2},{-23.4,-43.2}}, color={0,0,127}));
  connect(Pwtt_ref, imGain.u) annotation (Line(points={{-56,-32},{-48,-32},{-48,-43},{-43.4,-43}}, color={0,0,127}));
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}})),
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics={Rectangle(
          extent={{-50,32},{40,-32}},
          lineColor={0,0,255},
          lineThickness=0.5),Text(
          extent={{-26,14},{18,-10}},
          lineColor={0,0,255},
          lineThickness=0.5,
          fillPattern=FillPattern.Solid,
          textString="Type 4B
P Control"),Text(
          extent={{-50,30},{-30,24}},
          lineColor={0,0,255},
          textString="Uwtt"),Text(
          extent={{-49,13},{-29,7}},
          lineColor={0,0,255},
          textString="iPmax"),Text(
          extent={{-49,-6},{-29,-12}},
          lineColor={0,0,255},
          textString="w_gen"),Text(
          extent={{-47,-24},{-27,-30}},
          lineColor={0,0,255},
          textString="Pwtt_ref"),Text(
          extent={{20,3},{40,-3}},
          lineColor={0,0,255},
          textString="iPcmd")}),
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
end PControl_Type4B_CDV;
