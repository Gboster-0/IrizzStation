/// Base handler for variant switch feedback
/obj/item/kinetic_crusher/proc/on_variant_switch(mob/living/user)
	to_chat(user, "You have converted your kit into the [initial(name)].")
	playsound(get_turf(user), 'sound/items/tools/rped.ogg', 50)

/obj/item/kinetic_crusher
	/// This var is used to imitate being weilded if it's one handed
	var/acts_as_if_wielded
	/// This var is used by retool kits when changing the crusher's projectile appearance
	var/projectile_icon_file = 'icons/obj/weapons/guns/projectiles.dmi'

/obj/item/kinetic_crusher/machete
	icon = 'modular_nova/modules/mining_crushers/icons/items_and_weapons.dmi'
	icon_state = "PKMachete"
	inhand_icon_state = "PKMachete0"
	lefthand_file = 'modular_nova/modules/mining_crushers/icons/melee_lefthand.dmi'
	righthand_file = 'modular_nova/modules/mining_crushers/icons/melee_righthand.dmi'
	worn_icon = 'modular_nova/modules/mining_crushers/icons/belt.dmi'
	worn_icon_state = "PKMachete0"
	name = "proto-kinetic machete"
	desc = "Recent breakthroughs with proto-kinetic technology have led to improved designs for the early proto-kinetic crusher, namely the ability to pack all \
		the same technology into a smaller more portable package. The machete design was chosen as to make a much easier to handle and less cumbersome frame. Of course \
		the smaller package means that the power is not as high as the original crusher design, but the different shell makes it capable of blocking basic attacks."
	force = 15
	block_chance = 15
	w_class = WEIGHT_CLASS_BULKY
	slot_flags = ITEM_SLOT_BELT
	throwforce = 5
	throw_speed = 4
	armour_penetration = 10
	custom_materials = list(
		/datum/material/iron=HALF_SHEET_MATERIAL_AMOUNT*1.15,
		/datum/material/glass=HALF_SHEET_MATERIAL_AMOUNT*2,
	)
	hitsound = 'sound/items/weapons/bladeslice.ogg'
	attack_verb_continuous = list(
		"slashes",
		"cuts",
		"cleaves",
		"chops",
		"swipes",
	)
	attack_verb_simple = list(
		"cleave",
		"chop",
		"cut",
		"swipe",
		"slash",
	)

	sharpness = SHARP_EDGED
	actions_types = list(/datum/action/item_action/toggle_light)
	obj_flags = NONE
	light_system = OVERLAY_LIGHT_DIRECTIONAL
	light_range = 5
	light_on = FALSE
	charged = TRUE
	charge_time =  1 SECONDS
	detonation_damage = 35
	backstab_bonus = 20
	acts_as_if_wielded = TRUE
	current_inhand_icon_state = "PKMachete"

/obj/item/kinetic_crusher/machete/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/two_handed, \
		force_unwielded=15, \
		force_wielded=15, \
	)
	AddComponent(/datum/component/butchering, \
		speed = 4 SECONDS, \
		effectiveness = 150, \
	)

/obj/item/kinetic_crusher/machete/update_icon_state()
	. = ..()
	if(current_inhand_icon_state == initial(current_inhand_icon_state)) // don't alter retool kit appearance
		inhand_icon_state = "PKMachete0" // this is not icon_state and not supported by 2hcomponent

/obj/item/kinetic_crusher/spear
	icon = 'modular_nova/modules/mining_crushers/icons/items_and_weapons.dmi'
	icon_state = "PKSpear"
	inhand_icon_state = "PKSpear0"
	lefthand_file = 'modular_nova/modules/mining_crushers/icons/melee_lefthand.dmi'
	righthand_file = 'modular_nova/modules/mining_crushers/icons/melee_righthand.dmi'
	worn_icon = 'modular_nova/modules/mining_crushers/icons/back.dmi'
	worn_icon_state = "PKSpear0"
	name = "proto-kinetic spear"
	desc = "Having finally invested in better Proto-kinetic tech, research and development was able to cobble together this new proto-kinetic weapon. By compacting all the technology \
		we were able to fit it all into a spear styled case. No longer will proto-kinetic crushers be for the most skilled and suicidal, but now they will be available to the most cautious \
		paranoid miners, now able to enjoy the (slightly lower) power of a crusher, while maintaining a (barely) minimum safe distance."
	force = 0
	w_class = WEIGHT_CLASS_HUGE
	slot_flags = ITEM_SLOT_BACK
	throwforce = 5
	throw_speed = 4
	armour_penetration = 15
	custom_materials = list(
		/datum/material/iron=HALF_SHEET_MATERIAL_AMOUNT*1.15,
		/datum/material/glass=HALF_SHEET_MATERIAL_AMOUNT*2,
	)
	hitsound = 'sound/items/weapons/bladeslice.ogg'
	attack_verb_continuous = list(
		"pierces",
		"stabs",
		"impales",
		"pokes",
		"jabs",
	)
	attack_verb_simple = list(
		"imaple",
		"stab",
		"pierce",
		"jab",
		"poke",
	)
	sharpness = SHARP_EDGED
	actions_types = list(/datum/action/item_action/toggle_light)
	obj_flags = UNIQUE_RENAME
	light_system = OVERLAY_LIGHT_DIRECTIONAL
	light_range = 8
	light_on = FALSE
	charged = TRUE
	charge_time =  1.5 SECONDS
	detonation_damage = 35
	backstab_bonus = 20
	reach = 2
	current_inhand_icon_state = "PKSpear"

/obj/item/kinetic_crusher/spear/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/two_handed, force_unwielded=0, force_wielded=15)
	AddComponent(/datum/component/butchering, \
		speed = 6 SECONDS, \
		effectiveness = 90, \
	)

/obj/item/kinetic_crusher/spear/update_icon_state()
	. = ..()
	if(current_inhand_icon_state == initial(current_inhand_icon_state)) // don't alter retool kit appearance
		inhand_icon_state = "PKSpear[HAS_TRAIT(src, TRAIT_WIELDED)]" // this is not icon_state and not supported by 2hcomponent

/obj/item/kinetic_crusher/hammer
	icon = 'modular_nova/modules/mining_crushers/icons/items_and_weapons.dmi'
	icon_state = "PKHammer"
	inhand_icon_state = "PKHammer0"
	lefthand_file = 'modular_nova/modules/mining_crushers/icons/melee_lefthand.dmi'
	righthand_file = 'modular_nova/modules/mining_crushers/icons/melee_righthand.dmi'
	worn_icon = 'modular_nova/modules/mining_crushers/icons/back.dmi'
	worn_icon_state = "PKHammer0"
	name = "proto-kinetic hammer"
	desc = "Somehow research and development managed to make the proto-kinetic crusher even bigger, allowing more parts to be fit inside and increase the power output. \
		This increased power output allows it to surpass the power generated by the standard crusher, while also pushing back the target. Unfortunately the flat head \
		results in backstabs being impossible."
	force = 0
	w_class = WEIGHT_CLASS_HUGE
	slot_flags = ITEM_SLOT_BACK
	throwforce = 5
	throw_speed = 4
	armour_penetration = 0
	custom_materials = list(
		/datum/material/iron=HALF_SHEET_MATERIAL_AMOUNT*1.15,
		/datum/material/glass=HALF_SHEET_MATERIAL_AMOUNT*2,
	)
	hitsound = 'sound/items/weapons/sonic_jackhammer.ogg'
	attack_verb_continuous = list(
		"slams",
		"crushes",
		"smashes",
		"flattens",
		"pounds",
	)
	attack_verb_simple = list(
		"slam",
		"crush",
		"smash",
		"flatten",
		"pound",
	)
	sharpness = NONE
	actions_types = list(/datum/action/item_action/toggle_light)
	obj_flags = UNIQUE_RENAME
	light_system = OVERLAY_LIGHT_DIRECTIONAL
	light_range = 5
	light_on = FALSE
	charged = TRUE
	charge_time = 2 SECONDS
	detonation_damage = 70
	backstab_bonus = 0
	acts_as_if_wielded = FALSE
	current_inhand_icon_state = "PKHammer"

/obj/item/kinetic_crusher/hammer/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/two_handed, force_unwielded=0, force_wielded=20)

/obj/item/kinetic_crusher/hammer/attack(mob/living/target, mob/living/user)
	var/relative_direction = get_cardinal_dir(src, target)
	var/atom/throw_target = get_edge_target_turf(target, relative_direction)
	. = ..()
	if(HAS_TRAIT(user, TRAIT_PACIFISM) || !HAS_TRAIT(src, TRAIT_WIELDED))
		return
	else if(!QDELETED(target) && !target.anchored)
		var/whack_speed = (2)
		target.throw_at(throw_target, 2, whack_speed, user, gentle = TRUE)

/obj/item/kinetic_crusher/hammer/update_icon_state()
	. = ..()
	if(current_inhand_icon_state == initial(current_inhand_icon_state)) // don't alter retool kit appearance
		inhand_icon_state = "PKHammer[HAS_TRAIT(src, TRAIT_WIELDED)]" // this is not icon_state and not supported by 2hcomponent

/obj/item/kinetic_crusher/claw
	icon = 'modular_nova/modules/mining_crushers/icons/items_and_weapons.dmi'
	icon_state = "PKClaw"
	inhand_icon_state = "PKClaw0"
	lefthand_file = 'modular_nova/modules/mining_crushers/icons/melee_lefthand.dmi'
	righthand_file = 'modular_nova/modules/mining_crushers/icons/melee_righthand.dmi'
	worn_icon_state = "PKHammer0"
	slot_flags = NONE
	name = "proto-kinetic claws"
	desc = "Truly the most compact version of the crusher ever made, it's small enough to fit in your backpack and still function as a crusher. \
		Best used when attacking from behind, rewarding those capable of landing what we call a 'critical hit' \
		(DISCLAIMER) The shell is made to fit over gloves, so don't try to wear it like a glove."
	force = 5
	w_class = WEIGHT_CLASS_NORMAL
	throwforce = 5
	throw_speed = 4
	armour_penetration = 0
	custom_materials = list(
		/datum/material/iron=HALF_SHEET_MATERIAL_AMOUNT*1.15,
		/datum/material/glass=HALF_SHEET_MATERIAL_AMOUNT*2,
	)
	hitsound = 'sound/items/weapons/pierce.ogg'
	attack_verb_continuous = list(
		"swipes",
		"slashes",
		"cuts",
		"slaps",
	)
	attack_verb_simple = list(
		"swipe",
		"slash",
		"cut",
		"slap",
	)
	sharpness = SHARP_POINTY
	actions_types = list(/datum/action/item_action/toggle_light)
	obj_flags = UNIQUE_RENAME
	light_system = OVERLAY_LIGHT_DIRECTIONAL
	light_range = 4
	light_on = FALSE
	charged = TRUE
	charge_time = 1 SECONDS
	detonation_damage = 5
	backstab_bonus = 200
	current_inhand_icon_state = "PKClaw"

/obj/item/kinetic_crusher/claw/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/two_handed, \
		force_unwielded=0, \
		force_wielded=5, \
	)
	AddComponent(/datum/component/butchering, \
		speed = 5 SECONDS, \
		effectiveness = 100, \
	)

/obj/item/kinetic_crusher/claw/update_icon_state()
	. = ..()
	if(current_inhand_icon_state == initial(current_inhand_icon_state)) // don't alter retool kit appearance
		inhand_icon_state = initial(inhand_icon_state) // get rid of the '0' or '1' at the end
