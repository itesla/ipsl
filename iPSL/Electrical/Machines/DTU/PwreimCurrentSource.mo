within iPSL.Electrical.Machines.DTU;
model PwreimCurrentSource "Developed by DTU"
  iPSL.Connectors.PwPin n annotation (Placement(transformation(extent={{60,-6},{72,6}}), iconTransformation(extent={{60,-6},{72,6}})));
  Modelica.Blocks.Interfaces.RealInput id_ref annotation (Placement(transformation(extent={{-73,33},{-61,47}})));
  Modelica.Blocks.Interfaces.RealInput iq_ref annotation (Placement(transformation(extent={{-73,-47},{-61,-33}})));
equation
  n.ir = id_ref;
  n.ii = iq_ref;
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics),
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics={Rectangle(extent={{-60,60},{60,-60}}, lineColor={0,0,255}),Ellipse(
          extent={{-22,22},{22,-20}},
          lineColor={0,0,255},
          lineThickness=0.5),Polygon(
          points={{0,22},{-2,16},{2,16},{0,22}},
          lineColor={0,0,255},
          lineThickness=0.5,
          smooth=Smooth.None,
          fillPattern=FillPattern.Solid,
          fillColor={0,0,255}),Line(
          points={{0,38},{0,-42}},
          color={0,0,255},
          thickness=0.5,
          smooth=Smooth.None),Text(
          extent={{-56,48},{-36,32}},
          lineColor={0,0,255},
          lineThickness=1,
          fillColor={0,0,255},
          fillPattern=FillPattern.Solid,
          textString="Ire_ref"),Text(
          extent={{-56,-30},{-36,-48}},
          lineColor={0,0,255},
          lineThickness=1,
          fillColor={0,0,255},
          fillPattern=FillPattern.Solid,
          textString="Iim_ref")}),
    Documentation(revisions="<!--DISCLAIMER-->
<html>
<p>Copyright 2015 RTE (France), SmarTS Lab (Sweden), AIA (Spain) and DTU (Denmark)</p>
<p>​- ​RTE: http://www.rte-france.com/</p>
<p>- SmarTS Lab, research group at KTH: https://www.kth.se/en</p>
<p>​- ​AIA: http://www.aia.es/en/energy/</p>
<p>​- ​DTU: http://www.dtu.dk/english</p>
<p>The authors can be contacted by email: info@itesla-ipsl.org </p>
<p>​</p>
<p>​​This Source Code Form is subject to the terms of the Mozilla Public License, v. 2.0. </p>
<p>If a copy of the MPL was not distributed with this file, You can obtain one at http://mozilla.org/MPL/2.0/.</p>
</html>"));
end PwreimCurrentSource;
