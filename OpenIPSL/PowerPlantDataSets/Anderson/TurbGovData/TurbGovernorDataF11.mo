within OpenIPSL.PowerPlantDataSets.Anderson.TurbGovData;
record TurbGovernorDataF11
  extends TurbGovernorDataTemplate( GOV = "G",
    R = 0.050,
    P_MAX = 230.00/270,
    T_1 = 0.100,
    T_2 = 0.000,
    T_3 = 0.259,
    T_4 = 0.100,
    T_5 = 10.000,
    F = 0.272);
end TurbGovernorDataF11;
