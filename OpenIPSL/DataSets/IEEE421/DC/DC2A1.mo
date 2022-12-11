within OpenIPSL.DataSets.IEEE421.DC;
record DC2A1 "IEEE421.5 DC2A Type Excitation System Model Data Set"
  extends GUDynamicsTemplate;

  replaceable record Machine = MachineData.Machine1   constrainedby
    MachineData.MachineDataTemplate     "Machine data";
  Machine machine;

  replaceable record ExcSystem = ESData.DC.DC2A1   constrainedby
    ESData.DC.DCxATemplate     "Excitation system data";
  ExcSystem excSystem;

  replaceable record PSS = PSSData.PSS1A2   constrainedby
    PSSData.PSS1ATemplate     "Power system stabilizer data";
  PSS pss;

end DC2A1;
