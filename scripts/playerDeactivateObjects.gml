///playerDeactivateObjects()
//Deactivates umimportant objects outside the current section

//deactivate everything to start
instance_deactivate_all(true);

instance_activate_region(global.sectionLeft - 8, global.sectionTop, abs(global.sectionRight - global.sectionLeft) + 8, abs(global.sectionBottom - global.sectionTop)-1, true);

//finally, activate important objects that shouldn't be deactivated
activateImportantObjects(); //Can be found under Views
