within OpenIPSL.Electrical.Sources;
model VoltageSourceReImInput
  "Ideal voltage source with user defined real and imaginary parts of the voltage phasor"
  extends OpenIPSL.Electrical.Essentials.pfComponent(
  enableS_b = true,
  enableV_b = true,
  enablefn = true,
  enableP_0 = true,
  enableQ_0 = true,
  enablev_0 = true,
  enableangle_0 = true,
  displayPF=true);
  Types.Angle angle(start=angle_0) "Bus voltage angle in radians";
  Types.Voltage V(start=v_0) "Bus voltage magnitude (pu)";
  Types.ActivePower P "Active Power absorbed by the Infinite bus (MW)";
  Types.ReactivePower Q "Reactive Power absorbed by the Infinite bus (MVAr)";
  OpenIPSL.Interfaces.PwPin p(vr(start=v_0*cos(angle_0*Modelica.Constants.pi/180)), vi(start=v_0*
          sin(angle_0*Modelica.Constants.pi/180)))
    annotation (Placement(
      visible=true,
      transformation(
        origin={110,0},
        extent={{-10.0,-10.0},{10.0,10.0}},
        rotation=0),
      iconTransformation(
        origin={110,0},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  Modelica.Blocks.Interfaces.RealInput vRe "Real Part of voltage phasor"
    annotation (Placement(transformation(extent={{-140,20},{-100,60}})));
  Modelica.Blocks.Interfaces.RealInput vIm "Imaginary Part of Voltage Phasor"
    annotation (Placement(transformation(extent={{-140,-60},{-100,-20}})));
equation
  p.vr =vRe;
  p.vi =vIm;
  V = sqrt(p.vr^2 + p.vi^2);
  angle = atan2(p.vi, p.vr);
  P = -(p.vr*p.ir + p.vi*p.ii)*S_b;
  Q = -(p.vr*p.ii - p.vi*p.ir)*S_b;
  annotation(Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}),
        graphics={                 Ellipse(
          extent={{-100,100},{100,-100}},
          lineColor={0,0,0},
          fillColor={213,255,170},
          fillPattern=FillPattern.Solid),Line(
          points={{-20,20},{-50,40},{-80,0}},
          color={0,0,0},
          thickness=0.5),                Line(
          points={{20,-20},{50,-40},{80,0}},
          color={0,0,0},
          thickness=0.5),Text(
          extent={{-40,20},{40,-20}},
          lineColor={0,0,0},
          textString="%name")}), Documentation(revisions="<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\"><tr>
<td><p>Reference</p></td>
<td><p>None.</p></td>
</tr>
<tr>
<td><p>Last update</p></td>
<td><p>2022-11-01 (First commit)</p></td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p>Luigi Vanfretti, Rensselaer Polytechnic Institute</p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p>see <a href=\"modelica://OpenIPSL.UsersGuide.Contact\">UsersGuide.Contact</a></p></td>
</tr>
</table>
</html>", info="<html>
<p>This model allows the user to specify the voltage real and imaginary part of the voltage phasor of an ideal voltage source. </p>
<p>The value of each part of the phasor have to be provided through sources from Modelica.Blocks.Sources with Real valued interfaces to be connected to the vRe and vIm real interfaces.</p>
</html>"));
end VoltageSourceReImInput;
