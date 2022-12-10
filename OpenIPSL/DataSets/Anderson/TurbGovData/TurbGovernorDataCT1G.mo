within OpenIPSL.DataSets.Anderson.TurbGovData;
record TurbGovernorDataCT1G
  extends TurbGovernorDataTemplate( GOV = "G",
    R = 0.050,
    P_MAX = 17.55/20.65,
    T_1 = 0.000,
    T_2 = 0.000,
    T_3 = 0.100,
    T_4 = 0.000,
    T_5 = 0.100,
    F = 0.0);
end TurbGovernorDataCT1G;
