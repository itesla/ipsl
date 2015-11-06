within iPSL.Electrical.Wind.GE.Type_3.Electrical_Control;
model lim_exc_s1
  extends Modelica.Blocks.Interfaces.BlockIcon;
  parameter Real xiqmin = 1;
  parameter Real xiqmax = 1;
  parameter Real typpe = 1;
  Modelica.Blocks.Interfaces.RealInput Efd "Input: Excitation voltage" annotation(Placement(transformation(extent = {{-140.0, 40.0}, {-100.0, 80.0}}, rotation = 0, origin = {0.0, 18.0}), visible = true, iconTransformation(origin = {0.0, 0.0}, extent = {{-140.0, 40.0}, {-100.0, 80.0}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput Vt "Terminal Voltage" annotation(Placement(transformation(extent = {{-140.0, -80.0}, {-100.0, -40.0}}, rotation = 0, origin = {0.0, -18.0}), visible = true, iconTransformation(origin = {0.0, 0.0}, extent = {{-140.0, -80.0}, {-100.0, -40.0}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput y
    "Output: saturated excitation voltage"                                       annotation(Placement(transformation(extent = {{100, -10}, {120, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput Vref "Reference Voltage " annotation(Placement(visible = true, transformation(origin = {0.0, -58.0}, extent = {{-140.0, 40.0}, {-100.0, 80.0}}, rotation = 0), iconTransformation(origin = {0.0, -58.0717}, extent = {{-140.0, 40.0}, {-100.0, 80.0}}, rotation = 0)));
equation
  if typpe == 1 then
    if Efd >= Vt + xiqmax and Vref >= 0 or Efd <= Vt + xiqmin and Vref <= 0 then
      y = 0;
    else
      y = Vref;
    end if;
  elseif typpe == 2 then
    if Vref >= Vt + xiqmax then
      y = Vt + xiqmax;
    elseif Vref <= Vt + xiqmin then
      y = Vt + xiqmin;
    else
      y = Vref;
    end if;
  else
    y = 0;
  end if;
  annotation(Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics={  Text(visible=  true, origin=  {-1.349, 1.6286},
            fillPattern=                                                                                                    FillPattern.Solid, extent=  {{-55.1519, -28.3714}, {55.1519, 28.3714}}, textString=  "lim_exc_s1", fontName=  "Arial")}), Documentation(info="<html>
<p>
Block has two continuous Real input vectors u1 and u2 and one
continuous Real output vector y.
All vectors have the same number of elements.
</p>
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
    Diagram(coordinateSystem(
        preserveAspectRatio=true,
        extent={{-100,-100},{100,100}},
        grid={2,2}), graphics));
end lim_exc_s1;
