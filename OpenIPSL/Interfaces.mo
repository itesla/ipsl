within OpenIPSL;
package Interfaces
  "Package for interface models used in this library. "
  extends Modelica.Icons.InterfacesPackage;
  connector PwPin "Connector for electrical blocks treating voltage and current as complex variables"
    Real vr "Real part of the voltage";
    Real vi "Imaginary part of the voltage";
    flow Real ir "Real part of the current";
    flow Real ii "Imaginary part of the current";
     annotation (Icon(graphics={Rectangle(
            extent={{-100,100},{100,-100}},
            lineColor={0,0,255},
            fillColor={0,0,255},
            fillPattern=FillPattern.Solid)}));
  end PwPin;
end Interfaces;
