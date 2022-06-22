/**
 * Emotes usable by brains, but only while they're in MMIs.
 */
/datum/emote/living/carbon/brain
	mob_type_allowed_typecache = list(/mob/living/carbon/brain)
	mob_type_blacklist_typecache = null
	/// The message that will be displayed to themselves, since brains can't really see their own emotes
	var/self_message

/datum/emote/living/carbon/brain/run_emote(mob/user, params, type_override, intentional)
	. = ..()
	if(!.)
		return FALSE

	if(self_message)
		to_chat(user, self_message)

/datum/emote/living/carbon/brain/can_run_emote(mob/user, status_check, intentional)
	. = ..()
	if(!.)
		return FALSE

	var/mob/living/carbon/brain/B = user

	if(!(B.container && istype(B.container, /obj/item/mmi)))  // No MMI, no emotes
		return FALSE

// So, brains can't really see their own emotes so we'll probably just want to send an extra message

/datum/emote/living/carbon/brain/alarm
	key = "alarm"
	key_third_person = "alarms"
	message = "издает тревожный звук."
	self_message = "Вы издаете тревожный звук."

/datum/emote/living/carbon/brain/alert
	key = "alert"
	key_third_person = "alerts"
	message = "издает жалобный звук."
	self_message = "Вы издаете жалобный звук."

/datum/emote/living/carbon/brain/notice
	key = "notice"
	message = "издает громкий звук."
	self_message = "Вы издаете громкий звук."

/datum/emote/living/carbon/brain/flash
	key = "flash"
	message = "начинает быстро мигать огнями!"

/datum/emote/living/carbon/brain/whistle
	key = "whistle"
	key_third_person = "whistles"
	message = "свистит."
	self_message = "Вы свистите."

/datum/emote/living/carbon/brain/beep
	key = "beep"
	key_third_person = "beeps"
	message = "подает звуковой сигнал."
	self_message = "Вы подаете звуковой сигнал."

/datum/emote/living/carbon/brain/boop
	key = "boop"
	key_third_person = "boops"
	message = "подает звуковой сигнал."
	self_message = "Вы подаете звуковой сигнал."
