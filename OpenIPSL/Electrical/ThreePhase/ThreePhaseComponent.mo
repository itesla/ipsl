within OpenIPSL.Electrical.ThreePhase;
partial model ThreePhaseComponent
    outer OpenIPSL.Electrical.SystemBase SysData
    "Must add this line in all models";
    parameter SI.ApparentPower S_b(displayUnit="MVA")=SysData.S_b "System base"
    annotation (Dialog(group="Power flow data", enable=false));
  parameter SI.ApparentPower S_p(displayUnit="MVA")=SysData.S_b/3 "Phase base"
    annotation (Dialog(group="Power flow data", enable=false));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));


end ThreePhaseComponent;
