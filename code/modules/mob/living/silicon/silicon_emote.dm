/datum/emote/living/silicon
	// Humans are allowed for the sake of IPCs
	mob_type_allowed_typecache = list(/mob/living/silicon, /mob/living/simple_animal/bot, /mob/living/carbon/human)
	mob_type_blacklist_typecache = list()

/datum/emote/living/silicon/can_run_emote(mob/user, status_check, intentional)
	. = ..()
	// Let IPCs (and people with robo-heads) make beep-boop noises
	if(!.)
		return FALSE

	if(ishuman(user))
		var/mob/living/carbon/human/H = user
		var/obj/item/organ/external/head/head = H.get_organ(BODY_ZONE_HEAD)
		if(head && !head.is_robotic())
			return FALSE

/datum/emote/living/silicon/scream
	key = "scream"
	key_third_person = "screams"
	message = "кричит!"
	message_param = "кричит на %t!"
	emote_type = EMOTE_SOUND | EMOTE_AUDIBLE
	vary = TRUE
	sound = "sound/goonstation/voice/robot_scream.ogg"
	volume = 80

/datum/emote/living/silicon/ping
	key = "ping"
	key_third_person = "pings"
	message = "издает звук."
	message_param = "издает звук на %t."
	emote_type = EMOTE_SOUND | EMOTE_AUDIBLE
	sound = "sound/machines/ping.ogg"

/datum/emote/living/silicon/buzz
	key = "buzz"
	key_third_person = "buzzes"
	message = "жужжит."
	message_param = "жужжит на %t."
	emote_type = EMOTE_SOUND | EMOTE_AUDIBLE
	sound = "sound/machines/buzz-sigh.ogg"

/datum/emote/living/silicon/buzz2
	key = "buzz2"
	message = "издает раздраженный жужжащий звук."
	message_param = "издает раздраженный жужжащий звук на %t."
	emote_type = EMOTE_SOUND | EMOTE_AUDIBLE
	sound = "sound/machines/buzz-two.ogg"

/datum/emote/living/silicon/beep
	key = "beep"
	key_third_person = "beeps"
	message = "издает сигнал."
	message_param = "издает сигнал на %t."
	emote_type = EMOTE_SOUND | EMOTE_AUDIBLE
	sound = "sound/machines/twobeep.ogg"

/datum/emote/living/silicon/yes
	key = "yes"
	message = "издает утвердительный сигнал."
	message_param = "издает утвердительный сигнал на %t."
	emote_type = EMOTE_SOUND | EMOTE_AUDIBLE
	sound = "sound/machines/synth_yes.ogg"

/datum/emote/living/silicon/no
	key = "no"
	message = "издает отрицательный сигнал."
	message_param = "издает отрицательный сигнал на %t."
	emote_type = EMOTE_SOUND | EMOTE_AUDIBLE
	sound = "sound/machines/synth_no.ogg"

/datum/emote/living/silicon/law
	key = "law"
	message = "показывает свой штрих-код."
	message_param = "показывает %t свой штрих-код."
	emote_type = EMOTE_SOUND | EMOTE_AUDIBLE
	sound = "sound/voice/biamthelaw.ogg"

/datum/emote/living/silicon/law/can_run_emote(mob/user, status_check, intentional)
	. = ..()
	var/mob/living/silicon/robot/bot = user
	if(!istype(bot) || !istype(bot.module, /obj/item/robot_module/security))
		return FALSE

/datum/emote/living/silicon/halt
	key = "halt"
	message = "визжит \"HALT! SECURITY!\" из своих динамиков."
	message_param = "приказывает %t остановиться."
	emote_type = EMOTE_SOUND
	sound = "sound/voice/halt.ogg"

/datum/emote/living/silicon/halt/can_run_emote(mob/user, status_check, intentional)
	. = ..()
	var/mob/living/silicon/robot/bot = user
	if(!istype(bot) || !istype(bot.module, /obj/item/robot_module/security))
		return FALSE
