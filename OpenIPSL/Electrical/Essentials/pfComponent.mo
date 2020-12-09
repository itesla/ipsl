within OpenIPSL.Electrical.Essentials;
partial model pfComponent
  "Partial model containing all the parameters for entering power flow data"
  outer OpenIPSL.Electrical.SystemBase SysData
    "Must add this line in all models";
  parameter Types.ApparentPower S_b=SysData.S_b
    "System base power"
    annotation (Dialog(group="Power flow data", enable=enableS_b));
  parameter Boolean enableS_b = false
    "Enable S_b in parameter list"
    annotation (
      Dialog(
        tab="Parameter mask",
        __Dymola_compact=true,
        __Dymola_descriptionLabel=true), choices(checkBox=true));
  parameter Types.Voltage V_b=400e3
    "Base voltage of the bus"
    annotation (Dialog(group="Power flow data", enable=enableV_b));
  parameter Boolean enableV_b = false
    "Enable V_b in parameter list"
    annotation (
      Dialog(
        tab="Parameter mask",
        __Dymola_compact=true,
        __Dymola_descriptionLabel=true), choices(checkBox=true));
  parameter Types.Frequency fn=SysData.fn
    "System frequency"
    annotation (Dialog(group="Power flow data", enable=enablefn));
  parameter Boolean enablefn = false
    "Enable fn in parameter list"
    annotation (
      Dialog(
        tab="Parameter mask",
        __Dymola_compact=true,
        __Dymola_descriptionLabel=true), choices(checkBox=true));
  parameter Types.ActivePower P_0=1e6
    "Initial active power"
    annotation (Dialog(group="Power flow data", enable=enableP_0));
  parameter Boolean enableP_0 = false
    "Enable P_0 in parameter list"
    annotation (
      Dialog(
        tab="Parameter mask",
        __Dymola_compact=true,
        __Dymola_descriptionLabel=true), choices(checkBox=true));
  parameter Types.ReactivePower Q_0=0
    "Initial reactive power"
    annotation (Dialog(group="Power flow data", enable=enableQ_0));
  parameter Boolean enableQ_0 = false
    "Enable Q_0 in parameter list"
    annotation (
      Dialog(
        tab="Parameter mask",
        __Dymola_compact=true,
        __Dymola_descriptionLabel=true), choices(checkBox=true));
  parameter Types.PerUnit v_0=1
    "Initial voltage magnitude"
    annotation (Dialog(group="Power flow data", enable=enablev_0));
  parameter Boolean enablev_0 = false
    "Enable v_0 in parameter list"
    annotation (
      Dialog(
        tab="Parameter mask",
        __Dymola_compact=true,
        __Dymola_descriptionLabel=true), choices(checkBox=true));
  parameter Types.Angle angle_0=0
    "Initial voltage angle"
    annotation (Dialog(group="Power flow data", enable=enableangle_0));
  parameter Boolean enableangle_0 = false
    "Enable angle_0 in parameter list"
    annotation (
      Dialog(
        tab="Parameter mask",
        __Dymola_compact=true,
        __Dymola_descriptionLabel=true), choices(checkBox=true));
  parameter Boolean displayPF=false "Display power flow:" annotation (
      Dialog(
      group="Power flow data",
      enable=enabledisplayPF,
      __Dymola_compact=true,
      __Dymola_descriptionLabel=true), choices(checkBox=true));
  parameter Boolean enabledisplayPF = false
    "Enable displayPF in parameter list"
    annotation (
      Dialog(
        tab="Parameter mask",
        __Dymola_compact=true,
        __Dymola_descriptionLabel=true), choices(checkBox=true));
end pfComponent;
