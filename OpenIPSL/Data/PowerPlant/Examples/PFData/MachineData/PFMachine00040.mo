within OpenIPSL.Data.PowerPlant.Examples.PFData.MachineData;
record PFMachine00040
  "Record for power flow solutions in machines - Pload = 40 MW"
  extends MachineTemplate(
    PG1=1e06*(40.000000000000),
    QG1=1e06*(4.703442639409),
    PG2=1e06*(0.016437980461),
    QG2=1e06*(6.584153452813));

  // MACHINE: '1_1'
  // Bus: B01'

  // MACHINE: '2_1'
  // Bus: B02'

end PFMachine00040;
