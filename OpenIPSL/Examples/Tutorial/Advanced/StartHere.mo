within OpenIPSL.Examples.Tutorial.Advanced;
model StartHere "Start Here"
  extends Modelica.Icons.Information;
  annotation (DocumentationClass=true, Documentation(info="<html>
  <h4>Before You Start</h4>
  <h5>Prerequisites</h5>
  <ul>
    <li>Dymola/OpenModelica installation.</li>
    <li>
      <a href=\"https://github.com/SanPen/GridCal\">GridCal</a> setup to generate the power flow solutions. An installation procedure with Miniconda is outlined <a href=\"https://github.com/ALSETLab/SMIB_Tutorial/blob/master/docs/gridcal_installation.md\">here</a>.
    </li>
    <li>OpenIPSL library.</li>
    <li>Download the files of the <a href=\"https://github.com/ALSETLab/SMIB_Tutorial\">SMIB_Tutorial</a> repository. </li>
  </ul>
  <h5>System Parameters</h5>
  <p>The system parameters for the static power flow model are listed below:</p>
  <table style=\"border-collapse:collapse;border-spacing:0;margin-left: 60px;\">
    <thead>
      <tr>
        <th style=\"border-color:black;border-style:solid;border-width:1px;overflow:hidden;padding:10px 5px;word-break:normal;background-color:#b3e6ff;font-weight:bold;text-align:center;vertical-align:top;\">
          <span style=\"font-weight:700;font-style:normal;text-decoration:none;color:#000;background-color:transparent\">Bus No.</span>
        </th>
        <th style=\"border-color:black;border-style:solid;border-width:1px;overflow:hidden;padding:10px 5px;word-break:normal;background-color:#b3e6ff;font-weight:bold;text-align:center;vertical-align:top;\">
          <span style=\"font-weight:700;font-style:normal;text-decoration:none;color:#000;background-color:transparent\">Bus Name</span>
        </th>
        <th style=\"border-color:black;border-style:solid;border-width:1px;overflow:hidden;padding:10px 5px;word-break:normal;background-color:#b3e6ff;font-weight:bold;text-align:center;vertical-align:top;\">
          <span style=\"font-weight:700;font-style:normal;text-decoration:none;color:#000;background-color:transparent\">Type</span>
        </th>
        <th style=\"border-color:black;border-style:solid;border-width:1px;overflow:hidden;padding:10px 5px;word-break:normal;background-color:#b3e6ff;font-weight:bold;text-align:center;vertical-align:top;\">
          <span style=\"font-weight:700;font-style:normal;text-decoration:none;color:#000;background-color:transparent\">V (pu)</span>
        </th>
        <th style=\"border-color:black;border-style:solid;border-width:1px;overflow:hidden;padding:10px 5px;word-break:normal;background-color:#b3e6ff;font-weight:bold;text-align:center;vertical-align:top;\">
          <span style=\"font-weight:700;font-style:normal;text-decoration:none;color:#000;background-color:transparent\">Angle</span>
        </th>
        <th style=\"border-color:black;border-style:solid;border-width:1px;overflow:hidden;padding:10px 5px;word-break:normal;background-color:#b3e6ff;font-weight:bold;text-align:center;vertical-align:top;\">
          <span style=\"font-weight:700;font-style:normal;text-decoration:none;color:#000;background-color:transparent\">P (MW)</span>
        </th>
        <th style=\"border-color:black;border-style:solid;border-width:1px;overflow:hidden;padding:10px 5px;word-break:normal;background-color:#b3e6ff;font-weight:bold;text-align:center;vertical-align:top;\">
          <span style=\"font-weight:700;font-style:normal;text-decoration:none;color:#000\">Q (Mvar)</span>
        </th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td style=\"border-color:black;border-style:solid;border-width:1px;overflow:hidden;padding:10px 5px;word-break:normal;text-align:left;vertical-align:top;\">
          <span style=\"font-weight:400;font-style:normal;text-decoration:none;color:#000;background-color:transparent\">1</span>
        </td>
        <td style=\"border-color:black;border-style:solid;border-width:1px;overflow:hidden;padding:10px 5px;word-break:normal;text-align:left;vertical-align:top;\">
          <span style=\"font-weight:400;font-style:normal;text-decoration:none;color:#000;background-color:transparent\">B01</span>
        </td>
        <td style=\"border-color:black;border-style:solid;border-width:1px;overflow:hidden;padding:10px 5px;word-break:normal;text-align:left;vertical-align:top;\">
          <span style=\"font-weight:400;font-style:normal;text-decoration:none;color:#000;background-color:transparent\">PV</span>
        </td>
        <td style=\"border-color:black;border-style:solid;border-width:1px;overflow:hidden;padding:10px 5px;word-break:normal;text-align:left;vertical-align:top;\">
          <span style=\"font-weight:400;font-style:normal;text-decoration:none;color:#000;background-color:transparent\">1.0000</span>
        </td>
        <td style=\"border-color:black;border-style:solid;border-width:1px;overflow:hidden;padding:10px 5px;word-break:normal;text-align:left;vertical-align:top;\">
          <span style=\"font-weight:400;font-style:normal;text-decoration:none;color:#000;background-color:transparent\">From PF</span>
        </td>
        <td style=\"border-color:black;border-style:solid;border-width:1px;overflow:hidden;padding:10px 5px;word-break:normal;text-align:left;vertical-align:top;\">
          <span style=\"font-weight:400;font-style:normal;text-decoration:none;color:#000;background-color:transparent\">40.0000</span>
        </td>
        <td style=\"border-color:black;border-style:solid;border-width:1px;overflow:hidden;padding:10px 5px;word-break:normal;text-align:left;vertical-align:top;\">
          <span style=\"font-weight:400;font-style:normal;text-decoration:none;color:#000;background-color:transparent\">From PF</span>
        </td>
      </tr>
      <tr>
        <td style=\"border-color:black;border-style:solid;border-width:1px;overflow:hidden;padding:10px 5px;word-break:normal;text-align:left;vertical-align:top;\">
          <span style=\"font-weight:400;font-style:normal;text-decoration:none;color:#000;background-color:transparent\">2</span>
        </td>
        <td style=\"border-color:black;border-style:solid;border-width:1px;overflow:hidden;padding:10px 5px;word-break:normal;text-align:left;vertical-align:top;\">
          <span style=\"font-weight:400;font-style:normal;text-decoration:none;color:#000;background-color:transparent\">B02</span>
        </td>
        <td style=\"border-color:black;border-style:solid;border-width:1px;overflow:hidden;padding:10px 5px;word-break:normal;text-align:left;vertical-align:top;\">
          <span style=\"font-weight:400;font-style:normal;text-decoration:none;color:#000;background-color:transparent\">Slack</span>
        </td>
        <td style=\"border-color:black;border-style:solid;border-width:1px;overflow:hidden;padding:10px 5px;word-break:normal;text-align:left;vertical-align:top;\">
          <span style=\"font-weight:400;font-style:normal;text-decoration:none;color:#000;background-color:transparent\">1.0000</span>
        </td>
        <td style=\"border-color:black;border-style:solid;border-width:1px;overflow:hidden;padding:10px 5px;word-break:normal;text-align:left;vertical-align:top;\">
          <span style=\"font-weight:400;font-style:normal;text-decoration:none;color:#000;background-color:transparent\">0.0000</span>
        </td>
        <td style=\"border-color:black;border-style:solid;border-width:1px;overflow:hidden;padding:10px 5px;word-break:normal;text-align:left;vertical-align:top;\">
          <span style=\"font-weight:400;font-style:normal;text-decoration:none;color:#000;background-color:transparent\">From PF</span>
        </td>
        <td style=\"border-color:black;border-style:solid;border-width:1px;overflow:hidden;padding:10px 5px;word-break:normal;text-align:left;vertical-align:top;\">
          <span style=\"font-weight:400;font-style:normal;text-decoration:none;color:#000;background-color:transparent\">From PF</span>
        </td>
      </tr>
      <tr>
        <td style=\"border-color:black;border-style:solid;border-width:1px;overflow:hidden;padding:10px 5px;word-break:normal;text-align:left;vertical-align:top;\">
          <span style=\"font-weight:400;font-style:normal;text-decoration:none;color:#000;background-color:transparent\">3</span>
        </td>
        <td style=\"border-color:black;border-style:solid;border-width:1px;overflow:hidden;padding:10px 5px;word-break:normal;text-align:left;vertical-align:top;\">
          <span style=\"font-weight:400;font-style:normal;text-decoration:none;color:#000;background-color:transparent\">B03*</span>
        </td>
        <td style=\"border-color:black;border-style:solid;border-width:1px;overflow:hidden;padding:10px 5px;word-break:normal;text-align:left;vertical-align:top;\">
          <span style=\"font-weight:400;font-style:normal;text-decoration:none;color:#000;background-color:transparent\">PQ</span>
        </td>
        <td style=\"border-color:black;border-style:solid;border-width:1px;overflow:hidden;padding:10px 5px;word-break:normal;text-align:left;vertical-align:top;\">
          <span style=\"font-weight:400;font-style:normal;text-decoration:none;color:#000;background-color:transparent\">From PF</span>
        </td>
        <td style=\"border-color:black;border-style:solid;border-width:1px;overflow:hidden;padding:10px 5px;word-break:normal;text-align:left;vertical-align:top;\">
          <span style=\"font-weight:400;font-style:normal;text-decoration:none;color:#000;background-color:transparent\">From PF</span>
        </td>
        <td style=\"border-color:black;border-style:solid;border-width:1px;overflow:hidden;padding:10px 5px;word-break:normal;text-align:left;vertical-align:top;\">
          <span style=\"font-weight:400;font-style:normal;text-decoration:none;color:#000;background-color:transparent\">0.0000</span>
        </td>
        <td style=\"border-color:black;border-style:solid;border-width:1px;overflow:hidden;padding:10px 5px;word-break:normal;text-align:left;vertical-align:top;\">
          <span style=\"font-weight:400;font-style:normal;text-decoration:none;color:#000;background-color:transparent\">0.0000</span>
        </td>
      </tr>
      <tr>
        <td style=\"border-color:black;border-style:solid;border-width:1px;overflow:hidden;padding:10px 5px;word-break:normal;text-align:left;vertical-align:top;\">
          <span style=\"font-weight:400;font-style:normal;text-decoration:none;color:#000;background-color:transparent\">4</span>
        </td>
        <td style=\"border-color:black;border-style:solid;border-width:1px;overflow:hidden;padding:10px 5px;word-break:normal;text-align:left;vertical-align:top;\">
          <span style=\"font-weight:400;font-style:normal;text-decoration:none;color:#000;background-color:transparent\">B04</span>
        </td>
        <td style=\"border-color:black;border-style:solid;border-width:1px;overflow:hidden;padding:10px 5px;word-break:normal;text-align:left;vertical-align:top;\">
          <span style=\"font-weight:400;font-style:normal;text-decoration:none;color:#000;background-color:transparent\">PQ</span>
        </td>
        <td style=\"border-color:black;border-style:solid;border-width:1px;overflow:hidden;padding:10px 5px;word-break:normal;text-align:left;vertical-align:top;\">
          <span style=\"font-weight:400;font-style:normal;text-decoration:none;color:#000;background-color:transparent\">From PF</span>
        </td>
        <td style=\"border-color:black;border-style:solid;border-width:1px;overflow:hidden;padding:10px 5px;word-break:normal;text-align:left;vertical-align:top;\">
          <span style=\"font-weight:400;font-style:normal;text-decoration:none;color:#000;background-color:transparent\">From PF</span>
        </td>
        <td style=\"border-color:black;border-style:solid;border-width:1px;overflow:hidden;padding:10px 5px;word-break:normal;text-align:left;vertical-align:top;\">
          <span style=\"font-weight:400;font-style:normal;text-decoration:none;color:#000;background-color:transparent\">50.0000</span>
        </td>
        <td style=\"border-color:black;border-style:solid;border-width:1px;overflow:hidden;padding:10px 5px;word-break:normal;text-align:left;vertical-align:top;\">
          <span style=\"font-weight:400;font-style:normal;text-decoration:none;color:#000;background-color:transparent\">10.0000</span>
        </td>
      </tr>
    </tbody>
  </table>
  <p style=\";margin-left: 55px;\">* <em>A three-phase fault is to be set at bus FAULT</em>
  </p>
  <br />
  <table style=\"border-collapse:collapse;border-spacing:0;margin-left: 95px;\">
    <thead>
      <tr>
        <th style=\"border-color:black;border-style:solid;border-width:1px;overflow:hidden;padding:10px 5px;word-break:normal;background-color:#b3e6ff;font-weight:bold;text-align:center;vertical-align:top;\">
          <span style=\"font-weight:700;font-style:normal;text-decoration:none;color:#000;background-color:transparent\">Line Name</span>
        </th>
        <th style=\"border-color:black;border-style:solid;border-width:1px;overflow:hidden;padding:10px 5px;word-break:normal;background-color:#b3e6ff;font-weight:bold;text-align:center;vertical-align:top;\">
          <span style=\"font-weight:700;font-style:normal;text-decoration:none;color:#000;background-color:transparent\">From Bus</span>
        </th>
        <th style=\"border-color:black;border-style:solid;border-width:1px;overflow:hidden;padding:10px 5px;word-break:normal;background-color:#b3e6ff;font-weight:bold;text-align:center;vertical-align:top;\">
          <span style=\"font-weight:700;font-style:normal;text-decoration:none;color:#000;background-color:transparent\">To Bus</span>
        </th>
        <th style=\"border-color:black;border-style:solid;border-width:1px;overflow:hidden;padding:10px 5px;word-break:normal;background-color:#b3e6ff;font-weight:bold;text-align:center;vertical-align:top;\">
          <span style=\"font-weight:700;font-style:normal;text-decoration:none;color:#000;background-color:transparent\">R (pu)</span>
        </th>
        <th style=\"border-color:black;border-style:solid;border-width:1px;overflow:hidden;padding:10px 5px;word-break:normal;background-color:#b3e6ff;font-weight:bold;text-align:center;vertical-align:top;\">
          <span style=\"font-weight:700;font-style:normal;text-decoration:none;color:#000;background-color:transparent\">X (pu)</span>
        </th>
        <th style=\"border-color:black;border-style:solid;border-width:1px;overflow:hidden;padding:10px 5px;word-break:normal;background-color:#b3e6ff;font-weight:bold;text-align:center;vertical-align:top;\">
          <span style=\"font-weight:700;font-style:normal;text-decoration:none;color:#000;background-color:transparent\">B (pu)</span>
        </th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td style=\"border-color:black;border-style:solid;border-width:1px;overflow:hidden;padding:10px 5px;word-break:normal;text-align:left;vertical-align:top;\">
          <span style=\"font-weight:400;font-style:normal;text-decoration:none;color:#000;background-color:transparent\">line_01</span>
        </td>
        <td style=\"border-color:black;border-style:solid;border-width:1px;overflow:hidden;padding:10px 5px;word-break:normal;text-align:left;vertical-align:top;\">
          <span style=\"font-weight:400;font-style:normal;text-decoration:none;color:#000;background-color:transparent\">B01</span>
        </td>
        <td style=\"border-color:black;border-style:solid;border-width:1px;overflow:hidden;padding:10px 5px;word-break:normal;text-align:left;vertical-align:top;\">
          <span style=\"font-weight:400;font-style:normal;text-decoration:none;color:#000;background-color:transparent\">B03</span>
        </td>
        <td style=\"border-color:black;border-style:solid;border-width:1px;overflow:hidden;padding:10px 5px;word-break:normal;text-align:left;vertical-align:top;\">
          <span style=\"font-weight:400;font-style:normal;text-decoration:none;color:#000;background-color:transparent\">0.0010</span>
        </td>
        <td style=\"border-color:black;border-style:solid;border-width:1px;overflow:hidden;padding:10px 5px;word-break:normal;text-align:left;vertical-align:top;\">
          <span style=\"font-weight:400;font-style:normal;text-decoration:none;color:#000;background-color:transparent\">0.2000</span>
        </td>
        <td style=\"border-color:black;border-style:solid;border-width:1px;overflow:hidden;padding:10px 5px;word-break:normal;text-align:left;vertical-align:top;\">
          <span style=\"font-weight:400;font-style:normal;text-decoration:none;color:#000;background-color:transparent\">0.0000</span>
        </td>
      </tr>
      <tr>
        <td style=\"border-color:black;border-style:solid;border-width:1px;overflow:hidden;padding:10px 5px;word-break:normal;text-align:left;vertical-align:top;\">
          <span style=\"font-weight:400;font-style:normal;text-decoration:none;color:#000;background-color:transparent\">line_02</span>
        </td>
        <td style=\"border-color:black;border-style:solid;border-width:1px;overflow:hidden;padding:10px 5px;word-break:normal;text-align:left;vertical-align:top;\">
          <span style=\"font-weight:400;font-style:normal;text-decoration:none;color:#000;background-color:transparent\">B03</span>
        </td>
        <td style=\"border-color:black;border-style:solid;border-width:1px;overflow:hidden;padding:10px 5px;word-break:normal;text-align:left;vertical-align:top;\">
          <span style=\"font-weight:400;font-style:normal;text-decoration:none;color:#000;background-color:transparent\">B02</span>
        </td>
        <td style=\"border-color:black;border-style:solid;border-width:1px;overflow:hidden;padding:10px 5px;word-break:normal;text-align:left;vertical-align:top;\">
          <span style=\"font-weight:400;font-style:normal;text-decoration:none;color:#000;background-color:transparent\">0.0010</span>
        </td>
        <td style=\"border-color:black;border-style:solid;border-width:1px;overflow:hidden;padding:10px 5px;word-break:normal;text-align:left;vertical-align:top;\">
          <span style=\"font-weight:400;font-style:normal;text-decoration:none;color:#000;background-color:transparent\">0.2000</span>
        </td>
        <td style=\"border-color:black;border-style:solid;border-width:1px;overflow:hidden;padding:10px 5px;word-break:normal;text-align:left;vertical-align:top;\">
          <span style=\"font-weight:400;font-style:normal;text-decoration:none;color:#000;background-color:transparent\">0.0000</span>
        </td>
      </tr>
      <tr>
        <td style=\"border-color:black;border-style:solid;border-width:1px;overflow:hidden;padding:10px 5px;word-break:normal;text-align:left;vertical-align:top;\">
          <span style=\"font-weight:400;font-style:normal;text-decoration:none;color:#000;background-color:transparent\">line_03</span>
        </td>
        <td style=\"border-color:black;border-style:solid;border-width:1px;overflow:hidden;padding:10px 5px;word-break:normal;text-align:left;vertical-align:top;\">
          <span style=\"font-weight:400;font-style:normal;text-decoration:none;color:#000;background-color:transparent\">B03</span>
        </td>
        <td style=\"border-color:black;border-style:solid;border-width:1px;overflow:hidden;padding:10px 5px;word-break:normal;text-align:left;vertical-align:top;\">
          <span style=\"font-weight:400;font-style:normal;text-decoration:none;color:#000;background-color:transparent\">B04</span>
        </td>
        <td style=\"border-color:black;border-style:solid;border-width:1px;overflow:hidden;padding:10px 5px;word-break:normal;text-align:left;vertical-align:top;\">
          <span style=\"font-weight:400;font-style:normal;text-decoration:none;color:#000;background-color:transparent\">0.0005</span>
        </td>
        <td style=\"border-color:black;border-style:solid;border-width:1px;overflow:hidden;padding:10px 5px;word-break:normal;text-align:left;vertical-align:top;\">
          <span style=\"font-weight:400;font-style:normal;text-decoration:none;color:#000;background-color:transparent\">0.1000</span>
        </td>
        <td style=\"border-color:black;border-style:solid;border-width:1px;overflow:hidden;padding:10px 5px;word-break:normal;text-align:left;vertical-align:top;\">
          <span style=\"font-weight:400;font-style:normal;text-decoration:none;color:#000;background-color:transparent\">0.0000</span>
        </td>
      </tr>
      <tr>
        <td style=\"border-color:black;border-style:solid;border-width:1px;overflow:hidden;padding:10px 5px;word-break:normal;text-align:left;vertical-align:top;\">
          <span style=\"font-weight:400;font-style:normal;text-decoration:none;color:#000;background-color:transparent\">line_04</span>
        </td>
        <td style=\"border-color:black;border-style:solid;border-width:1px;overflow:hidden;padding:10px 5px;word-break:normal;text-align:left;vertical-align:top;\">
          <span style=\"font-weight:400;font-style:normal;text-decoration:none;color:#000;background-color:transparent\">B04</span>
        </td>
        <td style=\"border-color:black;border-style:solid;border-width:1px;overflow:hidden;padding:10px 5px;word-break:normal;text-align:left;vertical-align:top;\">
          <span style=\"font-weight:400;font-style:normal;text-decoration:none;color:#000;background-color:transparent\">B02</span>
        </td>
        <td style=\"border-color:black;border-style:solid;border-width:1px;overflow:hidden;padding:10px 5px;word-break:normal;text-align:left;vertical-align:top;\">
          <span style=\"font-weight:400;font-style:normal;text-decoration:none;color:#000;background-color:transparent\">0.0005</span>
        </td>
        <td style=\"border-color:black;border-style:solid;border-width:1px;overflow:hidden;padding:10px 5px;word-break:normal;text-align:left;vertical-align:top;\">
          <span style=\"font-weight:400;font-style:normal;text-decoration:none;color:#000;background-color:transparent\">0.1000</span>
        </td>
        <td style=\"border-color:black;border-style:solid;border-width:1px;overflow:hidden;padding:10px 5px;word-break:normal;text-align:left;vertical-align:top;\">
          <span style=\"font-weight:400;font-style:normal;text-decoration:none;color:#000;background-color:transparent\">0.0000</span>
        </td>
      </tr>
    </tbody>
  </table>
  <br />
  <p id=\"3ba4b22e-c215-4513-b3cd-e6fb1014c189\">For the dynamic part of the simulation, the parameters of the models are:</p>
  <table style=\"border-collapse:collapse;border-spacing:0;margin-left: 50px;\">
    <thead>
      <tr>
        <th style=\"border-color:black;border-style:solid;border-width:1px;overflow:hidden;padding:10px 5px;word-break:normal;background-color:#b3e6ff;font-weight:bold;text-align:center;vertical-align:top;\">
          <span style=\"font-weight:700;font-style:normal;text-decoration:none;color:#000;background-color:transparent\">Generator (Bus)</span>
        </th>
        <th style=\"border-color:black;border-style:solid;border-width:1px;overflow:hidden;padding:10px 5px;word-break:normal;background-color:#b3e6ff;font-weight:bold;text-align:center;vertical-align:top;\">
          <span style=\"font-weight:700;font-style:normal;text-decoration:none;color:#000;background-color:transparent\">Generator Type</span>
        </th>
        <th style=\"border-color:black;border-style:solid;border-width:1px;overflow:hidden;padding:10px 5px;word-break:normal;background-color:#b3e6ff;font-weight:bold;text-align:center;vertical-align:top;\">
          <span style=\"font-weight:700;font-style:normal;text-decoration:none;color:#000;background-color:transparent\">Exciter</span>
        </th>
        <th style=\"border-color:black;border-style:solid;border-width:1px;overflow:hidden;padding:10px 5px;word-break:normal;background-color:#b3e6ff;font-weight:bold;text-align:center;vertical-align:top;\">
          <span style=\"font-weight:700;font-style:normal;text-decoration:none;color:#000;background-color:transparent\">Turbine Governor</span>
        </th>
        <th style=\"border-color:black;border-style:solid;border-width:1px;overflow:hidden;padding:10px 5px;word-break:normal;background-color:#b3e6ff;font-weight:bold;text-align:center;vertical-align:top;\">
          <span style=\"font-weight:700;font-style:normal;text-decoration:none;color:#000;background-color:transparent\">Stabilizer</span>
        </th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td style=\"border-color:black;border-style:solid;border-width:1px;overflow:hidden;padding:10px 5px;word-break:normal;text-align:left;vertical-align:top;\">
          <span style=\"font-weight:400;font-style:normal;text-decoration:none;color:#000;background-color:transparent\">1</span>
        </td>
        <td style=\"border-color:black;border-style:solid;border-width:1px;overflow:hidden;padding:10px 5px;word-break:normal;text-align:left;vertical-align:top;\">
          <span style=\"font-weight:400;font-style:normal;text-decoration:none;color:#000;background-color:transparent\">GENROE</span>
        </td>
        <td style=\"border-color:black;border-style:solid;border-width:1px;overflow:hidden;padding:10px 5px;word-break:normal;text-align:left;vertical-align:top;\">
          <span style=\"font-weight:400;font-style:normal;text-decoration:none;color:#000;background-color:transparent\">None</span>
        </td>
        <td style=\"border-color:black;border-style:solid;border-width:1px;overflow:hidden;padding:10px 5px;word-break:normal;text-align:left;vertical-align:top;\">
          <span style=\"font-weight:400;font-style:normal;text-decoration:none;color:#000;background-color:transparent\">None</span>
        </td>
        <td style=\"border-color:black;border-style:solid;border-width:1px;overflow:hidden;padding:10px 5px;word-break:normal;text-align:left;vertical-align:top;\">
          <span style=\"font-weight:400;font-style:normal;text-decoration:none;color:#000;background-color:transparent\">None</span>
        </td>
      </tr>
      <tr>
        <td style=\"border-color:black;border-style:solid;border-width:1px;overflow:hidden;padding:10px 5px;word-break:normal;text-align:left;vertical-align:top;\">
          <span style=\"font-weight:400;font-style:normal;text-decoration:none;color:#000;background-color:transparent\">3</span>
        </td>
        <td style=\"border-color:black;border-style:solid;border-width:1px;overflow:hidden;padding:10px 5px;word-break:normal;text-align:left;vertical-align:top;\">
          <span style=\"font-weight:400;font-style:normal;text-decoration:none;color:#000;background-color:transparent\">GENCLS</span>
        </td>
        <td style=\"border-color:black;border-style:solid;border-width:1px;overflow:hidden;padding:10px 5px;word-break:normal;text-align:left;vertical-align:top;\">
          <span style=\"font-weight:400;font-style:normal;text-decoration:none;color:#000;background-color:transparent\">None</span>
        </td>
        <td style=\"border-color:black;border-style:solid;border-width:1px;overflow:hidden;padding:10px 5px;word-break:normal;text-align:left;vertical-align:top;\">
          <span style=\"font-weight:400;font-style:normal;text-decoration:none;color:#000;background-color:transparent\">None</span>
        </td>
        <td style=\"border-color:black;border-style:solid;border-width:1px;overflow:hidden;padding:10px 5px;word-break:normal;text-align:left;vertical-align:top;\">
          <span style=\"font-weight:400;font-style:normal;text-decoration:none;color:#000;background-color:transparent\">None</span>
        </td>
      </tr>
    </tbody>
  </table>
  <br />
  <table style=\"border-collapse:collapse;border-spacing:0;margin-left: 120px;\">
    <thead>
      <tr>
        <th style=\"border-color:black;border-style:solid;border-width:1px;overflow:hidden;padding:10px 5px;word-break:normal;background-color:#b3e6ff;font-weight:bold;text-align:center;vertical-align:top;\">
          <span style=\"font-weight:700;font-style:normal;text-decoration:none;color:#000;background-color:transparent\">Generator (Bus)</span>
        </th>
        <th style=\"border-color:black;border-style:solid;border-width:1px;overflow:hidden;padding:10px 5px;word-break:normal;background-color:#b3e6ff;font-weight:bold;text-align:center;vertical-align:top;\">
          <span style=\"font-weight:700;font-style:normal;text-decoration:none;color:#000;background-color:transparent\">Parameter</span>
        </th>
        <th style=\"border-color:black;border-style:solid;border-width:1px;overflow:hidden;padding:10px 5px;word-break:normal;background-color:#b3e6ff;font-weight:bold;text-align:center;vertical-align:top;\">
          <span style=\"font-weight:700;font-style:normal;text-decoration:none;color:#000;background-color:transparent\">Value</span>
        </th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td style=\"border-color:black;border-style:solid;border-width:1px;overflow:hidden;padding:10px 5px;word-break:normal;text-align:left;vertical-align:top;\" rowspan=\"17\">GENROE</td>
        <td style=\"border-color:black;border-style:solid;border-width:1px;overflow:hidden;padding:10px 5px;word-break:normal;text-align:left;vertical-align:top;\">
          <span style=\"font-weight:400;font-style:normal;text-decoration:none;color:#000;background-color:transparent\">Mbase</span>
        </td>
        <td style=\"border-color:black;border-style:solid;border-width:1px;overflow:hidden;padding:10px 5px;word-break:normal;text-align:left;vertical-align:top;\">
          <span style=\"font-weight:400;font-style:normal;text-decoration:none;color:#000;background-color:transparent\">100 MVA</span>
        </td>
      </tr>
      <tr>
        <td style=\"border-color:black;border-style:solid;border-width:1px;overflow:hidden;padding:10px 5px;word-break:normal;text-align:left;vertical-align:top;\">
          <span style=\"font-weight:400;font-style:normal;text-decoration:none;color:#000;background-color:transparent\">T'do (&gt; 0)</span>
        </td>
        <td style=\"border-color:black;border-style:solid;border-width:1px;overflow:hidden;padding:10px 5px;word-break:normal;text-align:left;vertical-align:top;\">
          <span style=\"font-weight:400;font-style:normal;text-decoration:none;color:#000;background-color:transparent\">5.0000</span>
        </td>
      </tr>
      <tr>
        <td style=\"border-color:black;border-style:solid;border-width:1px;overflow:hidden;padding:10px 5px;word-break:normal;text-align:left;vertical-align:top;\">
          <span style=\"font-weight:400;font-style:normal;text-decoration:none;color:#000;background-color:transparent\">T''do (&gt; 0)</span>
        </td>
        <td style=\"border-color:black;border-style:solid;border-width:1px;overflow:hidden;padding:10px 5px;word-break:normal;text-align:left;vertical-align:top;\">
          <span style=\"font-weight:400;font-style:normal;text-decoration:none;color:#000;background-color:transparent\">0.0700</span>
        </td>
      </tr>
      <tr>
        <td style=\"border-color:black;border-style:solid;border-width:1px;overflow:hidden;padding:10px 5px;word-break:normal;text-align:left;vertical-align:top;\">
          <span style=\"font-weight:400;font-style:normal;text-decoration:none;color:#000;background-color:transparent\">T'qo (&gt; 0)</span>
        </td>
        <td style=\"border-color:black;border-style:solid;border-width:1px;overflow:hidden;padding:10px 5px;word-break:normal;text-align:left;vertical-align:top;\">
          <span style=\"font-weight:400;font-style:normal;text-decoration:none;color:#000;background-color:transparent\">0.9000</span>
        </td>
      </tr>
      <tr>
        <td style=\"border-color:black;border-style:solid;border-width:1px;overflow:hidden;padding:10px 5px;word-break:normal;text-align:left;vertical-align:top;\">
          <span style=\"font-weight:400;font-style:normal;text-decoration:none;color:#000;background-color:transparent\">T''qo (&gt; 0)</span>
        </td>
        <td style=\"border-color:black;border-style:solid;border-width:1px;overflow:hidden;padding:10px 5px;word-break:normal;text-align:left;vertical-align:top;\">
          <span style=\"font-weight:400;font-style:normal;text-decoration:none;color:#000;background-color:transparent\">0.0900</span>
        </td>
      </tr>
      <tr>
        <td style=\"border-color:black;border-style:solid;border-width:1px;overflow:hidden;padding:10px 5px;word-break:normal;text-align:left;vertical-align:top;\">
          <span style=\"font-weight:400;font-style:normal;text-decoration:none;color:#000;background-color:transparent\">H, Inertia</span>
        </td>
        <td style=\"border-color:black;border-style:solid;border-width:1px;overflow:hidden;padding:10px 5px;word-break:normal;text-align:left;vertical-align:top;\">
          <span style=\"font-weight:400;font-style:normal;text-decoration:none;color:#000;background-color:transparent\">4.2800</span>
        </td>
      </tr>
      <tr>
        <td style=\"border-color:black;border-style:solid;border-width:1px;overflow:hidden;padding:10px 5px;word-break:normal;text-align:left;vertical-align:top;\">
          <span style=\"font-weight:400;font-style:normal;text-decoration:none;color:#000;background-color:transparent\">D, Speed Damping</span>
        </td>
        <td style=\"border-color:black;border-style:solid;border-width:1px;overflow:hidden;padding:10px 5px;word-break:normal;text-align:left;vertical-align:top;\">
          <span style=\"font-weight:400;font-style:normal;text-decoration:none;color:#000;background-color:transparent\">0.0000</span>
        </td>
      </tr>
      <tr>
        <td style=\"border-color:black;border-style:solid;border-width:1px;overflow:hidden;padding:10px 5px;word-break:normal;text-align:left;vertical-align:top;\">
          <span style=\"font-weight:400;font-style:normal;text-decoration:none;color:#000;background-color:transparent\">Xd</span>
        </td>
        <td style=\"border-color:black;border-style:solid;border-width:1px;overflow:hidden;padding:10px 5px;word-break:normal;text-align:left;vertical-align:top;\">
          <span style=\"font-weight:400;font-style:normal;text-decoration:none;color:#000;background-color:transparent\">1.8400</span>
        </td>
      </tr>
      <tr>
        <td style=\"border-color:black;border-style:solid;border-width:1px;overflow:hidden;padding:10px 5px;word-break:normal;text-align:left;vertical-align:top;\">
          <span style=\"font-weight:400;font-style:normal;text-decoration:none;color:#000;background-color:transparent\">Xq</span>
        </td>
        <td style=\"border-color:black;border-style:solid;border-width:1px;overflow:hidden;padding:10px 5px;word-break:normal;text-align:left;vertical-align:top;\">
          <span style=\"font-weight:400;font-style:normal;text-decoration:none;color:#000;background-color:transparent\">1.7500</span>
        </td>
      </tr>
      <tr>
        <td style=\"border-color:black;border-style:solid;border-width:1px;overflow:hidden;padding:10px 5px;word-break:normal;text-align:left;vertical-align:top;\">
          <span style=\"font-weight:400;font-style:normal;text-decoration:none;color:#000;background-color:transparent\">X'd</span>
        </td>
        <td style=\"border-color:black;border-style:solid;border-width:1px;overflow:hidden;padding:10px 5px;word-break:normal;text-align:left;vertical-align:top;\">
          <span style=\"font-weight:400;font-style:normal;text-decoration:none;color:#000;background-color:transparent\">0.4100</span>
        </td>
      </tr>
      <tr>
        <td style=\"border-color:black;border-style:solid;border-width:1px;overflow:hidden;padding:10px 5px;word-break:normal;text-align:left;vertical-align:top;\">
          <span style=\"font-weight:400;font-style:normal;text-decoration:none;color:#000;background-color:transparent\">X'q</span>
        </td>
        <td style=\"border-color:black;border-style:solid;border-width:1px;overflow:hidden;padding:10px 5px;word-break:normal;text-align:left;vertical-align:top;\">
          <span style=\"font-weight:400;font-style:normal;text-decoration:none;color:#000;background-color:transparent\">0.6000</span>
        </td>
      </tr>
      <tr>
        <td style=\"border-color:black;border-style:solid;border-width:1px;overflow:hidden;padding:10px 5px;word-break:normal;text-align:left;vertical-align:top;\">
          <span style=\"font-weight:400;font-style:normal;text-decoration:none;color:#000;background-color:transparent\">X''d = X''q</span>
        </td>
        <td style=\"border-color:black;border-style:solid;border-width:1px;overflow:hidden;padding:10px 5px;word-break:normal;text-align:left;vertical-align:top;\">
          <span style=\"font-weight:400;font-style:normal;text-decoration:none;color:#000;background-color:transparent\">0.2000</span>
        </td>
      </tr>
      <tr>
        <td style=\"border-color:black;border-style:solid;border-width:1px;overflow:hidden;padding:10px 5px;word-break:normal;text-align:left;vertical-align:top;\">
          <span style=\"font-weight:400;font-style:normal;text-decoration:none;color:#000;background-color:transparent\">Xl</span>
        </td>
        <td style=\"border-color:black;border-style:solid;border-width:1px;overflow:hidden;padding:10px 5px;word-break:normal;text-align:left;vertical-align:top;\">
          <span style=\"font-weight:400;font-style:normal;text-decoration:none;color:#000;background-color:transparent\">0.1200</span>
        </td>
      </tr>
      <tr>
        <td style=\"border-color:black;border-style:solid;border-width:1px;overflow:hidden;padding:10px 5px;word-break:normal;text-align:left;vertical-align:top;\">
          <span style=\"font-weight:400;font-style:normal;text-decoration:none;color:#000;background-color:transparent\">S(1.0)</span>
        </td>
        <td style=\"border-color:black;border-style:solid;border-width:1px;overflow:hidden;padding:10px 5px;word-break:normal;text-align:left;vertical-align:top;\">
          <span style=\"font-weight:400;font-style:normal;text-decoration:none;color:#000;background-color:transparent\">0.1100</span>
        </td>
      </tr>
      <tr>
        <td style=\"border-color:black;border-style:solid;border-width:1px;overflow:hidden;padding:10px 5px;word-break:normal;text-align:left;vertical-align:top;\">
          <span style=\"font-weight:400;font-style:normal;text-decoration:none;color:#000;background-color:transparent\">S(1.2)</span>
        </td>
        <td style=\"border-color:black;border-style:solid;border-width:1px;overflow:hidden;padding:10px 5px;word-break:normal;text-align:left;vertical-align:top;\">
          <span style=\"font-weight:400;font-style:normal;text-decoration:none;color:#000;background-color:transparent\">0.3900</span>
        </td>
      </tr>
      <tr>
        <td style=\"border-color:black;border-style:solid;border-width:1px;overflow:hidden;padding:10px 5px;word-break:normal;text-align:left;vertical-align:top;\">
          <span style=\"font-weight:400;font-style:normal;text-decoration:none;color:#000;background-color:transparent\">Ra</span>
        </td>
        <td style=\"border-color:black;border-style:solid;border-width:1px;overflow:hidden;padding:10px 5px;word-break:normal;text-align:left;vertical-align:top;\">
          <span style=\"font-weight:400;font-style:normal;text-decoration:none;color:#000;background-color:transparent\">0.0000</span>
        </td>
      </tr>
      <tr>
        <td style=\"border-color:black;border-style:solid;border-width:1px;overflow:hidden;padding:10px 5px;word-break:normal;text-align:left;vertical-align:top;\">
          <span style=\"font-weight:400;font-style:normal;text-decoration:none;color:#000;background-color:transparent\">Xsource (= Xpq)</span>
        </td>
        <td style=\"border-color:black;border-style:solid;border-width:1px;overflow:hidden;padding:10px 5px;word-break:normal;text-align:left;vertical-align:top;\">
          <span style=\"font-weight:400;font-style:normal;text-decoration:none;color:#000;background-color:transparent\">0.2000</span>
        </td>
      </tr>
      <tr>
        <td style=\"border-color:black;border-style:solid;border-width:1px;overflow:hidden;padding:10px 5px;word-break:normal;text-align:left;vertical-align:top;\" rowspan=\"5\">GENCLS</td>
        <td style=\"border-color:black;border-style:solid;border-width:1px;overflow:hidden;padding:10px 5px;word-break:normal;text-align:left;vertical-align:top;\">
          <span style=\"font-weight:400;font-style:normal;text-decoration:none;color:#000;background-color:transparent\">Mbase</span>
        </td>
        <td style=\"border-color:black;border-style:solid;border-width:1px;overflow:hidden;padding:10px 5px;word-break:normal;text-align:left;vertical-align:top;\">
          <span style=\"font-weight:400;font-style:normal;text-decoration:none;color:#000;background-color:transparent\">100 MVA</span>
        </td>
      </tr>
      <tr>
        <td style=\"border-color:black;border-style:solid;border-width:1px;overflow:hidden;padding:10px 5px;word-break:normal;text-align:left;vertical-align:top;\">
          <span style=\"font-weight:400;font-style:normal;text-decoration:none;color:#000;background-color:transparent\">Inertia H</span>
        </td>
        <td style=\"border-color:black;border-style:solid;border-width:1px;overflow:hidden;padding:10px 5px;word-break:normal;text-align:left;vertical-align:top;\">
          <span style=\"font-weight:400;font-style:normal;text-decoration:none;color:#000;background-color:transparent\">5.0000</span>
        </td>
      </tr>
      <tr>
        <td style=\"border-color:black;border-style:solid;border-width:1px;overflow:hidden;padding:10px 5px;word-break:normal;text-align:left;vertical-align:top;\">
          <span style=\"font-weight:400;font-style:normal;text-decoration:none;color:#000;background-color:transparent\">Damping Constant D</span>
        </td>
        <td style=\"border-color:black;border-style:solid;border-width:1px;overflow:hidden;padding:10px 5px;word-break:normal;text-align:left;vertical-align:top;\">
          <span style=\"font-weight:400;font-style:normal;text-decoration:none;color:#000;background-color:transparent\">0.0000</span>
        </td>
      </tr>
      <tr>
        <td style=\"border-color:black;border-style:solid;border-width:1px;overflow:hidden;padding:10px 5px;word-break:normal;text-align:left;vertical-align:top;\">
          <span style=\"font-weight:400;font-style:normal;text-decoration:none;color:#000;background-color:transparent\">Ra</span>
        </td>
        <td style=\"border-color:black;border-style:solid;border-width:1px;overflow:hidden;padding:10px 5px;word-break:normal;text-align:left;vertical-align:top;\">
          <span style=\"font-weight:400;font-style:normal;text-decoration:none;color:#000;background-color:transparent\">0.0000</span>
        </td>
      </tr>
      <tr>
        <td style=\"border-color:black;border-style:solid;border-width:1px;overflow:hidden;padding:10px 5px;word-break:normal;text-align:left;vertical-align:top;\">
          <span style=\"font-weight:400;font-style:normal;text-decoration:none;color:#000;background-color:transparent\">XSource</span>
        </td>
        <td style=\"border-color:black;border-style:solid;border-width:1px;overflow:hidden;padding:10px 5px;word-break:normal;text-align:left;vertical-align:top;\">
          <span style=\"font-weight:400;font-style:normal;text-decoration:none;color:#000;background-color:transparent\">0.2000</span>
        </td>
      </tr>
    </tbody>
  </table>
</html>"));
end StartHere;
