within OpenIPSL.Data.PowerPlant.Anderson.SynCondensor;
record AndersonSC4 "Anderson Synch Condensor Unit 4 (60 MVA)"

  extends GUDynamicsTemplate;

  replaceable record Machine = MachineData.MachineDataSC4  constrainedby
    MachineData.MachineDataTemplate     "Machine data";
  Machine machine;

  replaceable record ExcSystem = ESData.ExcSystemDataSC4  constrainedby
    ESData.ExcSystemDataTemplate     "Excitation system data";
  ExcSystem excSystem;

  replaceable record TurbGovernor = TurbGovData.TurbGovernorDataND  constrainedby
    TurbGovData.TurbGovernorDataTemplate     "Turbine-Governor data";
  TurbGovernor turbGovernor;

  replaceable record PSS = PSSData.PSSDataND  constrainedby
    PSSData.PSSDataTemplate     "Power system stabilizer data";
      PSS pss;

end AndersonSC4;
