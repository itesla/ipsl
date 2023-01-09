within OpenIPSL.Data.PowerPlant.Anderson.Steam.Fossil;
record AndersonF2 "Anderson Fossil Steam Unit 2 (35.29 MVA)"

  extends GUDynamicsTemplate;

  replaceable record Machine = MachineData.MachineDataF2  constrainedby
    MachineData.MachineDataTemplate     "Machine data";
  Machine machine;

  replaceable record ExcSystem = ESData.ExcSystemDataF2  constrainedby
    ESData.ExcSystemDataTemplate     "Excitation system data";
  ExcSystem excSystem;

  replaceable record TurbGovernor = TurbGovData.TurbGovernorDataF2  constrainedby
    TurbGovData.TurbGovernorDataTemplate     "Turbine-Governor data";
  TurbGovernor turbGovernor;

  replaceable record PSS = PSSData.PSSDataND  constrainedby
    PSSData.PSSDataTemplate     "Power system stabilizer data";
      PSS pss;

end AndersonF2;
