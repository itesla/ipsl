within OpenIPSL.Data.PowerPlant.Anderson.TurbGovData;
record TurbGovernorDataND
  extends TurbGovernorDataTemplate( GOV = "N",
    R = Modelica.Constants.small,
    P_MAX = Modelica.Constants.small,
    T_1 = Modelica.Constants.small,
    T_2 = Modelica.Constants.small,
    T_3 = Modelica.Constants.small,
    T_4 = Modelica.Constants.small,
    T_5 = Modelica.Constants.small,
    F = Modelica.Constants.small);
end TurbGovernorDataND;
