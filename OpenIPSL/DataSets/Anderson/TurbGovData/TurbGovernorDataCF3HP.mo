within OpenIPSL.DataSets.Anderson.TurbGovData;
record TurbGovernorDataCF3HP
  extends TurbGovernorDataTemplate( GOV = "G",
    R = 0.050,
    P_MAX = 267.00/278.3,
    T_1 = 0.250,
    T_2 = 0.000,
    T_3 = 0.000,
    T_4 = 0.050,
    T_5 = 12.000,
    F = 0.549);
end TurbGovernorDataCF3HP;
