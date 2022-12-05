within OpenIPSL.Examples.Tutorial.Example_4.PfData.MachineData;
partial record MachineTemplate
  "Record template for power flow solutions in machines"

parameter OpenIPSL.Types.ActivePower PG1 "Machine: genunit" annotation(Dialog(enable = false));
parameter OpenIPSL.Types.ReactivePower QG1 "Machine: genunit" annotation(Dialog(enable = false));

parameter OpenIPSL.Types.ActivePower PG2 "Machine: infiniteBus" annotation(Dialog(enable = false));
parameter OpenIPSL.Types.ReactivePower QG2 "Machine: infiniteBus" annotation(Dialog(enable = false));

end MachineTemplate;
