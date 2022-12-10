within OpenIPSL.DataSets.Anderson.TurbGovData;
record TurbGovernorDataF7
  extends TurbGovernorDataTemplate( GOV = "G",
    R = 0.050,
    P_MAX = 121.00/147.1,
    T_1 = 0.200,
    T_2 = 0.000,
    T_3 = 0.300,
    T_4 = 0.090,
    T_5 = 10.000,
    F = 0.250);
end TurbGovernorDataF7;
