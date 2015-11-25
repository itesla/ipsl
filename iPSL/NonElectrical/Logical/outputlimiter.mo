within iPSL.NonElectrical.Logical;
model outputlimiter
  parameter Real VCU "Output Limits";
  parameter Real VCL "Output Limits";
  Boolean switch;
  Modelica.Blocks.Interfaces.RealInput VSS annotation(Placement(transformation(extent = {{-120, -18}, {-80, 22}}), iconTransformation(extent = {{-118, -10}, {-100, 8}})));
  Modelica.Blocks.Interfaces.RealOutput VOTHSGO annotation(Placement(transformation(extent = {{90, -24}, {130, 16}}), iconTransformation(extent = {{98, -8}, {114, 8}})));
equation
  switch = if VSS>VCU or VSS<VCL then false else true;
  if switch == true then
    VOTHSGO = VSS;
  else
    VOTHSGO = 0;
  end if;
  annotation(Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics), Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics={  Text(extent = {{-68, 58}, {62, -88}}, lineColor = {0, 0, 255}, textString = "Vs=VSS, if(VCU>VCT>VCL)
Vs=0, if(VCT>VCU)
Vs=0, if(VCT<VCL)
"),     Text(
          extent={{-68,58},{60,42}},
                lineColor={0,0,255},
                textString="Output Limiter"),Rectangle(extent={{-100,42},
          {98,-60}}, lineColor={0,0,255})}),
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
end outputlimiter;
