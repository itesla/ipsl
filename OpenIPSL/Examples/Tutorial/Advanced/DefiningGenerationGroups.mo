within OpenIPSL.Examples.Tutorial.Advanced;
model DefiningGenerationGroups
  "Adding Generation Unit Models in More Detail"
  extends Modelica.Icons.Information;
  annotation (DocumentationClass=true, Documentation(info="<html>
  <h5 id=\"fef31677-e316-4b7c-8a39-d910e07e6ced\">Adding Generation Unit Models in More Detail</h5>
  <p id=\"45edda70-9012-4947-8a4c-7b9d96aae295\">Let us now proceed to create alternative representations of a generation unit so that we can use them in our experiments.</p>
  <ol type=\"1\" id=\"6184f26d-ccaa-434b-96dc-d735d5c3bf0f\" start=\"1\">
    <li>Expand your <span style=\"font-family: Courier New; color: #0000ff;\">
        <span style=\"font-family: Courier New; color: #0000ff;\">GenerationUnit</span>s </span> package and duplicate the <span style=\"font-family: Courier New; color: #0000ff;\">Generator_Only</span> model to create a new model called <span style=\"font-family: Courier New; color: #0000ff;\">Generator_TurbGov</span> that also has a turbine/governor block. </li>
  </ol>
  <p style=\"margin-left: 50px;\">
    <img style=\"width:442px\" src=\"modelica://OpenIPSL/Resources/images/example_4/image1.png\" alt=\"Image1\" />
  </p>
  <ol type=\"1\" id=\"4e6491e6-45c5-4f1e-915c-783dbc5109b3\" start=\"2\" style=\"line-height:175%;\">
    <li>Go to the diagram layer of the model and drag-and-drop a <span style=\"font-family: Courier New; color: #0000ff;\">IEEEG1</span> turbine/governor block from <span style=\"font-family: Courier New; color: #0000ff;\">OpenIPSL.Electrical.Controls.PSSE.TG</span>. </li>
    <li>It is highly recommended that you increase the dimensions of the canvas so that the components could be better distributed. One way of achieving this is by right-clicking the diagram layer and choosing the Attributes option. In the Graphics tab modify the coordinates as indicated below:</li>
  </ol>
  <p style=\"margin-left: 50px;\">
    <img style=\"width:357px\" src=\"modelica://OpenIPSL/Resources/images/example_4/image41.png\" alt=\"Image41\" />
  </p>
  <ol type=\"1\" id=\"35fd9daf-a336-4bf9-b7d6-98235d6df058\" start=\"4\">
    <li>Remove the connection between the <span style=\"font-family: Courier New; color: #0000ff;\">PMECH0</span> output and the <span style=\"font-family: Courier New; color: #0000ff;\">PMECH</span> input of the machine. Be aware that we now have a turbine block, therefore connect its HP-stage mechanical power output to the corresponding input of the machine. Your model should look like this: </li>
  </ol>
  <p style=\"margin-left: 50px;\">
    <img style=\"width:644px\" src=\"modelica://OpenIPSL/Resources/images/example_4/image54.png\" alt=\"Image54\" />
  </p>
  <ol type=\"1\" id=\"a2a9c0ad-4ee6-4d43-b5ab-67a846c7a804\" start=\"5\">
    <li>Provide the following values for the <span style=\"font-family: Courier New; color: #0000ff;\">IEEEG1</span> parameters: </li>
  </ol>
  <p style=\"margin-left: 50px;\">
    <img style=\"width:521px\" src=\"modelica://OpenIPSL/Resources/images/example_4/image38.png\" alt=\"Image38\" />
  </p>
  <ol type=\"1\" id=\"5afafc25-2919-4c37-baa2-a732ac4c54d3\" start=\"6\" style=\"line-height:175%;\">
    <li>Check the model and make sure that everything is fine.</li>
    <li>Open the diagram layer of your <span style=\"font-family: Courier New; color: #0000ff;\">SMIB</span> experiment model and double-click the <em>genunit</em> component. </li>
    <li>Go to the Attributes tab and click the replaceable option. Then click the Constraining Clause checkbox and select <span style=\"font-family: Courier New; color: #0000ff;\">OpenIPSL.Interfaces.Generator</span> from the drop-down list. </li>
  </ol>
  <p style=\"margin-left: 50px;\">
    <img style=\"width:417px\" src=\"modelica://OpenIPSL/Resources/images/example_4/image92.png\" alt=\"Image92\" />
  </p>
  <hr>
  <p style=\"margin-left: 40px;\">&#x1F4CC; The <span style=\"font-family: Courier New; color: #0000ff;\">GenerationUnit</span> icon should now turn into </p>
  <p style=\"margin-left: 90px;\">
    <img style=\"width:105px\" src=\"modelica://OpenIPSL/Resources/images/example_4/image24.png\" alt=\"Image24\" />
  </p>
  <hr>
  <ol type=\"1\" id=\"dc757fa2-b4c1-46a9-8b71-f7d68e401b55\" start=\"9\">
    <li>In Simulation Setup go to the Output tab and make sure that you are keeping at least 10 results:</li>
  </ol>
  <p style=\"margin-left: 50px;\">
    <img style=\"width:553px\" src=\"modelica://OpenIPSL/Resources/images/example_4/image93.png\" alt=\"Image93\" />
  </p>
  <ol type=\"1\" id=\"4d961eae-ff66-45ff-ba08-4ab5691b6b09\" start=\"10\">
    <li>Go back to the diagram layer for the <span style=\"font-family: Courier New; color: #0000ff;\">SMIB</span> model and right-click the <em>genunit</em> block to change the class to the \" <em>Machine with Turbine and Governor</em>\" option. </li>
  </ol>
  <p style=\"margin-left: 50px;\">
    <img style=\"width:700px\" src=\"modelica://OpenIPSL/Resources/images/example_4/image34.png\" alt=\"Image34\" />
  </p>
  <ol type=\"1\" id=\"ff3351d7-9ee3-463f-a1e1-313d9e08585e\" start=\"11\" style=\"line-height:175%;\">
    <li>Simulate the model again for 2 seconds.</li>
    <li>Plot the active power output (P) from <em>genunit</em> and compare it to the result you got from the previous simulation (where the generation unit model did not include the turbine/governor block). </li>
    <li>Create a new generation unit model including the electrical machine, the turbine/governor and an excitation system. Name the new model <span style=\"font-family: Courier New; color: #0000ff;\">Generator_TurbGov_AVR</span>. For this to be done make sure you duplicate the <span style=\"font-family: Courier New; color: #0000ff;\">Generator_TurbGov</span> model. </li>
  </ol>
  <p style=\"margin-left: 50px;\">
    <img style=\"width:444px\" src=\"modelica://OpenIPSL/Resources/images/example_4/image49.png\" alt=\"Image49\" />
  </p>
  <ol type=\"1\" id=\"f92f2e2c-0b81-4d67-a9f4-3c6999f7f864\" start=\"14\" style=\"line-height:175%;\">
    <li>Drag-and-drop an <span style=\"font-family: Courier New; color: #0000ff;\">ESST1A</span> excitation system block from <span style=\"font-family: Courier New; color: #0000ff;\">OpenIPSL.Electrical.Controls.PSSE.ES</span> to the diagram layer of the new model. Add 4 Constant blocks from <span style=\"font-family: Courier New; color: #0000ff;\">Modelica.Blocks.Sources</span> too. </li>
    <li>Increase the dimensions of the diagram layer as required to comfortably resize and connect your components. Check out what we did in step 3. A suggestion is shown below:</li>
  </ol>
  <p style=\"margin-left: 50px;\">
    <img src=\"modelica://OpenIPSL/Resources/images/example_4/image94.png\" alt=\"Image94\" />
  </p>
  <ol type=\"1\" id=\"fca4263d-c8e3-4137-99e3-f464b5e72990\" start=\"16\" style=\"line-height:175%;\">
    <li>In the <span style=\"font-family: Courier New; color: #0000ff;\">GENROE</span> machine component, remove the connection between <span style=\"font-family: Courier New; color: #0000ff;\">EFD</span> and <span style=\"font-family: Courier New; color: #0000ff;\">EFD0</span>. The <span style=\"font-family: Courier New; color: #0000ff;\">EFD</span> input of the machine should now be connected to the respective output from the excitation system. </li>
    <li>Add the following connections between the machine and the excitation system:</li>
  </ol>
  <table style=\"border-collapse:collapse;border-color:#aaa;border-spacing:0;margin-left: 110px;\">
    <thead>
      <tr>
        <th style=\"background-color:#0066cc;border-color:#aaa;border-style:solid;border-width:1px;overflow:hidden;padding:10px 5px;word-break:normal;color:#ffffff;text-align:center;font-size:12px;\">
          <strong>GENROE Machine</strong>
        </th>
        <th style=\"background-color:#0066cc;border-color:#aaa;border-style:solid;border-width:1px;overflow:hidden;padding:10px 5px;word-break:normal;color:#ffffff;text-align:center;font-size:12px;\">
          <strong>EEST1A</strong>
        </th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td style=\"border-color:#aaa;border-style:solid;border-width:1px;color:#000;overflow:hidden;padding:10px 5px;word-break:normal;background-color:#e6f2ff;text-align:center;font-size:12px;\">ETERM</td>
        <td style=\"border-color:#aaa;border-style:solid;border-width:1px;color:#000;overflow:hidden;padding:10px 5px;word-break:normal;background-color:#e6f2ff;text-align:center;font-size:12px;\">VT</td>
      </tr>
      <tr>
        <td style=\"border-color:#aaa;border-style:solid;border-width:1px;color:#000;overflow:hidden;padding:10px 5px;word-break:normal;text-align:center;font-size:12px;\">ETERM</td>
        <td style=\"border-color:#aaa;border-style:solid;border-width:1px;color:#000;overflow:hidden;padding:10px 5px;word-break:normal;text-align:center;font-size:12px;\">ECOMP</td>
      </tr>
      <tr>
        <td style=\"border-color:#aaa;border-style:solid;border-width:1px;color:#000;overflow:hidden;padding:10px 5px;word-break:normal;background-color:#e6f2ff;text-align:center;font-size:12px;\">EFD0</td>
        <td style=\"border-color:#aaa;border-style:solid;border-width:1px;color:#000;overflow:hidden;padding:10px 5px;word-break:normal;background-color:#e6f2ff;text-align:center;font-size:12px;\">EFD0</td>
      </tr>
      <tr>
        <td style=\"border-color:#aaa;border-style:solid;border-width:1px;color:#000;overflow:hidden;padding:10px 5px;word-break:normal;text-align:center;font-size:12px;\">XADIFD</td>
        <td style=\"border-color:#aaa;border-style:solid;border-width:1px;color:#000;overflow:hidden;padding:10px 5px;word-break:normal;text-align:center;font-size:12px;\">XADIFD</td>
      </tr>
    </tbody>
  </table>
  <ol type=\"1\" start=\"18\">
    <li>Use the Constant blocks to set the excitation system inputs to the values indicated in the following table:</li>
  </ol>
  <table style=\"border-collapse:collapse;border-color:#aaa;border-spacing:0;margin-left: 100px;\">
    <thead>
      <tr>
        <th style=\"background-color:#0066cc;border-color:#aaa;border-style:solid;border-width:1px;overflow:hidden;padding:10px 5px;word-break:normal;color:#ffffff;text-align:center;font-size:12px;\">
          <strong>Input</strong>
        </th>
        <th style=\"background-color:#0066cc;border-color:#aaa;border-style:solid;border-width:1px;overflow:hidden;padding:10px 5px;word-break:normal;color:#ffffff;text-align:center;font-size:12px;\">
          <strong>Value</strong>
        </th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td style=\"border-color:#aaa;border-style:solid;border-width:1px;color:#000;overflow:hidden;padding:10px 5px;word-break:normal;background-color:#e6f2ff;text-align:center;font-size:12px;\">VOTHSG</td>
        <td style=\"border-color:#aaa;border-style:solid;border-width:1px;color:#000;overflow:hidden;padding:10px 5px;word-break:normal;background-color:#e6f2ff;text-align:center;font-size:12px;\">0</td>
      </tr>
      <tr>
        <td style=\"border-color:#aaa;border-style:solid;border-width:1px;color:#000;overflow:hidden;padding:10px 5px;word-break:normal;text-align:center;font-size:12px;\">VOTHSG2</td>
        <td style=\"border-color:#aaa;border-style:solid;border-width:1px;color:#000;overflow:hidden;padding:10px 5px;word-break:normal;text-align:center;font-size:12px;\">0</td>
      </tr>
      <tr>
        <td style=\"border-color:#aaa;border-style:solid;border-width:1px;color:#000;overflow:hidden;padding:10px 5px;word-break:normal;background-color:#e6f2ff;text-align:center;font-size:12px;\">VUEL</td>
        <td style=\"border-color:#aaa;border-style:solid;border-width:1px;color:#000;overflow:hidden;padding:10px 5px;word-break:normal;background-color:#e6f2ff;text-align:center;font-size:12px;\">0</td>
      </tr>
      <tr>
        <td style=\"border-color:#aaa;border-style:solid;border-width:1px;color:#000;overflow:hidden;padding:10px 5px;word-break:normal;text-align:center;font-size:12px;\">VOEL</td>
        <td style=\"border-color:#aaa;border-style:solid;border-width:1px;color:#000;overflow:hidden;padding:10px 5px;word-break:normal;text-align:center;font-size:12px;\">Modelica.Constants.inf</td>
      </tr>
      <tr>
        <td style=\"border-color:#aaa;border-style:solid;border-width:1px;color:#000;overflow:hidden;padding:10px 5px;word-break:normal;background-color:#e6f2ff;text-align:center;font-size:12px;\">VUEL2</td>
        <td style=\"border-color:#aaa;border-style:solid;border-width:1px;color:#000;overflow:hidden;padding:10px 5px;word-break:normal;background-color:#e6f2ff;text-align:center;font-size:12px;\">-Modelica.Constants.inf</td>
      </tr>
      <tr>
        <td style=\"border-color:#aaa;border-style:solid;border-width:1px;color:#000;overflow:hidden;padding:10px 5px;word-break:normal;text-align:center;font-size:12px;\">VUEL3</td>
        <td style=\"border-color:#aaa;border-style:solid;border-width:1px;color:#000;overflow:hidden;padding:10px 5px;word-break:normal;text-align:center;font-size:12px;\">-Modelica.Constants.inf</td>
      </tr>
    </tbody>
  </table>
  <p style=\"margin-left: 40px;\">Your model should now look like this:</p>
  <p style=\"margin-left: 50px;\">
    <img style=\"width:698px\" src=\"modelica://OpenIPSL/Resources/images/example_4/image55.png\" alt=\"Image55\" />
  </p>
  <ol type=\"1\" id=\"887fb7b5-3c33-408c-912a-f81cac36e795\" start=\"19\">
    <li>Double-click the excitation system component and input the parameter values as indicated below:</li>
  </ol>
  <p style=\"margin-left: 50px;\">
    <img style=\"width:477px\" src=\"modelica://OpenIPSL/Resources/images/example_4/image57.png\" alt=\"Image57\" />
  </p>
  <ol type=\"1\" id=\"459f9a53-b544-4ad8-ab3e-f274b384ff20\" start=\"20\" style=\"line-height:175%;\">
    <li>Check the generation unit model to verify that everything is fine. Then go to the <span style=\"font-family: Courier New; color: #0000ff;\">SMIB</span> experiment model and change the class of the <em>genunit</em> component so that it now uses the model with the excitation system. </li>
    <li>In the diagram layer of the <span style=\"font-family: Courier New; color: #0000ff;\">SMIB</span> model when right-clicking the <em>genunit</em> component, you should now be able to see the new generation unit model among the options for class change. Update the component class so that it uses the most recent generation unit model. </li>
  </ol>
  <p style=\"margin-left: 50px;\">
    <img style=\"width:700px\" src=\"modelica://OpenIPSL/Resources/images/example_4/image16.png\" alt=\"Image16\" />
  </p>
  <ol type=\"1\" id=\"318c863a-b2c2-4494-b7e8-d74c77a870e2\" start=\"22\" style=\"line-height:175%;\">
    <li>Simulate the <span style=\"font-family: Courier New; color: #0000ff;\">SMIB</span> model for 10 seconds. </li>
    <li>Plot the active power (P) and the reactive power (Q) outputs from <em>genunit</em> in different diagrams. Then, plot the voltage (V) from all the buses in another window. </li>
    <li>Go to the <span style=\"font-family: Courier New; color: #0000ff;\">
        <span style=\"font-family: Courier New; color: #0000ff;\">GenerationUnit</span>s </span> package and create a new model by duplicating <span style=\"font-family: Courier New; color: #0000ff;\">Generator_TurbGov</span>_AVR. Name the new model <span style=\"font-family: Courier New; color: #0000ff;\">Generator_TurbGov_AVR_PSS</span>. This generation unit model is going to include a power system stabilizer (PSS). </li>
  </ol>
  <p style=\"margin-left: 50px;\">
    <img style=\"width:444px\" src=\"modelica://OpenIPSL/Resources/images/example_4/image8.png\" alt=\"Image8\" />
  </p>
  <ol type=\"1\" id=\"7a8e5915-e8fa-4fe1-992d-9febbd1637c7\" start=\"25\" style=\"line-height:175%;\">
    <li>Navigate the <span style=\"font-family: Courier New; color: #0000ff;\">OpenIPSL.Electrical.Controls.PSSE.PSS</span> package and locate the <span style=\"font-family: Courier New; color: #0000ff;\">PSS2A</span> model ( <em>Dual-Input Stabilizer Model [IEEE1992]</em>). Drag-and-drop an instance to the diagram layer of the new generation unit model. </li>
    <li>Remove the constant source block that is connected to the <span style=\"font-family: Courier New; color: #0000ff;\">VOTHSG</span> input of the excitation system component. Now this input should be connected to the output of the <span style=\"font-family: Courier New; color: #0000ff;\">PSS2A</span> block. </li>
    <li>Connect the <span style=\"font-family: Courier New; color: #0000ff;\">V_S1</span> and <span style=\"font-family: Courier New; color: #0000ff;\">V_S2</span> inputs of the <span style=\"font-family: Courier New; color: #0000ff;\">PSS2A</span> block to the <span style=\"font-family: Courier New; color: #0000ff;\">SPEED_HP</span> and <span style=\"font-family: Courier New; color: #0000ff;\">PELEC</span> outputs of the machine component, respectively. </li>
  </ol>
  <p style=\"margin-left: 50px;\">Make sure that your model looks like the figure below:</p>
  <p style=\"margin-left: 50px;\">
    <img style=\"width:700px\" src=\"modelica://OpenIPSL/Resources/images/example_4/image27.png\" alt=\"Image27\" />
  </p>
  <ol type=\"1\" id=\"e5165b62-8a8f-4bc6-8fb9-7ecf05fde3ee\" start=\"28\">
    <li>Double-click the <span style=\"font-family: Courier New; color: #0000ff;\">PSS2A</span> component in order to update the parameters as indicated below: </li>
  </ol>
  <p style=\"margin-left: 50px;\">
    <img style=\"width:566px\" src=\"modelica://OpenIPSL/Resources/images/example_4/image60.png\" alt=\"Image60\" />
  </p>
</html>"));
end DefiningGenerationGroups;
