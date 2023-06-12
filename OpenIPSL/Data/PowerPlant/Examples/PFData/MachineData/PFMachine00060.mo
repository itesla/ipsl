within OpenIPSL.Data.PowerPlant.Examples.PFData.MachineData;
record PFMachine00060
  "Record for power flow solutions in machines - Pload = 60 MW"
  extends MachineTemplate(
    PG1=1e06*(40.000000000000),
    QG1=1e06*(6.166248014698),
    PG2=1e06*(20.018845062360),
    QG2=1e06*(9.602764457313));

  // MACHINE: '1_1'
  // Bus: B01'

  // MACHINE: '2_1'
  // Bus: B02'

end PFMachine00060;
