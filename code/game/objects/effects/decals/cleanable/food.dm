/obj/effect/decal/cleanable/food
	icon = 'icons/effects/tomatodecal.dmi'
	gender = NEUTER
	beauty = -100

/obj/effect/decal/cleanable/food/tomato_smudge
	name = "tomato smudge"
	desc = "It's red."
	icon_state = "tomato_floor1"
	random_icon_states = list("tomato_floor1", "tomato_floor2", "tomato_floor3")

/obj/effect/decal/cleanable/food/tomato_smudge/can_bloodcrawl_in()
	return TRUE // why? why not.

/obj/effect/decal/cleanable/food/plant_smudge
	name = "plant smudge"
	desc = "Chlorophyll? More like borophyll!"
	icon_state = "smashed_plant"

/obj/effect/decal/cleanable/food/egg_smudge
	name = "smashed egg"
	desc = "Seems like this one won't hatch."
	icon_state = "smashed_egg1"
	random_icon_states = list("smashed_egg1", "smashed_egg2", "smashed_egg3")

/obj/effect/decal/cleanable/food/pie_smudge //honk
	name = "smashed pie"
	desc = "It's pie cream from a cream pie."
	icon_state = "smashed_pie"

/obj/effect/decal/cleanable/food/salt
	name = "salt pile"
	desc = "A sizable pile of table salt. Someone must be upset."
	icon_state = "salt_pile"
	var/safepasses = 3 //how many times can this salt pile be passed before dissipating

/obj/effect/decal/cleanable/food/salt/Initialize(mapload, list/datum/disease/diseases)
	. = ..()
	var/static/list/loc_connections = list(
		COMSIG_ATOM_ENTERED = PROC_REF(on_entered)
	)
	AddElement(/datum/element/connect_loc, loc_connections)

/obj/effect/decal/cleanable/food/salt/CanAllowThrough(atom/movable/mover, border_dir)
	. = ..()
	//IRIS EDIT CHANGE BEGIN - SALT_VULNERABILITY_QUIRK
	if(HAS_TRAIT(mover, TRAIT_SALT_VULNERABILITY))
	//IRIS EDIT CHANGE END
		return FALSE

/obj/effect/decal/cleanable/food/salt/Bumped(atom/movable/AM)
	. = ..()
	//IRIS EDIT CHANGE BEGIN - SALT_VULNERABILITY_QUIRK
	if(HAS_TRAIT(AM, TRAIT_SALT_VULNERABILITY))
	//IRIS EDIT CHANGE END
		to_chat(AM, span_danger("Your path is obstructed by [span_phobia("salt")]."))

/obj/effect/decal/cleanable/food/salt/proc/on_entered(datum/source, atom/movable/AM)
	SIGNAL_HANDLER

	if(!isliving(AM))
		return

	if(iscarbon(AM))
		var/mob/living/carbon/C = AM
		if(C.move_intent == MOVE_INTENT_WALK)
			return

	safepasses--
	if(safepasses <= 0 && !QDELETED(src))
		qdel(src)

/obj/effect/decal/cleanable/food/flour
	name = "flour"
	desc = "It's still good. Four second rule!"
	icon_state = "flour"

/obj/effect/decal/cleanable/food/squid_ink
	name = "ink smear"
	desc = "a smear from some inky substance..."
	icon = 'icons/effects/blood.dmi'
	icon_state = "floor1"
	color = COLOR_DARK

/obj/effect/decal/cleanable/food/squid_ink/Initialize(mapload, list/datum/disease/diseases)
	icon_state = "floor[rand(1, 7)]"
	return ..()
