within OpenIPSL.PowerPlantDataSets.Anderson.TurbGovData;
record TurbGovernorDataH16
  extends TurbGovernorDataTemplate( GOV = "G",
    R = 0.050,
    P_MAX = 267.00/231.6,
    T_1 = 124.470,
    T_2 = 8.590,
    T_3 = 0.250,
    T_4 = 0.000,
    T_5 = 0.740,
    F = -2.000);
end TurbGovernorDataH16;
