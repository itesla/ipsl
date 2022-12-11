within OpenIPSL.DataSets.IEEE421.DC;
record DC3A2
  "IEEE421.5 DC3A Type Excitation System Model Data Set 2 (Separately Excited)"
  extends GUDynamicsTemplate;

  replaceable record Machine = MachineData.Machine1   constrainedby
    MachineData.MachineDataTemplate     "Machine data";
  Machine machine;

  replaceable record ExcSystem = ESData.DC.DC3A2   constrainedby
    ESData.DC.DCxATemplate     "Excitation system data";
  ExcSystem excSystem;

  replaceable record PSS = PSSData.PSS1AND   constrainedby
    PSSData.PSS1ATemplate     "Power system stabilizer data";
  PSS pss;

end DC3A2;
