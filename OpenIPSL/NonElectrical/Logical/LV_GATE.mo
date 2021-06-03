within OpenIPSL.NonElectrical.Logical;
block LV_GATE "Passes through the lower value of the two inputs"
  extends Modelica.Blocks.Math.Min;
equation
  connect(y, y) annotation (Line(points={{110,0},{110,0}}, color={0,0,127}));
  annotation (Icon(graphics={Polygon(
          points={{-100,100},{40,100},{100,0},{40,-100},{-100,-100},{-100,100}},
          lineColor={28,108,200},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid), Text(
          extent={{-100,40},{60,-40}},
          lineColor={0,0,255},
          fillColor={255,255,255},
          fillPattern=FillPattern.None,
          textString="LV
GATE")}));
end LV_GATE;
