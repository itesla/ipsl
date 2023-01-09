within OpenIPSL.Data.PowerPlant.Anderson.TurbGovData;
record TurbGovernorDataF18
  extends TurbGovernorDataTemplate( GOV = "G",
    R = 0.050,
    P_MAX = 553.00/590,
    T_1 = 0.080,
    T_2 = 0.000,
    T_3 = 0.150,
    T_4 = 0.050,
    T_5 = 10.000,
    F = 0.280);
end TurbGovernorDataF18;
