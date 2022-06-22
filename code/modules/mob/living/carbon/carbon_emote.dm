/datum/emote/living/carbon
	mob_type_allowed_typecache = list(/mob/living/carbon)
	mob_type_blacklist_typecache = list(/mob/living/carbon/brain)

/datum/emote/living/carbon/blink
	key = "blink"
	key_third_person = "blinks"
	message = "моргает."

/datum/emote/living/carbon/blink_r
	key = "blink_r"
	message = "мыстро моргает."

/datum/emote/living/carbon/clap
	key = "clap"
	key_third_person = "claps"
	message = "хлопает."
	message_mime = "бесшумно хлопает."
	message_param = "хлопает %t."
	emote_type = EMOTE_SOUND
	vary = TRUE

/datum/emote/living/carbon/clap/run_emote(mob/user, params, type_override, intentional)
	var/mob/living/carbon/human/H = user
	if(!H.bodyparts_by_name[BODY_ZONE_L_ARM] || !H.bodyparts_by_name[BODY_ZONE_R_ARM])
		if(!H.bodyparts_by_name[BODY_ZONE_L_ARM] && !H.bodyparts_by_name[BODY_ZONE_R_ARM])
			// no arms...
			to_chat(user, "<span class='warning'>You need arms to be able to clap.</span>")
		else
			// well, we've got at least one
			user.visible_message("[user] makes the sound of one hand clapping.")
		return TRUE

	return ..()

/datum/emote/living/carbon/clap/get_sound(mob/living/user)
	if(ishuman(user))
		var/mob/living/carbon/human/H = user
		if(!H?.mind.miming)
			return pick(
				'sound/misc/clap1.ogg',
				'sound/misc/clap2.ogg',
				'sound/misc/clap3.ogg',
				'sound/misc/clap4.ogg')

/datum/emote/living/carbon/cross
	key = "cross"
	key_third_person = "crosses"
	message = "скрещивает руки."
	hands_use_check = TRUE

/datum/emote/living/carbon/chuckle
	key = "chuckle"
	key_third_person = "chuckles"
	message = "усмехается."
	message_mime = "кажется, усмехается."
	emote_type = EMOTE_AUDIBLE | EMOTE_MOUTH
	muzzled_noises = list("joyful", "upbeat")

/datum/emote/living/carbon/cough
	key = "cough"
	key_third_person = "coughs"
	message = "кашляет!"
	message_mime = "кажется, кашляет!"
	emote_type = EMOTE_SOUND | EMOTE_MOUTH
	vary = TRUE
	age_based = TRUE
	volume = 120
	unintentional_stat_allowed = UNCONSCIOUS

/datum/emote/living/carbon/cough/get_sound(mob/living/user)
	. = ..()
	if(ishuman(user))
		var/mob/living/carbon/human/H = user
		if(H.gender == FEMALE)
			if(H.dna.species.female_cough_sounds)
				return pick(H.dna.species.female_cough_sounds)
		else
			if(H.dna.species.male_cough_sounds)
				return pick(H.dna.species.male_cough_sounds)

/datum/emote/living/carbon/moan
	key = "moan"
	key_third_person = "moans"
	message = "стонет!"
	message_mime = "кажется, стонет!"
	muzzled_noises = list("pained")
	emote_type = EMOTE_AUDIBLE | EMOTE_MOUTH
	unintentional_stat_allowed = UNCONSCIOUS

/datum/emote/living/carbon/giggle
	key = "giggle"
	key_third_person = "giggles"
	message = "хихикает."
	message_mime = "бесшумно хихикает!"
	muzzled_noises = list("bubbly")
	emote_type = EMOTE_AUDIBLE | EMOTE_MOUTH

/datum/emote/living/carbon/gurgle
	key = "gurgle"
	key_third_person = "gurgles"
	message = "издает неприятное бульканье."
	muzzled_noises = list("unpleasant", "guttural")
	emote_type = EMOTE_AUDIBLE | EMOTE_MOUTH
	unintentional_stat_allowed = UNCONSCIOUS

/datum/emote/living/carbon/inhale
	key = "inhale"
	key_third_person = "inhales"
	message = "делает вдох."
	emote_type = EMOTE_AUDIBLE | EMOTE_MOUTH
	muzzled_noises = list("breathy")

/datum/emote/living/carbon/inhale/sharp
	key = "inhale_s"
	key_third_person = "inhales sharply!"
	message = "делает глубокий вдох!"

/datum/emote/living/carbon/kiss
	key = "kiss"
	key_third_person = "kisses"
	message = "делает воздушный поцелуй."
	message_param = "посылает воздушный поцелуй %t!"
	muzzled_noises = list("smooching")

/datum/emote/living/carbon/wave
	key = "wave"
	key_third_person = "waves"
	message = "машет рукой."
	message_param = "машет рукой %t."
	hands_use_check = TRUE

/datum/emote/living/carbon/yawn
	key = "yawn"
	key_third_person = "yawns"
	message = "зевает."
	emote_type = EMOTE_AUDIBLE | EMOTE_MOUTH
	muzzled_noises = list("tired", "lazy", "sleepy")

/datum/emote/living/carbon/exhale
	key = "exhale"
	key_third_person = "exhales"
	message = "выдыхает."
	emote_type = EMOTE_AUDIBLE | EMOTE_MOUTH

/datum/emote/living/carbon/laugh
	key = "laugh"
	key_third_person = "laughs"
	message = "хохочет."
	message_mime = "бесшумно хохочет!"
	message_param = "хохочет над %t."
	muzzled_noises = list("happy", "joyful")
	emote_type = EMOTE_AUDIBLE | EMOTE_MOUTH

/datum/emote/living/carbon/scowl
	key = "scowl"
	key_third_person = "scowls"
	message = "хмурится."

/datum/emote/living/groan
	key = "groan"
	key_third_person = "groans"
	message = "стонет!"
	message_mime = "кажется, стонет!"
	message_param = "стонет на %t."
	muzzled_noises = list("pained")
	emote_type = EMOTE_AUDIBLE | EMOTE_MOUTH
	unintentional_stat_allowed = UNCONSCIOUS

/datum/emote/living/carbon/sign
	key = "sign"
	key_third_person = "signs"
	message = "показывает."
	message_param = "показывает %t."
	param_desc = "number(0-10)"
	// Humans get their own proc since they have fingers
	mob_type_blacklist_typecache = list(/mob/living/carbon/human)
	hands_use_check = TRUE
	target_behavior = EMOTE_TARGET_BHVR_NUM

/datum/emote/living/carbon/faint
	key = "faint"
	key_third_person = "faints"
	message = "падает в обморок."

/datum/emote/living/carbon/faint/run_emote(mob/user, params, type_override, intentional)
	. = ..()
	if(. && isliving(user))
		var/mob/living/L = user
		L.SetSleeping(2 SECONDS)
