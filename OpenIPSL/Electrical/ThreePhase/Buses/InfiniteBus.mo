within OpenIPSL.Electrical.ThreePhase.Buses;
model InfiniteBus "Three-phase infinite bus"
  extends ThreePhaseComponent;
  parameter SI.Voltage V_b(displayUnit="kV")=400e3
    "Base voltage of the bus"
    annotation (Dialog(group="Power flow data"));
  parameter SI.PerUnit V_A=1
    "Voltage magnitude (pu)"
    annotation (Dialog(group="Power flow data"));
  parameter SI.Angle angle_A(displayUnit = "deg") = SI.Conversions.from_deg(0) "Voltage angle for phase A"
    annotation (Dialog(group="Power flow data"));
  parameter SI.PerUnit V_B=1 "Voltage magnitude (pu)"
    annotation (Dialog(group="Power flow data"));
  parameter SI.Angle angle_B(displayUnit = "deg") = SI.Conversions.from_deg(-120) "Voltage angle for phase B"
    annotation (Dialog(group="Power flow data"));
  parameter SI.PerUnit V_C=1 "Voltage magnitude (pu)"
    annotation (Dialog(group="Power flow data"));
  parameter SI.Angle angle_C(displayUnit = "deg") = SI.Conversions.from_deg(120) "Voltage angle for phase C"
    annotation (Dialog(group="Power flow data"));
  parameter SI.ActivePower P_A(displayUnit="MW")=1e6
    "Initial active power"
    annotation (Dialog(group="Power flow data"));
  parameter SI.ReactivePower Q_A(displayUnit="Mvar")=0
    "Initial reactive power"
    annotation (Dialog(group="Power flow data"));
  parameter SI.ActivePower P_B(displayUnit="MW")=1e6
    "Initial active power"
    annotation (Dialog(group="Power flow data"));
  parameter SI.ReactivePower Q_B(displayUnit="Mvar")=0
    "Initial reactive power"
    annotation (Dialog(group="Power flow data"));
  parameter SI.ActivePower P_C(displayUnit="MW")=1e6
    "Initial active power"
    annotation (Dialog(group="Power flow data"));
  parameter SI.ReactivePower Q_C(displayUnit="Mvar")=0
    "Initial reactive power"
    annotation (Dialog(group="Power flow data"));
  parameter SI.Frequency fn=SysData.fn
    "System frequency"
    annotation (Dialog(group="Power flow data", enable=false));
  OpenIPSL.Interfaces.PwPin p1
    annotation (Placement(transformation(extent={{80,80},{100,100}})));
  OpenIPSL.Interfaces.PwPin p2
    annotation (Placement(transformation(extent={{80,-10},{100,10}})));
  OpenIPSL.Interfaces.PwPin p3
    annotation (Placement(transformation(extent={{80,-100},{100,-80}})));
  SI.ActivePower Pa(displayUnit="MW") "Active Power suplied by the Infinite bus (phase a)";
  SI.ReactivePower Qa(displayUnit="Mvar") "Reactive Power suplied by the Infinite bus (phase a)";
  SI.ActivePower Pb(displayUnit="MW") "Active Power suplied by the Infinite bus (phase b) (MW)";
  SI.ReactivePower Qb(displayUnit="Mvar") "Reactive Power suplied by the Infinite bus (phase b) (MVAr)";
  SI.ActivePower Pc(displayUnit="MW") "Active Power suplied by the Infinite bus (phase c) (MW)";
  SI.ReactivePower Qc(displayUnit="Mvar") "Reactive Power suplied by the Infinite bus (phase c) (MVAr)";
equation
  // Equations for Phase A
  p1.vr = V_A*cos(angle_A);
  p1.vi = V_A*sin(angle_A);
  Pa = -(p1.vr*p1.ir + p1.vi*p1.ii)*S_p;
  Qa = -(p1.vr*p1.ii - p1.vi*p1.ir)*S_p;
  // Equations for Phase B
  p2.vr = V_B*cos(angle_B);
  p2.vi = V_B*sin(angle_B);
  Pb = -(p2.vr*p2.ir + p2.vi*p2.ii)*S_p;
  Qb = -(p2.vr*p2.ii - p2.vi*p2.ir)*S_p;
  // Equations for Phase C
  p3.vr = V_C*cos(angle_C);
  p3.vi = V_C*sin(angle_C);
  Pc = -(p3.vr*p3.ir + p3.vi*p3.ii)*S_p;
  Qc = -(p3.vr*p3.ii - p3.vi*p3.ir)*S_p;
  annotation (Icon(coordinateSystem(
        extent={{-100,-100},{100,100}},
        preserveAspectRatio=false,
        initialScale=0.1,
        grid={10,10}), graphics={Rectangle(
          fillColor={255,255,255},
          extent={{-100,-100},{100,100}},
          lineColor={0,0,0},
          fillPattern=FillPattern.Solid),Line(points={{34,86},{82,86},{74,92}},
          color={0,0,0}),Text(
          extent={{14,84},{102,38}},
          lineColor={238,46,47},
          textString=DynamicSelect("0.0", String(P, significantDigits=2))),Line(
          points={{32,-54},{80,-54},{72,-48}}, color={0,0,0}),Text(
          extent={{12,-54},{100,-100}},
          lineColor={0,255,0},
          textString=DynamicSelect("0.0", String(Q, significantDigits=2))),Line(
          points={{40,-48},{40,-60}}, color={0,0,0}),Line(points={{80,-54},{72,
          -60}}, color={0,0,0}),Line(points={{82,86},{74,80}}, color={0,0,0})}),
      Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
            100,100}})),
            Documentation(info="<html>
<p>This is a three-phase infinite bus model.</p>
<p>An infinite bus represents a very strong system. This means that no matter how much power is drained from or injected in it, the bus will keep the values of frequency, voltage magnitude and voltage angle constant.</p>
<p>The infinite bus also provides the angle references that can be used in coherency studies or in power flow results.</p>
<p> <\p>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\">
<tr>
<td><p>Last update</p></td>
<td>2020-05-21</td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p>Marcelo de Castro, AlsetLab, and Maxime Baudette, LBNL</p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p><a href=\"mailto:vanfrl@rpi.edu\">vanfrl@rpi.edu</a></p></td>
</tr>
</table>
</html>"));
end InfiniteBus;
