block omegaRef
    parameter Integer nGenerators = 1;
    Modelica.Blocks.Interfaces.RealInput pin_HIn[nGenerators];
    Modelica.Blocks.Interfaces.RealInput pin_SN[nGenerators];
    Modelica.Blocks.Interfaces.RealInput pin_omega[nGenerators];
    Modelica.Blocks.Interfaces.RealOutput omegaRef;
    Modelica.Blocks.Math.Sum omegaRefDen(nin = nGenerators);
    Modelica.Blocks.Math.Sum omegaRefNum(nin = nGenerators);
    Real denom[nGenerators];
    Real num[nGenerators];
equation 
  denom = pin_HIn .* pin_SN;
  num  = denom .* pin_omega;
  omegaRefNum.u = num;
  omegaRefDen.u = denom;
  omegaRef = omegaRefNum.y / omegaRefDen.y;
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end omegaRef;
