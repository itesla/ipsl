within OpenIPSL.PowerPlantDataSets.Anderson.TurbGovData;
record TurbGovernorDataF10
  extends TurbGovernorDataTemplate( GOV = "G",
    R = 0.050,
    P_MAX = 210.00/233,
    T_1 = 0.150,
    T_2 = 0.000,
    T_3 = 0.100,
    T_4 = 0.300,
    T_5 = 10.000,
    F = 0.237);
end TurbGovernorDataF10;
