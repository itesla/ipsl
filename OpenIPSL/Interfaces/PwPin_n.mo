within OpenIPSL.Interfaces;
connector PwPin_n
  "Negative connector for electrical blocks treating voltage and current as complex variables"
   extends PwPin;

  annotation (defaultComponentName="n",
    Icon(graphics={Rectangle(
          extent={{-100,100},{100,-100}},
          lineColor={0,0,255},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid)}),
    Diagram(graphics={Rectangle(
          extent={{-100,100},{100,-100}},
          lineColor={0,0,255},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid)}));
end PwPin_n;
