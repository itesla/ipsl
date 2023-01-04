within OpenIPSL.PowerPlantDataSets.IEEE421.AC;
record AC1A1 "IEEE421.5 AC1A Type Excitation System Model Data Set"
  extends GUDynamicsTemplate;

  replaceable record Machine = MachineData.Machine1   constrainedby
    MachineData.MachineDataTemplate     "Machine data";
  Machine machine;

  replaceable record ExcSystem = ESData.AC.AC1A1   constrainedby
    ESData.AC.ACxATemplate     "Excitation system data";
  ExcSystem excSystem;

  replaceable record PSS = PSSData.PSS1AND   constrainedby
    PSSData.PSS1ATemplate     "Power system stabilizer data";
  PSS pss;

end AC1A1;
