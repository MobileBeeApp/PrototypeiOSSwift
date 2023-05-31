MacOS Version 10.15.7 and Xcode 12.4 was used / is needed (or above). The iPhone SE (2nd generation) was taken as the basis because I also physically own it. 

Due to the Pods do not start the project with Prototype.xcodeproj but with Prototype.xcworkspace

Code with camera functions has been disabled because otherwise it won't work via the simulator. Affected code has CAM as comment in the places. Affected classes for this are ViewController.swift and FloatingPanelviewController.swift (//comment out for CAM for simulator),
and also APIManager.swift (//FUTURE weather commented out).
