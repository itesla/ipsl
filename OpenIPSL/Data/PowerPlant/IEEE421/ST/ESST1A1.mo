within OpenIPSL.Data.PowerPlant.IEEE421.ST;
record ESST1A1
  "IEEE421.5 ST1A Type Excitation System Model Data Set 1 (Bus-fed thyristor excitation system without transient gain reduction)"
  extends GUDynamicsTemplate;

  replaceable record Machine = MachineData.Machine1   constrainedby
    MachineData.MachineDataTemplate     "Machine data";
  Machine machine;

  replaceable record ExcSystem = ESData.ST.ESST1A1   constrainedby
    ESData.ST.ESSTxATemplate     "Excitation system data";
  ExcSystem excSystem;

  replaceable record PSS = PSSData.PSS2B2   constrainedby PSSData.PSS2BTemplate
                              "Power system stabilizer data";
  PSS pss;

end ESST1A1;
