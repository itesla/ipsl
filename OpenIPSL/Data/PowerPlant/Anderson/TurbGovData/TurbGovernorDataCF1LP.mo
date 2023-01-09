within OpenIPSL.Data.PowerPlant.Anderson.TurbGovData;
record TurbGovernorDataCF1LP
  extends TurbGovernorDataTemplate( GOV = "G",
    R = 0.050,
    P_MAX = 107.50/128,
    T_1 = 0.100,
    T_2 = 0.000,
    T_3 = 0.150,
    T_4 = 0.300,
    T_5 = 10.000,
    F = 0.000);
end TurbGovernorDataCF1LP;
