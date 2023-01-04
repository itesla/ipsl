within OpenIPSL.PowerPlantDataSets.Anderson.TurbGovData;
record TurbGovernorDataH8
  extends TurbGovernorDataTemplate( GOV = "G",
    R = 0.050,
    P_MAX = 90.00/75,
    T_1 = 20.000,
    T_2 = 4.000,
    T_3 = 0.500,
    T_4 = 0.000,
    T_5 = 0.850,
    F = -2.000);
end TurbGovernorDataH8;
