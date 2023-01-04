within OpenIPSL.PowerPlantDataSets.Anderson.TurbGovData;
record TurbGovernorDataH13
  extends TurbGovernorDataTemplate( GOV = "G",
    R = 0.050,
    P_MAX = 120.00/131,
    T_1 = 27.500,
    T_2 = 2.240,
    T_3 = 0.500,
    T_4 = 0.000,
    T_5 = 0.520,
    F = -2.000);
end TurbGovernorDataH13;
