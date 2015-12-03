within iPSL.Electrical.Controls.PSSE.ES.ST5B;


model SelectLogic
  "Selection of voltage signal depending on the Excitation limiters"
  Modelica.Blocks.Interfaces.RealInput V1
    annotation (Placement(transformation(extent={{-138,40},{-98,80}})));
  Modelica.Blocks.Interfaces.RealInput V2
    annotation (Placement(transformation(extent={{-138,-20},{-98,20}})));
  Modelica.Blocks.Interfaces.RealInput V3
    annotation (Placement(transformation(extent={{-138,-80},{-98,-40}})));
  Modelica.Blocks.Interfaces.RealInput VOEL annotation (Placement(
        transformation(
        extent={{-20,-20},{20,20}},
        rotation=270,
        origin={-60,96}), iconTransformation(
        extent={{-20,-20},{20,20}},
        rotation=270,
        origin={-60,112})));
  Modelica.Blocks.Interfaces.RealInput VUEL annotation (Placement(
        transformation(
        extent={{-20,-20},{20,20}},
        rotation=270,
        origin={0,96}), iconTransformation(
        extent={{-20,-20},{20,20}},
        rotation=270,
        origin={0,112})));
  Modelica.Blocks.Interfaces.RealInput VERR annotation (Placement(
        transformation(
        extent={{-20,-20},{20,20}},
        rotation=270,
        origin={60,96}), iconTransformation(
        extent={{-20,-20},{20,20}},
        rotation=270,
        origin={60,112})));
  Modelica.Blocks.Interfaces.RealOutput Vout
    annotation (Placement(transformation(extent={{100,10},{120,30}})));
equation
  Vout = if VOEL > 0 then V3 else if VUEL > 0 then V2 else V1;
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
            100}}), graphics),
    Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
            100}}), graphics={Text(
          extent={{-42,54},{38,-48}},
          lineColor={0,0,255},
          textString="Select
Logic"),Rectangle(extent={{-100,100},{100,-100}}, lineColor={0,0,255})}),
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
end SelectLogic;
