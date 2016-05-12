# Apply Copyright in all .mo files of the library

import sys
import os
from OMPython import OMCSession

# Start OMC session and load MSL

omc = OMCSession()
omc.sendExpression("loadModel(Modelica)")

# Load OpenIPSL and get all models
omc.sendExpression('loadFile("C:\dev\OSS\OpenIPSL_Repo\OpenIPSL\package.mo")')
list_models = omc.sendExpression('getClassNames(OpenIPSL,recursive=true)')

newCopyrightFile  = open('copyrightStatement')
newCopyright = newCopyrightFile.read()

# Loop on all models:
for model in list_models:
    #Get the current annotation
    anno = omc.sendExpression("getDocumentationAnnotation(%s)" % (model))
    omc.sendExpression("setDocumentationAnnotation(%s,%s,%s,%s)" % (model,anno[0],newCopyright,anno[2]))

omc.sendExpression("save(OpenIPSL)")

