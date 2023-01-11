within OpenIPSL.Examples.Tutorial.Example_4.PxData;
record PowerFlow
  "Instantiable record containing the replaceable record with power flow results"
  extends Modelica.Icons.Record;

  replaceable record PowerFlow =
        OpenIPSL.Examples.Tutorial.Example_4.PxData.PowerFlowTemplate
    constrainedby OpenIPSL.Examples.Tutorial.Example_4.PxData.PowerFlowTemplate
    "Replaceable power flow record"
  annotation(choicesAllMatching=true);

PowerFlow powerflow;

  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end PowerFlow;
