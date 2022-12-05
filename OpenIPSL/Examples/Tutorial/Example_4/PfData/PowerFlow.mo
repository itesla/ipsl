within OpenIPSL.Examples.Tutorial.Example_4.PfData;
record PowerFlow
  "Instantiable record containing the replaceable record with power flow results"
  extends Modelica.Icons.Record;

  replaceable record PowerFlow =
        OpenIPSL.Examples.Tutorial.Example_4.PfData.PowerFlowTemplate
    constrainedby OpenIPSL.Examples.Tutorial.Example_4.PfData.PowerFlowTemplate
    "Replaceable power flow record"
  annotation(choicesAllMatching);

PowerFlow powerflow;

  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end PowerFlow;
