within OpenIPSL.Examples.Tutorial.Example_4.PfData.MachineData;
record PfMachine00000 "Record for power flow solutions in machines - Id 00000"
extends
    OpenIPSL.Examples.Tutorial.Example_4.PfData.MachineData.MachineTemplate(
    PG1=1e06*(40.0000000),
    QG1=1e06*(5.4165820),
    PG2=1e06*(10.0171156),
    QG2=1e06*(8.0065440));

// MACHINE: '1_1'
// Bus: B01'

// MACHINE: '2_1'
// Bus: B02'

end PfMachine00000;
