within OpenIPSL.Examples.Tutorial.Example_4.PFData.LoadData;
partial record LoadTemplate
  "Record template for power flow solutions in loads"

parameter OpenIPSL.Types.ActivePower PL1 annotation(Dialog(enable = false));
parameter OpenIPSL.Types.ReactivePower QL1 annotation(Dialog(enable = false));

end LoadTemplate;
