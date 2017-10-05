within OpenIPSL.NonElectrical.Nonlinear;
block CeilingBlock
  "Implements the ceiling function primarily found inside AVRs."
  extends Modelica.Blocks.Interfaces.SISO;
  parameter Real Ae=0 "First ceiling coefficient";
  parameter Real Be=1 "Second ceiling coefficient";
equation
  y = Ae*Modelica.Math.exp(Be*abs(u));

  annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics={Text(
          extent={{-78,42},{72,-30}},
          lineColor={28,108,200},
          textString="Ae*exp(Be|u|)")}));
end CeilingBlock;
