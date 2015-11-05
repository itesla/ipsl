within iPSL.Electrical.Wind.PSSE.WT3G;
model LVPL "Low voltage power logic"
parameter Real VLVPL1 "LVPL voltage 1 (Low voltage power logic)";
parameter Real VLVPL2 "LVPL voltage 2";
parameter Real GLVPL "LVPL gain";
parameter Real K=GLVPL/(VLVPL2-VLVPL1);
  Modelica.Blocks.Interfaces.RealInput Vt
    annotation (Placement(transformation(extent={{-112,-18},{-72,22}})));
  Modelica.Blocks.Interfaces.RealOutput LVPL
    annotation (Placement(transformation(extent={{90,-10},{110,10}})));
equation

if Vt< VLVPL1 then
  LVPL=0;
elseif Vt> VLVPL2 then
  LVPL=1e+6;
else
  LVPL=K*(Vt-VLVPL1);
end if;
  annotation (Diagram(coordinateSystem(preserveAspectRatio=true, extent={{
            -100,-100},{100,100}}), graphics={Rectangle(extent={{-78,30},{
              92,-58}}, lineColor={0,0,255})}), Icon(coordinateSystem(
          preserveAspectRatio=true, extent={{-100,-100},{100,100}}),
        graphics={
        Rectangle(extent={{-86,50},{92,-68}}, lineColor={0,0,255}),
        Line(
          points={{-36,-54},{22,16},{22,30},{22,30}},
          color={0,0,255},
          smooth=Smooth.None,
          thickness=0.5),
        Line(
          points={{52,-54},{-50,-54},{-50,40},{-48,36},{-54,36},{-50,40},{
              -50,40}},
          color={0,0,255},
          smooth=Smooth.None,
          thickness=0.5),
        Text(
          extent={{44,-40},{74,-58}},
          lineColor={0,0,255},
          lineThickness=0.5,
          fillColor={0,0,255},
          fillPattern=FillPattern.Solid,
          textString="V"),
        Text(
          extent={{-44,46},{-14,28}},
          lineColor={0,0,255},
          lineThickness=0.5,
          fillColor={0,0,255},
          fillPattern=FillPattern.Solid,
          textString="LVPL"),
        Line(
          points={{-56,12},{-44,12},{-44,12}},
          color={0,0,255},
          thickness=0.5,
          smooth=Smooth.None)}),
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
end LVPL;
