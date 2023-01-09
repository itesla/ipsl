within OpenIPSL.Data.PowerPlant.Anderson.Steam.Nuclear;
record AndersonN7 "Anderson Nuclear Steam Unit 7 (1300 MVA)"

  extends GUDynamicsTemplate;

  replaceable record Machine = MachineData.MachineDataN7  constrainedby
    MachineData.MachineDataTemplate     "Machine data";
  Machine machine;

  replaceable record ExcSystem = ESData.ExcSystemDataN7  constrainedby
    ESData.ExcSystemDataTemplate     "Excitation system data";
  ExcSystem excSystem;

  replaceable record TurbGovernor = TurbGovData.TurbGovernorDataN7  constrainedby
    TurbGovData.TurbGovernorDataTemplate     "Turbine-Governor data";
  TurbGovernor turbGovernor;

  replaceable record PSS = PSSData.PSSDataN7  constrainedby
    PSSData.PSSDataTemplate     "Power system stabilizer data";
      PSS pss;

end AndersonN7;
