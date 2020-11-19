within OpenIPSL;
package Types "Library specific type definitions"
  extends Modelica.Icons.TypesPackage;
  type Voltage = SI.Voltage(nominal = 1e4, displayUnit = "kV");
  type Current = SI.Current(nominal = 1e4, displayUnit = "kA");
  type ActivePower = SI.ActivePower(nominal = 1e8, displayUnit = "MW");
  type ReactivePower = SI.ReactivePower(nominal = 1e8, displayUnit = "MVA");
  type Power = SI.Power(nominal = 1e8, displayUnit = "MW");
  type ApparentPower = SI.ApparentPower(nominal = 1e8, displayUnit = "MVA");
  type Angle = SI.Angle;
  type AngularVelocity = SI.AngularVelocity;
  type Frequency = SI.Frequency;
  type Resistance = SI.Resistance;
  type Reactance = SI.Reactance;
  type Conductance = SI.Conductance;
  type Susceptance = SI.Susceptance;
  type Impedance = SI.Impedance;
  type PerUnit = SI.PerUnit;
  type Time = SI.Time;
  type Ctrl = enumeration(
      alpha  "Control using the firing angle alpha",
      xTCSC  "Control using reactance xTCSC")
       "Control type of the PSAT TCSC";
end Types;
