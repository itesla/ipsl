within OpenIPSL.DataSets.Anderson.TurbGovData;
record TurbGovernorDataH15
  extends TurbGovernorDataTemplate( GOV = "G",
    R = 0.050,
    P_MAX = 155.00/158,
    T_1 = Modelica.Constants.small,
    T_2 = Modelica.Constants.small,
    T_3 = Modelica.Constants.small,
    T_4 = Modelica.Constants.small,
    T_5 = Modelica.Constants.small,
    F = -2.000);
end TurbGovernorDataH15;
