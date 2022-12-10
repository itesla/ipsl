within OpenIPSL.DataSets.Anderson.TurbGovData;
record TurbGovernorDataF20
  extends TurbGovernorDataTemplate( GOV = "G",
    R = 0.050,
    P_MAX = 810.00/896,
    T_1 = 0.100,
    T_2 = 0.000,
    T_3 = 0.200,
    T_4 = 0.100,
    T_5 = 8.720,
    F = 0.300);
end TurbGovernorDataF20;
