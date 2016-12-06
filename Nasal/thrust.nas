# A340 Throttle Control System by Joshua Davidson (it0uchpods/411)
# Set A/THR modes to Custom IT-AUTOTHRUST, and other thrust modes like MCT, TOGA and eventually TO FLEX.
# V1.8
# Alpha Floor by legoboyvdlp

setlistener("/sim/signals/fdm-initialized", func {
	setprop("/systems/thrust/state1", "IDLE");
	setprop("/systems/thrust/state2", "IDLE");
	setprop("/systems/thrust/state3", "IDLE");
	setprop("/systems/thrust/state4", "IDLE");
	setprop("/systems/thrust/lvrclb", "0");
	setprop("/systems/thrust/clbreduc-ft", "1500");
	lvrclb();
	print("Thrust System ... Done!")
});

setlistener("/controls/engines/engine[0]/throttle", func {
	var thrr = getprop("/controls/engines/engine[0]/throttle");
	var alpha1 = getprop("/systems/thrust/state1");
	if (thrr < 0.05) {
		setprop("/systems/thrust/state1", "IDLE");
		atoff_request();
	} else if (thrr >= 0.05 and thrr < 0.60) {
		setprop("/systems/thrust/state1", "MAN");
	} else if (thrr >= 0.60 and thrr < 0.80) {
		setprop("/systems/thrust/state1", "CL");
	} else if (thrr >= 0.80 and thrr < 0.95) {
		setprop("/it-autoflight/input/athr", 1);
		setprop("/controls/engines/engine[0]/throttle-fdm", 0.94);
		setprop("/systems/thrust/state1", "MCT");
	} else if ((thrr >= 0.95) and (alpha1 !="AFLOOR")) {
		setprop("/it-autoflight/input/athr", 1);
		setprop("/controls/engines/engine[0]/throttle-fdm", 0.98);
		setprop("/systems/thrust/state1", "TOGA");
	}
});

setlistener("/controls/engines/engine[1]/throttle", func {
	var thrr = getprop("/controls/engines/engine[1]/throttle");
	var alpha2 = getprop("/systems/thrust/state2");
	if (thrr < 0.05) {
		setprop("/systems/thrust/state2", "IDLE");
		atoff_request();
	} else if (thrr >= 0.05 and thrr < 0.60) {
		setprop("/systems/thrust/state2", "MAN");
	} else if (thrr >= 0.60 and thrr < 0.80) {
		setprop("/systems/thrust/state2", "CL");
	} else if (thrr >= 0.80 and thrr < 0.95) {
		setprop("/it-autoflight/input/athr", 1);
		setprop("/controls/engines/engine[1]/throttle-fdm", 0.94);
		setprop("/systems/thrust/state2", "MCT");
	} else if ((thrr >= 0.95) and (alpha2 !="AFLOOR")) {
		setprop("/it-autoflight/input/athr", 1);
		setprop("/controls/engines/engine[1]/throttle-fdm", 0.98);
		setprop("/systems/thrust/state2", "TOGA");
	}
});

setlistener("/controls/engines/engine[2]/throttle", func {
	var thrr = getprop("/controls/engines/engine[2]/throttle");
	var alpha3 = getprop("/systems/thrust/state3");
	if (thrr < 0.05) {
		setprop("/systems/thrust/state3", "IDLE");
		atoff_request();
	} else if (thrr >= 0.05 and thrr < 0.60) {
		setprop("/systems/thrust/state3", "MAN");
	} else if (thrr >= 0.60 and thrr < 0.80) {
		setprop("/systems/thrust/state3", "CL");
	} else if (thrr >= 0.80 and thrr < 0.95) {
		setprop("/it-autoflight/input/athr", 1);
		setprop("/controls/engines/engine[2]/throttle-fdm", 0.94);
		setprop("/systems/thrust/state3", "MCT");
	} else if ((thrr >= 0.95) and (alpha3 !="AFLOOR")) {
		setprop("/it-autoflight/input/athr", 1);
		setprop("/controls/engines/engine[2]/throttle-fdm", 0.98);
		setprop("/systems/thrust/state3", "TOGA");
	}
});

setlistener("/controls/engines/engine[3]/throttle", func {
	var thrr = getprop("/controls/engines/engine[3]/throttle");
	var alpha4 = getprop("/systems/thrust/state4");
	if (thrr < 0.05) {
		setprop("/systems/thrust/state4", "IDLE");
		atoff_request();
	} else if (thrr >= 0.05 and thrr < 0.60) {
		setprop("/systems/thrust/state4", "MAN");
	} else if (thrr >= 0.60 and thrr < 0.80) {
		setprop("/systems/thrust/state4", "CL");
	} else if (thrr >= 0.80 and thrr < 0.95) {
		setprop("/it-autoflight/input/athr", 1);
		setprop("/controls/engines/engine[3]/throttle-fdm", 0.94);
		setprop("/systems/thrust/state4", "MCT");
	} else if ((thrr >= 0.95) and (alpha4 !="AFLOOR")) {
		setprop("/it-autoflight/input/athr", 1);
		setprop("/controls/engines/engine[3]/throttle-fdm", 0.98);
		setprop("/systems/thrust/state4", "TOGA");
	}
});

# Checks if all throttles are in the IDLE position, before tuning off the A/THR.
var atoff_request = func {
	var state1 = getprop("/systems/thrust/state1");
	var state2 = getprop("/systems/thrust/state2");
	var state3 = getprop("/systems/thrust/state3");
	var state4 = getprop("/systems/thrust/state4");
	if ((state1 == "IDLE") and (state2 == "IDLE") and (state3 == "IDLE") and (state4 == "IDLE")) {
		setprop("/it-autoflight/input/athr", 0);
		setprop("/systems/thrust/at1", 0);
		setprop("/systems/thrust/at2", 0);
		setprop("/systems/thrust/at3", 0);
		setprop("/systems/thrust/at4", 0);
	}
}

var lvrclb = func {
	var state1 = getprop("/systems/thrust/state1");
	var state2 = getprop("/systems/thrust/state2");
	var state3 = getprop("/systems/thrust/state3");
	var state4 = getprop("/systems/thrust/state4");
	if ((state1 == "CL") and (state2 == "CL") and (state3 == "CL") and (state4 == "CL")) {
		setprop("/systems/thrust/lvrclb", "0");
	} else {
		var status = getprop("/systems/thrust/lvrclb");
		if (status == 0) {
			if (getprop("/instrumentation/altimeter/indicated-altitude-ft") >= getprop("/systems/thrust/clbreduc-ft")) {
				setprop("/systems/thrust/lvrclb", "1");
			} else {
				setprop("/systems/thrust/lvrclb", "0");
			}
		} else if (status == 1) {
			setprop("/systems/thrust/lvrclb", "0");
		}
	}
    settimer(lvrclb, 0.5);
}

# ALPHA FLOOR
var alpha_floor = func {
	var state1 = getprop("/systems/thrust/state1");
	var state2 = getprop("/systems/thrust/state2");
	var state3 = getprop("/systems/thrust/state3");
	var state4 = getprop("/systems/thrust/state4");
	var spd = getprop("/velocities/airspeed-kt");
	var stallspd = getprop("/flight-management/fmgc-values/ind-stall-speed"); # does not work yet, use 128 for now
	if  ((state1 !="TOGA") and (state2 !="TOGA") and (state3 !="TOGA") and (state4 !="TOGA") and (spd < 128)) {
	  setprop("/controls/engines/engine[0]/throttle-lk",0.99);
      setprop("/controls/engines/engine[1]/throttle-lk",0.99);
      setprop("/controls/engines/engine[2]/throttle-lk",0.99);
      setprop("/controls/engines/engine[3]/throttle-lk",0.99);
	  setprop("/systems/thrust/state1","AFLOOR");
      setprop("/systems/thrust/state2","AFLOOR");
      setprop("/systems/thrust/state3","AFLOOR");
      setprop("/systems/thrust/state4","AFLOOR");
	} else {
	# Do nothing
	}
	settimer(alpha_floor, 0.5);
}

# TOGA LOCK
var toga_lk = func {
	var state1 = getprop("/systems/thrust/state1");
	var state2 = getprop("/systems/thrust/state2");
	var state3 = getprop("/systems/thrust/state3");
	var state4 = getprop("/systems/thrust/state4");
	var spd = getprop("/velocities/airspeed-kt");
	var stallspd = getprop("/flight-management/fmgc-values/ind-stall-speed"); # Does not work yet, use 128 for now
	if  ((state1 =="AFLOOR") and (state2 == "AFLOOR") and (state3 == "AFLOOR") and (state4 == "AFLOOR") and (spd > 128)) {
		setprop("/controls/engines/engine[0]/throttle-lk",0.99);
		setprop("/controls/engines/engine[1]/throttle-lk",0.99);
		setprop("/controls/engines/engine[2]/throttle-lk",0.99);
		setprop("/controls/engines/engine[3]/throttle-lk",0.99);
		setprop("/systems/thrust/state1","TOGALK");
		setprop("/systems/thrust/state2","TOGALK");
		setprop("/systems/thrust/state3","TOGALK");
		setprop("/systems/thrust/state4","TOGALK");
	} else {
	# Do nothing
	}
	settimer(toga_lk, 0.5);
}
