within OpenIPSL.Examples;
package SevenBus "Seven-bus three-machine test network package"
    extends Modelica.Icons.ExamplesPackage;

annotation (Documentation(info="<html>
<p>This small 7-bus test system is implemented in Modelica for performing tests. Although the test range is limited, the network can be very useful for debugging, basic simulation and library training purposes. </p>
<p>The system was validated against historical data and the system is, originally, very stable. However, the present system is highly loaded, which makes it ideal for testing coherency of the generation units under certain disturbances, for example. </p>
</html>"));
end SevenBus;
