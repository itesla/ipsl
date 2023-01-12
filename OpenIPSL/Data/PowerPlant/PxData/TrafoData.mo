within OpenIPSL.Data.PowerPlant.PxData;
package TrafoData "Records with power flow solutions for machines"
  extends Modelica.Icons.RecordsPackage;

  partial record TrafoTemplate
    "Record template for power flow solutions in transformers"

  end TrafoTemplate;

  record PxTrafo00030
    "Record for power flow solutions in trafos - Pload = 30 MW"
    extends TrafoTemplate;

  end PxTrafo00030;

  record PxTrafo00040
    "Record for power flow solutions in trafos - Pload = 40 MW"
    extends TrafoTemplate;

  end PxTrafo00040;

  record PxTrafo00050
    "Record for power flow solutions in trafos - Pload = 50 MW"
    extends TrafoTemplate;

  end PxTrafo00050;

  record PxTrafo00060
    "Record for power flow solutions in trafos - Pload = 60 MW"
    extends TrafoTemplate;

  end PxTrafo00060;

  record PxTrafo00070
    "Record for power flow solutions in trafos - Pload = 70 MW"
    extends TrafoTemplate;

  end PxTrafo00070;
end TrafoData;
