within iPSL.Electrical.Wind.DTU;
model IQLVRT
  "Selects the reactive current during fault and post fault. Developed by DTU"
  Modelica.Blocks.Interfaces.RealInput F_LVRT annotation (Placement(
        transformation(
        extent={{-5,-6},{5,6}},
        rotation=-90,
        origin={-40,56})));
  Modelica.Blocks.Interfaces.RealInput Fpost annotation (Placement(
        transformation(
        extent={{-5,-6},{5,6}},
        rotation=-90,
        origin={40,56})));
  Modelica.Blocks.Interfaces.RealInput iQstate annotation (Placement(
        transformation(
        extent={{-5,-6},{5,6}},
        rotation=0,
        origin={-46,30})));
  Modelica.Blocks.Interfaces.RealInput iQpost annotation (Placement(
        transformation(
        extent={{-5,-6},{5,6}},
        rotation=0,
        origin={-46,0})));
  Modelica.Blocks.Interfaces.RealInput iqv annotation (Placement(transformation(
        extent={{-5,-6},{5,6}},
        rotation=0,
        origin={-46,-30})));
  Modelica.Blocks.Interfaces.RealOutput iQcmd annotation (Placement(
        transformation(
        extent={{-5,-6},{5,6}},
        rotation=0,
        origin={44,0})));
equation
  iQcmd = if F_LVRT < 0.5 and Fpost < 0.5 then iQstate elseif F_LVRT < 0.5 and
    Fpost > 0.5 then iQpost + iQstate else iqv + iQstate;
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
            100,100}}), graphics),
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,
            100}}), graphics={Rectangle(
          extent={{-40,50},{40,-30}},
          lineColor={0,0,255},
          lineThickness=0.5),Text(
          extent={{-18,32},{20,0}},
          lineColor={0,0,255},
          lineThickness=0.5,
          fillPattern=FillPattern.Solid,
          textString="IQLVRT 
Mode")}),
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
end IQLVRT;

