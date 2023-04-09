within OpenIPSL.Data.PowerPlant.PFData.MachineData;
record PFMachine00030
  "Record for power flow solutions in machines - Pload = 30 MW"
  extends MachineTemplate(
    PG1=1e06*(40.000000000000),
    QG1=1e06*(4.026356091240),
    PG2=1e06*(-9.983197295790),
    QG2=1e06*(5.334184750708));

  // MACHINE: '1_1'
  // Bus: B01'

  // MACHINE: '2_1'
  // Bus: B02'

end PFMachine00030;
