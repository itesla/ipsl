within OpenIPSL.Data.PowerPlant.PFData;
package TrafoData "Records with power flow solutions for transformers"
  extends Modelica.Icons.RecordsPackage;

  partial record TrafoTemplate
    "Record template for power flow solutions in transformers"

  end TrafoTemplate;

  record PFTrafo00030
    "Record for power flow solutions in trafos - Pload = 30 MW"
    extends TrafoTemplate;

  end PFTrafo00030;

  record PFTrafo00040
    "Record for power flow solutions in trafos - Pload = 40 MW"
    extends TrafoTemplate;

  end PFTrafo00040;

  record PFTrafo00050
    "Record for power flow solutions in trafos - Pload = 50 MW"
    extends TrafoTemplate;

  end PFTrafo00050;

  record PFTrafo00060
    "Record for power flow solutions in trafos - Pload = 60 MW"
    extends TrafoTemplate;

  end PFTrafo00060;

  record PFTrafo00070
    "Record for power flow solutions in trafos - Pload = 70 MW"
    extends TrafoTemplate;

  end PFTrafo00070;
  annotation (Documentation(info="<html>
<p>Records with power flow solutions for transformers.</p>
</html>"));
end TrafoData;
