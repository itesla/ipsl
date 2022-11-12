within OpenIPSL.Examples.Tutorial.Advanced;
model InstallingGridCal "Installing GridCal"
  extends Modelica.Icons.Information;
  annotation (DocumentationClass=true, Documentation(info="<html>
  <h5>Installing GridCal</h5>
  <p style=\"line-height: 2;\">At this point, we have a record structure to keep the power flow solutions linked to the SMIB power system elements. It is our next task to populate the records and for that to be done we need a python script that runs a library called <em>GridCal</em> which computes the power flow. To properly install <em>GridCal</em> please follow the steps listed below: </p>
  <ol type=\"1\" id=\"9e55a974-570d-4360-82ea-540c1fb71868\" start=\"1\" style=\"line-height:175%;\">
    <li>Install Miniconda. Go to the <a href=\"https://docs.conda.io/en/latest/miniconda.html\">Miniconda website</a>, download the installer depending on the platform of your choice and install it. </li>
    <li>Create a new Miniconda <em>environment</em> that will handle the GridCal Installation.
      <ol type=\"a\" id=\"3ba09d41-4173-42bc-9a0a-7836a60a836b\" start=\"1\" style=\"line-height:175%;\">
        <li>Open a Command Prompt / Terminal window and browse to the path where you want to create the <em>environment</em>. </li>
        <li>Type the following command where <span style=\"font-family: Courier New; color: #0000ff;\">&lt;&lt;env_name&gt;&gt;</span> should be replaced by the actual name you want to give to the <em>environment</em>. </li>
      </ol>
      <p>
        <img style=\"width:389px;margin-left:20px;\" src=\"modelica://OpenIPSL/Resources/images/example_4/image74.png\" alt=\"Image74\" />
      </p>
      <ol type=\"a\" id=\"69d2b56f-2125-4c08-ab32-56e054afc6d9\" start=\"3\">
        <li>Accept any python packages required to be installed by typing <strong>Y</strong> when prompted:
          <p>
            <img style=\"width:626px\" src=\"modelica://OpenIPSL/Resources/images/example_4/image36.png\" alt=\"Image36\" />
          </p>
        </li>
      </ol>
    </li>
    <li>Activate the environment. Type the command shown below and do not forget to replace the <span style=\"font-family: Courier New; color: #0000ff;\">&lt;&lt;env_name&gt;&gt;</span> expression by the actual name you gave to the environment in step 2.b. </li>
  </ol>
  <p>
    <img style=\"width:270px;margin-left:30px;\" src=\"modelica://OpenIPSL/Resources/images/example_4/image75.png\" alt=\"Image75\" />
  </p>
  <hr>
  <p style=\"margin-left: 50px; line-height: 2;\">&#x1F4CC; Please notice that whenever you want to use your environment again and your environment session is no longer open, you first need to open a command prompt / terminal window, then locate the path where the environment is and finally type the <span style=\"font-family: Courier New; color: #0000ff;\">conda activate</span> command as indicated above. An environment session is typically finalized by typing the <span style=\"font-family: Courier New; color: #0000ff;\">conda deactivate</span> command. </p>
  <hr>
  <p style=\"margin-left: 50px;\">After successfully activating a miniconda environment you will see the name of the environment enclosed in parenthesis a shown below</p>
  <p>
    <img style=\"width:300px;margin-left: 50px;\" src=\"modelica://OpenIPSL/Resources/images/example_4/image28.png\" alt=\"Image28\" />
  </p>
  <ol type=\"1\" id=\"92aa7be5-b938-4a15-8aea-6e17c79d2cbb\" start=\"4\">
    <li>Upgrade <code>pip</code> (optional). </li>
  </ol>
  <p style=\"margin-left: 40px;\">On Windows:</p>
  <p>
    <img style=\"width:267px;margin-left: 50px;\" src=\"modelica://OpenIPSL/Resources/images/example_4/image76.png\" alt=\"Image76\" />
  </p>
  <p style=\"margin-left: 40px;\">On Linux/macOS:</p>
  <p>
    <img style=\"width:203px;margin-left: 50px;\" src=\"modelica://OpenIPSL/Resources/images/example_4/image77.png\" alt=\"Image77\" />
  </p>
  <p style=\"margin-left: 40px;\">You should get something similar to</p>
  <p>
    <img style=\"width:531px;margin-left: 50px;\" src=\"modelica://OpenIPSL/Resources/images/example_4/image19.png\" alt=\"Image19\" />
  </p>
  <ol type=\"1\" id=\"552f0e6c-ffc8-4317-abe3-a0061df158cf\" start=\"5\">
    <li>Clean <span style=\"font-family: Courier New; color: #0000ff;\">pip</span> cache. </li>
  </ol>
  <p>
    <img style=\"width:232px;margin-left: 50px;\" src=\"modelica://OpenIPSL/Resources/images/example_4/image78.png\" alt=\"Image78\" />
  </p>
  <p>
    <img style=\"width:502px;margin-left: 70px;\" src=\"modelica://OpenIPSL/Resources/images/example_4/image4.png\" alt=\"Image4\" />
  </p>
  <ol type=\"1\" id=\"502168b9-b299-419b-bf9d-959c1da5f3d7\" start=\"6\">
    <li>Go to the <a href=\"https://github.com/SanPen/GridCal\">GridCal github page</a> and then click the <em>Releases</em> link. You can either clone the <em>release</em>, if you feel familiar with <em>git</em>, or download the <em>source code zip file</em>. We recommend installing the v4.0.0 release (hash d1a065a) because we already tested it. </li>
  </ol>
  <p style=\"margin-left: 50px;\">To clone the release use the following git commands:</p>
  <p>
    <img style=\"width:503px;margin-left: 50px;\" src=\"modelica://OpenIPSL/Resources/images/example_4/image79.png\" alt=\"Image79\" />
  </p>
  <p style=\"margin-left: 50px;\">In case you decided to download the zip file manually, unzip it to a convenient location.</p>
  <ol type=\"1\" id=\"4ce85ebd-c9b8-4f7f-a69c-23c21081efe1\" start=\"7\">
    <li>Go back to the command prompt/terminal window and navigate to the path where you have your local GridCal repo clone or unzipped files. If you use the <span style=\"font-family: Courier New; color: #0000ff;\">dir</span> command you should be able to see the following list of files: </li>
  </ol>
  <p>
    <img style=\"width:502px;margin-left: 50px;\" src=\"modelica://OpenIPSL/Resources/images/example_4/image56.png\" alt=\"Image56\" />
  </p>
  <ol type=\"1\" id=\"0a650d9b-fb20-4c45-806e-1fd9c9626f34\" start=\"8\">
    <li>Navigate to the <span style=\"font-family: Courier New; color: #0000ff;\">src</span> folder by using the <span style=\"font-family: Courier New; color: #0000ff;\">cd</span> command: </li>
  </ol>
  <p>
    <img style=\"width:121px;margin-left: 50px;\" src=\"modelica://OpenIPSL/Resources/images/example_4/image80.png\" alt=\"Image80\" />
  </p>
  <ol type=\"1\" id=\"27a6afd9-9b27-49ed-aa2c-e3a7bf34319d\" start=\"9\">
    <li>( <strong>Important</strong>) <em>Make sure your conda environment is activated</em>. Execute the following command: </li>
  </ol>
  <p>
    <img style=\"width:225px;margin-left: 50px;\" src=\"modelica://OpenIPSL/Resources/images/example_4/image81.png\" alt=\"Image81\" />
  </p>
  <hr>
  <p style=\"margin-left: 50px; line-height: 2;\">&#x1F4CC; There are a bunch of packages required to be installed and it can take a while to complete it. Please remember that GridCal has only been installed in the current environment. Therefore, whenever you use a script that requires this library the environment should be activated.</p>
  <hr>
  <ol type=\"1\" id=\"47024fb8-7e66-443f-b588-e889c26f76e2\" start=\"10\">
    <li>Test your installation running this python command:</li>
  </ol>
  <p>
    <img style=\"width:267px;margin-left: 50px;\" src=\"modelica://OpenIPSL/Resources/images/example_4/image82.png\" alt=\"Image82\" />
  </p>
  <p>
    <img style=\"width:700px;margin-left: 50px;\" src=\"modelica://OpenIPSL/Resources/images/example_4/image11.png\" alt=\"Image11\" />
  </p>
  <p style=\"margin-left: 50px;\">As shown in the screenshot above you should not get any errors.</p>
  <ol type=\"1\" id=\"91ad9ad2-4403-4c33-9c4b-b2bb9e9b4784\" start=\"11\">
    <li>( <strong>Optional but recommended</strong>) Install <span style=\"font-family: Courier New; color: #0000ff;\">JupyterLab</span> by using <code>pip</code> inside of your environment: </li>
  </ol>
  <p>
    <img style=\"width:211px;margin-left: 50px;\" src=\"modelica://OpenIPSL/Resources/images/example_4/image83.png\" alt=\"Image83\" />
  </p>
  <p style=\"margin-left: 50px;\">You can deactivate your environment at any time when you no longer require GridCal by using the following command:</p>
  <p>
    <img style=\"width:160px;margin-left: 50px;\" src=\"modelica://OpenIPSL/Resources/images/example_4/image84.png\" alt=\"Image84\" />
  </p>
</html>"));
end InstallingGridCal;
