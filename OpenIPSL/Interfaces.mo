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
            fillPattern=FillPattern.Solid)}), Diagram(graphics={Text(
            extent={{-100,160},{100,120}},
            lineColor={0,0,255},
            textString="%name"),Rectangle(
            extent={{-100,100},{100,-100}},
            lineColor={0,0,255},
            fillColor={0,0,255},
            fillPattern=FillPattern.Solid)}));
  end PwPin;

  partial model Generator
    "Interface for a generator which provides the PwPin"
    extends OpenIPSL.Electrical.Essentials.pfComponent;
     parameter Boolean displayPF=false "Enable/Disable"
      annotation (Dialog(
        group="Display Power Flow Results",
        __Dymola_compact=true,
        __Dymola_descriptionLabel=true),
        choices(checkBox=true));
    OpenIPSL.Interfaces.PwPin pwPin annotation (Placement(transformation(extent={{100,-10},{120,10}}), iconTransformation(extent={{100,-10},{120,10}})));
    OpenIPSL.Types.ActivePowerMega P "Active power";
    OpenIPSL.Types.ReactivePowerMega Q "Reactive power";
  equation

    -P = (pwPin.vr * pwPin.ir + pwPin.vi * pwPin.ii) * S_b "Active power";
    -Q = (pwPin.vi * pwPin.ir - pwPin.vr * pwPin.ii) * S_b "Reactive power";

    annotation (
      Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics={
          Ellipse(
            extent={{-100,100},{100,-100}},
            lineColor={0,0,0},
            fillColor={215,215,215},
            fillPattern=FillPattern.Solid),
          Line(
            points={{20,-20},{50,-40},{80,0}},
            color={0,0,0},
            thickness=0.5),
          Text(
            extent={{-40,20},{40,-20}},
            lineColor={0,0,0},
            textString="%name"),
          Text(
            extent={{-100,140},{100,100}},
            lineColor={238,46,47},
            fillPattern=FillPattern.Solid,
            visible=displayPF,
            textString=DynamicSelect("0 MW", OpenIPSL.Functions.displayPower(P," MW"))),
          Text(
            extent={{-100,-100},{100,-140}},
            lineColor={0,255,0},
            fillPattern=FillPattern.Solid,
            visible=displayPF,
            textString=DynamicSelect("0 Mvar", OpenIPSL.Functions.displayPower(Q," Mvar"))),
          Line(
            points={{-20,20},{-50,40},{-80,0}},
            color={0,0,0},
            thickness=0.5)}));
  end Generator;
end Interfaces;
