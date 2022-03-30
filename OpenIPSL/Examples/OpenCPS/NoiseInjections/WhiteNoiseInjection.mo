within OpenIPSL.Examples.OpenCPS.NoiseInjections;
model WhiteNoiseInjection
  extends BaseClass;

equation
  P = noise_gen.y;
  Q = 0;
  annotation (uses(OpenIPSL(version="0.8.1"), Modelica(version="3.2.2")));
end WhiteNoiseInjection;
