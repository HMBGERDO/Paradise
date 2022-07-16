/datum/event/loneops

/datum/event/loneops/start()
	var/list/mob/dead/observer/candidates = SSghost_spawns.poll_candidates("Do you want to play as Lone Operative?", ROLE_OPERATIVE, TRUE, source = /mob/living/simple_animal/hostile
/syndicate/melee/space)
	if(candidates.len >= 1)
		var/mind = pick(candidates)
		var/mob/living/carbon/human/H
		if(isobserver(mind.current))
			H = mind.current.change_mob_type(/mob/living/carbon/human, null, null, TRUE)
		else
			H = mind.current

		H.equipOutfit(dresscode)
		var/bomb = locate(/obj/machinery/nuclearbomb) in GLOB.poi_list
		var/datum/game_mode/nuclear/temp
		if(SSticker.mode.config_tag == "nuclear")
			temp = SSticker.mode
		else
			temp = new
		temp.forge_syndicate_objectives(mind)
		temp.create_syndicate(mind, bomb)
		temp.greet_syndicate(mind)
		H.equipOutfit(/datum/outfit/admin/syndicate/operative)
