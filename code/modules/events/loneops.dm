/datum/event/loneops

/datum/event/loneops/start()
	INVOKE_ASYNC(src, .proc/make_ops)

/datum/event/loneops/proc/make_ops()
	var/list/mob/dead/observer/candidates = SSghost_spawns.poll_candidates("Do you want to play as Lone Operative?", ROLE_OPERATIVE, TRUE, source = /mob/living/simple_animal/hostile/syndicate/melee/space)
	if(candidates.len >= 1)
		var/ghost = pick(candidates)
		var/mob/living/carbon/human/H = makeBody(ghost)
		var/datum/mind/mind = H.mind
		var/bomb = locate(/obj/machinery/nuclearbomb) in GLOB.poi_list
		var/datum/game_mode/nuclear/temp
		if(SSticker.mode.config_tag == "nuclear")
			temp = SSticker.mode
		else
			temp = new

		var/list/spawn_locations = list()
		for(var/thing in GLOB.carplist)
			spawn_locations.Add(get_turf(thing))

		spawn_locations = shuffle(spawn_locations)
		H.loc = spawn_locations[1]
		mind.offstation_role = TRUE
		mind.assigned_role = SPECIAL_ROLE_NUKEOPS
		mind.special_role = SPECIAL_ROLE_NUKEOPS
		temp.forge_syndicate_objectives(mind)
		temp.create_syndicate(mind, bomb)
		temp.greet_syndicate(mind)
		temp.scale_telecrystals()
		H.equipOutfit(/datum/outfit/admin/syndicate/operative)
		var/player_tc = min(20, round(temp.total_tc / temp.agents_possible)) // Lone Operative would not get less then 20TC
		var/obj/item/radio/uplink/nuclear/current_uplink
		for(var/item in H.contents)
			if(istype(item, /obj/item/radio/uplink/nuclear))
				current_uplink = item
		current_uplink.hidden_uplink.uses = player_tc
		H.faction |= "syndicate"
		H.update_icons()
		H.real_name = "[syndicate_name()] Operative"
		temp.update_syndicate_id(mind, FALSE)
		temp.update_synd_icons_added(mind)

/datum/event/loneops/proc/get_candidate()
	var/list/mob/dead/observer/candidates = SSghost_spawns.poll_candidates("Do you want to play as Lone Operative?", ROLE_OPERATIVE, TRUE, source = /mob/living/simple_animal/hostile/syndicate/melee/space)
	if(candidates.len >= 1)
		var/mind = pick(candidates)
		return mind

/datum/event/loneops/proc/prepare_body(var/ghost)
	var/body = makeBody(ghost)
	return body
