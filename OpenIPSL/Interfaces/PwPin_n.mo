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
          fillPattern=FillPattern.Solid)}),
    Documentation(info="<html>
<p>
This connector <code>PwPin_n</code> is nearly identical to 
<a href=\"modelica://OpenIPSL.Interfaces.PwPin_p\">PwPin_p</a>
(and <a href=\"modelica://OpenIPSL.Interfaces.PwPin\">PwPin</a>). 
The only difference is that the default component name is set to \"n\" 
and that the icons are different in order to identify more easily the pins of a component.
</p>
</html>"));
end PwPin_n;
