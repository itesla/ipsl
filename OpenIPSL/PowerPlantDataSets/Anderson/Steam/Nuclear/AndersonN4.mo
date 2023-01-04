within OpenIPSL.PowerPlantDataSets.Anderson.Steam.Nuclear;
record AndersonN4 "Anderson Nuclear Steam Unit 4 (920.35 MVA)"

  extends GUDynamicsTemplate;

  replaceable record Machine = MachineData.MachineDataN4  constrainedby
    MachineData.MachineDataTemplate     "Machine data";
  Machine machine;

  replaceable record ExcSystem = ESData.ExcSystemDataN4  constrainedby
    ESData.ExcSystemDataTemplate     "Excitation system data";
  ExcSystem excSystem;

  replaceable record TurbGovernor = TurbGovData.TurbGovernorDataN4  constrainedby
    TurbGovData.TurbGovernorDataTemplate     "Turbine-Governor data";
  TurbGovernor turbGovernor;

  replaceable record PSS = PSSData.PSSDataND  constrainedby
    PSSData.PSSDataTemplate     "Power system stabilizer data";
      PSS pss;

end AndersonN4;
