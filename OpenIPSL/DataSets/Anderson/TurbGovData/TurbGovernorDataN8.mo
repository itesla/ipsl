within OpenIPSL.DataSets.Anderson.TurbGovData;
record TurbGovernorDataN8
  extends TurbGovernorDataTemplate( GOV = "G",
    R = 0.050,
    P_MAX = 1205.00/1340,
    T_1 = 0.180,
    T_2 = 0.000,
    T_3 = 0.040,
    T_4 = 0.200,
    T_5 = 5.000,
    F = 0.300);
end TurbGovernorDataN8;
