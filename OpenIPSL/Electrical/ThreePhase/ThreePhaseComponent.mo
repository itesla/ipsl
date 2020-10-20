within OpenIPSL.Electrical.ThreePhase;
partial model ThreePhaseComponent "Partial model for inheritance of single-phase base power based on three-phase system base power."
    outer OpenIPSL.Electrical.SystemBase SysData
    "Must add this line in all models";
    parameter SI.ApparentPower S_b(displayUnit="MVA")=SysData.S_b "System base"
    annotation (Dialog(group="Power flow data", enable=false));
  parameter SI.ApparentPower S_p(displayUnit="MVA")=SysData.S_b/3 "Phase base"
    annotation (Dialog(group="Power flow data", enable=false));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)),
        Documentation(info="<html>
<p>If the three-phase model deals with power, it is necessary to extand this partial model. 
It basically takes the system base power, which is a three-phase value, and calculates the per-phase base power.
This is necessary for obtaining the correct per-unit values of current and voltages in a three-phase power system connected to a positive-sequence-equivalent system.</p>
<p>For instance, if the system base is 100 MVA, in a positive-sequence-equivalent grid, the phase base is 33.33 MVA.</p>

</html>"));
end ThreePhaseComponent;
