#var EFB = gui.Dialog.new("/sim/gui/dialogs/EFB/dialog",
#        "Aircraft/411Workshop/Systems/EFB-dlg.xml");
var Radio = gui.Dialog.new("/sim/gui/dialogs/radios/dialog",
        "Aircraft/411Workshop/Systems/tranceivers.xml");
var ap_settings = gui.Dialog.new("/sim/gui/dialogs/autopilot/dialog",
        "Aircraft/411Workshop/Systems/autopilot-dlg.xml");
var tiller_steering = gui.Dialog.new("/sim/gui/dialogs/tiller_steering/dialog",
		"Aircraft/411Workshop/Systems/tiller_steering.xml");
var yokechart = gui.Dialog.new("/sim/gui/dialogs/yokechart/dialog",
		"Aircraft/411Workshop/Dialogs/yokechart-dialog.xml");

gui.menuBind("radio", "dialogs.Radio.open()");
gui.menuBind("autopilot-settings", "dialogs.ap_settings.open()");
