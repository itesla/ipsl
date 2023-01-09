within OpenIPSL.Data.PowerPlant.Anderson.TurbGovData;
record TurbGovernorDataCF5LP
  extends TurbGovernorDataTemplate( GOV = "G",
    R = 0.050,
    P_MAX = 382.00/426,
    T_1 = 0.100,
    T_2 = 0.000,
    T_3 = 0.300,
    T_4 = 0.050,
    T_5 = 14.000,
    F = 0.000);
end TurbGovernorDataCF5LP;
