within OpenIPSL.Data.PowerPlant.Examples.PFData.MachineData;
record PFMachine00070
  "Record for power flow solutions in machines - Pload = 70 MW"
  extends MachineTemplate(
    PG1=1e06*(40.000000000000),
    QG1=1e06*(6.952963447417),
    PG2=1e06*(30.021636815223),
    QG2=1e06*(11.374399597248));

  // MACHINE: '1_1'
  // Bus: B01'

  // MACHINE: '2_1'
  // Bus: B02'

end PFMachine00070;
