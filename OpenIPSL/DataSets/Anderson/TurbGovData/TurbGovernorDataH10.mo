within OpenIPSL.DataSets.Anderson.TurbGovData;
record TurbGovernorDataH10
  extends TurbGovernorDataTemplate( GOV = "G",
    R = 0.030,
    P_MAX = 133.00/100,
    T_1 = 52.100,
    T_2 = 4.800,
    T_3 = 0.500,
    T_4 = 0.000,
    T_5 = 0.498,
    F = -2.000);
end TurbGovernorDataH10;
