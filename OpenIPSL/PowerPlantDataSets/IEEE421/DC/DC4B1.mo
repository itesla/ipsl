within OpenIPSL.PowerPlantDataSets.IEEE421.DC;
record DC4B1 "IEEE421.5 DC4B Type Excitation System Model Data Set"
  extends GUDynamicsTemplate;

  replaceable record Machine = MachineData.Machine1   constrainedby
    MachineData.MachineDataTemplate     "Machine data";
  Machine machine;

  replaceable record ExcSystem = ESData.DC.DC4B1   constrainedby
    ESData.DC.DCxBTemplate     "Excitation system data";
  ExcSystem excSystem;

  replaceable record PSS = PSSData.PSS1AND   constrainedby
    PSSData.PSS1ATemplate     "Power system stabilizer data";
  PSS pss;

end DC4B1;
