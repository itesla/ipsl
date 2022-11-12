within OpenIPSL.Examples.Tutorial.Advanced;
model InstallingGridCal "Installing GridCal"
  extends Modelica.Icons.Information;
  annotation (DocumentationClass=true, Documentation(info="<html>
  <h5>Installing GridCal</h5>
  <p style=\"line-height: 2;\">At this point, we have a record structure to keep the power flow solutions linked to the SMIB power system elements. It is our next task to populate the records and for that to be done we need a python script that runs a library called <em>GridCal</em> which computes the power flow. To properly install <em>GridCal</em> please follow the steps listed below: </p>
  <ol type=\"1\" start=\"1\" style=\"line-height:175%;\">
    <li>Install <strong>Miniconda</strong>. Go to the <a href=\"https://docs.conda.io/en/latest/miniconda.html\">Miniconda website</a>, download the installer depending on the platform of your choice and install it. </li>
    <li>Create a new Miniconda <em>environment</em> that will handle the GridCal Installation.
      <ol type=\"a\" start=\"1\" style=\"line-height:175%;\">
        <li>Open a Command Prompt / Terminal window and browse to the path where you want to create the <em>environment</em>. </li>
        <li>Type the following command where <font color=\"blue\"><code>&lt;&lt;env_name&gt;&gt;</code></font> should be replaced by the actual name you want to give to the <em>environment</em>. </li>
      </ol>
      <blockquote><pre>
    <strong>conda create</strong> -n &lt;&lt;env_name&gt;&gt; python=3.7
      </pre></blockquote>
      <ol type=\"a\" start=\"3\">
        <li>Accept any python packages required to be installed by typing <strong>Y</strong> when prompted:
          <p>
            <img src=\"modelica://OpenIPSL/Resources/images/example_4/image36.png\" alt=\"Image36\" />
          </p>
        </li>
      </ol>
    </li>
    <li>Activate the environment. Type the command shown below and do not forget to replace the <font color=\"blue\"><code>&lt;&lt;env_name&gt;&gt;</code></font> expression by the actual name you gave to the environment in step 2.b. </li>
  </ol>
  <blockquote><pre>
    <strong>conda activate</strong> &lt;&lt;env_name&gt;&gt;
  </pre></blockquote>
  <hr>
  <p style=\"margin-left: 50px; line-height: 2;\">&#x1F4CC; Please notice that whenever you want to use your environment again and your environment session is no longer open, you first need to open a command prompt / terminal window, then locate the path where the environment is and finally type the <font color=\"blue\"><code>conda activate</code></font> command as indicated above. An environment session is typically finalized by typing the <font color=\"blue\"><code>conda deactivate</code></font> command. </p>
  <hr>
  <p style=\"margin-left: 50px;\">After successfully activating a miniconda environment you will see the name of the environment enclosed in parenthesis a shown below</p>
  <p>
    <img style=\"margin-left: 50px;\" src=\"modelica://OpenIPSL/Resources/images/example_4/image28.png\" alt=\"Image28\" />
  </p>
  <ol type=\"1\" start=\"4\">
    <li>Upgrade <code>pip</code> (optional). </li>
  </ol>
  <p style=\"margin-left: 40px;\">On Windows:</p>
  <blockquote><pre>
    <strong>python</strong> -m pip install -U pip
  </pre></blockquote>
  <p style=\"margin-left: 40px;\">On Linux/macOS:</p>
  <blockquote><pre>
    <strong>pip</strong> install -U pip
  </pre></blockquote>
  <p style=\"margin-left: 40px;\">You should get something similar to</p>
  <p>
    <img style=\"margin-left: 50px;\" src=\"modelica://OpenIPSL/Resources/images/example_4/image19.png\" alt=\"Image19\" />
  </p>
  <ol type=\"1\" start=\"5\">
    <li>Clean <code>pip</code> cache. </li>
  </ol>
  <blockquote><pre>
    <strong>python</strong> -m pip cache purge
  </pre></blockquote>
  <ol type=\"1\" start=\"6\">
    <li>Go to the <a href=\"https://github.com/SanPen/GridCal\">GridCal github page</a> and then click the <em>Releases</em> link. You can either clone the <em>release</em>, if you feel familiar with <em>git</em>, or download the <em>source code zip file</em>. We recommend installing the v4.0.0 release (hash <em>d1a065a</em>) because we already tested it. </li>
  </ol>
  <p style=\"margin-left: 50px;\">To clone the release use the following git commands:</p>
  <blockquote><pre>
    <strong>git clone</strong> https://github.com/SanPen/GridCal my_gridcal
    <strong>cd</strong> my_gridcal
    <strong>git reset</strong> --hard d1a065a
  </pre></blockquote>
  <p style=\"margin-left: 50px;\">In case you decided to download the zip file manually, unzip it to a convenient location.</p>
  <ol type=\"1\" start=\"7\">
    <li>Go back to the command prompt/terminal window and navigate to the path where you have your local GridCal repo clone or unzipped files. If you use the <code>dir</code> command you should be able to see the following list of files: </li>
  </ol>
  <p>
    <img style=\"margin-left: 50px;\" src=\"modelica://OpenIPSL/Resources/images/example_4/image56.png\" alt=\"Image56\" />
  </p>
  <ol type=\"1\" start=\"8\">
    <li>Navigate to the <font color=\"blue\"><code>src</code></font> folder by using the <code>cd</code> command: </li>
  </ol>
  <blockquote><pre>
    <strong>cd</strong> src
  </pre></blockquote>
  <ol type=\"1\" start=\"9\">
    <li>( <strong>Important</strong>) <em>Make sure your conda environment is activated</em>. Execute the following command: </li>
  </ol>
  <blockquote><pre>
    <strong>python</strong> -m pip install .
  </pre></blockquote>
  <hr>
  <p style=\"margin-left: 50px; line-height: 2;\">&#x1F4CC; There are a bunch of packages required to be installed and it can take a while to complete it. Please remember that GridCal has only been installed in the current environment. Therefore, whenever you use a script that requires this library the environment should be activated.</p>
  <hr>
  <ol type=\"1\" start=\"10\">
    <li>Test your installation running this python command:</li>
  </ol>
  <blockquote><pre>
    <strong>from</strong> GridCal.Engine <strong>import</strong> *
  </pre></blockquote>
  <p>
    <img style=\"margin-left: 70px;\" src=\"modelica://OpenIPSL/Resources/images/example_4/image11.png\" alt=\"Image11\" />
  </p>
  <p style=\"margin-left: 50px;\">As shown in the screenshot above you should not get any errors.</p>
  <ol type=\"1\" start=\"11\">
    <li>( <strong>Optional but recommended</strong>) Install <font color=\"blue\"><code>JupyterLab</code></font> by using <code>pip</code> inside of your environment: </li>
  </ol>
  <blockquote><pre>
    <strong>pip install</strong> jupyterlab
  </pre></blockquote>
  <p style=\"margin-left: 50px;\">You can deactivate your environment at any time when you no longer require GridCal by using the following command:</p>
  <blockquote><pre>
    <strong>conda deactivate</strong>
  </pre></blockquote>
</html>"));
end InstallingGridCal;
