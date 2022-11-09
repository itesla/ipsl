within OpenIPSL.Examples.Tutorial.Advanced;
model SMIBSystemAssembly "Assembling a SMIB System"
  extends Modelica.Icons.Information;
  annotation (DocumentationClass=true, Documentation(info="<html>
  <h5>Assembling a SMIB System</h5>
  <ol style=\"line-height:175%;\">
    <li>Open Dymola.</li>
    <li>Load the OpenIPSL library.</li>
    <li>Create a new package called <span style=\"font-family: Courier New; color: #0000ff;\">SMIB</span>. Make sure to unselect the option to save the contents of the package in one file. </li>
  </ol>
  <p style=\"margin-left:50px; margin-right:50px;\">
    <img src=\"modelica://OpenIPSL/Resources/images/example_4/image33.png\" alt=\"Image33\" />
  </p>
  <ol start=\"4\" style=\"line-height:175%;\">
    <li>Inside <span style=\"font-family: Courier New; color: #0000ff;\">SMIB</span> create two sub-packages named <span style=\"font-family: Courier New; color: #0000ff;\">Experiments</span> and <span style=\"font-family: Courier New; color: #0000ff;\">BaseModels</span>. Then add two sub-packages inside <span style=\"font-family: Courier New; color: #0000ff;\">BaseModels</span> called <span style=\"font-family: Courier New; color: #0000ff;\">GenerationUnits</span> and <span style=\"font-family: Courier New; color: #0000ff;\">BaseNetwork</span>. Once again, remember to keep the option to &#34; <em>save the contents of the package in one file</em>&#34; unselected. </li>
    <li>To follow the structure and appearance convention of packages in Modelica, we can add an icon to the <span style=\"font-family: Courier New; color: #0000ff;\">Experiments</span> package. Double-click the <span style=\"font-family: Courier New; color: #0000ff;\">Experiments</span> package and go to the text layer to add the following line of class extension: </li>
  </ol>
  <p>
    <img src=\"modelica://OpenIPSL/Resources/images/example_4//image64.png\" alt=\"Image64\" />
  </p>
  <ol start=\"6\" style=\"line-height:175%;\">
    <li>Inside <span style=\"font-family: Courier New; color: #0000ff;\">BaseNetwork</span>, create a new <em>partial</em> model called <span style=\"font-family: Courier New; color: #0000ff;\">SMIB_Partial</span>. </li>
    <li>Go to the Package Browser, navigate to <span style=\"font-family: Courier New; color: #0000ff;\">OpenIPSL.Interfaces.Generator</span>, and right-click the icon to create a new model by class extension. Name the new model <span style=\"font-family: Courier New; color: #0000ff;\">InfiniteBus</span> and place it inside <span style=\"font-family: Courier New; color: #0000ff;\">GenerationUnits</span>. </li>
  </ol>
  <p style=\"margin-left:50px; margin-right:50px;\">
    <img src=\"modelica://OpenIPSL/Resources/images/example_4//image3.png\" alt=\"Image3\" />
  </p>
  <ol start=\"8\">
    <li>Repeat the procedure to create a new model called <span style=\"font-family: Courier New; color: #0000ff;\">Generator_Only</span>. Your package should look as follows: </li>
  </ol>
  <p style=\"margin-left:50px; margin-right:50px;\">
    <img src=\"modelica://OpenIPSL/Resources/images/example_4//image26.png\" alt=\"Image26\" />
  </p>
  <ol start=\"9\" style=\"line-height:175%;\">
    <li>Inside <span style=\"font-family: Courier New; color: #0000ff;\">InfiniteBus</span>, drag and drop a <span style=\"font-family: Courier New; color: #0000ff;\">GENCLS</span> generator model from <span style=\"font-family: Courier New; color: #0000ff;\">OpenIPSL.Electrical.Machines.PSSE</span>. </li>
    <li>Connect the <strong><span style=\"color: #0000ff;\">blue pin</span></strong> of the <span style=\"font-family: Courier New; color: #0000ff;\">GENCLS</span> component to <span style=\"font-family: Courier New; color: #0000ff;\">pwPin</span>. </li>
    <li>Now drag and drop a <span style=\"font-family: Courier New; color: #0000ff;\">GENROE</span> generator model from <span style=\"font-family: Courier New; color: #0000ff;\">OpenIPSL.Electrical.Machines.PSSE</span> to <span style=\"font-family: Courier New; color: #0000ff;\">Generator_Only</span>. </li>
  </ol>
  <p style=\"margin-left:50px; margin-right:50px;\">
    <img src=\"modelica://OpenIPSL/Resources/images/example_4//image31.png\" alt=\"Image31\" />
  </p>
  <ol start=\"12\">
    <li>Connect the output pin <span style=\"font-family: Courier New; color: #0000ff;\">PMECH0</span> on the right to the input pin <span style=\"font-family: Courier New; color: #0000ff;\">PMECH</span> on the left of the <span style=\"font-family: Courier New; color: #0000ff;\">GENROE</span> block. Do the same for the <span style=\"font-family: Courier New; color: #0000ff;\">EFD0</span> output and input <span style=\"font-family: Courier New; color: #0000ff;\">EFD</span> on the bottom. Also, connect the blue pin to <span style=\"font-family: Courier New; color: #0000ff;\">pwPin</span>. Your connections should look as follows </li>
  </ol>
  <p style=\"margin-left:50px; margin-right:50px;\">
    <img src=\"modelica://OpenIPSL/Resources/images/example_4//image51.png\" alt=\"Image51\" />
  </p>
  <ol start=\"13\">
    <li>Double click the <span style=\"font-family: Courier New; color: #0000ff;\">GENCLS</span> block inside the <span style=\"font-family: Courier New; color: #0000ff;\">InfiniteBus</span> model. Be sure to enter all the machine parameters in the figure below: </li>
  </ol>
  <p style=\"margin-left:50px; margin-right:50px;\">
    <img src=\"modelica://OpenIPSL/Resources/images/example_4//image62.png\" alt=\"Image62\" />
  </p>
  <ol start=\"14\">
    <li>Switch to the Modelica Text of the <span style=\"font-family: Courier New; color: #0000ff;\">InfiniteBus</span> model. Propagate the power flow parameters one layer up as indicated in the highlighted text of the following code chunk: </li>
  </ol>
  <p>
    <img src=\"modelica://OpenIPSL/Resources/images/example_4//image63.png\" alt=\"Image63\" />
  </p>
  <ol start=\"15\">
    <li>Go to the diagram layer of the <span style=\"font-family: Courier New; color: #0000ff;\">Generator_Only</span> model, double click the <span style=\"font-family: Courier New; color: #0000ff;\">GENROE</span> component and fill in the power flow data fields. Notice that no explicit values should be passed to <span style=\"font-family: Courier New; color: #0000ff;\">v_0</span> ( <span style=\"font-family: Courier New; color: #0000ff;\">V_0</span> in OpenIPSL 1.5), <span style=\"font-family: Courier New; color: #0000ff;\">angle_0</span>, <span style=\"font-family: Courier New; color: #0000ff;\">P_0</span>, and <span style=\"font-family: Courier New; color: #0000ff;\">Q_0</span>. These values are propagated from an upper layer. </li>
  </ol>
  <p style=\"margin-left:50px; margin-right:50px;\">
    <img src=\"modelica://OpenIPSL/Resources/images/example_4//image2.png\" alt=\"Image2\" />
  </p>
  <ol start=\"16\">
    <li>Similarly, pass the dynamical machine parameters to the generator model</li>
  </ol>
  <p style=\"margin-left:50px; margin-right:50px;\">
    <img src=\"modelica://OpenIPSL/Resources/images/example_4//image7.png\" alt=\"Image7\" />
  </p>
  <ol start=\"17\" style=\"line-height:175%;\">
    <li>Go now to the diagram layer of the <span style=\"font-family: Courier New; color: #0000ff;\">SMIB_Partial</span> model. Drag and drop the following components: <ul style=\"line-height:175%;\">
        <li>four buses from <span style=\"font-family: Courier New; color: #0000ff;\">OpenIPSL.Buses.Bus</span> (you could also work with <span style=\"font-family: Courier New; color: #0000ff;\">OpenIPSL.Buses.BusExt</span>); </li>
        <li>four lines from <span style=\"font-family: Courier New; color: #0000ff;\">OpenIPSL.Branches.PwLine</span>; </li>
        <li>a <span style=\"font-family: Courier New; color: #0000ff;\">Load</span> from <span style=\"font-family: Courier New; color: #0000ff;\">OpenIPSL.Electrical.Loads.PSSE</span>; </li>
        <li>a <span style=\"font-family: Courier New; color: #0000ff;\">PwFault</span> from <span style=\"font-family: Courier New; color: #0000ff;\">OpenIPSL.Electrical.Events</span>; </li>
        <li>a <span style=\"font-family: Courier New; color: #0000ff;\">SystemBase</span> from <span style=\"font-family: Courier New; color: #0000ff;\">OpenIPSL.Electrical.SystemBase</span>. Set the base frequency to 50 Hz and the base to 100 MVA; </li>
        <li>an <span style=\"font-family: Courier New; color: #0000ff;\">InfiniteBus</span> generation unit. </li>
      </ul>
    </li>
  </ol>
  <ol start=\"18\">
    <li>Connect and name the different components as shown below:</li>
  </ol>
  <p style=\"margin-left:50px; margin-right:50px;\">
    <img src=\"modelica://OpenIPSL/Resources/images/example_4//image25.png\" alt=\"Image25\" />
  </p>
  <ol start=\"19\">
    <li>Enter the parameters for each of the four lines, as indicated in the corresponding table at the beginning of this document. For example, lines 1 and 2 should have the following parameters:</li>
  </ol>
  <p style=\"margin-left:50px; margin-right:50px;\">
    <img src=\"modelica://OpenIPSL/Resources/images/example_4//image65.png\" alt=\"Image65\" />
  </p>
  <ol start=\"20\" style=\"line-height:175%;\">
    <li>Click the <span style=\"font-family: Courier New; color: #0000ff;\">B01</span> component and select the option to display the power flow. Do the same for the remaining buses and the generation unit component. </li>
    <li>Double click the <span style=\"font-family: Courier New; color: #0000ff;\">pwFault</span> block and fill in the parameters as indicated below: </li>
  </ol>
  <p style=\"margin-left:50px; margin-right:50px;\">
    <img src=\"modelica://OpenIPSL/Resources/images/example_4//image66.png\" alt=\"Image66\" />
  </p>
  <ol start=\"22\">
    <li>Inside <span style=\"font-family: Courier New; color: #0000ff;\">Experiments</span> create a new model named SMIB by extending the <span style=\"font-family: Courier New; color: #0000ff;\">SMIB_Partial</span> model. Although not entirely required, add the following line to the Modelica text to include an icon to the model: </li>
  </ol>
  <p>
    <img src=\"modelica://OpenIPSL/Resources/images/example_4//image67.png\" alt=\"Image67\" />
  </p>
  <hr>
  <p style=\"margin-left:50px; margin-right:50px;\">&#x1F4CC; You should have a package structure similar to this:</p>
  <p style=\"margin-left:100px; margin-right:50px;\">
    <img src=\"modelica://OpenIPSL/Resources/images/example_4//image20.png\" alt=\"Image20\" />
  </p>
  <hr>
  <ol start=\"23\" style=\"line-height:175%;\">
    <li>Drag-and-drop a <span style=\"font-family: Courier New; color: #0000ff;\">Generator_Only</span> component from the <span style=\"font-family: Courier New; color: #0000ff;\">GenerationUnits</span> package to the diagram layer of the SMIB model. Name it genunit and make sure that the <em>Display power flow</em> option inside its parameters window is checked. </li>
    <li>Connect <span style=\"font-family: Courier New; color: #0000ff;\">genunit</span> to bus <span style=\"font-family: Courier New; color: #0000ff;\">B01</span>. The model should look as follows: </li>
  </ol>
  <p style=\"margin-left:50px; margin-right:50px;\">
    <img src=\"modelica://OpenIPSL/Resources/images/example_4//image68.png\" alt=\"Image68\" />
  </p>
  <ol start=\"25\" style=\"line-height:175%;\">
    <li>Save your models. You should see several .mo files accompanying the model inside a folder called <span style=\"font-family: Courier New; color: #0000ff;\">SMIB</span>. </li>
    <li>Close Dymola or unload your SMIB model.</li>
  </ol>
</html>"));
end SMIBSystemAssembly;
