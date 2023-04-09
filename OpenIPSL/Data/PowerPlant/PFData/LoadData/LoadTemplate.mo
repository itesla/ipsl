within OpenIPSL.Data.PowerPlant.PFData.LoadData;
partial record LoadTemplate
  "Record template for power flow solutions in loads"

  parameter OpenIPSL.Types.ActivePower PL1 "Load: constantLoad"
    annotation (Dialog(enable=false));
  parameter OpenIPSL.Types.ReactivePower QL1 "Load: constantLoad"
    annotation (Dialog(enable=false));

end LoadTemplate;
