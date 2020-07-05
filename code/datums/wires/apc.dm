/datum/wires/apc
	holder_type = /obj/machinery/power/apc
	wire_count = 4
	proper_name = "APC"
	window_x = 355
	window_y = 97

/datum/wires/apc/New(atom/_holder)
	wires = list(WIRE_IDSCAN, WIRE_MAIN_POWER1, WIRE_MAIN_POWER2, WIRE_AI_CONTROL)
	return ..()

/datum/wires/apc/get_status()
	. = ..()
	var/obj/machinery/power/apc/A = holder
	. += "The APC is [A.locked ? "" : "un"]locked."
	. += A.shorted ? "The APCs power has been shorted." : "The APC is working properly!"
	. += "The 'AI control allowed' light is [A.aidisabled ? "off" : "on"]."


/datum/wires/apc/interactable(mob/user)
	var/obj/machinery/power/apc/A = holder
	if(A.panel_open && !A.opened)
		return TRUE
	return FALSE

/datum/wires/apc/on_pulse(wire)

	var/obj/machinery/power/apc/A = holder

	switch(wire)
		if(WIRE_IDSCAN)
			A.locked = FALSE

			spawn(300)
				if(A)
					A.locked = TRUE
					A.updateDialog()

		if(WIRE_MAIN_POWER1, WIRE_MAIN_POWER2)
			if(!A.shorted)
				A.shorted = TRUE

				spawn(1200)
					if(A && !is_cut(WIRE_MAIN_POWER1) && !is_cut(WIRE_MAIN_POWER2))
						A.shorted = FALSE
						A.updateDialog()

		if(WIRE_AI_CONTROL)
			if(!A.aidisabled)
				A.aidisabled = TRUE

				spawn(10)
					if(A && !is_cut(WIRE_AI_CONTROL))
						A.aidisabled = FALSE
						A.updateDialog()

	..()

/datum/wires/apc/on_cut(wire, mend)
	var/obj/machinery/power/apc/A = holder

	switch(wire)
		if(WIRE_MAIN_POWER1, WIRE_MAIN_POWER2)
			if(!mend)
				A.shock(usr, 50)
				A.shorted = TRUE

			else if(!is_cut(WIRE_MAIN_POWER1) && !is_cut(WIRE_MAIN_POWER2))
				A.shorted = FALSE
				A.shock(usr, 50)

		if(WIRE_AI_CONTROL)
			if(!mend)
				if(!A.aidisabled)
					A.aidisabled = TRUE
			else
				if(A.aidisabled)
					A.aidisabled = FALSE
	..()
