within OpenIPSL.Examples.Tutorial.Advanced.Utilities;
function saveTotalSMIBModel "Save the SMIB package as a total model"
  output Boolean ok "True if succesful";
algorithm
  ok := saveTotalModel("SMIBTotal.mo", "SMIB", true);
end saveTotalSMIBModel;
