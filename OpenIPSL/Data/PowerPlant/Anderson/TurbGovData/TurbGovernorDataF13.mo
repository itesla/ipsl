within OpenIPSL.Data.PowerPlant.Anderson.TurbGovData;
record TurbGovernorDataF13
  extends TurbGovernorDataTemplate( GOV = "G",
    R = 0.050,
    P_MAX = 360.00/384,
    T_1 = 0.220,
    T_2 = 0.000,
    T_3 = 0.200,
    T_4 = 0.250,
    T_5 = 8.000,
    F = 0.270);
end TurbGovernorDataF13;
