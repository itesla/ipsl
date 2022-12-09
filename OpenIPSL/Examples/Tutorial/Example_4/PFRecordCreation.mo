within OpenIPSL.Examples.Tutorial.Example_4;
model PFRecordCreation
  "Creating and Integrating the Power Flow Structure"
  extends Modelica.Icons.Information;
  annotation (DocumentationClass=true, Documentation(info="<html>
  <h5>Creating and Integrating the Power Flow Structure</h5>
  <ol>
    <li>Create a directory called <font color=\"blue\"><code>models</code></font> above your model current folder. </li>
    <li>Add a sub-folder named <font color=\"blue\"><code>_old</code></font> if your model has been created with OpenIPSL 1.5.0. If, on the other hand, you have used the new version of the library, then name that sub-folder <font color=\"blue\"><code> _new</code></font>. </li>
    <li>Move your model folder to the directory created in <strong>step 2</strong>. For example, let&apos;s assume you are using the new version of OpenIPSL, then if your model is saved in a folder called <font color=\"blue\"><code>SMIB</code></font>, the new path of your folder should be <font color=\"blue\"><code>models/_new/SMIB</code></font>. </li>
    <li>Make sure the directory <font color=\"blue\"><code>pf2rec</code></font> downloaded from the <font color=\"blue\"><code>SMIB_Tutorial</code></font> repository is in the same directory. Here is a screenshot of how your folder structure should look like:
    <p>
      <img src=\"modelica://OpenIPSL/Resources/images/example_4/PFRecordCreation/FolderStructureForSMIBProject.png\" alt=\"FolderStructureForSMIBProject\" />
    </p>
    </li>
    <li>In the same location where you have your <font color=\"blue\"><code>models</code></font> and <font color=\"blue\"><code>pf2rec</code></font> folders, create a new python file called <font color=\"blue\"><code>create_records.py</code></font>. Copy and paste the following code in the file. <em>Be careful with indentation!</em>
    <blockquote><pre>
<strong>from</strong> pf2rec <strong>import</strong> *

<strong>import</strong> argparse
<strong>import</strong> os
<strong>import</strong> re

parser = argparse.ArgumentParser()

parser.add_argument(<em>\"--model\"</em>, help = <em>\"Name of the package containing the target OpenIPSL model. Defaults to 'SMIB'\"</em>)
parser.add_argument(<em>\"--version\"</em>, help = <em>\"OpenIPSL version for which the model has been created. Defaults to '1.5.0'\"</em>)

args = parser.parse_args()

<strong>if</strong> __name__ == <em>'__main__'</em>:

    <strong>if</strong> args.model:
        _model = args.model
    <strong>else</strong>:
        _model = <em>'SMIB'</em>

    <strong>if</strong> args.version:
        _version = args.version
        <strong>if</strong> _version <strong>not in</strong> [<em>'1.5.0'</em>, <em>'2.0.0'</em>]:
            raise ValueError(<em>\"OpenIPSL version could not be identified\"</em>)
    <strong>else</strong>:
        _version = <em>'1.5.0'</em>

    <strong>if</strong> _version == <em>'1.5.0'</em>:
        _model_lib = <em>'_old'</em>
    <strong>elif</strong> _version == <em>'2.0.0'</em>:
        _model_lib = <em>'_new'</em>

    <em># Absolute path to the '.mo' file of the model (total model)</em>
    data_path = os.path.abspath(os.path.join(os.getcwd(), <em>\"models\"</em>, _model_lib, _model))

    path_mo_file = os.path.abspath(os.path.join(data_path, <em>f\"</em>{_model}<em>Total.mo\"</em>))
        
    <em># Remove Modelica code lines from the '.mo' file that alter the expected input for</em>
    <em>#   pf2rec functions (the GenerationUnits package section of Modelica code should </em>
    <em>#   be excluded)</em>
    includeCodeLine = False <em># True if line of code should be included</em>
    new_lines = list()
    <strong>with</strong> open(path_mo_file, <em>\"r\"</em>) <strong>as</strong> mo_file:
        lines = mo_file.readlines()

        <strong>for</strong> l <strong>in</strong> lines:
            <strong>if</strong> re.search(<em>\"^package\\sSMIB\"</em>, l):
                includeCodeLine = True
            <strong>if</strong> re.search(<em>\"^\\s+package\\sGenerationUnits\"</em>, l):
                includeCodeLine = False
            <strong>if</strong> re.search(<em>\"^\\s+package\\sBaseNetwork\"</em>, l):
                includeCodeLine = True
            <strong>if</strong> includeCodeLine:
                new_lines.append(l);
        
    <strong>with</strong> open(path_mo_file, <em>\"w\"</em>) <strong>as</strong> mo_file:
        <strong>for</strong> l <strong>in</strong> new_lines:
            mo_file.write(<em>\"{}\"</em>.format(l))

    create_pf_records(_model,
                      path_mo_file,
                      data_path,
                      openipsl_version = _version)

    </pre></blockquote>
    </li>
    <li>Reload your model or run Dymola, depending on what you did at the end of the previous section. Create a package inside the root package <font color=\"blue\"><code>SMIB</code></font> and name it <font color=\"blue\"><code>Utilities</code></font>. </li>
    <li>Add a new function inside <font color=\"blue\"><code>Utilities</code></font> called <font color=\"blue\"><code>saveTotalSMIBModel</code></font>. Remember that the procedure for creating functions is the same as for other kinds of classes such as <font color=\"blue\"><code>Package</code></font>, <font color=\"blue\"><code>Model</code></font> or <font color=\"blue\"><code>Record</code></font>. </li>
    <li>Go to the Modelica text of the function and type the following code:
    <blockquote><pre>
<strong>function</strong> saveTotalSMIBModel \"Save the SMIB package as a total model\"
  <strong>output</strong> <em>Boolean</em> ok \"True if succesful\";
<strong>algorithm</strong>
  ok := <em>saveTotalModel</em>(\"SMIBTotal.mo\", \"SMIB\", <strong>true</strong>);
<strong>end</strong> saveTotalSMIBModel;
    </pre></blockquote>
    <hr>
    <p>&#x1F4CC; This function has no inputs and only one boolean output. The modelica standard function <em><font color=\"blue\"><code>saveTotalModel</code></font></em> is called inside the algorithm section with predefined arguments. You can check the information view of <em><font color=\"blue\"><code>saveTotalModel</code></font></em> to get to know the proper use of each of its parameters. To do that, make sure the <font color=\"blue\"><code>DymolaCommands</code></font> library is loaded within the Package Browser. Then navigate as shown in the picture below </p>
    <p>
      <img src=\"modelica://OpenIPSL/Resources/images/example_4/PFRecordCreation/SaveTotalModelFunction.png\" alt=\"SaveTotalModelFunction\" />
    </p>
    <hr>
    </li>
    <li>Right-click the <font color=\"blue\"><code>saveTotalSMIBModel</code></font> function from the Package Browser. Select the &quot; <em>Call Function...</em>&quot; option and then click the <font color=\"blue\"><code>OK</code></font> button. As a result, you should be able to see a new file called <em><font color=\"blue\"><code>SMIBTotal.mo</code></font></em> in the same folder where your model files are being stored. </li>
    <li>Go to the system terminal, change the current directory to the location where the <font color=\"blue\"><code>create_records</code></font> python script is placed and execute it as indicated below.
    <p>For OpenIPSL 1.5.0:</p>
    <blockquote><pre>
<strong>python</strong> create_records.py
    </pre></blockquote>
  <p>For OpenIPSL 2.0.0:</p>
    <blockquote><pre>
<strong>python</strong> create_records.py --version 2.0.0
    </pre></blockquote>
    </li>
    <li>Go back to Dymola and refresh ( <img src=\"modelica://OpenIPSL/Resources/images/example_4/PFRecordCreation/RefreshButton.png\" alt=\"RefreshButton\" />) the SMIB package.
    <hr>
    <p>
    &#x1F4CC; The python script <font color=\"blue\"><code>create_records</code></font> should have created a new package inside your model that looks like this
    </p>
    <p>
      <img src=\"modelica://OpenIPSL/Resources/images/example_4/PFRecordCreation/PFDataPackageStructure.png\" alt=\"PFDataPackageStructure\" />
    </p>
    <hr>
    </li>
    <li>Double-click the <font color=\"blue\"><code>SMIBPartial</code></font> model to open its diagram view. From the new <font color=\"blue\"><code>PFData</code></font> package, drag and drop <strong>one</strong>
      <font color=\"blue\"><code>PowerFlow</code></font> element on your canvas. <strong>For convenience, rename it as</strong>
      <font color=\"blue\"><code>pf</code></font>.
    <p>
      <img src=\"modelica://OpenIPSL/Resources/images/example_4/PFRecordCreation/PowerFlowRecordInstantiation.png\" alt=\"PowerFlowRecordInstantiation\" />
    </p>
    </li>
    <li>Link the power flow variables to the different components as indicated below. <em>Yes, unfortunately you must type them!</em>
    <p>
      <img src=\"modelica://OpenIPSL/Resources/images/example_4/PFRecordCreation/ComponentReferenceToPFRecord.png\" alt=\"ComponentReferenceToPFRecord\" />
    </p>
  <table cellspacing=\"0\" cellpadding=\"1\" border=\"1\">
    <thead>
      <tr>
        <th bgcolor=\"#b3e6ff\">Component</th>
        <th bgcolor=\"#b3e6ff\">V_0</th>
        <th bgcolor=\"#b3e6ff\">A_0</th>
        <th bgcolor=\"#b3e6ff\">P_0</th>
        <th bgcolor=\"#b3e6ff\">Q_0</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>B01 (bus)</td>
        <td>pf.powerflow.bus.V1</td>
        <td>pf.powerflow.bus.A1</td>
        <td>N/A</td>
        <td>N/A</td>
      </tr>
      <tr>
        <td bgcolor=\"#e6e6e6\">B02 (bus)</td>
        <td bgcolor=\"#e6e6e6\">pf.powerflow.bus.V2</td>
        <td bgcolor=\"#e6e6e6\">pf.powerflow.bus.A2</td>
        <td bgcolor=\"#e6e6e6\">N/A</td>
        <td bgcolor=\"#e6e6e6\">N/A</td>
      </tr>
      <tr>
        <td>B03 (bus)</td>
        <td>pf.powerflow.bus.V3</td>
        <td>pf.powerflow.bus.A3</td>
        <td>N/A</td>
        <td>N/A</td>
      </tr>
      <tr>
        <td bgcolor=\"#e6e6e6\">B04 (bus)</td>
        <td bgcolor=\"#e6e6e6\">pf.powerflow.bus.V4</td>
        <td bgcolor=\"#e6e6e6\">pf.powerflow.bus.A4</td>
        <td bgcolor=\"#e6e6e6\">N/A</td>
        <td bgcolor=\"#e6e6e6\">N/A</td>
      </tr>
      <tr>
        <td>load (load)</td>
        <td>pf.powerflow.bus.V4</td>
        <td>pf.powerflow.bus.A4</td>
        <td>pf.powerflow.loads.PL1</td>
        <td>pf.powerflow.loads.QL1</td>
      </tr>
      <tr>
        <td bgcolor=\"#e6e6e6\">InfiniteBus (gen)</td>
        <td bgcolor=\"#e6e6e6\">pf.powerflow.bus.V2</td>
        <td bgcolor=\"#e6e6e6\">pf.powerflow.bus.A2</td>
        <td bgcolor=\"#e6e6e6\">pf.powerflow.machines.PG2</td>
        <td bgcolor=\"#e6e6e6\">pf.powerflow.machines.QG2</td>
      </tr>
    </tbody>
  </table>
    <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;If you check your model now, you should see an error because we have not defined the power flow values. We have just pointed to the container which will have it. Next, we generate the power flow results using <font color=\"blue\"><code>GridCal</code></font>.</p>
    </li>
    <li>Now open the diagram layer of your SMIB model inside the <font color=\"blue\"><code>Experiments</code></font> package. Link the power flow variables to <font color=\"blue\"><code>genunit</code></font> as specified in the following table:
  <table cellspacing=\"0\" cellpadding=\"0\" border=\"1\">
    <thead>
      <tr>
        <th bgcolor=\"#b3e6ff\">Component</th>
        <th bgcolor=\"#b3e6ff\">V_0</th>
        <th bgcolor=\"#b3e6ff\">A_0</th>
        <th bgcolor=\"#b3e6ff\">P_0</th>
        <th bgcolor=\"#b3e6ff\">Q_0</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>genunit (gen)</td>
        <td>pf.powerflow.bus.V1</td>
        <td>pf.powerflow.bus.A1</td>
        <td>pf.powerflow.machines.PG1</td>
        <td>pf.powerflow.machines.QG1</td>
      </tr>
    </tbody>
  </table>
    </li>
  </ol>
</html>"));
end PFRecordCreation;
