within OpenIPSL.PowerPlantDataSets.IEEE421.ST;
record ESST1A2
  "IEEE421.5 ST1A Type Excitation System Model Data Set 2 (Bus-fed thyristor excitation system with transient gain reduction)"
  extends GUDynamicsTemplate;

  replaceable record Machine = MachineData.Machine1   constrainedby
    MachineData.MachineDataTemplate     "Machine data";
  Machine machine;

  replaceable record ExcSystem = ESData.ST.ESST1A2   constrainedby
    ESData.ST.ESSTxATemplate     "Excitation system data";
  ExcSystem excSystem;

  replaceable record PSS = PSSData.PSS1A3   constrainedby PSSData.PSS1ATemplate
                              "Power system stabilizer data";
  PSS pss;

end ESST1A2;
