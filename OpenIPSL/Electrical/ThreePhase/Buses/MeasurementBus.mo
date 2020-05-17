within OpenIPSL.Electrical.ThreePhase.Buses;
model MeasurementBus
  extends ThreePhaseComponent;
  OpenIPSL.Interfaces.PwPin p1
    annotation (Placement(transformation(extent={{80,80},{100,100}})));
  OpenIPSL.Interfaces.PwPin p2
    annotation (Placement(transformation(extent={{80,-10},{100,10}})));
  OpenIPSL.Interfaces.PwPin p3
    annotation (Placement(transformation(extent={{80,-100},{100,-80}})));
  OpenIPSL.Interfaces.PwPin p4
    annotation (Placement(transformation(extent={{-100,80},{-80,100}})));
  OpenIPSL.Interfaces.PwPin p5
    annotation (Placement(transformation(extent={{-100,-10},{-80,10}})));
  OpenIPSL.Interfaces.PwPin p6
    annotation (Placement(transformation(extent={{-100,-100},{-80,-80}})));
  SI.ActivePower Pa(displayUnit="MW") "Active Power suplyed by the Infinite bus (phase a)";
  SI.ReactivePower Qa(displayUnit="Mvar") "Reactive Power suplyed by the Infinite bus (phase a)";
  SI.ActivePower Pb(displayUnit="MW") "Active Power suplyed by the Infinite bus (phase b) (MW)";
  SI.ReactivePower Qb(displayUnit="Mvar") "Reactive Power suplyed by the Infinite bus (phase b) (MVAr)";
  SI.ActivePower Pc(displayUnit="MW") "Active Power suplyed by the Infinite bus (phase c) (MW)";
  SI.ReactivePower Qc(displayUnit="Mvar") "Reactive Power suplyed by the Infinite bus (phase c) (MVAr)";
  Modelica.Blocks.Interfaces.RealOutput pa = Pa/S_b "[pu, system base]" annotation (Placement(transformation(
        extent={{-24,-24},{24,24}},
        rotation=-90,
        origin={52,-124})));
  Modelica.Blocks.Interfaces.RealOutput pb = Pb/S_b "[pu, system base]" annotation (Placement(transformation(
        extent={{-24,-24},{24,24}},
        rotation=-90,
        origin={2,-124})));
  Modelica.Blocks.Interfaces.RealOutput pc = Pc/S_b "[pu, system base]" annotation (Placement(transformation(
        extent={{-24,-24},{24,24}},
        rotation=-90,
        origin={-50,-124})));

  Modelica.Blocks.Interfaces.RealOutput qa = Qa/S_b "[pu, system base]" annotation (Placement(transformation(
        extent={{-24,-24},{24,24}},
        rotation=-90,
        origin={52,-124}), iconTransformation(
        extent={{24,-24},{-24,24}},
        rotation=-90,
        origin={60,110})));
  Modelica.Blocks.Interfaces.RealOutput qb = Qb/S_b "[pu, system base]" annotation (Placement(transformation(
        extent={{-24,-24},{24,24}},
        rotation=-90,
        origin={2,-124}), iconTransformation(
        extent={{24,-24},{-24,24}},
        rotation=-90,
        origin={0,110})));
  Modelica.Blocks.Interfaces.RealOutput qc = Qc/S_b "[pu, system base]" annotation (Placement(transformation(
        extent={{-24,-24},{24,24}},
        rotation=-90,
        origin={-50,-124}), iconTransformation(
        extent={{24,-24},{-24,24}},
        rotation=-90,
        origin={-50,110})));
equation
  // Equations for Phase A
  Pa = -(p1.vr*p1.ir + p1.vi*p1.ii)*S_p;
  Qa = -(p1.vr*p1.ii - p1.vi*p1.ir)*S_p;
  // Equations for Phase B
  Pb = -(p2.vr*p2.ir + p2.vi*p2.ii)*S_p;
  Qb = -(p2.vr*p2.ii - p2.vi*p2.ir)*S_p;
  // Equations for Phase C
  Pc = -(p3.vr*p3.ir + p3.vi*p3.ii)*S_p;
  Qc = -(p3.vr*p3.ii - p3.vi*p3.ir)*S_p;
  connect(p4, p1) annotation (Line(points={{-90,90},{90,90}}, color={0,0,255}));
  connect(p5, p2) annotation (Line(points={{-90,0},{90,0}}, color={0,0,255}));
  connect(p6, p3)
    annotation (Line(points={{-90,-90},{90,-90}}, color={0,0,255}));
  annotation (Icon(coordinateSystem(
        extent={{-100,-100},{100,100}},
        preserveAspectRatio=false,
        initialScale=0.1,
        grid={10,10}), graphics={Rectangle(
          fillColor={255,255,255},
          extent={{-100,-100},{100,100}},
          lineColor={0,0,0},
          fillPattern=FillPattern.Solid)}),
      Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
            100,100}})));
end MeasurementBus;
