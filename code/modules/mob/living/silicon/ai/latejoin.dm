GLOBAL_LIST_EMPTY(empty_playable_ai_cores)

/mob/living/silicon/ai/verb/wipe_core()
	set name = "Удалить Ядро"
	set category = "OOC"
	set desc = "Удалите свое ядро. Это аналог криокапсулы, освобождает слот вашей профессии."

	// Guard against misclicks, this isn't the sort of thing we want happening accidentally
	if(alert("ПРЕДУПРЕЖДЕНИЕ: Вы сразу удалите ядро и станете призраком, ваш персонаж будет удалён из раунда. Вы уверены, что хотите это сделать?",
					"Удалить Ядро", "Нет", "Нет", "Да") != "Да")
		return
	cryo_AI()

/mob/living/silicon/ai/proc/cryo_AI()
	GLOB.empty_playable_ai_cores += new /obj/structure/AIcore/deactivated(loc)
	GLOB.global_announcer.autosay("[src] был перемещён в научное хранилище.", "Система Наблюдения за Искусственным Интеллектом")

	//Handle job slot/tater cleanup.
	var/job = mind.assigned_role

	SSjobs.FreeRole(job)

	if(mind.objectives.len)
		mind.objectives.Cut()
		mind.special_role = null
	else
		if(SSticker.mode.name == "AutoTraitor")
			var/datum/game_mode/traitor/autotraitor/current_mode = SSticker.mode
			current_mode.possible_traitors.Remove(src)

	// Ghost the current player and disallow them to return to the body
	ghostize()
	// Delete the old AI shell
	qdel(src)

/mob/living/silicon/ai/proc/moveToAILandmark()
	var/obj/loc_landmark
	for(var/obj/effect/landmark/start/ai/A in GLOB.landmarks_list)
		if(locate(/mob/living) in get_turf(A))
			continue
		loc_landmark = A
	if(!loc_landmark)
		for(var/obj/effect/landmark/tripai in GLOB.landmarks_list)
			if(tripai.name == "tripai")
				if(locate(/mob/living) in get_turf(tripai))
					continue
				loc_landmark = tripai
	if(!loc_landmark)
		to_chat(src, "Oh god sorry we can't find an unoccupied AI spawn location, so we're spawning you on top of someone.") //lol what is this message
		for(var/obj/effect/landmark/start/ai/A in GLOB.landmarks_list)
			loc_landmark = A

	forceMove(get_turf(loc_landmark))
	view_core()

// Before calling this, make sure an empty core exists, or this will no-op
/mob/living/silicon/ai/proc/moveToEmptyCore()
	if(!GLOB.empty_playable_ai_cores.len)
		CRASH("moveToEmptyCore called without any available cores")

	// IsJobAvailable for AI checks that there is an empty core available in this list
	var/obj/structure/AIcore/deactivated/C = GLOB.empty_playable_ai_cores[1]
	GLOB.empty_playable_ai_cores -= C

	forceMove(C.loc)
	view_core()

	qdel(C)
