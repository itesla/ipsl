within OpenIPSL.PowerPlantDataSets.Anderson.TurbGovData;
record TurbGovernorDataCF5HP
  extends TurbGovernorDataTemplate( GOV = "G",
    R = 0.050,
    P_MAX = 436.00/483,
    T_1 = 0.100,
    T_2 = 0.000,
    T_3 = 0.300,
    T_4 = 0.050,
    T_5 = 14.000,
    F = 0.580);
end TurbGovernorDataCF5HP;
