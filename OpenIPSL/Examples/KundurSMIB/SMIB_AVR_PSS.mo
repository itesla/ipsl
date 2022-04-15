within OpenIPSL.Examples.KundurSMIB;
model SMIB_AVR_PSS "Single-Machine-Infinite-Bus system with generation unit composed of Machine, AVR and PSS."
  extends Modelica.Icons.Example;
  extends SMIB_Partial;
  Generation_Groups.Generator_AVR_PSS G1(
    v_0=1,
    P_0=0.899999999997135*S_b,
    Q_0=0.436002238696658*S_b,
    angle_0=0.494677176989155)
    annotation (Placement(transformation(extent={{-82,-10},{-62,10}})));
protected
  parameter Real S_b=SysData.S_b;
equation
  connect(G1.pwPin, B1.p)
    annotation (Line(points={{-61,0},{-52,0}},         color={0,0,255}));
  annotation (
    Diagram(coordinateSystem(extent={{-100,-100},{100,100}},
          preserveAspectRatio=false), graphics={Text(
          extent={{-110,74},{110,54}},
          lineColor={0,0,0},
          lineThickness=1,
          fillPattern=FillPattern.Solid,
          fontSize=15,
          textStyle={TextStyle.Bold},
          textString="(AVR + PSS)")}),
    experiment(
      StopTime=10,
      Interval=0.0001,
      Tolerance=1e-006,
      __Dymola_fixedstepsize=0.0001,
      __Dymola_Algorithm="Rkfix2"),
    __Dymola_experimentSetupOutput,
    Documentation(info="<html>
<p>This example system represents an SMIB system with generation unit composed of a machine, an AVR and a PSS. The system should be simulated during 10 seconds.</p>
<p>Variables of interest are:</p>
<ul>
<li><code>B1.v</code></li>
<li><code>G1.machine.delta</code></li>
</ul>
<p>Note that the system is now stable. Compare these variables with the ones obtained when simulating <code>SMIB</code> and <code>SMIB_AVR</code> for 10 seconds.</p>
<p> </p>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\">
<tr>
<td><p>Reference</p></td>
<td><p>SMIB PSAT, d_kundur2.mdl, PSAT</p></td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p>Maxime Baudette, Ahsan Murad, SmarTS Lab, KTH Royal Institute of Technology</p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p><a href=\"https://github.com/ALSETLab\">ALSETLab</a></p></td>
</tr>
</table>
</html>"));
end SMIB_AVR_PSS;
