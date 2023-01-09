within OpenIPSL.Data.PowerPlant.Anderson.PSSData;
record PSSDataCF2HP
  extends PSSDataTemplate(
                       PSS = "F",
    K_QV = 0.000,
    K_QS = 0.600,
    T_Q = 10.000,
    Tp_Q1 = 0.490,
    T_Q1 = 0.020,
    Tp_Q2 = 0.490,
    T_Q2 = 0.020,
    Tp_Q3 = 0.000,
    T_Q3 = 0.000,
    V_SLIM = 0.080);
end PSSDataCF2HP;
