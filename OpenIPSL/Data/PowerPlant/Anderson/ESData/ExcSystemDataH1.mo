within OpenIPSL.Data.PowerPlant.Anderson.ESData;
record ExcSystemDataH1
  extends ExcSystemDataTemplate( VR_type = "E",
    IEEE_type = "DC3x",
    Name = "RHEO",
    RR = 0.88,
    T_R = 0.000,
    K_A = 0.050,
    T_A1 = 20.000,
    T_A2 = 0.000,
    V_RMAX = 4.320,
    V_RMIN = 0.000,
    K_E = 1.000,
    T_E = 2.019,
    E_1 = 2.340,
    E_2 = 3.120,
    S_EE_1 = 0.099,
    S_EE_2 = 0.385,
    A_ex = 0.0017,
    B_ex = 1.7412,
    Efd_max = 3.12,
    Efd_min = 0.000,
    K_F = 0.000,
    T_F1 = 0.000,
    T_F2 = 0.000);
end ExcSystemDataH1;