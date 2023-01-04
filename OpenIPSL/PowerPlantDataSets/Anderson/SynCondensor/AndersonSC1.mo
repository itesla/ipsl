within OpenIPSL.PowerPlantDataSets.Anderson.SynCondensor;
record AndersonSC1 "Anderson Synch Condensor Unit 1 (25 MVA)"

  extends GUDynamicsTemplate;

  replaceable record Machine = MachineData.MachineDataSC1  constrainedby
    MachineData.MachineDataTemplate     "Machine data";
  Machine machine;

  replaceable record ExcSystem = ESData.ExcSystemDataSC1  constrainedby
    ESData.ExcSystemDataTemplate     "Excitation system data";
  ExcSystem excSystem;

  replaceable record TurbGovernor = TurbGovData.TurbGovernorDataND  constrainedby
    TurbGovData.TurbGovernorDataTemplate     "Turbine-Governor data";
  TurbGovernor turbGovernor;

  replaceable record PSS = PSSData.PSSDataND  constrainedby
    PSSData.PSSDataTemplate     "Power system stabilizer data";
      PSS pss;

end AndersonSC1;
