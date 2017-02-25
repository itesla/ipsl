within OpenIPSL.Electrical;
record SystemBase "System Base Definition"
  parameter OpenIPSL.Types.ApparentPowerMega S_b=100 "System base in MVA";
  parameter Modelica.SIunits.Frequency fn=50 "System Frequency in Hz";
  annotation (
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{140,100}}), graphics={Rectangle(
          extent={{-100,100},{140,-100}},
          lineColor={28,108,200},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),Text(
          extent={{-80,40},{120,0}},
          lineColor={28,108,200},
          horizontalAlignment=TextAlignment.Left,
          textString="System Base: %S_b MVA"),Text(
          extent={{-80,-20},{120,-60}},
          lineColor={28,108,200},
          horizontalAlignment=TextAlignment.Left,
          textString="Frequency: %fn Hz"),Text(
          extent={{-80,100},{120,60}},
          lineColor={28,108,200},
          horizontalAlignment=TextAlignment.Center,
          textString="System Data")}),
    defaultComponentName="SysData",
    defaultAttributes="inner",
    missingInnerMessage="
No 'System Data' component is defined. A default component will be used, and generate a system base of 100 MVA, and a frequency of 50 Hz",
    Diagram(coordinateSystem(extent={{-100,-100},{140,100}})));
end SystemBase;
