within OpenIPSL.Examples.Tutorial.Example_4.PFData.MachineData;
partial record MachineTemplate
  "Record template for power flow solutions in machines"

parameter OpenIPSL.Types.ActivePower PG1 annotation(Dialog(enable = false));
parameter OpenIPSL.Types.ReactivePower QG1 annotation(Dialog(enable = false));

parameter OpenIPSL.Types.ActivePower PG2 annotation(Dialog(enable = false));
parameter OpenIPSL.Types.ReactivePower QG2 annotation(Dialog(enable = false));

end MachineTemplate;
