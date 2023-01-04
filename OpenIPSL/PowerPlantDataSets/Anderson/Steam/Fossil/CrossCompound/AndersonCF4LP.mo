within OpenIPSL.PowerPlantDataSets.Anderson.Steam.Fossil.CrossCompound;
record AndersonCF4LP
  "Anderson Cross-Compound Fossil Steam Unit 4 LP (375 MVA)"

  extends GUDynamicsTemplate;

  replaceable record Machine = MachineData.MachineDataCF4LP  constrainedby
    MachineData.MachineDataTemplate     "Machine data";
  Machine machine;

  replaceable record ExcSystem = ESData.ExcSystemDataCF4LP  constrainedby
    ESData.ExcSystemDataTemplate     "Excitation system data";
  ExcSystem excSystem;

  replaceable record TurbGovernor =
      TurbGovData.TurbGovernorDataCF4LP                                constrainedby
    TurbGovData.TurbGovernorDataTemplate     "Turbine-Governor data";
  TurbGovernor turbGovernor;

  replaceable record PSS = PSSData.PSSDataCF4LP  constrainedby
    PSSData.PSSDataTemplate     "Power system stabilizer data";
      PSS pss;

end AndersonCF4LP;
