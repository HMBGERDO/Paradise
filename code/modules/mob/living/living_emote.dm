/datum/emote/living
	mob_type_allowed_typecache = /mob/living
	mob_type_blacklist_typecache = list(
		/mob/living/carbon/brain,	// nice try
		/mob/living/silicon,
		/mob/living/simple_animal/bot
	)
	message_postfix = "at %t."

/datum/emote/living/should_play_sound(mob/user, intentional)
	. = ..()
	if(user.mind?.miming)
		return FALSE  // shh
	return .

/datum/emote/living/blush
	key = "blush"
	key_third_person = "blushes"
	message = "краснеет."

/datum/emote/living/bow
	key = "bow"
	key_third_person = "bows"
	message = "кляняется."
	message_param = "кляняется %t."
	message_postfix = " %t."

/datum/emote/living/burp
	key = "burp"
	key_third_person = "burps"
	message = "рыгает."
	message_mime = "отвратительно открывает рот."
	emote_type = EMOTE_AUDIBLE
	muzzled_noises = list("peculiar")

/datum/emote/living/choke
	key = "choke"
	key_third_person = "chokes"
	message = "задыхается!"
	message_mime = "отчаянно хватается за горло!"
	emote_type = EMOTE_AUDIBLE
	muzzled_noises = list("gagging", "strong")

/datum/emote/living/collapse
	key = "collapse"
	key_third_person = "collapses"
	message = "падает!"
	emote_type = EMOTE_VISIBLE

/datum/emote/living/collapse/run_emote(mob/user, params, type_override, intentional)
	. = ..()
	if(. && isliving(user))
		var/mob/living/L = user
		L.Paralyse(4 SECONDS)

/datum/emote/living/dance
	key = "dance"
	key_third_person = "dances"
	message = "весело танцует."

/datum/emote/living/jump
	key = "jump"
	key_third_person = "jumps"
	message = "прыгает!"

/datum/emote/living/deathgasp
	key = "deathgasp"
	key_third_person = "deathgasps"
	emote_type = EMOTE_AUDIBLE | EMOTE_VISIBLE  // make sure deathgasp gets runechatted regardless
	age_based = TRUE
	cooldown = 10 SECONDS
	volume = 40
	unintentional_stat_allowed = DEAD
	message = "seizes up and falls limp, their eyes dead and lifeless..."
	message_alien = "seizes up and falls limp, their eyes dead and lifeless..."
	message_robot = "shudders violently for a moment before falling still, its eyes slowly darkening."
	message_AI = "screeches, its screen flickering as its systems slowly halt."
	message_alien = "lets out a waning guttural screech, green blood bubbling from its maw..."
	message_larva = "lets out a sickly hiss of air and falls limply to the floor..."
	message_monkey = "lets out a faint chimper as it collapses and stops moving..."
	message_simple = "stops moving..."

	mob_type_blacklist_typecache = list(
		/mob/living/carbon/brain,
	)

/datum/emote/living/deathgasp/get_sound(mob/living/user)
	. = ..()

	if(isanimal(user))
		var/mob/living/simple_animal/S = user
		if(S.deathmessage)
			message_simple = S.deathmessage
		return S.death_sound

	if(ishuman(user))
		var/mob/living/carbon/human/H = user
		if(H.dna.species)
			message = H.dna.species.death_message
			return pick(H.dna.species.death_sounds)

	if(isalien(user))
		var/mob/living/carbon/alien/A = user
		message_alien = A.death_message
		return A.death_sound

	if(issilicon(user))
		var/mob/living/silicon/SI = user
		return SI.death_sound

/datum/emote/living/deathgasp/play_sound_effect(mob/user, intentional, sound_path, sound_volume)
	var/mob/living/carbon/human/H = user
	if(!istype(H))
		return ..()
	// special handling here: we don't want monkeys' gasps to sound through walls so you can actually walk past xenobio
	playsound(user.loc, sound_path, sound_volume, TRUE, frequency = H.get_age_pitch(), ignore_walls = !isnull(user.mind))

/datum/emote/living/drool
	key = "drool"
	key_third_person = "drools"
	message = "пускает слюни."
	unintentional_stat_allowed = UNCONSCIOUS

/datum/emote/living/quiver
	key = "quiver"
	key_third_person = "quivers"
	message = "дрожит."
	unintentional_stat_allowed = UNCONSCIOUS

/datum/emote/living/frown
	key = "frown"
	key_third_person = "frowns"
	message = "хмурится."
	message_param = "хмурится на %t."

/datum/emote/living/gag
	key = "gag"
	key_third_person = "gags"
	message = "подавился."
	message_mime = "кажется, подавился."
	message_param = "подавился на %t."
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/glare
	key = "glare"
	key_third_person = "glares"
	message = "недовольно смотрит."
	message_param = "недовольно смотрит на %t."

/datum/emote/living/grin
	key = "grin"
	key_third_person = "grins"
	message = "ухмыляется."

/datum/emote/living/grimace
	key = "grimace"
	key_third_person = "grimaces"
	message = "делает гримасу."

/datum/emote/living/look
	key = "look"
	key_third_person = "looks"
	message = "смотрит."
	message_param = "смотрит на %t."

/datum/emote/living/bshake
	key = "bshake"
	key_third_person = "bshakes"
	message = "трясется."
	unintentional_stat_allowed = UNCONSCIOUS

/datum/emote/living/shudder
	key = "shudder"
	key_third_person = "shudders"
	message = "дрожит."
	unintentional_stat_allowed = UNCONSCIOUS

/datum/emote/living/point
	key = "point"
	key_third_person = "points"
	message = "указывает."
	message_param = "указывает на %t."
	hands_use_check = TRUE
	target_behavior = EMOTE_TARGET_BHVR_USE_PARAMS_ANYWAY
	emote_target_type = EMOTE_TARGET_ANY

/datum/emote/living/point/act_on_target(mob/user, target)
	if(!target)
		return

	user.pointed(target)

/datum/emote/living/point/run_emote(mob/user, params, type_override, intentional)
	// again, /tg/ has some flavor when pointing (like if you only have one leg) that applies debuffs
	// but it's so common that seems unnecessary for here
	message_param = initial(message_param) // reset
	if(ishuman(user))
		var/mob/living/carbon/human/H = user
		if(!H.has_left_hand() && !H.has_right_hand())
			if(H.get_num_legs() != 0)
				message_param = "пытается указать на %t ногой."
			else
				// nugget
				message_param = "<span class='userdanger>bumps [user.p_their()] head on the ground</span> trying to motion towards %t."

	return ..()

/datum/emote/living/pout
	key = "pout"
	key_third_person = "pouts"
	message = "дуется."

/datum/emote/living/scream
	key = "scream"
	key_third_person = "screams"
	message = "кричит!"
	message_mime = "кажется, кричит!"
	message_simple = "хнычет."
	message_alien = "рычит!"
	emote_type = EMOTE_SOUND | EMOTE_MOUTH
	mob_type_blacklist_typecache = list(
		// Humans and silicons get specialized scream.
		/mob/living/carbon/human,
		/mob/living/silicon
	)
	volume = 80

/datum/emote/living/scream/get_sound(mob/living/user)
	. = ..()
	if(isalien(user))
		return "sound/voice/hiss5.ogg"

/datum/emote/living/shake
	key = "shake"
	key_third_person = "shakes"
	message = "отрицательно машет головой."

/datum/emote/living/shiver
	key = "shiver"
	key_third_person = "shiver"
	message = "дрожит."
	unintentional_stat_allowed = UNCONSCIOUS

/datum/emote/living/sigh
	key = "sigh"
	key_third_person = "sighs"
	message = "вздыхает."
	message_mime = "кажется, вздыхает."
	muzzled_noises = list("weak")
	emote_type = EMOTE_AUDIBLE | EMOTE_MOUTH

/datum/emote/living/sigh/happy
	key = "hsigh"
	key_third_person = "hsighs"
	message = "спокойно вздыхает."
	message_mime = "кажется, вздыхает."
	muzzled_noises = list("chill", "relaxed")

/datum/emote/living/sit
	key = "sit"
	key_third_person = "sits"
	message = "sits down."

/datum/emote/living/smile
	key = "smile"
	key_third_person = "smiles"
	message = "улыбается."
	message_param = "улыбается %t."

/datum/emote/living/smug
	key = "smug"
	key_third_person = "smugs"
	message = "самодовольно ухмыляется."
	message_param = "самодовольно ухмыляется %t."

/datum/emote/living/sniff
	key = "sniff"
	key_third_person = "sniffs"
	message = "нюхает."
	emote_type = EMOTE_AUDIBLE
	unintentional_stat_allowed = UNCONSCIOUS

/datum/emote/living/snore
	key = "snore"
	key_third_person = "snores"
	message = "храпит."
	message_mime = "кажется, спит."
	message_simple = "шевелится во сне."
	message_robot = "мечтает об электрических овцах..."
	emote_type = EMOTE_AUDIBLE | EMOTE_MOUTH
	// lock it so these emotes can only be used while unconscious
	stat_allowed = UNCONSCIOUS
	max_stat_allowed = UNCONSCIOUS
	unintentional_stat_allowed = UNCONSCIOUS
	max_unintentional_stat_allowed = UNCONSCIOUS

/datum/emote/living/nightmare
	key = "nightmare"
	message = "корчится во сне."
	emote_type = EMOTE_VISIBLE
	stat_allowed = UNCONSCIOUS
	max_stat_allowed = UNCONSCIOUS
	unintentional_stat_allowed = UNCONSCIOUS
	max_unintentional_stat_allowed = UNCONSCIOUS

/datum/emote/living/nightmare/run_emote(mob/user, params, type_override, intentional)
	. = ..()
	if(!.)
		return FALSE
	user.dir = pick(GLOB.cardinal)

/datum/emote/living/stare
	key = "stare"
	key_third_person = "stares"
	message = "пристально смотрит."
	message_param = "пристально смотрит на %t."

/datum/emote/living/strech
	key = "stretch"
	key_third_person = "stretches"
	message = "протягивает руки."

/datum/emote/living/sulk
	key = "sulk"
	key_third_person = "sulks"
	message = "грустно дуется."

/datum/emote/living/sway
	key = "sway"
	key_third_person = "sways"
	message = "неровно стоит на ногах."

/datum/emote/living/swear
	key = "swear"
	key_third_person = "swears"
	message = "ругается!"
	message_param = "ругается на %t!"
	message_mime = "делает грубый жест!"
	message_simple = "издает сердитый звук!"
	message_robot = "издает особенно оскорбительную серию гудков!"
	message_postfix = "на %t!"
	emote_type = EMOTE_AUDIBLE | EMOTE_MOUTH

	mob_type_blacklist_typecache = list(
		/mob/living/carbon/brain,
	)

/datum/emote/living/tilt
	key = "tilt"
	key_third_person = "tilts"
	message = "наклоняет голову в сторону."

/datum/emote/living/tremble
	key = "tremble"
	key_third_person = "trembles"
	message = "дрожит от страха!"

/datum/emote/living/twitch
	key = "twitch"
	key_third_person = "twitches"
	message = "сильно дергается."
	unintentional_stat_allowed = UNCONSCIOUS

/datum/emote/living/twitch_s
	key = "twitch_s"
	message = "дергается."
	unintentional_stat_allowed = UNCONSCIOUS

/datum/emote/living/whimper
	key = "whimper"
	key_third_person = "whimpers"
	message = "хнычет."
	message_mime = "кажется, ранен."
	emote_type = EMOTE_AUDIBLE | EMOTE_MOUTH
	muzzled_noises = list("weak", "pathetic")

/datum/emote/living/wsmile
	key = "wsmile"
	key_third_person = "wsmiles"
	message = "немного улыбается."

/datum/emote/living/custom
	key = "me"
	key_third_person = "custom"
	message = null
	mob_type_blacklist_typecache = list(
		/mob/living/carbon/brain,	// nice try
	)

	// Custom emotes should be able to be forced out regardless of context.
	// It falls on the caller to determine whether or not it should actually be called.
	unintentional_stat_allowed = DEAD

/datum/emote/living/custom/proc/check_invalid(mob/user, input)
	var/static/regex/stop_bad_mime = regex(@"says|exclaims|yells|asks")
	if(stop_bad_mime.Find(input, 1, 1))
		to_chat(user, "<span class='danger'>Invalid emote.</span>")
		return TRUE
	return FALSE

/datum/emote/living/custom/run_emote(mob/user, params, type_override = null, intentional = FALSE)
	var/custom_emote
	var/custom_emote_type

	if(QDELETED(user))
		return FALSE
	else if(check_mute(user?.client?.ckey, MUTE_IC))
		to_chat(user, "<span class='boldwarning'>You cannot send IC messages (muted).</span>")
		return FALSE
	else if(!params)
		custom_emote = copytext(sanitize(input("Choose an emote to display.") as text|null), 1, MAX_MESSAGE_LEN)
		if(custom_emote && !check_invalid(user, custom_emote))
			var/type = input("Is this a visible or hearable emote?") as null|anything in list("Visible", "Hearable")
			switch(type)
				if("Visible")
					custom_emote_type = EMOTE_VISIBLE
				if("Hearable")
					custom_emote_type = EMOTE_AUDIBLE
				else
					to_chat(user,"<span class='warning'>Unable to use this emote, must be either hearable or visible.</span>")
					return
	else
		custom_emote = params
		if(type_override)
			custom_emote_type = type_override

	message = custom_emote
	emote_type = custom_emote_type
	. = ..()
	message = initial(message)
	emote_type = initial(emote_type)

/datum/emote/living/custom/replace_pronoun(mob/user, message)
	// Trust the user said what they mean
	return message

