within OpenIPSL;
package Types "Collection of special types used in OpenIPSL"
  extends Modelica.Icons.TypesPackage;
  type ReactivePowerMega = Real (final quantity="Power", final unit="Mvar");
  type ActivePowerMega =Real (final quantity="Power", final unit="MW");
  type VoltageKilo = Real (final quantity="ElectricPotential", final unit= "kV");
end Types;
