within OpenIPSL.PowerPlantDataSets.PfData;
package TrafoData "Records with power flow solutions for machines"
  extends Modelica.Icons.RecordsPackage;

  partial record TrafoTemplate
    "Record template for power flow solutions in transformers"

  end TrafoTemplate;

  record PfTrafo00030
    "Record for power flow solutions in trafos - Pload = 30 MW"
    extends TrafoTemplate;

  end PfTrafo00030;

  record PfTrafo00040
    "Record for power flow solutions in trafos - Pload = 40 MW"
    extends TrafoTemplate;

  end PfTrafo00040;

  record PfTrafo00050
    "Record for power flow solutions in trafos - Pload = 50 MW"
    extends TrafoTemplate;

  end PfTrafo00050;

  record PfTrafo00060
    "Record for power flow solutions in trafos - Pload = 60 MW"
    extends TrafoTemplate;

  end PfTrafo00060;

  record PfTrafo00070
    "Record for power flow solutions in trafos - Pload = 70 MW"
    extends TrafoTemplate;

  end PfTrafo00070;
end TrafoData;
