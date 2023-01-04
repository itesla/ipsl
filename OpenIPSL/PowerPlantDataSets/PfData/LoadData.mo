within OpenIPSL.PowerPlantDataSets.PfData;
package LoadData "Records with power flow solutions for loads"
  extends Modelica.Icons.RecordsPackage;

  partial record LoadTemplate
    "Record template for power flow solutions in loads"

    parameter OpenIPSL.Types.ActivePower PL1 "Load: constantLoad"
      annotation (Dialog(enable=false));
    parameter OpenIPSL.Types.ReactivePower QL1 "Load: constantLoad"
      annotation (Dialog(enable=false));

  end LoadTemplate;

  record PfLoad00030
    "Record for power flow solutions in loads - Pload = 30 MW"
    extends LoadTemplate(  PL1=1e06*(30.000000000000), QL1=1e06*(6.000000000000));

    // Load: '3_1'

  end PfLoad00030;

  record PfLoad00040
    "Record for power flow solutions in loads - Pload = 40 MW"
    extends LoadTemplate(  PL1=1e06*(40.000000000000), QL1=1e06*(8.000000000000));

    // Load: '3_1'

  end PfLoad00040;

  record PfLoad00050
    "Record for power flow solutions in loads - Pload = 50 MW"
    extends LoadTemplate(  PL1=1e06*(50.000000000000), QL1=1e06*(10.000000000000));

    // Load: '3_1'

  end PfLoad00050;

  record PfLoad00060
    "Record for power flow solutions in loads - Pload = 60 MW"
    extends LoadTemplate(  PL1=1e06*(60.000000000000), QL1=1e06*(12.000000000000));

    // Load: '3_1'

  end PfLoad00060;

  record PfLoad00070
    "Record for power flow solutions in loads - Pload = 70 MW"
    extends LoadTemplate(  PL1=1e06*(70.000000000000), QL1=1e06*(14.000000000000));

    // Load: '3_1'

  end PfLoad00070;
end LoadData;
