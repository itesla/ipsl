within OpenIPSL.DataSets.PfData;
package MachineData "Records with power flow solutions for machines"
  extends Modelica.Icons.RecordsPackage;

  partial record MachineTemplate
    "Record template for power flow solutions in machines"

    parameter OpenIPSL.Types.ActivePower PG1 "machine: generator1"
      annotation (Dialog(enable=false));
    parameter OpenIPSL.Types.ReactivePower QG1 "machine: generator1"
      annotation (Dialog(enable=false));

    parameter OpenIPSL.Types.ActivePower PG2 "machine: generator2"
      annotation (Dialog(enable=false));
    parameter OpenIPSL.Types.ReactivePower QG2 "machine: generator2"
      annotation (Dialog(enable=false));

  end MachineTemplate;

  record PfMachine00030
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

  end PfMachine00030;

  record PfMachine00040
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

  end PfMachine00040;

  record PfMachine00050
    "Record for power flow solutions in machines - Pload = 50 MW"
    extends MachineTemplate(
      PG1=1e06*(40.000000000000),
      QG1=1e06*(5.416582036620),
      PG2=1e06*(10.017115630375),
      QG2=1e06*(8.006544038288));

    // MACHINE: '1_1'
    // Bus: B01'

    // MACHINE: '2_1'
    // Bus: B02'

  end PfMachine00050;

  record PfMachine00060
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

  end PfMachine00060;

  record PfMachine00070
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

  end PfMachine00070;
end MachineData;
