within OpenIPSL.PowerPlantDataSets.IEEE421.DC;
record DC3A1
  "IEEE421.5 DC3A Type Excitation System Model Data Set 1 (Self-Excited)"
  extends GUDynamicsTemplate;

  replaceable record Machine = MachineData.Machine1   constrainedby
    MachineData.MachineDataTemplate     "Machine data";
  Machine machine;

  replaceable record ExcSystem = ESData.DC.DC3A1   constrainedby
    ESData.DC.DCxATemplate     "Excitation system data";
  ExcSystem excSystem;

  replaceable record PSS = PSSData.PSS1AND   constrainedby
    PSSData.PSS1ATemplate     "Power system stabilizer data";
  PSS pss;

end DC3A1;
