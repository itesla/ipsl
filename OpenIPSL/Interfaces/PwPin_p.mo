within OpenIPSL.Interfaces;
connector PwPin_p
  "Positive connector for electrical blocks treating voltage and current as complex variables"
 extends PwPin;
 annotation (defaultComponentName="p");
end PwPin_p;
