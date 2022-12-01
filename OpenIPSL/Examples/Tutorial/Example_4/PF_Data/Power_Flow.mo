within OpenIPSL.Examples.Tutorial.Example_4.PF_Data;
record Power_Flow
  extends Modelica.Icons.Record;

  replaceable record PowerFlow =
        OpenIPSL.Examples.Tutorial.Example_4.PF_Data.Power_Flow_Template
    constrainedby
    OpenIPSL.Examples.Tutorial.Example_4.PF_Data.Power_Flow_Template
  annotation(choicesAllMatching);

PowerFlow powerflow;

  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end Power_Flow;
