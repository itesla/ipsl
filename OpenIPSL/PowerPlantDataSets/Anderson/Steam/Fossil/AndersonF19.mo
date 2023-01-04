within OpenIPSL.PowerPlantDataSets.Anderson.Steam.Fossil;
record AndersonF19 "Anderson Fossil Steam Unit 19 (835 MVA)"

  extends GUDynamicsTemplate;

  replaceable record Machine = MachineData.MachineDataF19  constrainedby
    MachineData.MachineDataTemplate     "Machine data";
  Machine machine;

  replaceable record ExcSystem = ESData.ExcSystemDataF19  constrainedby
    ESData.ExcSystemDataTemplate     "Excitation system data";
  ExcSystem excSystem;

  replaceable record TurbGovernor = TurbGovData.TurbGovernorDataF19  constrainedby
    TurbGovData.TurbGovernorDataTemplate     "Turbine-Governor data";
  TurbGovernor turbGovernor;

  replaceable record PSS = PSSData.PSSDataF19  constrainedby
    PSSData.PSSDataTemplate     "Power system stabilizer data";
      PSS pss;

end AndersonF19;
