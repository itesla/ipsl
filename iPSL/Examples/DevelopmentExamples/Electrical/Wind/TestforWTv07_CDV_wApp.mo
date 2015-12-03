within iPSL.Examples.DevelopmentExamples.Electrical.Wind;


model TestforWTv07_CDV_wApp "Developed by DTU"
  Modelica.Blocks.Sources.Constant imSetPoint1(k=0.9) annotation (Placement(transformation(extent={{-108,-44},{-88,-24}})));
  Modelica.Blocks.Sources.Constant imSetPoint5(k=1) annotation (Placement(transformation(extent={{-106,-20},{-94,-8}})));
  Modelica.Blocks.Sources.Constant imSetPoint6(k=0) annotation (Placement(transformation(extent={{-106,-30},{-86,-10}})));
  iPSL.Electrical.Buses.InfiniteBus2 infiniteBus(angle=0) annotation (Placement(transformation(extent={{34,-31},{14,-11}})));
  iPSL.Electrical.Wind.DTU.Type4B_WT_CDV type4B_WT_CDV annotation (Placement(transformation(extent={{-74,-50},{-4,6}})));
  Modelica.Blocks.Sources.Constant imSetPoint2(k=1) annotation (Placement(transformation(extent={{6,-52},{26,-32}})));
  Modelica.Blocks.Sources.Step step1(
    offset=0,
    height=-0.5,
    startTime=1) annotation (Placement(transformation(extent={{0,-72},{16,-56}})));
  Modelica.Blocks.Sources.Step step2(
    offset=0,
    height=0.5,
    startTime=2) annotation (Placement(transformation(extent={{0,-98},{16,-82}})));
  Modelica.Blocks.Math.Add3 add3_1 annotation (Placement(transformation(extent={{40,-60},{60,-40}})));
equation
  connect(imSetPoint5.y, type4B_WT_CDV.Uref) annotation (Line(
      points={{-93.4,-14},{-78,-14},{-78,-10.8},{-66.7941,-10.8}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(imSetPoint6.y, type4B_WT_CDV.Qref) annotation (Line(
      points={{-85,-20},{-78,-20},{-78,-22},{-66.7941,-22}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(infiniteBus.p, type4B_WT_CDV.WTG_terminal) annotation (Line(
      points={{13,-21},{2,-21},{2,-22},{-7.08824,-22}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(imSetPoint1.y, type4B_WT_CDV.Pref) annotation (Line(
      points={{-87,-34},{-78,-34},{-78,-33.2},{-66.7941,-33.2}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(imSetPoint2.y, add3_1.u1) annotation (Line(points={{27,-42},{38,-42},{38,-42}}, color={0,0,127}));
  connect(step1.y, add3_1.u2) annotation (Line(points={{16.8,-64},{30,-64},{30,-50},{38,-50}}, color={0,0,127}));
  connect(step2.y, add3_1.u3) annotation (Line(points={{16.8,-90},{34,-90},{34,-58},{38,-58}}, color={0,0,127}));
  connect(add3_1.y, infiniteBus.V) annotation (Line(points={{61,-50},{68,-50},{68,-48},{68,-21},{35,-21}}, color={0,0,127}));
  annotation (
    Diagram(coordinateSystem(extent={{-220,-160},{160,100}}, preserveAspectRatio=false)),
    Icon(coordinateSystem(extent={{-220,-160},{160,100}})),
    Documentation(info="<html>
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
end TestforWTv07_CDV_wApp;
