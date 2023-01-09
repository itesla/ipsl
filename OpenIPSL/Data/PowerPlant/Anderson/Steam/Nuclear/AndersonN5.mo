within OpenIPSL.Data.PowerPlant.Anderson.Steam.Nuclear;
record AndersonN5 "Anderson Nuclear Steam Unit 5 (1070 MVA)"

  extends GUDynamicsTemplate;

  replaceable record Machine = MachineData.MachineDataN5  constrainedby
    MachineData.MachineDataTemplate     "Machine data";
  Machine machine;

  replaceable record ExcSystem = ESData.ExcSystemDataN5  constrainedby
    ESData.ExcSystemDataTemplate     "Excitation system data";
  ExcSystem excSystem;

  replaceable record TurbGovernor = TurbGovData.TurbGovernorDataN5  constrainedby
    TurbGovData.TurbGovernorDataTemplate     "Turbine-Governor data";
  TurbGovernor turbGovernor;

  replaceable record PSS = PSSData.PSSDataN5  constrainedby
    PSSData.PSSDataTemplate     "Power system stabilizer data";
      PSS pss;

end AndersonN5;
