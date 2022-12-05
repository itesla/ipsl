within OpenIPSL.Examples.Tutorial.Example_4.PfData.LoadData;
partial record LoadTemplate
  "Record template for power flow solutions in loads"

parameter OpenIPSL.Types.ActivePower PL1 "Load: load" annotation(Dialog(enable = false));
parameter OpenIPSL.Types.ReactivePower QL1 "Load: load" annotation(Dialog(enable = false));

end LoadTemplate;
