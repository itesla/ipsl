within iPSL.Electrical.Controls.PSAT.OEL;
model OEL "PSAT Over Excitation Limiter"
  Modelica.Blocks.Interfaces.RealInput v "Generator terminal voltage (pu)" annotation (Placement(transformation(extent={{-110,68},{-90,88}}), iconTransformation(extent={{-90,66},{-62,98}})));
  Modelica.Blocks.Interfaces.RealInput p "Active power (pu)" annotation (Placement(transformation(extent={{-110,36},{-90,56}}), iconTransformation(extent={{-90,32},{-62,62}})));
  Modelica.Blocks.Interfaces.RealInput q "Reactive power (pu)" annotation (Placement(transformation(extent={{-110,4},{-90,24}}), iconTransformation(extent={{-90,-6},{-62,24}})));
  FieldCurrent field_current(xd=xd, xq=xq) annotation (Placement(transformation(extent={{-82,38},{-46,72}})));
  Modelica.Blocks.Sources.Constant set(k=iflim) annotation (Placement(transformation(extent={{-40,0},{-20,20}})));
  //Ymin=0,
  //nStartValue=0,
  //Ymax=vOELmax,
  //K=1/T0)
  Modelica.Blocks.Interfaces.RealOutput v_OXL annotation (Placement(transformation(extent={{98,28},{118,48}}), iconTransformation(extent={{66,6},{94,38}})));
  parameter Real T0 "Integrator time constant (s)";
  parameter Real xd "d-axis estimated generator reactance (pu)";
  parameter Real xq "q-axis estimated generator reactance (pu)";
  parameter Real iflim "Maximum filed current (pu)";
  parameter Real vOELmax "Maximum output signal (pu)";
  Modelica.Blocks.Math.Add add(k2=-1) annotation (Placement(transformation(extent={{-40,40},{-20,60}})));
  Modelica.Blocks.Sources.Constant const(k=iflim) annotation (Placement(transformation(extent={{-74,10},{-54,30}})));
  Modelica.Blocks.Logical.Greater greater annotation (Placement(transformation(extent={{0,40},{20,60}})));
  Modelica.Blocks.Logical.Switch switch1 annotation (Placement(transformation(extent={{38,0},{58,20}})));
  Modelica.Blocks.Sources.Constant set1(k=0) annotation (Placement(transformation(extent={{-40,-40},{-20,-20}})));
  Modelica.Blocks.Continuous.LimIntegrator limIntegrator(
    k=1/T0,
    outMax=Modelica.Constants.inf,
    outMin=0) annotation (Placement(transformation(extent={{68,0},{88,20}})));
equation
  connect(v, field_current.v) annotation (Line(
      points={{-100,78},{-86,78},{-86,63.33},{-75.88,63.33}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(p, field_current.p) annotation (Line(
      points={{-100,46},{-84,46},{-84,56.19},{-75.7,56.19}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(q, field_current.q) annotation (Line(
      points={{-100,14},{-84,14},{-84,48.71},{-75.7,48.71}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(field_current.ifield, add.u1) annotation (Line(points={{-50.68,56.19},{-48,56.19},{-48,56},{-42,56}}, color={0,0,127}));
  connect(const.y, add.u2) annotation (Line(points={{-53,20},{-48,20},{-48,44},{-42,44}}, color={0,0,127}));
  connect(add.y, greater.u1) annotation (Line(points={{-19,50},{-10.5,50},{-2,50}}, color={0,0,127}));
  connect(set.y, greater.u2) annotation (Line(points={{-19,10},{-10,10},{-10,42},{-2,42}}, color={0,0,127}));
  connect(greater.y, switch1.u2) annotation (Line(points={{21,50},{26,50},{26,10},{36,10}}, color={255,0,255}));
  connect(switch1.u1, greater.u1) annotation (Line(points={{36,18},{-6,18},{-6,50},{-2,50}}, color={0,0,127}));
  connect(set1.y, switch1.u3) annotation (Line(points={{-19,-30},{20,-30},{20,2},{36,2}}, color={0,0,127}));
  connect(switch1.y, limIntegrator.u) annotation (Line(points={{59,10},{66,10}}, color={0,0,127}));
  connect(limIntegrator.y, v_OXL) annotation (Line(points={{89,10},{92,10},{92,38},{108,38}}, color={0,0,127}));
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}})),
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics={Rectangle(extent={{-60,92},{68,-48}}, lineColor={0,0,255}),Text(
          extent={{-68,100},{-30,64}},
          lineColor={0,0,255},
          fillPattern=FillPattern.Solid,
          textString="v"),Text(
          extent={{-64,64},{-30,30}},
          lineColor={0,0,255},
          fillPattern=FillPattern.Solid,
          textString="p"),Text(
          extent={{-62,24},{-34,-10}},
          lineColor={0,0,255},
          fillPattern=FillPattern.Solid,
          textString="q"),Text(
          extent={{-52,-16},{-16,-48}},
          lineColor={0,0,255},
          fillPattern=FillPattern.Solid,
          textString="vref0"),Text(
          extent={{26,46},{60,12}},
          lineColor={0,0,255},
          fillPattern=FillPattern.Solid,
          textString="v_OXL"),Text(
          extent={{-18,102},{44,24}},
          lineColor={0,0,255},
          fillPattern=FillPattern.Solid,
          textString="OXL")}),
    Documentation(info="<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\">
<tr>
<td><p>Reference</p></td>
<td>Over Excitation Limiter, PSAT manual</td>
</tr>
<tr>
<td><p>Last update</p></td>
<td>2015-10-02</td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p>Le Qi, SmarTS Lab, KTH Royal Institute of Technology</p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p><a href=\"mailto:luigiv@kth.se\">luigiv@kth.se</a></p></td>
</tr>
</table>
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
end OEL;

