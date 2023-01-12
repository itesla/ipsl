within OpenIPSL.Data.PowerPlant.PFData;
package LoadData "Records with power flow solutions for loads"
  extends Modelica.Icons.RecordsPackage;

  partial record LoadTemplate
    "Record template for power flow solutions in loads"

    parameter OpenIPSL.Types.ActivePower PL1 "Load: constantLoad"
      annotation (Dialog(enable=false));
    parameter OpenIPSL.Types.ReactivePower QL1 "Load: constantLoad"
      annotation (Dialog(enable=false));

  end LoadTemplate;

  record PFLoad00030 "Record for power flow solutions in loads - Pload = 30 MW"
    extends LoadTemplate(  PL1=1e06*(30.000000000000), QL1=1e06*(6.000000000000));

    // Load: '3_1'

  end PFLoad00030;

  record PFLoad00040 "Record for power flow solutions in loads - Pload = 40 MW"
    extends LoadTemplate(  PL1=1e06*(40.000000000000), QL1=1e06*(8.000000000000));

    // Load: '3_1'

  end PFLoad00040;

  record PFLoad00050 "Record for power flow solutions in loads - Pload = 50 MW"
    extends LoadTemplate(  PL1=1e06*(50.000000000000), QL1=1e06*(10.000000000000));

    // Load: '3_1'

  end PFLoad00050;

  record PFLoad00060 "Record for power flow solutions in loads - Pload = 60 MW"
    extends LoadTemplate(  PL1=1e06*(60.000000000000), QL1=1e06*(12.000000000000));

    // Load: '3_1'

  end PFLoad00060;

  record PFLoad00070 "Record for power flow solutions in loads - Pload = 70 MW"
    extends LoadTemplate(  PL1=1e06*(70.000000000000), QL1=1e06*(14.000000000000));

    // Load: '3_1'

  end PFLoad00070;
end LoadData;
