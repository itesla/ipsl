within OpenIPSL.Data.PowerPlant.Anderson.TurbGovData;
record TurbGovernorDataH14
  extends TurbGovernorDataTemplate( GOV = "G",
    R = 0.038,
    P_MAX = 160.00/145,
    T_1 = 65.300,
    T_2 = 6.200,
    T_3 = 0.500,
    T_4 = 0.000,
    T_5 = 0.650,
    F = -2.000);
end TurbGovernorDataH14;
