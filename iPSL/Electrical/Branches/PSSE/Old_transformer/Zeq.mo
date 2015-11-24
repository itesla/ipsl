within iPSL.Electrical.Branches.PSSE.Old_transformer;
model Zeq "Transformer equivalent impedance"

  iPSL.Connectors.PwPin p annotation (Placement(transformation(extent={{-80,-10},
            {-60,10}}), iconTransformation(extent={{-80,-10},{-60,10}})));
  iPSL.Connectors.PwPin n annotation (Placement(transformation(extent={{60,-10},
            {80,10}}), iconTransformation(extent={{60,-10},{80,10}})));
  parameter Real R "Resistance p.u.";
  parameter Real X "Reactance p.u.";

public
  Modelica.Blocks.Interfaces.RealInput t(start = 1) annotation(Placement(transformation(extent={{-20,-20},
            {20,20}},
        rotation=180,
        origin={82,50}),  iconTransformation(
        extent={{-20,-20},{20,20}},
        rotation=180,
        origin={60,40})));
equation
  t*(R * n.ir  - X * n.ii)= n.vr - p.vr*t;
 t*(R * n.ii  + X * n.ir)= n.vi- p.vi*t;
  -(R * p.ir  - X * p.ii) = n.vr- p.vr*t;
 -(R * p.ii  + X * p.ir)= n.vi- p.vi*t;

  annotation(Icon(coordinateSystem(preserveAspectRatio=false,extent={{-100,-100},
            {100,100}}),
                  graphics={  Rectangle(extent = {{-60, 40}, {60, -42}}, lineColor = {0, 0, 255}), Rectangle(extent={{
              -36,8},{32,-6}},                                                                                                    lineColor = {0, 0, 255}, fillColor = {95, 95, 95},
            fillPattern =                                                                                                   FillPattern.Solid)}),
                                                                                          Diagram(
        coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,100}}),                                                                       graphics),
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
end Zeq;
