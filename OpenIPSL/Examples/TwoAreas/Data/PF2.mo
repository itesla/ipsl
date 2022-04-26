within OpenIPSL.Examples.TwoAreas.Data;
record PF2 "Power flow data record, designed for test system assembled with PSSE models"
  import Modelica.Constants.pi;
  extends Support.PF_TwoAreas(
    voltages(
      V1=1.03,
      A1=0.35378975855,
      V2=1.01,
      A2=0.18336917813,
      V3=1.03,
      A3=-0.11868238913,
      V4=1.01,
      A4=-0.29656809182,
      V5=1.0069,
      A5=0.24064774259,
      V6=0.97914,
      A6=0.06483200039,
      V7=0.9610106,
      A7=-0.08179502992,
      V8=0.94828,
      A8=-0.32311454975,
      V9=0.9713628,
      A9=-0.56119369128,
      V10=0.98486,
      A10=-0.41387167085,
      V11=1.0088,
      A11=-0.23424936555),
    machines(
      P1_1=700000000,
      Q1_1=185029600,
      P2_1=700000000,
      Q2_1=234611300,
      P3_1=719094100,
      Q3_1=176026200,
      P4_1=700000000,
      Q4_1=202082700),
    loads(
      PL7_1=967000000,
      QL7_1=-84700000,
      PL9_1=1767000000,
      QL9_1=-230200000));
  annotation (Documentation);
end PF2;
