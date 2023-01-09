within OpenIPSL.Data.PowerPlant.PFData;
record PowerFlow
  extends Modelica.Icons.Record;

  replaceable record PowerFlow =
      PowerFlowTemplate constrainedby PowerFlowTemplate "Replaceable power flow record"
                                                  annotation (
      choicesAllMatching);

  PowerFlow powerflow;

end PowerFlow;
