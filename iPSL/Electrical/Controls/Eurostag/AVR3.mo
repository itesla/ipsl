within iPSL.Electrical.Controls.Eurostag;
model AVR3 "Voltage regulator. Developed by AIA. 2013"
  parameter Real Kgain;
  parameter Real KE;
  parameter Real TE;
  parameter Real init_V1;
  parameter Real init_V2;
  Modelica.Blocks.Math.Gain imGain(k=Kgain)
    annotation (Placement(transformation(extent={{-2,18},{20,40}})));
  Modelica.Blocks.Interfaces.RealOutput pin_EFD annotation(Placement(transformation(extent = {{60, -10}, {79, 10}}), iconTransformation(extent = {{59, -10}, {79, 10}})));
  Modelica.Blocks.Interfaces.RealInput pin_TerminalVoltage annotation(Placement(transformation(extent = {{-61, -10}, {-41, 10}}), iconTransformation(extent = {{-61, -10}, {-41, 10}})));
  Modelica.Blocks.Sources.Constant imSetPoint(k=init_V1)
    annotation (Placement(transformation(extent={{-90,38},{-68,60}})));
  iPSL.NonElectrical.Continuous.SimpleLag imSimpleLag(
    K=KE,
    T=TE,
    y_start=init_V2)
    annotation (Placement(transformation(extent={{34,20},{52,38}})));
  Modelica.Blocks.Math.Add add1(k2=-1)
    annotation (Placement(transformation(extent={{-40,20},{-20,40}})));
equation
  connect(imGain.y, imSimpleLag.u) annotation (Line(points={{21.1,29},{26.55,29},
          {26.55,29},{32.2,29}}, color={0,0,127}));
  connect(imSimpleLag.y, pin_EFD) annotation (Line(points={{52.9,29},{80,29},{
          80,0},{69.5,0}}, color={0,0,127}));
  connect(add1.y, imGain.u)
    annotation (Line(points={{-19,30},{-4.2,30},{-4.2,29}}, color={0,0,127}));
  connect(imSetPoint.y, add1.u1) annotation (Line(points={{-66.9,49},{-50,49},{
          -50,36},{-42,36}}, color={0,0,127}));
  connect(add1.u2, pin_TerminalVoltage)
    annotation (Line(points={{-42,24},{-51,24},{-51,0}}, color={0,0,127}));
  annotation (                  Icon(graphics={  Rectangle(extent=  {{-40, 40}, {60, -40}}, lineColor=  {0, 0, 255}), Text(extent=  {{58, -10}, {-40, 12}}, lineColor=  {0, 0, 255}, textString=  "AVR3")}),
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
</html>"),
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
            100,100}})));
end AVR3;
