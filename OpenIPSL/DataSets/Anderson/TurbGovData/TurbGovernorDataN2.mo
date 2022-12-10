within OpenIPSL.DataSets.Anderson.TurbGovData;
record TurbGovernorDataN2
  extends TurbGovernorDataTemplate( GOV = "G",
    R = 0.050,
    P_MAX = 208.675/245.5,
    T_1 = Modelica.Constants.small,
    T_2 = Modelica.Constants.small,
    T_3 = Modelica.Constants.small,
    T_4 = Modelica.Constants.small,
    T_5 = Modelica.Constants.small,
    F = Modelica.Constants.small);
end TurbGovernorDataN2;
