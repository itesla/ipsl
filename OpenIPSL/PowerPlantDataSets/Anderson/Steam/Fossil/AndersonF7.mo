within OpenIPSL.PowerPlantDataSets.Anderson.Steam.Fossil;
record AndersonF7 "Anderson Fossil Steam Unit 7 (147.1 MVA)"

  extends GUDynamicsTemplate;

  replaceable record Machine = MachineData.MachineDataF7  constrainedby
    MachineData.MachineDataTemplate     "Machine data";
  Machine machine;

  replaceable record ExcSystem = ESData.ExcSystemDataF7  constrainedby
    ESData.ExcSystemDataTemplate     "Excitation system data";
  ExcSystem excSystem;

  replaceable record TurbGovernor = TurbGovData.TurbGovernorDataF7  constrainedby
    TurbGovData.TurbGovernorDataTemplate     "Turbine-Governor data";
  TurbGovernor turbGovernor;

  replaceable record PSS = PSSData.PSSDataND  constrainedby
    PSSData.PSSDataTemplate     "Power system stabilizer data";
      PSS pss;

end AndersonF7;
