within OpenIPSL.Data.PowerPlant.Anderson.Hydro;
record AndersonH4 "Anderson Hydro Unit 4 (35 MVA)"

  extends GUDynamicsTemplate;

  replaceable record Machine = MachineData.MachineDataH4  constrainedby
    MachineData.MachineDataTemplate     "Machine data";
  Machine machine;

  replaceable record ExcSystem = ESData.ExcSystemDataH4  constrainedby
    ESData.ExcSystemDataTemplate     "Excitation system data";
  ExcSystem excSystem;

  replaceable record TurbGovernor = TurbGovData.TurbGovernorDataH4  constrainedby
    TurbGovData.TurbGovernorDataTemplate     "Turbine-Governor data";
  TurbGovernor turbGovernor;

  replaceable record PSS = PSSData.PSSDataND  constrainedby
    PSSData.PSSDataTemplate     "Power system stabilizer data";
      PSS pss;

end AndersonH4;
