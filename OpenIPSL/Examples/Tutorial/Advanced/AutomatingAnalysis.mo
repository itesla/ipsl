within OpenIPSL.Examples.Tutorial.Advanced;
model AutomatingAnalysis
  "Automating Analysis with Modelica Functions"
  extends Modelica.Icons.Information;
  annotation (DocumentationClass=true, Documentation(info="<html>
  <h5>Automating Analysis with Modelica functions</h5>
  <ol type=\"1\" start=\"1\" style=\"line-height:175%;\">
    <li>Open the diagram layer of the <font color=\"blue\"><code>SMIB_Partial</code></font> model. Remember that this model is located in the following path: <font color=\"blue\"><code>SMIB.BaseModels.BaseNetwork</code></font>. </li>
    <li>Double-click the load component and go to the Attributes tab. In the <em>Properties</em> group select the <em>Replaceable</em> option. Then click the Constraining clause checkbox and browse for class by pressing the button <img src=\"modelica://OpenIPSL/Resources/images/example_4/image10.png\" alt=\"Image10\" />. From the package tree select <font color=\"blue\"><code>OpenIPSL.Electrical.Loads.PSSE.BaseClasses.baseLoad</code></font> as shown in the figure below. </li>
  </ol>
  <p style=\"margin-left: 50px;\">
    <img src=\"modelica://OpenIPSL/Resources/images/example_4/image40.png\" alt=\"Image40\" />
  </p>
  <ol type=\"1\" start=\"3\">
    <li>In the package browser, go to the <font color=\"blue\"><code>Experiments</code></font> package, create a new model by duplicating <font color=\"blue\"><code>SMIB</code></font> and name it <font color=\"blue\"><code>SMIB_VarLoad</code></font>. </li>
  </ol>
  <p style=\"margin-left: 50px;\">
    <img src=\"modelica://OpenIPSL/Resources/images/example_4/image47.png\" alt=\"Image47\" />
  </p>
  <ol type=\"1\" start=\"4\">
    <li>Now right-click the load component of the <font color=\"blue\"><code>SMIB_VarLoad</code></font> model and change the class to <em><font color=\"blue\"><code>PSS/E Load with variation</code></font></em> as indicated in the following picture: </li>
  </ol>
  <p style=\"margin-left: 50px;\">
    <img src=\"modelica://OpenIPSL/Resources/images/example_4/image52.png\" alt=\"Image52\" />
  </p>
  <ol type=\"1\" start=\"5\" style=\"line-height:175%;\">
    <li>Double-click the load component to update its power flow parameters. You can either use the button to insert a component reference or type directly each value according to the following settings:
      <ul style=\"line-height:175%;\">
        <li>P_0: <em>pf.powerflow.loads.PL1</em></li>
        <li>Q_0: <em>pf.powerflow.loads.QL1</em></li>
        <li>v_0: <em>pf.powerflow.bus.V3</em></li>
        <li>angle_0: <em>pf.powerflow.bus.A3</em></li>
      </ul>
    </li>
  </ol>
  <ol type=\"1\" start=\"6\">
    <li>Specify a load drop of 0.1 pu starting at t = 10 sec and for a duration of 60 sec.</li>
  </ol>
  <p style=\"margin-left: 50px;\">
    <img src=\"modelica://OpenIPSL/Resources/images/example_4/image37.png\" alt=\"Image37\" />
  </p>
  <ol type=\"1\" start=\"7\">
    <li>This time we want to see the effect of a perturbation on the load. Therefore, double-click the fault component and change its time parameters so that the fault event occurs after the new simulation stop time (100 sec).</li>
  </ol>
  <p style=\"margin-left: 50px;\">
    <img src=\"modelica://OpenIPSL/Resources/images/example_4/image35.png\" alt=\"Image35\" />
  </p>
  <ol type=\"1\" start=\"8\">
    <li>Change the class of the genunit component of the <font color=\"blue\"><code>SMIB_VarLoad</code></font> model to the <font color=\"blue\"><code>Generator_TurbGov_AVR_PSS</code></font> model. You will find it as &quot;<em>Machine with Turbine, Governor, Excitation System and PSS</em>&quot;. </li>
  </ol>
  <p style=\"margin-left: 50px;\">
    <img src=\"modelica://OpenIPSL/Resources/images/example_4/image14.png\" alt=\"Image14\" />
  </p>
  <ol type=\"1\" start=\"9\">
    <li>Go to the Simulation view and close all the results by right-clicking any of the results from the Variable Browser and then selecting the <em>Close All Results</em> option. </li>
  </ol>
  <p style=\"margin-left: 50px;\">
    <img src=\"modelica://OpenIPSL/Resources/images/example_4/image46.png\" alt=\"Image46\" />
  </p>
  <p>We would like to automatically simulate the <font color=\"blue\"><code>SMIB</code></font> and <font color=\"blue\"><code>SMIB_VarLoad</code></font> models and plot their results for comparative purposes. For this to be done we are going to create and call a Modelica function that includes the right sequence of steps. </p>
  <ol type=\"1\" start=\"10\" style=\"line-height:175%;\">
    <li>Create a new Modelica function inside of the <font color=\"blue\"><code>Experiments</code></font> package. For this to be done you can go to <em>File &gt; New &gt; Function</em> after selecting the package, or alternatively, you can right-click the package and then click on <em>New &gt; Function</em>. Name the function <em>
        <font color=\"blue\"><code>RunAndCompare</code></font>
      </em>. The <font color=\"blue\"><code>Experiments</code></font> package should now look like this: </li>
  </ol>
  <p style=\"margin-left: 50px;\">
    <img src=\"modelica://OpenIPSL/Resources/images/example_4/image29.png\" alt=\"Image29\" />
  </p>
  <ol type=\"1\" start=\"11\">
    <li>Go to the Modelica text of the <font color=\"blue\"><code>RunAndCompare</code></font> function and create 6 input variables as indicated below: </li>
  </ol>
  <blockquote><pre>
    <strong>function</strong> RunAndCompare
      \"Runs different instances of the SMIB model to compare their results\"

      // INPUTS TO THE FUNCTION
      <strong>input</strong> <em>Modelica.Units.SI.Time</em> tsim=100 \"Simulation time\";
      <strong>input</strong> <em>Integer</em> numberOfIntervalsin=10000 \"No. of intervals\";
      <strong>input</strong> <em>String</em> methodin = \"Dassl\" \"Solver\";
      <strong>input</strong> <em>Real</em> fixedstepsizein= 1e-3 \"Time step - needed only for fixed time step solvers\";

      // MODELS TO SIMULATE
      <strong>input</strong> <em>String</em> modelA=\"SMIB.Experiments.SMIB\";
      <strong>input</strong> <em>String</em> modelB=\"SMIB.Experiments.SMIB_VarLoad\";
      ...
  </pre></blockquote>
  <ol type=\"1\" start=\"12\">
    <li>Add the following code inside of the algorithm section of the function to define the simulation and plotting instructions:</li>
  </ol>
  <blockquote><pre>
    <strong>algorithm </strong>
      simulateModel(
        modelA,
        stopTime=tsim,
        numberOfIntervals=numberOfIntervalsin,
        method = methodin,
        fixedstepsize=fixedstepsizein,
        resultFile=\"res_casea\");
      simulateModel(
        modelB,
        stopTime=tsim,
        numberOfIntervals=numberOfIntervalsin,
        method = methodin,
        fixedstepsize=fixedstepsizein,
        resultFile=\"res_caseb\");

      <em>removePlots</em>(true);
      Advanced.FilesToKeep :=10;
      <em>createPlot</em>(id=1, position={15, 15, 678, 703}, y={\"B01.V\"},
        range={0.0, 10.0, 0.4, 1.4}, grid=true, filename=\"res_casea.mat\",
        colors={{28,108,200}}, displayUnits={\"1\"});
      <em>createPlot</em>(id=1, position={15, 15, 678, 703}, y={\"genunit.P\"},
        range={0.0, 10.0, -1.5, 2.0}, grid=true, subPlot=102,
        colors={{28,108,200}}, displayUnits={\"1\"});
      <em>createPlot</em>(id=1, position={15, 15, 678, 703}, y={\"genunit.Q\"},
        range={0.0, 10.0, -0.5, 2.0}, grid=true, subPlot=103,
        colors={{28,108,200}}, displayUnits={\"1\"});
      <em>createPlot</em>(id=1, position={15, 15, 678, 703}, y={\"B01.V\"},
        range={0.0, 10.0, 0.4, 1.4}, erase=false, grid=true,
        filename=\"res_caseb.mat\", colors={{238,46,47}}, displayUnits={\"1\"},
        axes={2});
      <em>createPlot</em>(id=1, position={15, 15, 678, 703}, y={\"genunit.P\"},
        range={0.0, 10.0, -1.5, 2.0}, erase=false, grid=true, subPlot=102,
        colors={{238,46,47}}, displayUnits={\"1\"},
        axes={2});
      <em>createPlot</em>(id=1, position={15, 15, 678, 703}, y={\"genunit.Q\"},
        range={0.0, 10.0, -0.5, 2.0}, erase=false, grid=true, subPlot=103,
        colors={{238,46,47}}, displayUnits={\"1\"},
        axes={2});

    <strong>end</strong> RunAndCompare;
  </pre></blockquote>
  <ol type=\"1\" start=\"13\">
    <li>Right-click the <font color=\"blue\"><code>RunAndCompare</code></font> function, select the <em>Call Function...</em> option and then press OK. If everything goes well you will get the plots shown below. </li>
  </ol>
  <p style=\"margin-left: 50px;\">
    <img src=\"modelica://OpenIPSL/Resources/images/example_4/image45.png\" alt=\"Image45\" />
  </p>
</html>"));
end AutomatingAnalysis;
