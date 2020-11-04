within OpenIPSL;
package Types "Library of constants, external objects and types with choices, especially to build menus"
  extends Modelica.Icons.TypesPackage;
 type Ctrl = enumeration(
      alpha
    "Control using the firing angle alpha",
      xTCSC
    "Control using reactance xTCSC") "Control type of the PSAT TCSC";
end Types;
