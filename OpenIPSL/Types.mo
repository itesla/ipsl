within OpenIPSL;
package Types "Collection of special types used in OpenIPSL"
  extends Modelica.Icons.TypesPackage;
  type ActivePowerMega =Real (final quantity="Power", final unit="MW");
  type ApparentPowerMega = Real (final quantity="Power", final unit="MVA");
  type ReactivePowerMega = Real (final quantity="Power", final unit="Mvar");
  type VoltageKilo = Real (final quantity="ElectricPotential", final unit= "kV");
end Types;
