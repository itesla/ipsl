within OpenIPSL.Data.PowerPlant.Anderson.SynCondensor;
record AndersonSC5 "Anderson Synch Condensor Unit 5 (75 MVA)"

  extends GUDynamicsTemplate;

  replaceable record Machine = MachineData.MachineDataSC5  constrainedby
    MachineData.MachineDataTemplate     "Machine data";
  Machine machine;

  replaceable record ExcSystem = ESData.ExcSystemDataSC5  constrainedby
    ESData.ExcSystemDataTemplate     "Excitation system data";
  ExcSystem excSystem;

  replaceable record TurbGovernor = TurbGovData.TurbGovernorDataND  constrainedby
    TurbGovData.TurbGovernorDataTemplate     "Turbine-Governor data";
  TurbGovernor turbGovernor;

  replaceable record PSS = PSSData.PSSDataND  constrainedby
    PSSData.PSSDataTemplate     "Power system stabilizer data";
      PSS pss;

end AndersonSC5;
