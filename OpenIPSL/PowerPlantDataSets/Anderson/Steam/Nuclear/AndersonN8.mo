within OpenIPSL.PowerPlantDataSets.Anderson.Steam.Nuclear;
record AndersonN8 "Anderson Nuclear Steam Unit 8 (1340 MVA)"

  extends GUDynamicsTemplate;

  replaceable record Machine = MachineData.MachineDataN8  constrainedby
    MachineData.MachineDataTemplate     "Machine data";
  Machine machine;

  replaceable record ExcSystem = ESData.ExcSystemDataN8  constrainedby
    ESData.ExcSystemDataTemplate     "Excitation system data";
  ExcSystem excSystem;

  replaceable record TurbGovernor = TurbGovData.TurbGovernorDataN8  constrainedby
    TurbGovData.TurbGovernorDataTemplate     "Turbine-Governor data";
  TurbGovernor turbGovernor;

  replaceable record PSS = PSSData.PSSDataN8  constrainedby
    PSSData.PSSDataTemplate     "Power system stabilizer data";
      PSS pss;

end AndersonN8;
