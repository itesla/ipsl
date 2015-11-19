within iPSL.Examples.Compliance.Electrical.Wind;
model TestforWTv07_CDV_wApp "Developed by DTU"

  iPSL.NonElectrical.Math.ImSetPoint imSetPoint1(V=0.9)
    annotation (Placement(transformation(extent={{-106,-44},{-86,-24}})));
  iPSL.NonElectrical.Math.ImSetPoint imSetPoint5(V=1)
    annotation (Placement(transformation(extent={{-106,-20},{-86,0}})));
  iPSL.NonElectrical.Math.ImSetPoint imSetPoint6(V=0)
    annotation (Placement(transformation(extent={{-106,-30},{-86,-10}})));
  iPSL.Electrical.Buses.InfiniteBus2 infiniteBus(angle=0)
    annotation (Placement(transformation(extent={{34,-31},{14,-11}})));
  iPSL.Electrical.Wind.DTU.Type4B_WT_CDV type4B_WT_CDV
    annotation (Placement(transformation(extent={{-74,-50},{-4,6}})));
  iPSL.NonElectrical.Math.ImSetPoint imSetPoint2(V=1)
    annotation (Placement(transformation(extent={{6,-52},{26,-32}})));
  Modelica.Blocks.Sources.Step step1(offset = 0, height = -0.5, startTime = 1) annotation(Placement(transformation(extent = {{0, -72}, {16, -56}})));
  Modelica.Blocks.Sources.Step step2(offset = 0, height = 0.5, startTime = 2) annotation(Placement(transformation(extent = {{0, -98}, {16, -82}})));
  iPSL.NonElectrical.Math.ImSum2 imSum2_2(
    a0=0,
    a1=1,
    a2=1) annotation (Placement(transformation(extent={{32,-84},{52,-64}})));
  iPSL.NonElectrical.Math.ImSum2 imSum2_3(
    a0=0,
    a1=1,
    a2=1) annotation (Placement(transformation(extent={{52,-52},{72,-32}})));
equation
  connect(imSetPoint5.n1, type4B_WT_CDV.Uref) annotation(Line(points={{-91.1,
          -10},{-78,-10},{-78,-10.8},{-66.7941,-10.8}},                                                                             color = {0, 0, 127}, smooth = Smooth.None));
  connect(imSetPoint6.n1, type4B_WT_CDV.Qref) annotation(Line(points={{-91.1,
          -20},{-78,-20},{-78,-22},{-66.7941,-22}},                                                                             color = {0, 0, 127}, smooth = Smooth.None));
  connect(infiniteBus.p, type4B_WT_CDV.WTG_terminal) annotation(Line(points={{13,-21},
          {2,-21},{2,-22},{-7.08824,-22}},                                                                                      color = {0, 0, 255}, smooth = Smooth.None));
  connect(imSum2_2.n1, imSum2_3.p2) annotation(Line(points = {{46.9, -74}, {52, -74}, {52, -44}, {56.9, -44}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(imSetPoint2.n1, imSum2_3.p1) annotation(Line(points = {{20.9, -42}, {38, -42}, {38, -40}, {56.9, -40}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(imSetPoint1.n1, type4B_WT_CDV.Pref) annotation(Line(points={{-91.1,
          -34},{-78,-34},{-78,-33.2},{-66.7941,-33.2}},                                                                             color = {0, 0, 127}, smooth = Smooth.None));
  connect(infiniteBus.V, imSum2_3.n1) annotation (Line(points={{35,-21},{74,
          -21},{74,-42},{66.9,-42}}, color={0,0,127}));
  connect(step2.y, imSum2_2.p2) annotation (Line(points={{16.8,-90},{32,-90},{
          32,-76},{36.9,-76}}, color={0,0,127}));
  connect(step1.y, imSum2_2.p1) annotation (Line(points={{16.8,-64},{24,-64},{
          32,-64},{32,-72},{36.9,-72}}, color={0,0,127}));
  annotation(Diagram(coordinateSystem(extent={{-220,-160},{160,100}},      preserveAspectRatio=false)),             Icon(coordinateSystem(extent = {{-220, -160}, {160, 100}})),
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
