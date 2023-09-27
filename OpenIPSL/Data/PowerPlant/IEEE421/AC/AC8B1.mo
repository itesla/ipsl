within OpenIPSL.Data.PowerPlant.IEEE421.AC;
record AC8B1 "IEEE421.5 AC8B Type Excitation System Model Data Set"
  extends GUDynamicsTemplate;

  replaceable record Machine = MachineData.Machine1   constrainedby
    MachineData.MachineDataTemplate     "Machine data";
  Machine machine;

  replaceable record ExcSystem = ESData.AC.AC8B1   constrainedby
    ESData.AC.ACxBTemplate     "Excitation system data";
  ExcSystem excSystem;

  replaceable record PSS = PSSData.PSS2BND   constrainedby
    PSSData.PSS2BTemplate     "Power system stabilizer data";
  PSS pss;

end AC8B1;
