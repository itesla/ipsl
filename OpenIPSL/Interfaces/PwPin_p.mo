within OpenIPSL.Interfaces;
connector PwPin_p
  "Positive connector for electrical blocks treating voltage and current as complex variables"
 extends PwPin;
 annotation (defaultComponentName="p", Documentation(info="<html>
<p>
This connector <code>PwPin_p</code> is nearly identical to 
<a href=\"modelica://OpenIPSL.Interfaces.PwPin\">PwPin</a>. 
The only difference is that the default component name is set to \"p\" 
in order to identify more easily the pins of a component.
</p>
</html>"));
end PwPin_p;
