within OpenIPSL.PowerPlantDataSets.Anderson.TurbGovData;
record TurbGovernorDataF12
  extends TurbGovernorDataTemplate( GOV = "G",
    R = 0.050,
    P_MAX = 347.00/330,
    T_1 = 0.100,
    T_2 = 0.000,
    T_3 = 0.400,
    T_4 = 0.050,
    T_5 = 8.000,
    F = 0.250);
end TurbGovernorDataF12;
