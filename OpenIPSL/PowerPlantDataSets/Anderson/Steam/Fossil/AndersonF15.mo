within OpenIPSL.PowerPlantDataSets.Anderson.Steam.Fossil;
record AndersonF15 "Anderson Fossil Steam Unit 15 (448 MVA)"

  extends GUDynamicsTemplate;

  replaceable record Machine = MachineData.MachineDataF15  constrainedby
    MachineData.MachineDataTemplate     "Machine data";
  Machine machine;

  replaceable record ExcSystem = ESData.ExcSystemDataF15  constrainedby
    ESData.ExcSystemDataTemplate     "Excitation system data";
  ExcSystem excSystem;

  replaceable record TurbGovernor = TurbGovData.TurbGovernorDataF15  constrainedby
    TurbGovData.TurbGovernorDataTemplate     "Turbine-Governor data";
  TurbGovernor turbGovernor;

  replaceable record PSS = PSSData.PSSDataF15  constrainedby
    PSSData.PSSDataTemplate     "Power system stabilizer data";
      PSS pss;

end AndersonF15;
