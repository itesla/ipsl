within OpenIPSL.Data.PowerPlant.Anderson.PSSData;
record PSSDataH7
  extends PSSDataTemplate(
                       PSS = "F",
    K_QV = 0.000,
    K_QS = 1.000,
    T_Q = 30.000,
    Tp_Q1 = 0.500,
    T_Q1 = 0.030,
    Tp_Q2 = 0.500,
    T_Q2 = 0.030,
    Tp_Q3 = 0.000,
    T_Q3 = 0.000,
    V_SLIM = 0.100);
end PSSDataH7;
