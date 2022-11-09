within OpenIPSL.Examples.Tutorial.Advanced;
model AutomatingAnalysis
  "Automating Analysis with Modelica Functions"
  extends Modelica.Icons.Information;
  annotation (DocumentationClass=true, Documentation(info="<html>
  <h5 id=\"9e1c704f-92c5-4081-8e89-ad9dcd8087dd\">Automating Analysis with Modelica functions</h5>
  <ol type=\"1\" id=\"6d85365c-b20b-4740-bba0-47f83836085e\" start=\"1\" style=\"line-height:175%;\">
    <li>Open the diagram layer of the <span style=\"font-family: Courier New; color: #0000ff;\">SMIB_Partial</span> model. Remember that this model is located in the following path: <span style=\"font-family: Courier New; color: #0000ff;\">SMIB.BaseModels.BaseNetwork</span>. </li>
    <li>Double-click the load component and go to the Attributes tab. In the <em>Properties</em> group select the <em>Replaceable</em> option. Then click the Constraining clause checkbox and browse for class by pressing the button <img style=\"width:17px\" src=\"modelica://OpenIPSL/Resources/images/example_4/image10.png\" alt=\"Image10\" />. From the package tree select <span style=\"font-family: Courier New; color: #0000ff;\">OpenIPSL.Electrical.Loads.PSSE.BaseClasses.baseLoad</span> as shown in the figure below. </li>
  </ol>
  <p style=\"margin-left: 50px;\">
    <img style=\"width:301px\" src=\"modelica://OpenIPSL/Resources/images/example_4/image40.png\" alt=\"Image40\" />
  </p>
  <ol type=\"1\" id=\"166ff458-826a-4cf9-8c11-d5d1a4a9ca87\" start=\"3\">
    <li>In the package browser, go to the <span style=\"font-family: Courier New; color: #0000ff;\">Experiments</span> package, create a new model by duplicating <span style=\"font-family: Courier New; color: #0000ff;\">SMIB</span> and name it <span style=\"font-family: Courier New; color: #0000ff;\">SMIB_VarLoad</span>. </li>
  </ol>
  <p style=\"margin-left: 50px;\">
    <img style=\"width:444px\" src=\"modelica://OpenIPSL/Resources/images/example_4/image47.png\" alt=\"Image47\" />
  </p>
  <ol type=\"1\" id=\"bb187880-5759-45fa-a325-5810f5d7ca9b\" start=\"4\">
    <li>Now right-click the load component of the <span style=\"font-family: Courier New; color: #0000ff;\">SMIB_VarLoad</span> model and change the class to <em>
        <span style=\"font-family: Courier New; color: #0000ff;\">PSS/E Load with variation</span>
      </em> as indicated in the following picture: </li>
  </ol>
  <p style=\"margin-left: 50px;\">
    <img style=\"width:687px\" src=\"modelica://OpenIPSL/Resources/images/example_4/image52.png\" alt=\"Image52\" />
  </p>
  <ol type=\"1\" id=\"9175e213-1eaa-4b62-8b70-9e4d6794c2e9\" start=\"5\" style=\"line-height:175%;\">
    <li>Double-click the load component to update its power flow parameters. You can either use the button to insert a component reference or type directly each value according to the following settings:
      <ul style=\"line-height:175%;\">
        <li>P_0: <em>pf.powerflow.loads.PL1</em></li>
        <li>Q_0: <em>pf.powerflow.loads.QL1</em></li>
        <li>v_0: <em>pf.powerflow.bus.V3</em></li>
        <li>angle_0: <em>pf.powerflow.bus.A3</em></li>
      </ul>
    </li>
  </ol>
  <ol type=\"1\" id=\"bd113a96-3a83-4fb6-92b5-07ca2af32238\" start=\"6\">
    <li>Specify a load drop of 0.1 pu starting at t = 10 sec and for a duration of 60 sec.</li>
  </ol>
  <p style=\"margin-left: 50px;\">
    <img style=\"width:432px\" src=\"modelica://OpenIPSL/Resources/images/example_4/image37.png\" alt=\"Image37\" />
  </p>
  <ol type=\"1\" id=\"9ce5ac48-ee5c-41c6-965b-4df05d1716a5\" start=\"7\">
    <li>This time we want to see the effect of a perturbation on the load. Therefore, double-click the fault component and change its time parameters so that the fault event occurs after the new simulation stop time (100 sec).</li>
  </ol>
  <p style=\"margin-left: 50px;\">
    <img style=\"width:662px\" src=\"modelica://OpenIPSL/Resources/images/example_4/image35.png\" alt=\"Image35\" />
  </p>
  <ol type=\"1\" id=\"51729e24-42a5-4834-ac2d-52ea5d23d086\" start=\"8\">
    <li>Change the class of the genunit component of the <span style=\"font-family: Courier New; color: #0000ff;\">SMIB_VarLoad</span> model to the <span style=\"font-family: Courier New; color: #0000ff;\">Generator_TurbGov_AVR_PSS</span> model. You will find it as &quot;<em>Machine with Turbine, Governor, Excitation System and PSS</em>&quot;. </li>
  </ol>
  <p style=\"margin-left: 50px;\">
    <img style=\"width:700px\" src=\"modelica://OpenIPSL/Resources/images/example_4/image14.png\" alt=\"Image14\" />
  </p>
  <ol type=\"1\" id=\"02348de3-1ea9-4428-a66f-a415497b7d3b\" start=\"9\">
    <li>Go to the Simulation view and close all the results by right-clicking any of the results from the Variable Browser and then selecting the <em>Close All Results</em> option. </li>
  </ol>
  <p style=\"margin-left: 50px;\">
    <img style=\"width:390px\" src=\"modelica://OpenIPSL/Resources/images/example_4/image46.png\" alt=\"Image46\" />
  </p>
  <p id=\"b6c36a75-214f-4f21-b3cf-8597b82b0139\">We would like to automatically simulate the <span style=\"font-family: Courier New; color: #0000ff;\">SMIB</span> and <span style=\"font-family: Courier New; color: #0000ff;\">SMIB_VarLoad</span> models and plot their results for comparative purposes. For this to be done we are going to create and call a Modelica function that includes the right sequence of steps. </p>
  <ol type=\"1\" id=\"f3e9822e-3f65-44d0-adba-21d5be3adf99\" start=\"10\" style=\"line-height:175%;\">
    <li>Create a new Modelica function inside of the <span style=\"font-family: Courier New; color: #0000ff;\">Experiments</span> package. For this to be done you can go to <em>File &gt; New &gt; Function</em> after selecting the package, or alternatively, you can right-click the package and then click on <em>New &gt; Function</em>. Name the function <em>
        <span style=\"font-family: Courier New; color: #0000ff;\">RunAndCompare</span>
      </em>. The <span style=\"font-family: Courier New; color: #0000ff;\">Experiments</span> package should now look like this: </li>
  </ol>
  <p style=\"margin-left: 50px;\">
    <img style=\"width:166px\" src=\"modelica://OpenIPSL/Resources/images/example_4/image29.png\" alt=\"Image29\" />
  </p>
  <ol type=\"1\" id=\"dea8ca64-1244-4f58-8a50-8a1e45522d3e\" start=\"11\">
    <li>Go to the Modelica text of the <span style=\"font-family: Courier New; color: #0000ff;\">RunAndCompare</span> function and create 6 input variables as indicated below: </li>
  </ol>
  <p style=\"margin-left: 50px;\">
    <img style=\"width:644px\" src=\"modelica://OpenIPSL/Resources/images/example_4/image95.png\" alt=\"Image95\" />
  </p>
  <ol type=\"1\" id=\"c8529aea-1ac0-4f77-9b18-63d2df8464ef\" start=\"12\">
    <li>Add the following code inside of the algorithm section of the function to define the simulation and plotting instructions:</li>
  </ol>
  <p style=\"margin-left: 50px;\">
    <img style=\"width:647px\" src=\"modelica://OpenIPSL/Resources/images/example_4/image96.png\" alt=\"Image96\" />
  </p>
  <p style=\"margin-left: 50px;\">
    <img style=\"width:633px\" src=\"modelica://OpenIPSL/Resources/images/example_4/image97.png\" alt=\"Image97\" />
  </p>
  <ol type=\"1\" id=\"90b58bf2-6d60-4ee2-bcd5-6b712cb66cda\" start=\"13\">
    <li>Right-click the <span style=\"font-family: Courier New; color: #0000ff;\">RunAndCompare</span> function, select the <em>Call Function…</em> option and then press OK. If everything goes well you will get the plots shown below. </li>
  </ol>
  <p style=\"margin-left: 50px;\">
    <img style=\"width:700px\" src=\"modelica://OpenIPSL/Resources/images/example_4/image45.png\" alt=\"Image45\" />
  </p>
</html>"));
end AutomatingAnalysis;
