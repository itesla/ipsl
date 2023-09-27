within OpenIPSL.Data.PowerPlant.Anderson.Steam.Fossil;
record AndersonF3 "Anderson Fossil Steam Unit 3 (51.2 MVA)"

  extends GUDynamicsTemplate;

  replaceable record Machine = MachineData.MachineDataF3  constrainedby
    MachineData.MachineDataTemplate     "Machine data";
  Machine machine;

  replaceable record ExcSystem = ESData.ExcSystemDataF3  constrainedby
    ESData.ExcSystemDataTemplate     "Excitation system data";
  ExcSystem excSystem;

  replaceable record TurbGovernor = TurbGovData.TurbGovernorDataF3  constrainedby
    TurbGovData.TurbGovernorDataTemplate     "Turbine-Governor data";
  TurbGovernor turbGovernor;

  replaceable record PSS = PSSData.PSSDataF3  constrainedby
    PSSData.PSSDataTemplate     "Power system stabilizer data";
      PSS pss;

end AndersonF3;
