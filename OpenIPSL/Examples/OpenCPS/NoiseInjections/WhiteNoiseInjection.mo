within OpenIPSL.Examples.OpenCPS.NoiseInjections;
model WhiteNoiseInjection "This model injects white noise in the electrical node"
  extends BaseClass;

equation
  P = noise_gen.y;
  Q = 0;
  annotation (Documentation(info="<html>
<p>This model injects white noise to the electrical node via active power value, i.e., <code>P</code>.
Reactive power, <code>Q</code>, is set to 0 and no noise is injected there.</p>
</html>"));
end WhiteNoiseInjection;
