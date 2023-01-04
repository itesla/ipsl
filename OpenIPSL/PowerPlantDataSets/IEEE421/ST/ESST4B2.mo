within OpenIPSL.PowerPlantDataSets.IEEE421.ST;
record ESST4B2
  "IEEE421.5 ST4B Type Excitation System Model Data Set 1 (Compound Source)"
  extends GUDynamicsTemplate;

  replaceable record Machine = MachineData.Machine1   constrainedby
    MachineData.MachineDataTemplate     "Machine data";
  Machine machine;

  replaceable record ExcSystem = ESData.ST.ESST4B2   constrainedby
    ESData.ST.ESSTxBTemplate     "Excitation system data";
  ExcSystem excSystem;

  replaceable record PSS = PSSData.PSS2BND   constrainedby
    PSSData.PSS2BTemplate     "Power system stabilizer data";
  PSS pss;

end ESST4B2;
