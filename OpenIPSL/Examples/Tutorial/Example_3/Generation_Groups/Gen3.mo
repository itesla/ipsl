within OpenIPSL.Examples.Tutorial.Example_3.Generation_Groups;
model Gen3 "100MVA/16.5kV generation unit for bus 3"
  extends Gen1(gen(
      Vn=16500,
      xd=0.1460,
      xq=0.0969,
      x1d=0.0608,
      x1q=0.0969,
      T1d0=8.96,
      T1q0=0.310,
      M=47.28));
  annotation (Documentation(info="<html>
<p>Note that this 100MVA/16.5kV generation unit allows the user to perform a step disturbance of magnitude <code>height</code> at instant <code>tstart</code> in the voltage reference value for each Automatic Voltage Regulator. </p>
<p>Also note that boolean variable <code>refdisturb</code> needs to be set to true for disturbance to take place.</p>
</html>"));
end Gen3;
