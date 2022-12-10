within OpenIPSL.DataSets.Anderson.TurbGovData;
record TurbGovernorDataF8
  extends TurbGovernorDataTemplate( GOV = "G",
    R = 0.050,
    P_MAX = 142.30/160,
    T_1 = 0.100,
    T_2 = 0.000,
    T_3 = 0.200,
    T_4 = 0.050,
    T_5 = 8.000,
    F = 0.300);
end TurbGovernorDataF8;
