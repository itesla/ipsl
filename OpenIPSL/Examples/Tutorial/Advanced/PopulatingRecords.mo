within OpenIPSL.Examples.Tutorial.Advanced;
model PopulatingRecords "Populating Power Flows Records with GridCal"
  extends Modelica.Icons.Information;
  annotation (DocumentationClass=true, Documentation(info="<html>
  <h5 id=\"153d8da7-e237-4c9d-ab2b-2cc35263dd82\">Populating Power Flows with GridCal</h5>
  <p id=\"0ed9e34a-d72e-42ea-b2ee-62fb35e3e185\">The next step is to populate our model with power flow results generated from GridCal. For simplicity, we will create a power flow model from an accompanying PSS/E <span style=\"font-family: Courier New; color: #0000ff;\">.raw</span>. However, it is possible to run the power flows from a native GridCal model. </p>
  <ol type=\"1\" id=\"66dc4dd1-545e-4349-a686-af2d1033697a\" start=\"1\">
    <li><a href=\"https://github.com/ALSETLab/SMIB_Tutorial/tree/master/models/_old/SMIB/PSSE_Files\">Download</a> the accompanying PSS/E <span style=\"font-family: Courier New; color: #0000ff;\">.raw</span> file ( <span style=\"font-family: Courier New; color: #0000ff;\">SMIB_Base_Case.raw</span>) and save it in your model directory under <span style=\"font-family: Courier New; color: #0000ff;\">PSSE_Files</span>. The <span style=\"font-family: Courier New; color: #0000ff;\">.dyr</span> file is not required for power flow computations.</li>
  </ol>
  <p style=\"margin-left: 40px;\">
    <img style=\"width:445px\" src=\"modelica://OpenIPSL/Resources/images/example_4/image53.png\" alt=\"Image53\" />
  </p>
  <ol type=\"1\" id=\"4e028741-e576-421d-be44-5e5f0ab1e2a5\" start=\"2\">
    <li>Create a new Python script called <span style=\"font-family: Courier New; color: #0000ff;\">run_pf.py</span>. Copy and paste the following code inside it. </li>
  </ol>
  <p style=\"margin-left: 40px;\">
    <img style=\"width:700px\" src=\"modelica://OpenIPSL/Resources/images/example_4/image85.png\" alt=\"Image85\" />
  </p>
  <p style=\"margin-left: 40px;\">
    <img style=\"width:705px\" src=\"modelica://OpenIPSL/Resources/images/example_4/image86.png\" alt=\"Image86\" />
  </p>
  <p style=\"margin-left: 40px;\">
    <img style=\"width:654px\" src=\"modelica://OpenIPSL/Resources/images/example_4/image87.png\" alt=\"Image87\" />
  </p>
  <p style=\"margin-left: 40px;\">
    <img style=\"width:718px\" src=\"modelica://OpenIPSL/Resources/images/example_4/image88.png\" alt=\"Image88\" />
  </p>
  <ol type=\"1\" id=\"a196115e-5bd0-43b3-9755-c047c16a8af6\" start=\"3\">
    <li>Execute <span style=\"font-family: Courier New; color: #0000ff;\">run_pf.py</span> from a terminal. </li>
  </ol>
  <p style=\"margin-left: 40px;\">
    <em>For OpenIPSL 1.5.0</em>:
  </p>
  <p style=\"margin-left: 50px;\">
    <img style=\"width:249px\" src=\"modelica://OpenIPSL/Resources/images/example_4/image89.png\" alt=\"Image89\" />
  </p>
  <p style=\"margin-left: 40px;\">
    <em>For OpenIPSL 2.0.0</em>:
  </p>
  <p style=\"margin-left: 50px;\">
    <img style=\"width:367px\" src=\"modelica://OpenIPSL/Resources/images/example_4/image90.png\" alt=\"Image90\" />
  </p>
  <hr>
  <p style=\"margin-left: 40px;\">&#x1F4CC; A new power flow record called <span style=\"font-family: Courier New; color: #0000ff;\">PF_00000</span> should be generated inside the <span style=\"font-family: Courier New; color: #0000ff;\">PF_Data</span> subfolder. </p>
  <hr>
  <ol type=\"1\" id=\"27c06a73-cd94-44a6-a95a-abf415b19a99\" start=\"4\">
    <li>Refresh your model. You should get a new file called <span style=\"font-family: Courier New; color: #0000ff;\">PF_0000.mo</span> inside your <span style=\"font-family: Courier New; color: #0000ff;\">PF_Data</span> folder. In fact, there should be a new file in every subfolder too. </li>
  </ol>
  <p style=\"margin-left: 100px;\">
    <img style=\"width:370px\" src=\"modelica://OpenIPSL/Resources/images/example_4/image91.png\" alt=\"Image91\" />
  </p>
  <ol type=\"1\" id=\"865fae2a-c8cd-478c-99a4-ebe9d152b421\" start=\"5\" style=\"line-height:175%;\">
    <li>In the diagram layer of your SMIB model, double click the power flow component <span style=\"font-family: Courier New; color: #0000ff;\">pf</span>. Select the newly created power flow <span style=\"font-family: Courier New; color: #0000ff;\">PF_00000</span> as the value for the <span style=\"font-family: Courier New; color: #0000ff;\">PowerFlow</span> field. By doing so, we are specifying that the model will initialize using the power flow results in that specific container. </li>
  </ol>
  <p style=\"margin-left: 70px;\">
    <img style=\"width:540px\" src=\"modelica://OpenIPSL/Resources/images/example_4/image42.png\" alt=\"Image42\" />
  </p>
  <p style=\"margin-left: 50px;\">To see the power flow values in Dymola, click on the <em>square button</em>
    <img style=\"width:19px\" src=\"modelica://OpenIPSL/Resources/images/example_4/image6.png\" alt=\"Image6\" /> on the left of the <span style=\"font-family: Courier New; color: #0000ff;\">PowerFlow</span> selection menu.
  </p>
  <p style=\"margin-left: 50px;\">You should see that the power flow record is composed of four fields: <em>bus</em>, <em>loads</em>, <em>machine </em>and <em>transformers</em>. </p>
  <p style=\"margin-left: 70px;\">
    <img style=\"width:585px\" src=\"modelica://OpenIPSL/Resources/images/example_4/image48.png\" alt=\"Image48\" />
  </p>
  <p style=\"margin-left: 50px;\">Inside each field, we can detail the power flow results</p>
  <p style=\"margin-left: 80px;\">
    <img style=\"width:518px\" src=\"modelica://OpenIPSL/Resources/images/example_4/image39.png\" alt=\"Image39\" />
  </p>
  <ol type=\"1\" id=\"290e240c-4d11-4b6b-bb45-b8c6c00de0a8\" start=\"6\">
    <li>Simulate the SMIB model for 2 seconds. Plot the voltage buses. Notice that the power flow solution initializes the dynamical simulation in an equilibrium (i.e., flat) so that the states of the system are not changing.</li>
  </ol>
  <p style=\"margin-left: 50px;\">
    <img style=\"width:567px\" src=\"modelica://OpenIPSL/Resources/images/example_4/image30.png\" alt=\"Image30\" />
  </p>
</html>"));
end PopulatingRecords;
