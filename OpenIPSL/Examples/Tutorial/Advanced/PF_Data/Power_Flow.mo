within OpenIPSL.Examples.Tutorial.Advanced.PF_Data;
record Power_Flow

  replaceable record PowerFlow =
        OpenIPSL.Examples.Tutorial.Advanced.PF_Data.Power_Flow_Template
      constrainedby
      OpenIPSL.Examples.Tutorial.Advanced.PF_Data.Power_Flow_Template
  annotation(choicesAllMatching);

PowerFlow powerflow;

  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end Power_Flow;
