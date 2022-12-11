within OpenIPSL.DataSets.IEEE421.DC;
record DC1A1 "IEEE421.5 DC1A Type Excitation System Model Data Set"
  extends GUDynamicsTemplate;

  replaceable record Machine = MachineData.Machine1   constrainedby
    MachineData.MachineDataTemplate     "Machine data";
  Machine machine;

  replaceable record ExcSystem = ESData.DC.DC1A1   constrainedby
    ESData.DC.DCxATemplate     "Excitation system data";
  ExcSystem excSystem;

  replaceable record PSS = PSSData.PSS1A1   constrainedby
    PSSData.PSS1ATemplate     "Power system stabilizer data";
  PSS pss;

end DC1A1;
