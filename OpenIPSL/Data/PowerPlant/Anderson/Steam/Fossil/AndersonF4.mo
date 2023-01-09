within OpenIPSL.Data.PowerPlant.Anderson.Steam.Fossil;
record AndersonF4 "Anderson Fossil Steam Unit 4 (75 MVA)"

  extends GUDynamicsTemplate;

  replaceable record Machine = MachineData.MachineDataF4  constrainedby
    MachineData.MachineDataTemplate     "Machine data";
  Machine machine;

  replaceable record ExcSystem = ESData.ExcSystemDataF4  constrainedby
    ESData.ExcSystemDataTemplate     "Excitation system data";
  ExcSystem excSystem;

  replaceable record TurbGovernor = TurbGovData.TurbGovernorDataF4  constrainedby
    TurbGovData.TurbGovernorDataTemplate     "Turbine-Governor data";
  TurbGovernor turbGovernor;

  replaceable record PSS = PSSData.PSSDataND  constrainedby
    PSSData.PSSDataTemplate     "Power system stabilizer data";
      PSS pss;

end AndersonF4;
