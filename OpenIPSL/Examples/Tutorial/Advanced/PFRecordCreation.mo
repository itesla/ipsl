within OpenIPSL.Examples.Tutorial.Advanced;
model PFRecordCreation
  "Creating and Integrating the Power Flow Structure"
  extends Modelica.Icons.Information;
  annotation (DocumentationClass=true, Documentation(info="<html>
  <h5>Creating and Integrating the Power Flow Structure</h5>
  <ol style=\"line-height:175%;\">
    <li>Create a directory called <span style=\"font-family: Courier New; color: #0000ff;\">models</span> above your model current folder. </li>
    <li>Add a sub-folder named <span style=\"font-family: Courier New; color: #0000ff;\">_old</span> if your model has been created with OpenIPSL 1.5.0. If, on the other hand, you have used the new version of the library, then name that sub-folder <span style=\"font-family: Courier New; color: #0000ff;\"> _new</span>. </li>
    <li>Move your model folder to the directory created in <strong>step 2</strong>. For example, let&apos;s assume you are using the new version of OpenIPSL, then if your model is saved in a folder called <span style=\"font-family: Courier New; color: #0000ff;\">SMIB</span>, the new path of your folder should be <span style=\"font-family: Courier New; color: #0000ff;\">models/_new/SMIB</span>. </li>
    <li>Make sure the directory <span style=\"font-family: Courier New; color: #0000ff;\">pf2rec</span> downloaded from the <span style=\"font-family: Courier New; color: #0000ff;\">SMIB_Tutorial</span> repository is in the same directory. Here is a screenshot of how your folder structure should look like: </li>
  </ol>
  <p style=\"margin-left: 50px;\">
    <br />
    <img src=\"modelica://OpenIPSL/Resources/images/example_4/image12.png\" alt=\"Image12\" />
  </p>
  <ol start=\"5\">
    <li>In the same location where you have your <span style=\"font-family: Courier New; color: #0000ff;\">models</span> and <span style=\"font-family: Courier New; color: #0000ff;\">pf2rec</span> folders, create a new python file called <span style=\"font-family: Courier New; color: #0000ff;\">create_records.py</span>. Copy and paste the following code in the file. <em>Be careful with indentation!</em>
    </li>
  </ol>
  <p style=\"margin-left: 50px;\">
    <br />
    <img src=\"modelica://OpenIPSL/Resources/images/example_4/image69.png\" alt=\"Image69\" />
  </p>
  <p style=\"margin-left: 50px;\">
    <img src=\"modelica://OpenIPSL/Resources/images/example_4/image70.png\" alt=\"Image70\" />
  </p>
  <ol start=\"6\" style=\"line-height:175%;\">
    <li>Reload your model or run Dymola, depending on what you did at the end of the previous section. Create a package inside the root package <span style=\"font-family: Courier New; color: #0000ff;\">SMIB</span> and name it <span style=\"font-family: Courier New; color: #0000ff;\">Utilities</span>. </li>
    <li>Add a new function inside <span style=\"font-family: Courier New; color: #0000ff;\">Utilities</span> called <span style=\"font-family: Courier New; color: #0000ff;\">saveTotalSMIBModel</span>. Remember that the procedure for creating functions is the same as for other kinds of classes such as <span style=\"font-family: Courier New; color: #0000ff;\">Package</span>, <span style=\"font-family: Courier New; color: #0000ff;\">Model</span> or <span style=\"font-family: Courier New; color: #0000ff;\">Record</span>. </li>
    <li>Go to the Modelica text of the function and type the following code:</li>
  </ol>
  <p style=\"margin-left: 50px;\">
    <br />
    <img src=\"modelica://OpenIPSL/Resources/images/example_4/image71.png\" alt=\"Image71\" />
  </p>
  <hr>
  <p style=\"margin-left: 50px; line-height: 2;\">&#x1F4CC; This function has no inputs and only one boolean output. The modelica standard function <em>
      <span style=\"font-family: Courier New; color: #0000ff;\">saveTotalModel</span>
    </em> is called inside the algorithm section with predefined arguments. You can check the information view of <em>
      <span style=\"font-family: Courier New; color: #0000ff;\">saveTotalModel</span>
    </em> to get to know the proper use of each of its parameters. To do that, make sure the <span style=\"font-family: Courier New; color: #0000ff;\">DymolaCommands</span> library is loaded within the Package Browser. Then navigate as shown in the picture below </p>
  <p style=\"margin-left: 100px;\">
    <img src=\"modelica://OpenIPSL/Resources/images/example_4/image18.png\" alt=\"Image18\" />
  </p>
  <hr>
  <ol start=\"9\" style=\"line-height:175%;\">
    <li>Right-click the <span style=\"font-family: Courier New; color: #0000ff;\">saveTotalSMIBModel</span> function from the Package Browser. Select the &quot; <em>Call Function...</em>&quot; option and then click the <span style=\"font-family: Courier New; color: #0000ff;\">OK</span> button. As a result, you should be able to see a new file called <em>
        <span style=\"font-family: Courier New; color: #0000ff;\">SMIBTotal.mo</span>
      </em> in the same folder where your model files are being stored. </li>
    <li>Go to the system terminal, change the current directory to the location where the <span style=\"color: #0000ff; font-family: Courier New;\">create_records</span> python script is placed and execute it as indicated below. </li>
  </ol>
  <p style=\"margin-left: 40px;\">For OpenIPSL 1.5.0:</p>
  <p style=\"margin-left: 50px;\">
    <img src=\"modelica://OpenIPSL/Resources/images/example_4/image72.png\" alt=\"Image72\" />
  </p>
  <p style=\"margin-left: 40px;\">For OpenIPSL 2.0.0:</p>
  <p style=\"margin-left: 40px;\">
    <img src=\"modelica://OpenIPSL/Resources/images/example_4/image73.png\" alt=\"Image73\" />
  </p>
  <ol start=\"11\">
    <li>Go back to Dymola and refresh ( <img src=\"modelica://OpenIPSL/Resources/images/example_4/image17.png\" alt=\"Image17\" />) the SMIB package. </li>
  </ol>
  <hr>
  <p style=\"margin-left: 50px;\">
    <br />&#x1F4CC; The python script <span style=\"font-family: Courier New; color: #0000ff;\">create_records</span> should have created a new package inside your model that looks like this
  </p>
  <p style=\"margin-left: 100px;\">
    <br>
    <img src=\"modelica://OpenIPSL/Resources/images/example_4/image43.png\" alt=\"Image43\" />
  </p>
  <hr>
  <ol start=\"12\">
    <li>Double-click the <span style=\"font-family: Courier New; color: #0000ff;\">SMIB_Partial</span> model to open its diagram view. From the new <span style=\"font-family: Courier New; color: #0000ff;\">PF_Data</span> package, drag and drop <strong>one</strong>
      <span style=\"font-family: Courier New; color: #0000ff;\">Power_Flow</span> element on your canvas. <strong>For convenience, rename it as</strong>
      <span style=\"font-family: Courier New; color: #0000ff;\">pf</span>.
    </li>
  </ol>
  <p style=\"margin-left: 50px;\">
    <br />
    <img src=\"modelica://OpenIPSL/Resources/images/example_4/image21.png\" alt=\"Image21\" />
  </p>
  <ol start=\"13\">
    <li>Link the power flow variables to the different components as indicated below. <em>Yes, unfortunately you must type them!</em>
    </li>
  </ol>
  <p style=\"margin-left: 50px;\">
    <br />
    <img src=\"modelica://OpenIPSL/Resources/images/example_4/image23.png\" alt=\"Image23\" />
  </p>
  <p>
    <br />
  </p>
  <table style=\"border-collapse:collapse;border-color:#aaa;border-spacing:0;margin-left: 50px;\">
    <thead>
      <tr>
        <th style=\"background-color:#0066cc;border-color:#aaa;border-style:solid;border-width:1px;overflow:hidden;padding:10px 5px;word-break:normal;color:#ffffff;font-weight:bold;text-align:left;vertical-align:top\">Component</th>
        <th style=\"background-color:#0066cc;border-color:#aaa;border-style:solid;border-width:1px;overflow:hidden;padding:10px 5px;word-break:normal;color:#ffffff;font-weight:bold;text-align:left;vertical-align:top\">V_0</th>
        <th style=\"background-color:#0066cc;border-color:#aaa;border-style:solid;border-width:1px;overflow:hidden;padding:10px 5px;word-break:normal;color:#ffffff;font-weight:bold;text-align:left;vertical-align:top\">A_0</th>
        <th style=\"background-color:#0066cc;border-color:#aaa;border-style:solid;border-width:1px;overflow:hidden;padding:10px 5px;word-break:normal;color:#ffffff;font-weight:bold;text-align:left;vertical-align:top\">P_0</th>
        <th style=\"background-color:#0066cc;border-color:#aaa;border-style:solid;border-width:1px;overflow:hidden;padding:10px 5px;word-break:normal;color:#ffffff;font-weight:bold;text-align:left;vertical-align:top\">Q_0</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td style=\"border-color:#aaa;border-style:solid;border-width:1px;color:#000;overflow:hidden;padding:10px 5px;word-break:normal;background-color:#e6f2ff;text-align:left;vertical-align:top\">B01 (bus)</td>
        <td style=\"border-color:#aaa;border-style:solid;border-width:1px;color:#000;overflow:hidden;padding:10px 5px;word-break:normal;background-color:#e6f2ff;text-align:left;vertical-align:top\">pf.powerflow.bus.V1</td>
        <td style=\"border-color:#aaa;border-style:solid;border-width:1px;color:#000;overflow:hidden;padding:10px 5px;word-break:normal;background-color:#e6f2ff;text-align:left;vertical-align:top\">pf.powerflow.bus.A1</td>
        <td style=\"border-color:#aaa;border-style:solid;border-width:1px;color:#000;overflow:hidden;padding:10px 5px;word-break:normal;background-color:#e6f2ff;text-align:left;vertical-align:top\">N/A</td>
        <td style=\"border-color:#aaa;border-style:solid;border-width:1px;color:#000;overflow:hidden;padding:10px 5px;word-break:normal;background-color:#e6f2ff;text-align:left;vertical-align:top\">N/A</td>
      </tr>
      <tr>
        <td style=\"background-color:#fff;border-color:#aaa;border-style:solid;border-width:1px;color:#333;overflow:hidden;padding:10px 5px;word-break:normal;text-align:left;vertical-align:top\">B02 (bus)</td>
        <td style=\"background-color:#fff;border-color:#aaa;border-style:solid;border-width:1px;color:#333;overflow:hidden;padding:10px 5px;word-break:normal;text-align:left;vertical-align:top\">pf.powerflow.bus.V2</td>
        <td style=\"background-color:#fff;border-color:#aaa;border-style:solid;border-width:1px;color:#333;overflow:hidden;padding:10px 5px;word-break:normal;text-align:left;vertical-align:top\">pf.powerflow.bus.A2</td>
        <td style=\"background-color:#fff;border-color:#aaa;border-style:solid;border-width:1px;color:#333;overflow:hidden;padding:10px 5px;word-break:normal;text-align:left;vertical-align:top\">N/A</td>
        <td style=\"background-color:#fff;border-color:#aaa;border-style:solid;border-width:1px;color:#333;overflow:hidden;padding:10px 5px;word-break:normal;text-align:left;vertical-align:top\">N/A</td>
      </tr>
      <tr>
        <td style=\"border-color:#aaa;border-style:solid;border-width:1px;color:#000;overflow:hidden;padding:10px 5px;word-break:normal;background-color:#e6f2ff;text-align:left;vertical-align:top\">B03 (bus)</td>
        <td style=\"border-color:#aaa;border-style:solid;border-width:1px;color:#000;overflow:hidden;padding:10px 5px;word-break:normal;background-color:#e6f2ff;text-align:left;vertical-align:top\">pf.powerflow.bus.V3</td>
        <td style=\"border-color:#aaa;border-style:solid;border-width:1px;color:#000;overflow:hidden;padding:10px 5px;word-break:normal;background-color:#e6f2ff;text-align:left;vertical-align:top\">pf.powerflow.bus.A3</td>
        <td style=\"border-color:#aaa;border-style:solid;border-width:1px;color:#000;overflow:hidden;padding:10px 5px;word-break:normal;background-color:#e6f2ff;text-align:left;vertical-align:top\">N/A</td>
        <td style=\"border-color:#aaa;border-style:solid;border-width:1px;color:#000;overflow:hidden;padding:10px 5px;word-break:normal;background-color:#e6f2ff;text-align:left;vertical-align:top\">N/A</td>
      </tr>
      <tr>
        <td style=\"background-color:#fff;border-color:#aaa;border-style:solid;border-width:1px;color:#333;overflow:hidden;padding:10px 5px;word-break:normal;text-align:left;vertical-align:top\">B04 (bus)</td>
        <td style=\"background-color:#fff;border-color:#aaa;border-style:solid;border-width:1px;color:#333;overflow:hidden;padding:10px 5px;word-break:normal;text-align:left;vertical-align:top\">pf.powerflow.bus.V4</td>
        <td style=\"background-color:#fff;border-color:#aaa;border-style:solid;border-width:1px;color:#333;overflow:hidden;padding:10px 5px;word-break:normal;text-align:left;vertical-align:top\">pf.powerflow.bus.A4</td>
        <td style=\"background-color:#fff;border-color:#aaa;border-style:solid;border-width:1px;color:#333;overflow:hidden;padding:10px 5px;word-break:normal;text-align:left;vertical-align:top\">N/A</td>
        <td style=\"background-color:#fff;border-color:#aaa;border-style:solid;border-width:1px;color:#333;overflow:hidden;padding:10px 5px;word-break:normal;text-align:left;vertical-align:top\">N/A</td>
      </tr>
      <tr>
        <td style=\"border-color:#aaa;border-style:solid;border-width:1px;color:#000;overflow:hidden;padding:10px 5px;word-break:normal;background-color:#e6f2ff;text-align:left;vertical-align:top\">load (load)</td>
        <td style=\"border-color:#aaa;border-style:solid;border-width:1px;color:#000;overflow:hidden;padding:10px 5px;word-break:normal;background-color:#e6f2ff;text-align:left;vertical-align:top\">pf.powerflow.bus.V4</td>
        <td style=\"border-color:#aaa;border-style:solid;border-width:1px;color:#000;overflow:hidden;padding:10px 5px;word-break:normal;background-color:#e6f2ff;text-align:left;vertical-align:top\">pf.powerflow.bus.A4</td>
        <td style=\"border-color:#aaa;border-style:solid;border-width:1px;color:#000;overflow:hidden;padding:10px 5px;word-break:normal;background-color:#e6f2ff;text-align:left;vertical-align:top\">pf.powerflow.loads.PL1</td>
        <td style=\"border-color:#aaa;border-style:solid;border-width:1px;color:#000;overflow:hidden;padding:10px 5px;word-break:normal;background-color:#e6f2ff;text-align:left;vertical-align:top\">pf.powerflow.loads.QL1</td>
      </tr>
      <tr>
        <td style=\"background-color:#fff;border-color:#aaa;border-style:solid;border-width:1px;color:#333;overflow:hidden;padding:10px 5px;word-break:normal;text-align:left;vertical-align:top\">InfiniteBus (gen)</td>
        <td style=\"background-color:#fff;border-color:#aaa;border-style:solid;border-width:1px;color:#333;overflow:hidden;padding:10px 5px;word-break:normal;text-align:left;vertical-align:top\">pf.powerflow.bus.V2</td>
        <td style=\"background-color:#fff;border-color:#aaa;border-style:solid;border-width:1px;color:#333;overflow:hidden;padding:10px 5px;word-break:normal;text-align:left;vertical-align:top\">pf.powerflow.bus.A2</td>
        <td style=\"background-color:#fff;border-color:#aaa;border-style:solid;border-width:1px;color:#333;overflow:hidden;padding:10px 5px;word-break:normal;text-align:left;vertical-align:top\">pf.powerflow.machines.PG2</td>
        <td style=\"background-color:#fff;border-color:#aaa;border-style:solid;border-width:1px;color:#333;overflow:hidden;padding:10px 5px;word-break:normal;text-align:left;vertical-align:top\">pf.powerflow.machines.QG2</td>
      </tr>
    </tbody>
  </table>
  <p style=\"margin-left: 50px;\">If you check your model now, you should see an error because we have not defined the power flow values. We have just pointed to the container which will have it. Next, we generate the power flow results using <span style=\"font-family: Courier New; color: #0000ff;\">GridCal</span>.</p>
  <p><br /></p>
  <ol start=\"14\">
    <li>Now open the diagram layer of your SMIB model inside the <span style=\"font-family: Courier New; color: #0000ff;\">Experiments</span> package. Link the power flow variables to <span style=\"font-family: Courier New; color: #0000ff;\">genunit</span> as specified in the following table: </li>
  </ol>
  <table style=\"border-collapse:collapse;border-color:#aaa;border-spacing:0;margin-left: 50px;\">
    <thead>
      <tr>
        <th style=\"background-color:#0066cc;border-color:#aaa;border-style:solid;border-width:1px;overflow:hidden;padding:10px 5px;word-break:normal;color:#ffffff;font-weight:bold;text-align:left;vertical-align:top\">
          <span style=\"font-weight:700;font-style:normal;text-decoration:none\">Component</span>
        </th>
        <th style=\"background-color:#0066cc;border-color:#aaa;border-style:solid;border-width:1px;overflow:hidden;padding:10px 5px;word-break:normal;color:#ffffff;font-weight:bold;text-align:left;vertical-align:top\">V_0</th>
        <th style=\"background-color:#0066cc;border-color:#aaa;border-style:solid;border-width:1px;overflow:hidden;padding:10px 5px;word-break:normal;color:#ffffff;font-weight:bold;text-align:left;vertical-align:top\">A_0</th>
        <th style=\"background-color:#0066cc;border-color:#aaa;border-style:solid;border-width:1px;overflow:hidden;padding:10px 5px;word-break:normal;color:#ffffff;font-weight:bold;text-align:left;vertical-align:top\">P_0</th>
        <th style=\"background-color:#0066cc;border-color:#aaa;border-style:solid;border-width:1px;overflow:hidden;padding:10px 5px;word-break:normal;color:#ffffff;font-weight:bold;text-align:left;vertical-align:top\">
          <span style=\"font-weight:700;font-style:normal;text-decoration:none\">Q_0</span>
        </th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td style=\"background-color:#fff;border-color:#aaa;border-style:solid;border-width:1px;color:#333;overflow:hidden;padding:10px 5px;word-break:normal;text-align:left;vertical-align:top\">genunit (gen)</td>
        <td style=\"background-color:#fff;border-color:#aaa;border-style:solid;border-width:1px;color:#333;overflow:hidden;padding:10px 5px;word-break:normal;text-align:left;vertical-align:top\">pf.powerflow.bus.V1</td>
        <td style=\"background-color:#fff;border-color:#aaa;border-style:solid;border-width:1px;color:#333;overflow:hidden;padding:10px 5px;word-break:normal;text-align:left;vertical-align:top\">pf.powerflow.bus.A1</td>
        <td style=\"background-color:#fff;border-color:#aaa;border-style:solid;border-width:1px;color:#333;overflow:hidden;padding:10px 5px;word-break:normal;text-align:left;vertical-align:top\">pf.powerflow.machines.PG1</td>
        <td style=\"background-color:#fff;border-color:#aaa;border-style:solid;border-width:1px;color:#333;overflow:hidden;padding:10px 5px;word-break:normal;text-align:left;vertical-align:top\">pf.powerflow.machines.QG1</td>
      </tr>
    </tbody>
  </table>
</html>"));
end PFRecordCreation;
