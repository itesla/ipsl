within OpenIPSL.PowerPlantDataSets.Anderson.Steam.Nuclear;
record AndersonN1 "Anderson Nuclear Steam Unit 1 (76.8 MVA)"

  extends GUDynamicsTemplate;

  replaceable record Machine = MachineData.MachineDataN1  constrainedby
    MachineData.MachineDataTemplate     "Machine data";
  Machine machine;

  replaceable record ExcSystem = ESData.ExcSystemDataN1  constrainedby
    ESData.ExcSystemDataTemplate     "Excitation system data";
  ExcSystem excSystem;

  replaceable record TurbGovernor = TurbGovData.TurbGovernorDataN1  constrainedby
    TurbGovData.TurbGovernorDataTemplate     "Turbine-Governor data";
  TurbGovernor turbGovernor;

  replaceable record PSS = PSSData.PSSDataN1  constrainedby
    PSSData.PSSDataTemplate     "Power system stabilizer data";
      PSS pss;

end AndersonN1;
