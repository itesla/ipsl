within OpenIPSL.Examples.Tutorial.Advanced;
model DefiningGenerationGroups
  "Adding Generation Unit Models in More Detail"
  extends Modelica.Icons.Information;
  annotation (DocumentationClass=true, Documentation(info="<html>
  <h5>Adding Generation Unit Models in More Detail</h5>
  <p>Let us now proceed to create alternative representations of a generation unit so that we can use them in our experiments.</p>
  <ol style=\"line-height:175%;\">
    <li>Expand your <font color=\"blue\"><code>GenerationUnits</code></font> package and duplicate the <font color=\"blue\"><code>Generator_Only</code></font> model to create a new model called <font color=\"blue\"><code>Generator_TurbGov</code></font> that also has a turbine/governor block.
    <p style=\"margin-left:10px;\">
      <img src=\"modelica://OpenIPSL/Resources/images/example_4/image1.png\" alt=\"Image1\" />
    </p>
    </li>
    <li>Go to the diagram layer of the model and drag-and-drop a <font color=\"blue\"><code>IEEEG1</code></font> turbine/governor block from <font color=\"blue\"><code>OpenIPSL.Electrical.Controls.PSSE.TG</code></font>. </li>
    <li>It is highly recommended that you increase the dimensions of the canvas so that the components could be better distributed. One way of achieving this is by right-clicking the diagram layer and choosing the <strong>Attributes</strong> option. In the <strong>Graphics</strong> tab modify the coordinates as indicated below:
    <p style=\"margin-left:10px;\">
      <img src=\"modelica://OpenIPSL/Resources/images/example_4/image41.png\" alt=\"Image41\" />
    </p>
    </li>
    <li>Remove the connection between the <font color=\"blue\"><code>PMECH0</code></font> output and the <font color=\"blue\"><code>PMECH</code></font> input of the machine. Be aware that we now have a turbine block, therefore connect its HP-stage mechanical power output to the corresponding input of the machine. Your model should look like this:
    <p style=\"margin-left:10px;\">
      <img src=\"modelica://OpenIPSL/Resources/images/example_4/image54.png\" alt=\"Image54\" />
    </p>
    </li>
    <li>Provide the following values for the <font color=\"blue\"><code>IEEEG1</code></font> parameters:
    <p style=\"margin-left:10px;\">
      <img src=\"modelica://OpenIPSL/Resources/images/example_4/image38.png\" alt=\"Image38\" />
    </p>
    </li>
    <li>Check the model and make sure that everything is fine.</li>
    <li>Open the diagram layer of your <font color=\"blue\"><code>SMIB</code></font> experiment model and double-click the <em>genunit</em> component. </li>
    <li>Go to the <strong>Attributes</strong> tab and click the replaceable option. Then click the <strong>Constraining Clause</strong> checkbox and select <font color=\"blue\"><code>OpenIPSL.Interfaces.Generator</code></font> from the drop-down list.
    <p style=\"margin-left:10px;\">
      <img src=\"modelica://OpenIPSL/Resources/images/example_4/image92.png\" alt=\"Image92\" />
    </p>
    <hr>
    <p>&#x1F4CC; The <font color=\"blue\"><code>GenerationUnit</code></font> icon should now turn into </p>
    <p style=\"margin-left: 50px;\">
      <img src=\"modelica://OpenIPSL/Resources/images/example_4/image24.png\" alt=\"Image24\" />
    </p>
    <hr>
    </li>
    <li>In <strong>Simulation Setup</strong> go to the <strong>Output</strong> tab and make sure that you are keeping at least 10 results:
    <p style=\"margin-left:10px;\">
      <img src=\"modelica://OpenIPSL/Resources/images/example_4/image93.png\" alt=\"Image93\" />
    </p>
    </li>
    <li>Go back to the diagram layer for the <font color=\"blue\"><code>SMIB</code></font> model and right-click the <em>genunit</em> block to change the class to the \" <em>Machine with Turbine and Governor</em>\" option. 
    <p style=\"margin-left:10px;\">
      <img src=\"modelica://OpenIPSL/Resources/images/example_4/image34.png\" alt=\"Image34\" />
    </p>
    </li>
    <li>Simulate the model again for 2 seconds.</li>
    <li>Plot the active power output (P) from <em>genunit</em> and compare it to the result you got from the previous simulation (where the generation unit model did not include the turbine/governor block). </li>
    <li>Create a new generation unit model including the electrical machine, the turbine/governor and an excitation system. Name the new model <font color=\"blue\"><code>Generator_TurbGov_AVR</code></font>. For this to be done make sure you duplicate the <font color=\"blue\"><code>Generator_TurbGov</code></font> model.
    <p style=\"margin-left:10px;\">
      <img src=\"modelica://OpenIPSL/Resources/images/example_4/image49.png\" alt=\"Image49\" />
    </p>
    </li>
    <li>Drag-and-drop an <font color=\"blue\"><code>ESST1A</code></font> excitation system block from <font color=\"blue\"><code>OpenIPSL.Electrical.Controls.PSSE.ES</code></font> to the diagram layer of the new model. Add 4 <code>Constant</code> blocks from <font color=\"blue\"><code>Modelica.Blocks.Sources</code></font> too. </li>
    <li>Increase the dimensions of the diagram layer as required to comfortably resize and connect your components. Check out what we did in step 3. A suggestion is shown below:
    <p style=\"margin-left:10px;\">
      <img src=\"modelica://OpenIPSL/Resources/images/example_4/image94.png\" alt=\"Image94\" />
    </p>
    </li>
    <li>In the <font color=\"blue\"><code>GENROE</code></font> machine component, remove the connection between <font color=\"blue\"><code>EFD</code></font> and <font color=\"blue\"><code>EFD0</code></font>. The <font color=\"blue\"><code>EFD</code></font> input of the machine should now be connected to the respective output from the excitation system. </li>
    <li>Add the following connections between the machine and the excitation system:
  <table cellspacing=\"0\" cellpadding=\"1\" border=\"1\" style=\"margin-left: 70px;\">
    <thead>
      <tr>
        <th bgcolor=\"#b3e6ff\">GENROE Machine</th>
        <th bgcolor=\"#b3e6ff\">EEST1A</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td><p align=\"center\">ETERM</p></td>
        <td><p align=\"center\">VT</p></td>
      </tr>
      <tr>
        <td bgcolor=\"#e6e6e6\"><p align=\"center\">ETERM</p></td>
        <td bgcolor=\"#e6e6e6\"><p align=\"center\">ECOMP</p></td>
      </tr>
      <tr>
        <td><p align=\"center\">EFD0</p></td>
        <td><p align=\"center\">EFD0</p></td>
      </tr>
      <tr>
        <td bgcolor=\"#e6e6e6\"><p align=\"center\">XADIFD</p></td>
        <td bgcolor=\"#e6e6e6\"><p align=\"center\">XADIFD</p></td>
      </tr>
    </tbody>
  </table>
    </li>
    <li>Use the <code>Constant</code> blocks to set the excitation system inputs to the values indicated in the following table:
  <table cellspacing=\"0\" cellpadding=\"1\" border=\"1\" style=\"margin-left: 60px;\">
    <thead>
      <tr>
        <th bgcolor=\"#b3e6ff\">Input</th>
        <th bgcolor=\"#b3e6ff\">Value</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td><p align=\"center\">VOTHSG</p></td>
        <td><p align=\"center\">0</p></td>
      </tr>
      <tr>
        <td bgcolor=\"#e6e6e6\"><p align=\"center\">VOTHSG2</p></td>
        <td bgcolor=\"#e6e6e6\"><p align=\"center\">0</p></td>
      </tr>
      <tr>
        <td><p align=\"center\">VUEL</p></td>
        <td><p align=\"center\">0</p></td>
      </tr>
      <tr>
        <td bgcolor=\"#e6e6e6\"><p align=\"center\">VOEL</p></td>
        <td bgcolor=\"#e6e6e6\"><p align=\"center\">Modelica.Constants.inf</p></td>
      </tr>
      <tr>
        <td><p align=\"center\">VUEL2</p></td>
        <td><p align=\"center\">-Modelica.Constants.inf</p></td>
      </tr>
      <tr>
        <td bgcolor=\"#e6e6e6\"><p align=\"center\">VUEL3</p></td>
        <td bgcolor=\"#e6e6e6\"><p align=\"center\">-Modelica.Constants.inf</p></td>
      </tr>
    </tbody>
  </table>
    <p>Your model should now look like this:</p>
    <p style=\"margin-left:10px;\">
      <img src=\"modelica://OpenIPSL/Resources/images/example_4/image55.png\" alt=\"Image55\" />
    </p>
    </li>
    <li>Double-click the excitation system component and input the parameter values as indicated below:
    <p style=\"margin-left:10px;\">
      <img src=\"modelica://OpenIPSL/Resources/images/example_4/image57.png\" alt=\"Image57\" />
    </p>
    </li>
    <li>Check the generation unit model to verify that everything is fine. Then go to the <font color=\"blue\"><code>SMIB</code></font> experiment model and change the class of the <em>genunit</em> component so that it now uses the model with the excitation system. </li>
    <li>In the diagram layer of the <font color=\"blue\"><code>SMIB</code></font> model when right-clicking the <em>genunit</em> component, you should now be able to see the new generation unit model among the options for class change. Update the component class so that it uses the most recent generation unit model.
    <p style=\"margin-left:10px;\">
      <img src=\"modelica://OpenIPSL/Resources/images/example_4/image16.png\" alt=\"Image16\" />
    </p>
    </li>
    <li>Simulate the <font color=\"blue\"><code>SMIB</code></font> model for 10 seconds. </li>
    <li>Plot the active power (P) and the reactive power (Q) outputs from <em>genunit</em> in different diagrams. Then, plot the voltage (V) from all the buses in another window. </li>
    <li>Go to the <font color=\"blue\"><code>
        <font color=\"blue\"><code>GenerationUnit</code></font>s </code></font> package and create a new model by duplicating <font color=\"blue\"><code>Generator_TurbGov</code></font>_AVR. Name the new model <font color=\"blue\"><code>Generator_TurbGov_AVR_PSS</code></font>. This generation unit model is going to include a power system stabilizer (PSS).
    <p style=\"margin-left:10px;\">
      <img src=\"modelica://OpenIPSL/Resources/images/example_4/image8.png\" alt=\"Image8\" />
    </p>
    </li>
    <li>Navigate the <font color=\"blue\"><code>OpenIPSL.Electrical.Controls.PSSE.PSS</code></font> package and locate the <font color=\"blue\"><code>PSS2A</code></font> model (<em>Dual-Input Stabilizer Model [IEEE1992]</em>). Drag-and-drop an instance to the diagram layer of the new generation unit model. </li>
    <li>Remove the constant source block that is connected to the <font color=\"blue\"><code>VOTHSG</code></font> input of the excitation system component. Now this input should be connected to the output of the <font color=\"blue\"><code>PSS2A</code></font> block. </li>
    <li>Connect the <font color=\"blue\"><code>V_S1</code></font> and <font color=\"blue\"><code>V_S2</code></font> inputs of the <font color=\"blue\"><code>PSS2A</code></font> block to the <font color=\"blue\"><code>SPEED_HP</code></font> and <font color=\"blue\"><code>PELEC</code></font> outputs of the machine component, respectively.
    <p style=\"margin-left:10px;\">Make sure that your model looks like the figure below:</p>
    <p style=\"margin-left:10px;\">
      <img src=\"modelica://OpenIPSL/Resources/images/example_4/image27.png\" alt=\"Image27\" />
    </p>
    </li>
    <li>Double-click the <font color=\"blue\"><code>PSS2A</code></font> component in order to update the parameters as indicated below:
    <p style=\"margin-left:10px;\">
      <img src=\"modelica://OpenIPSL/Resources/images/example_4/image60.png\" alt=\"Image60\" />
    </p>
	</li>
  </ol>
</html>"));
end DefiningGenerationGroups;
