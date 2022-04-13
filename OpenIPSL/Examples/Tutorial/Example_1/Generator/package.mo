within OpenIPSL.Examples.Tutorial.Example_1;
package Generator "Set of steps illustrating how to assemble a generation unit using OpenIPSL."
 extends Modelica.Icons.Package;

annotation (Documentation(info="<html>
<p>The task of modeling the generation unit is basically divided into three steps:</p> 
<ul>
<li><strong>Step 1</strong>: instantiating machine model and inputting parameters.</li>
<li><strong>Step 2</strong>: declaring Automatic Voltage Regulator (AVR) model with a disabled stabilizer.</li>
<li><strong>Step 3</strong>: connections between models are performed.</li>
</ul>
<p> More information about each step is displayed in the graphics/diagram layer of the model.</p>
</html>"));
end Generator;
