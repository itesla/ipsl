within OpenIPSL.Examples.OpenCPS.NoiseInjections;
model WienerProcessInjection "This model injects noise via Wiener process in the electrical node"
  extends BaseClass;

initial equation
  P = 0;

equation
  der(P) = noise_gen.y;
  Q = 0;
  annotation (Documentation(info="<html>
<p>This model injects noise to the electrical node via the derivative of the active power value, i.e. <code>der(P)</code>.
Reactive power, <code>Q</code>, is set to 0 and no noise is injected there.</p>  
</html>"));
end WienerProcessInjection;
