//ASH STAFF
/obj/item/ash_staff
	name = "staff of the ashlands"
	desc = "A gnarly and twisted branch that is imbued with some ancient power."

	icon = 'icons/obj/weapons/guns/magic.dmi'
	lefthand_file = 'icons/mob/inhands/weapons/staves_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/weapons/staves_righthand.dmi'
	icon_state = "staffofanimation"
	inhand_icon_state = "staffofanimation"


/obj/item/ash_staff/interact_with_atom(atom/interacting_with, mob/living/user, list/modifiers)
	if(!user.mind.has_antag_datum(/datum/antagonist/ashwalker))
		return NONE

	if(istype(interacting_with, /obj/structure/lavaland/ash_walker))
		return NONE

	if(!isopenturf(interacting_with))
		return NONE

	var/turf/target_turf = interacting_with
	if(istype(interacting_with, /turf/open/misc/asteroid/basalt/lava_land_surface))
		to_chat(user, span_warning("You begin to corrupt the land even further..."))
		if(!do_after(user, 4 SECONDS, target = target_turf))
			to_chat(user, span_warning("[src] had their casting cut short!"))
			return ITEM_INTERACT_BLOCKING

		target_turf.ChangeTurf(/turf/open/lava/smooth/lava_land_surface)
		to_chat(user, span_notice("[src] sparks, corrupting the area too far!"))
		return

	if(!do_after(user, 2 SECONDS, target = target_turf))
		to_chat(user, span_warning("[src] had their casting cut short!"))
		return ITEM_INTERACT_BLOCKING

	target_turf.ChangeTurf(/turf/open/misc/asteroid/basalt/lava_land_surface)
	return ITEM_INTERACT_SUCCESS


//generic ash item recipe
/datum/crafting_recipe/ash_recipe
	reqs = list(
		/obj/item/stack/sheet/bone = 1,
		/obj/item/stack/sheet/sinew = 1,
	)
	time = 4 SECONDS
	category = CAT_TOOLS
