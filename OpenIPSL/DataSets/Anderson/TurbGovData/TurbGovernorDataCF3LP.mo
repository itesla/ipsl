within OpenIPSL.DataSets.Anderson.TurbGovData;
record TurbGovernorDataCF3LP
  extends TurbGovernorDataTemplate( GOV = "G",
    R = 0.050,
    P_MAX = 213.00/221.7,
    T_1 = 0.250,
    T_2 = 0.000,
    T_3 = 0.000,
    T_4 = 0.300,
    T_5 = 12.000,
    F = 0.000);
end TurbGovernorDataCF3LP;
