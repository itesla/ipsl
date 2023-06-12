within OpenIPSL.Data.PowerPlant.Examples.PFData;
record PowerFlow "Record containing replaceable record with power flow results"
  extends Modelica.Icons.Record;

  replaceable record PowerFlow =
      PowerFlowTemplate constrainedby PowerFlowTemplate "Replaceable power flow record"
                                                  annotation (
      choicesAllMatching);

  PowerFlow powerflow;

  annotation (Documentation(info="<html>
<p>Instantiable record containing the replaceable record with power flow results.</p>
</html>"));
end PowerFlow;
