var tilt_calc = func() {

	if ((getprop("/sim/replay/time") == 0) or (getprop("/sim/replay/time") == nil)) {

		var rod_length = 37.547; # In Inches

		# LEFT MAIN GEAR
	
		var front_z_pos = getprop("fdm/jsbsim/gear/unit[1]/z-position");
	
		var coeff = (222.61 + front_z_pos) / rod_length;
	
		setprop("gear/tilt/left-tilt-deg", math.asin(coeff) * 57.29);
	
		# RIGHT MAIN GEAR
	
		front_z_pos = getprop("fdm/jsbsim/gear/unit[2]/z-position");
	
		coeff = (222.61 + front_z_pos) / rod_length;
	
		setprop("gear/tilt/right-tilt-deg", math.asin(coeff) * 57.29);
	
	}

};


