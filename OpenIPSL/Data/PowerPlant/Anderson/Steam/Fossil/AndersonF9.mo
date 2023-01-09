within OpenIPSL.Data.PowerPlant.Anderson.Steam.Fossil;
record AndersonF9 "Anderson Fossil Steam Unit 9 (192 MVA)"

  extends GUDynamicsTemplate;

  replaceable record Machine = MachineData.MachineDataF9  constrainedby
    MachineData.MachineDataTemplate     "Machine data";
  Machine machine;

  replaceable record ExcSystem = ESData.ExcSystemDataF9  constrainedby
    ESData.ExcSystemDataTemplate     "Excitation system data";
  ExcSystem excSystem;

  replaceable record TurbGovernor = TurbGovData.TurbGovernorDataF9  constrainedby
    TurbGovData.TurbGovernorDataTemplate     "Turbine-Governor data";
  TurbGovernor turbGovernor;

  replaceable record PSS = PSSData.PSSDataF9  constrainedby
    PSSData.PSSDataTemplate     "Power system stabilizer data";
      PSS pss;

end AndersonF9;
