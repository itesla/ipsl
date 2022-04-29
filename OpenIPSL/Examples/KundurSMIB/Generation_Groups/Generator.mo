within OpenIPSL.Examples.KundurSMIB.Generation_Groups;
model Generator "Generation unit used in SMIB system"
  extends OpenIPSL.Interfaces.Generator;
  OpenIPSL.Electrical.Machines.PSAT.Order6 machine(
    Vn=400000,
    V_b=V_b,
    ra=0.003,
    xd=1.81,
    xq=1.76,
    x1d=0.3,
    x1q=0.65,
    x2d=0.23,
    x2q=0.25,
    T1d0=8,
    T1q0=1,
    T2d0=0.03,
    T2q0=0.07,
    M=7,
    D=0,
    P_0=P_0,
    Q_0=Q_0,
    v_0=v_0,
    angle_0=angle_0,
    Sn=2220000000,
    Taa=0) annotation (Placement(transformation(extent={{20,-30},{80,30}})));
equation
  connect(machine.pm0, machine.pm) annotation (Line(points={{26,-33},{26,-40},{0,-40},{0,-15},{14,-15}},
                                             color={0,0,127}));
  connect(machine.vf0, machine.vf) annotation (Line(points={{26,33},{26,40},{0,40},{0,15},{14,15}},
                                color={0,0,127}));
  connect(machine.p, pwPin) annotation (Line(points={{80,0},{110,0}}, color={0,0,255}));
  annotation (
    Documentation(info="<html>
<p> Generation unit composed of a order 6 machine model.</p>
</html>"));
end Generator;
