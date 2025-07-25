// NOVA GOOD TRAITS

/datum/quirk/hard_soles
	name = "Hardened Soles"
	desc = "You're used to walking barefoot, and won't receive the negative effects of doing so."
	value = 2
	mob_trait = TRAIT_HARD_SOLES
	gain_text = span_notice("The ground doesn't feel so rough on your feet anymore.")
	lose_text = span_danger("You start feeling the ridges and imperfections on the ground.")
	medical_record_text = "Patient's feet are more resilient against traction."
	icon = FA_ICON_PERSON_RUNNING

/datum/quirk/linguist
	name = "Linguist"
	desc = "You're a student of numerous languages and come with an additional language point."
	value = 0
	mob_trait = TRAIT_LINGUIST
	gain_text = span_notice("Your brain seems more equipped to handle different modes of conversation.")
	lose_text = span_danger("Your grasp of the finer points of Draconic idioms fades away.")
	medical_record_text = "Patient demonstrates a high brain plasticity in regards to language learning."
	icon = FA_ICON_BOOK_ATLAS

/datum/quirk/sharpclaws
	name = "Sharp Claws"
	desc = "Whether it's a hunter's inherent biology, or your stubborn refusal to clip your nails ahead of your Jiu-Jitsu classes, your unarmed attacks are sharper and will make people bleed."
	value = 2
	gain_text = span_notice("Your palms hurt a bit from the sharpness of your nails.")
	lose_text = span_danger("You feel a distinct emptiness as your nails dull; good luck scratching that itch.")
	medical_record_text = "Patient ended up scratching through the examination table's cushions; recommended they look into clipping their claws."
	icon = FA_ICON_LINES_LEANING

/datum/quirk/sharpclaws/add(client/client_source)
	var/mob/living/carbon/human/human_holder = quirk_holder
	if(!istype(human_holder))
		return FALSE

	var/obj/item/bodypart/arm/left/left_arm = human_holder.get_bodypart(BODY_ZONE_L_ARM)
	if(left_arm)
		left_arm.unarmed_attack_verbs = list("slash")
		left_arm.unarmed_attack_effect = ATTACK_EFFECT_CLAW
		left_arm.unarmed_attack_sound = 'sound/items/weapons/slash.ogg'
		left_arm.unarmed_miss_sound = 'sound/items/weapons/slashmiss.ogg'
		left_arm.unarmed_sharpness = SHARP_EDGED

	var/obj/item/bodypart/arm/right/right_arm = human_holder.get_bodypart(BODY_ZONE_R_ARM)
	if(right_arm)
		right_arm.unarmed_attack_verbs = list("slash")
		right_arm.unarmed_attack_effect = ATTACK_EFFECT_CLAW
		right_arm.unarmed_attack_sound = 'sound/items/weapons/slash.ogg'
		right_arm.unarmed_miss_sound = 'sound/items/weapons/slashmiss.ogg'
		right_arm.unarmed_sharpness = SHARP_EDGED

/datum/quirk/sharpclaws/remove(client/client_source)
	var/mob/living/carbon/human/human_holder = quirk_holder
	var/obj/item/bodypart/arm/left/left_arm = human_holder.get_bodypart(BODY_ZONE_L_ARM)
	if(left_arm)
		left_arm.unarmed_attack_verbs = initial(left_arm.unarmed_attack_verbs)
		left_arm.unarmed_attack_effect = initial(left_arm.unarmed_attack_effect)
		left_arm.unarmed_attack_sound = initial(left_arm.unarmed_attack_sound)
		left_arm.unarmed_miss_sound = initial(left_arm.unarmed_miss_sound)
		left_arm.unarmed_sharpness = initial(left_arm.unarmed_sharpness)

	var/obj/item/bodypart/arm/right/right_arm = human_holder.get_bodypart(BODY_ZONE_R_ARM)
	if(right_arm)
		right_arm.unarmed_attack_verbs = initial(right_arm.unarmed_attack_verbs)
		right_arm.unarmed_attack_effect = initial(right_arm.unarmed_attack_effect)
		right_arm.unarmed_attack_sound = initial(right_arm.unarmed_attack_sound)
		right_arm.unarmed_miss_sound = initial(right_arm.unarmed_miss_sound)
		right_arm.unarmed_sharpness = initial(right_arm.unarmed_sharpness)

/datum/quirk/water_breathing
	name = "Water breathing"
	desc = "You are able to breathe underwater!"
	value = 2
	mob_trait = TRAIT_WATER_BREATHING
	gain_text = span_notice("You become acutely aware of the moisture in your lungs and in the air. It feels nice.")
	lose_text = span_danger("You suddenly realize the moisture in your lungs feels <i>really weird</i>, and you almost choke on it!")
	medical_record_text = "Patient possesses biology compatible with aquatic respiration."
	icon = FA_ICON_FISH

// AdditionalEmotes *turf quirks
/datum/quirk/water_aspect
	name = "Water aspect (Emotes)"
	desc = "(Aquatic innate) Underwater societies are home to you, space ain't much different. (Say *turf to cast)"
	value = 0
	mob_trait = TRAIT_WATER_ASPECT
	gain_text = span_notice("You feel like you can control water.")
	lose_text = span_danger("Somehow, you've lost your ability to control water!")
	medical_record_text = "Patient holds a collection of nanobots designed to synthesize H2O."
	icon = FA_ICON_WATER

/datum/quirk/webbing_aspect
	name = "Webbing aspect (Emotes)"
	desc = "(Insect innate) Insect folk capable of weaving aren't unfamiliar with receiving envy from those lacking a natural 3D printer. (Say *turf to cast)"
	value = 0
	mob_trait = TRAIT_WEBBING_ASPECT
	gain_text = span_notice("You could easily spin a web.")
	lose_text = span_danger("Somehow, you've lost your ability to weave.")
	medical_record_text = "Patient has the ability to weave webs with naturally synthesized silk."
	icon = FA_ICON_STICKY_NOTE

/datum/quirk/floral_aspect
	name = "Floral aspect (Emotes)"
	desc = "(Podperson innate) Kudzu research isn't pointless, rapid photosynthesis technology is here! (Say *turf to cast)"
	value = 0
	mob_trait = TRAIT_FLORAL_ASPECT
	gain_text = span_notice("You feel like you can grow vines.")
	lose_text = span_danger("Somehow, you've lost your ability to rapidly photosynthesize.")
	medical_record_text = "Patient can rapidly photosynthesize to grow vines."
	icon = FA_ICON_PLANT_WILT

/datum/quirk/ash_aspect
	name = "Ash aspect (Emotes)"
	desc = "(Lizard innate) The ability to forge ash and flame, a mighty power - yet mostly used for theatrics. (Say *turf to cast)"
	value = 0
	mob_trait = TRAIT_ASH_ASPECT
	gain_text = span_notice("There is a forge smouldering inside of you.")
	lose_text = span_danger("Somehow, you've lost your ability to breathe fire.")
	medical_record_text = "Patients possess a fire breathing gland commonly found in lizard folk."
	icon = FA_ICON_FIRE

/datum/quirk/sparkle_aspect
	name = "Sparkle aspect (Emotes)"
	desc = "(Moth innate) Sparkle like the dust off of a moth's wing, or like a cheap red-light hook-up. (Say *turf to cast)"
	value = 0
	mob_trait = TRAIT_SPARKLE_ASPECT
	gain_text = span_notice("You're covered in sparkling dust!")
	lose_text = span_danger("Somehow, you've completely cleaned yourself of glitter..")
	medical_record_text = "Patient seems to be looking fabulous."
	icon = FA_ICON_HAND_SPARKLES

/datum/quirk/no_appendix
	name = "Appendicitis Survivor"
	desc = "You had a run in with appendicitis in the past and no longer have an appendix."
	icon = FA_ICON_NOTES_MEDICAL
	value = 2
	gain_text = span_notice("You no longer have an appendix.")
	lose_text = span_danger("Your appendix has magically.. regrown?")
	medical_record_text = "Patient had appendicitis in the past and has had their appendix surgically removed."
	/// The mob's original appendix
	var/obj/item/organ/appendix/old_appendix

/datum/quirk/no_appendix/post_add()
	var/mob/living/carbon/carbon_quirk_holder = quirk_holder
	old_appendix = carbon_quirk_holder.get_organ_slot(ORGAN_SLOT_APPENDIX)

	if(isnull(old_appendix))
		return

	old_appendix.Remove(carbon_quirk_holder, special = TRUE)
	old_appendix.moveToNullspace()

	STOP_PROCESSING(SSobj, old_appendix)

/datum/quirk/no_appendix/remove()
	var/mob/living/carbon/carbon_quirk_holder = quirk_holder

	if(isnull(old_appendix))
		return

	var/obj/item/organ/appendix/current_appendix = carbon_quirk_holder.get_organ_slot(ORGAN_SLOT_APPENDIX)

	// if we have not gained an appendix already, put the old one back
	if(isnull(current_appendix))
		old_appendix.Insert(carbon_quirk_holder, special = TRUE)
	else
		qdel(old_appendix)

	old_appendix = null

/datum/quirk/sensitive_hearing // Teshari hearing but as a quirk
	name = "Sensitive Hearing"
	desc = "You can hear even the quietest of sounds, but you're more vulnerable to hearing damage as a result. NOTE: This is a direct downgrade for Teshari!"
	icon = FA_ICON_HEADPHONES_SIMPLE
	value = 6
	mob_trait = TRAIT_SENSITIVE_HEARING
	gain_text = span_notice("You could hear a pin drop from 10 feet away.")
	lose_text = span_danger("Your hearing feels less sensitive.")
	medical_record_text = "Patient scored very highly in hearing tests."
	/// Teshari hearing is an action, so here is its holder
	var/datum/action/cooldown/spell/teshari_hearing/hearing_action

/datum/quirk/sensitive_hearing/add_unique()
	var/obj/item/organ/ears/ears = quirk_holder.get_organ_slot(ORGAN_SLOT_EARS)

	hearing_action = new
	LAZYADD(ears.actions_types, hearing_action.type)
	ears.add_item_action(hearing_action)
	hearing_action.Grant(quirk_holder)

/datum/quirk/sensitive_hearing/remove()
	if(QDELING(quirk_holder))
		return
	var/obj/item/organ/ears/ears = quirk_holder.get_organ_slot(ORGAN_SLOT_EARS)
	if(isnull(ears))
		return

	LAZYREMOVE(ears.actions_types, hearing_action.type)
	ears.remove_item_action(hearing_action)
	hearing_action.Remove(quirk_holder)
	//restore dmg multiplier of our current ears
	//we could have any subtype at this point so just take that one's initial value
	//as opposed to making a copy at the start of the player's round (what if they transplant it, etc)
	ears.damage_multiplier = initial(ears.damage_multiplier)
