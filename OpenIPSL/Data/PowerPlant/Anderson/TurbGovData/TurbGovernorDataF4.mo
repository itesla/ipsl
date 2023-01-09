within OpenIPSL.Data.PowerPlant.Anderson.TurbGovData;
record TurbGovernorDataF4
  extends TurbGovernorDataTemplate( GOV = "G",
    R = 0.050,
    P_MAX = 75.00/75,
    T_1 = 0.090,
    T_2 = 0.000,
    T_3 = 0.200,
    T_4 = 0.300,
    T_5 = 0.000,
    F = 1.000);
end TurbGovernorDataF4;
