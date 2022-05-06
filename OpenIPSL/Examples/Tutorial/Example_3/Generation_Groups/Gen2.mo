within OpenIPSL.Examples.Tutorial.Example_3.Generation_Groups;
model Gen2 "100MVA/13.8kV generation unit for bus 2"
  extends Gen1(gen(
      Vn=13800,
      xd=1.3125,
      xq=1.2578,
      x1d=0.1813,
      x1q=0.25,
      T1d0=5.89,
      T1q0=0.6,
      M=6.02));
  annotation (Documentation(info="<html>
<p>Note that this 100MVA/13.8kV generation unit allows the user to perform a step disturbance of magnitude <code>height</code> at instant <code>tstart</code> in the voltage reference value for each Automatic Voltage Regulator. </p>
<p>Also note that boolean variable <code>refdisturb</code> needs to be set to true for disturbance to take place.</p>
</html>"));
end Gen2;
