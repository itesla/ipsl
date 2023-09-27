within OpenIPSL.Data.PowerPlant.Anderson.TurbGovData;
record TurbGovernorDataCT2
  extends TurbGovernorDataTemplate( GOV = "G",
    R = 0.040,
    P_MAX = 82.00/62.5,
    T_1 = 0.500,
    T_2 = 1.250,
    T_3 = 0.700,
    T_4 = 0.700,
    T_5 = 0.000,
    F = 1.000);
end TurbGovernorDataCT2;
