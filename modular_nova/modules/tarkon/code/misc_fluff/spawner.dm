//Port Tarkon, 8 people trapped in a revamped charlie-station like ghost role. Survive the aliens and threats, Fix the port and/or finish construction

/obj/effect/mob_spawn/ghost_role/human/tarkon
	name = "Port Tarkon Crew Member"
	prompt_name = "a port deck worker"
	icon = 'icons/obj/machines/sleeper.dmi'
	icon_state = "sleeper"
	you_are_text = "You are a member of Tarkon Industries, recently assigned to a recently recovered asset known as Port Tarkon. Your supervisors are the Ensign and Site Director."
	flavour_text = "On the recently reclaimed Port Tarkon, You are tasked to help finish construction and carry on any tasks given by the site director. It may be best to look at your departmental noteboard. (OOC note: This ghost role was not designed with Plasmamen or Vox in mind. While there are some accommodations so that they can survive, it should be noted that they were not the focal point whilst designing Port Tarkon. The closet in the middle of the room above contains the 'accommodations' for those species.)"
	important_text = "You are not to abandon Port Tarkon. Check other sleepers for alternative jobs. Listen to the Site Director and Ensign."
	outfit = /datum/outfit/tarkon
	faction = list(FACTION_TARKON)
	spawner_job_path = /datum/job/tarkon
	loadout_enabled = TRUE
	quirks_enabled = TRUE
	random_appearance = FALSE
	computer_area = /area/ruin/space/has_grav/port_tarkon

/datum/outfit/tarkon
	name = "default port tarkon outfit"
	uniform = /obj/item/clothing/under/tarkon/general
	head = /obj/item/clothing/head/utility/welding/hat
	shoes = /obj/item/clothing/shoes/winterboots
	gloves = /obj/item/clothing/gloves/combat
	back = /obj/item/storage/backpack
	id = /obj/item/card/id/advanced/tarkon
	id_trim = /datum/id_trim/away/tarkon
	ears = /obj/item/radio/headset/tarkon
	backpack_contents = list(
		/obj/item/crowbar = 1
		)
	var/backpack = /obj/item/storage/backpack/tarkon //Replaces "back" item with provided backpack based on preference on role spawn. Will be used further in project Colony Echo
	/// Replaces "back" item with provided satchel
	var/satchel = /obj/item/storage/backpack/satchel/tarkon
	/// Replaces "back" item with provided duffelbag
	var/duffelbag = /obj/item/storage/backpack/duffelbag/tarkon
	/// Replaces "back" item with provided messenger bag.
	var/messenger = /obj/item/storage/backpack/messenger/tarkon

/datum/outfit/tarkon/pre_equip(mob/living/carbon/human/tarkon, visuals_only = FALSE)
	if(ispath(back, /obj/item/storage/backpack)) //we just steal this from the job outfit datum.
		switch(tarkon.backpack)
			if(GBACKPACK)
				back = /obj/item/storage/backpack //Grey backpack
			if(GSATCHEL)
				back = /obj/item/storage/backpack/satchel //Grey satchel
			if(GDUFFELBAG)
				back = /obj/item/storage/backpack/duffelbag //Grey Duffel bag
			if(LSATCHEL)
				back = /obj/item/storage/backpack/satchel/leather //Leather Satchel
			if(GMESSENGER)
				back = /obj/item/storage/backpack/messenger //Grey messenger bag
			if(DBACKPACK)
				back = backpack //faction backpack
			if(DSATCHEL)
				back = satchel //faction satchel
			if(DMESSENGER)
				back = messenger //faction messenger bag
			if(DDUFFELBAG)
				back = duffelbag //faction duffel bag
			else
				back = backpack //faction backpack fallback incase bag pref shits bed

	var/client/client = GLOB.directory[ckey(tarkon.mind?.key)]

	if(isplasmaman(tarkon))
		uniform = /obj/item/clothing/under/plasmaman
		gloves = /obj/item/clothing/gloves/color/plasmaman
		head = /obj/item/clothing/head/helmet/space/plasmaman
		r_hand = /obj/item/tank/internals/plasmaman/belt/full
		internals_slot = ITEM_SLOT_HANDS
	if(isvox(tarkon) || isvoxprimalis(tarkon))
		r_hand = /obj/item/tank/internals/nitrogen/belt/full
		mask = /obj/item/clothing/mask/breath/vox
		internals_slot = ITEM_SLOT_HANDS

	if(client?.is_veteran() && client?.prefs.read_preference(/datum/preference/toggle/playtime_reward_cloak))
		neck = /obj/item/clothing/neck/cloak/skill_reward/playing

/datum/outfit/tarkon/post_equip(mob/living/carbon/human/tarkon, visualsOnly = FALSE)
	var/obj/item/card/id/id_card = tarkon.wear_id
	if(istype(id_card))
		id_card.registered_name = tarkon.real_name
		id_card.update_label()
		id_card.update_icon()
	var/obj/item/radio/target_radio = tarkon.ears
	target_radio.set_frequency(FREQ_TARKON)
	target_radio.recalculateChannels()

	handlebank(tarkon)
	return ..()

/obj/effect/mob_spawn/ghost_role/human/tarkon/cargo
	prompt_name = "a port salvage tech"
	outfit = /datum/outfit/tarkon/cargo

/datum/outfit/tarkon/cargo
	name = "Port Tarkon Cargo Outfit"
	uniform = /obj/item/clothing/under/tarkon
	glasses = /obj/item/clothing/glasses/sunglasses
	id = /obj/item/card/id/advanced/tarkon/cargo
	id_trim = /datum/id_trim/away/tarkon/cargo
	l_pocket = /obj/item/mining_voucher

/obj/effect/mob_spawn/ghost_role/human/tarkon/sci
	prompt_name = "a port researcher"
	outfit = /datum/outfit/tarkon/sci

/datum/outfit/tarkon/sci
	name = "Port Tarkon Science Outfit"
	uniform = /obj/item/clothing/under/tarkon/sci
	glasses = /obj/item/clothing/glasses/hud/diagnostic
	id = /obj/item/card/id/advanced/tarkon/sci
	id_trim = /datum/id_trim/away/tarkon/sci
	r_pocket = /obj/item/stock_parts/power_store/cell/high
	l_pocket = /obj/item/card/id/away/tarkonrobo

/obj/effect/mob_spawn/ghost_role/human/tarkon/med
	prompt_name = "a port trauma medic"
	outfit = /datum/outfit/tarkon/med

/datum/outfit/tarkon/med
	name = "Port Tarkon Medical Outfit"
	uniform = /obj/item/clothing/under/tarkon/med
	glasses = /obj/item/clothing/glasses/hud/health
	id = /obj/item/card/id/advanced/tarkon/med
	id_trim = /datum/id_trim/away/tarkon/med
	neck = /obj/item/clothing/neck/stethoscope
	l_pocket = /obj/item/healthanalyzer
	r_pocket = /obj/item/stack/medical/suture/medicated

/obj/effect/mob_spawn/ghost_role/human/tarkon/engi
	prompt_name = "a port maintenance engineer"
	outfit = /datum/outfit/tarkon/engi

/datum/outfit/tarkon/engi
	name = "Port Tarkon Engineering Outfit"
	uniform = /obj/item/clothing/under/tarkon/eng
	glasses = /obj/item/clothing/glasses/meson/engine/tray
	id = /obj/item/card/id/advanced/tarkon/engi
	id_trim = /datum/id_trim/away/tarkon/eng
	neck = /obj/item/clothing/neck/security_cape/tarkon
	l_pocket = /obj/item/tank/internals/emergency_oxygen/engi
	r_pocket = /obj/item/stack/cable_coil
	backpack_contents = list(
		/obj/item/crowbar = 1,
		/obj/item/inducer = 1
		)

/obj/effect/mob_spawn/ghost_role/human/tarkon/sec
	prompt_name = "a port security member"
	outfit = /datum/outfit/tarkon/sec

/datum/outfit/tarkon/sec
	name = "Port Tarkon Security Outfit"
	uniform = /obj/item/clothing/under/tarkon/sec
	glasses = /obj/item/clothing/glasses/hud/security
	gloves = /obj/item/clothing/gloves/tackler/combat
	neck = /obj/item/clothing/neck/security_cape/tarkon
	id = /obj/item/card/id/advanced/tarkon/sec
	id_trim = /datum/id_trim/away/tarkon/sec
	l_pocket = /obj/item/melee/baton/telescopic
	r_pocket = /obj/item/grenade/barrier

/obj/effect/mob_spawn/ghost_role/human/tarkon/ensign
	name = "Port Tarkon Ensign"
	prompt_name = "an abandoned ensign"
	icon = 'icons/obj/machines/sleeper.dmi'
	icon_state = "sleeper-o"
	you_are_text = "You were tasked by Tarkon Industries to Port Tarkon as a low-level command member. Your superior is the site director."
	flavour_text = "Second in command, you are usually tasked with outward missions with other Tarkon members while the site director stays at the port. (OOC note: This ghost role was not designed with Plasmamen or Vox in mind. While there are some accommodations so that they can survive, it should be noted that they were not the focal point whilst designing Port Tarkon. The closet in the middle of the room above contains the 'accommodations' for those species.)"
	important_text = "This is Not a job ment for Non-Tarkon specific Characters. You are not to abandon Port Tarkon without reason. You are allowed to travel within available Z-levels and to the station, and are allowed to hold exploration parties."
	outfit = /datum/outfit/tarkon/ensign
	spawner_job_path = /datum/job/tarkon

/datum/outfit/tarkon/ensign //jack of all trades, master of none, spent all his credits, every last one
	name = "Port Tarkon Ensigns Outfit"
	uniform = /obj/item/clothing/under/tarkon/com
	ears = /obj/item/radio/headset/tarkon/command
	id = /obj/item/card/id/advanced/tarkon/ensign
	id_trim = /datum/id_trim/away/tarkon/ensign
	neck = /obj/item/clothing/neck/security_cape/tarkon

/obj/effect/mob_spawn/ghost_role/human/tarkon/director
	name = "Port Tarkon Site Director"
	prompt_name = "a port site director"
	icon = 'icons/obj/machines/sleeper.dmi'
	icon_state = "sleeper"
	you_are_text = "You are a newly assigned Site Director for Port Tarkon. Your superiors are none except the will of yourself and Tarkon Industries."
	flavour_text = "On the recently reclaimed Port Tarkon, You are tasked with overlooking your crew and keeping the port up and running. (OOC note: This ghost role was not designed with Plasmamen or Vox in mind. While there are some accommodations so that they can survive, it should be noted that they were not the focal point whilst designing Port Tarkon. The closet in the middle of the room above contains the 'accommodations' for those species.)"
	important_text = "This is Not a job ment for Non-Tarkon specific Characters. You are not to abandon Port Tarkon. Check other sleepers for alternative jobs."
	outfit = /datum/outfit/tarkon/director
	spawner_job_path = /datum/job/tarkon
	loadout_enabled = TRUE
	quirks_enabled = TRUE
	random_appearance = FALSE
	computer_area = /area/ruin/space/has_grav/port_tarkon

/datum/outfit/tarkon/director //Look at me, I'm the director now.
	name = "Port Tarkon Directors Outfit"
	uniform = /obj/item/clothing/under/tarkon/com
	ears = /obj/item/radio/headset/tarkon/command
	id = /obj/item/card/id/advanced/tarkon/director
	id_trim = /datum/id_trim/away/tarkon/director
	neck = /obj/item/clothing/neck/security_cape/tarkon
	r_pocket = /obj/item/card/id/away/tarkonrobo

/obj/machinery/computer/cryopod/tarkon
	radio = /obj/item/radio/headset/tarkon
	announcement_channel = RADIO_CHANNEL_TARKON
	req_one_access = list("tarkon")

MAPPING_DIRECTIONAL_HELPERS(/obj/machinery/computer/cryopod/tarkon, 32)

////////////////////// Corpse/Mob Spawners Below

/datum/outfit/tarkon/loot
	name = "Dead Tarkon Ensigns Outfit"
	uniform = /obj/item/clothing/under/tarkon/com
	ears = /obj/item/radio/headset/tarkon/command
	id = /obj/item/card/id/advanced/tarkon/ensign
	id_trim = /datum/id_trim/away/tarkon/ensign
	neck = /obj/item/clothing/neck/security_cape/tarkon
	gloves = /obj/item/clothing/gloves/combat
	back = /obj/item/mod/control/pre_equipped/tarkon
	backpack_contents = list(/obj/item/trench_tool)

/obj/effect/mob_spawn/corpse/human/tarkon
	icon_state = "corpseminer"
	outfit = /datum/outfit/tarkon/loot

#define ROLE_TARKALIEN "Xenomorph Hive T-35"

/obj/structure/spawner/tarkon_xenos
	name = "infested warren"
	desc = "A deep tunnel that goes deeper than any light can reach. A distant roaring could be heard within..."
	icon_state = "hole"
	icon = 'icons/mob/simple/lavaland/nest.dmi'
	max_integrity = 500
	max_mobs = 4
	spawn_time = 30 SECONDS
	mob_types = list(
		/mob/living/basic/alien,
		/mob/living/basic/alien/drone,
		/mob/living/basic/alien/sentinel
	)
	spawn_text = "crawls out of"
	faction = list(ROLE_TARKALIEN)
	var/boss_mob = /mob/living/basic/alien/queen/large
	var/loot_drop = /obj/effect/mob_spawn/corpse/human/tarkon

/obj/structure/spawner/tarkon_xenos/atom_deconstruct(disassembled)
	new /obj/effect/nest_break(loc, loot_drop, boss_mob)
	return ..()

/obj/effect/nest_break
	name = "collapsing infested nest"
	desc = "Stop standing and get clear!"
	layer = TABLE_LAYER
	icon = 'icons/mob/simple/lavaland/nest.dmi'
	icon_state = "hole"
	anchored = TRUE
	density = TRUE
	var/boss_mob //Boss mob that spawns after nest breaking
	var/loot_drop //Reward for breaking nest

/obj/effect/nest_break/proc/rustle()
	for(var/mob/shooken in range(7,src))
		shake_camera(shooken, 15, 1)
	playsound(get_turf(src),'sound/effects/explosion/explosionfar.ogg', 200, TRUE)
	visible_message(span_boldannounce("The nest's entrance starts to crumble before something charges forth!"))
	var/mob/living/basic/boss_baby = new boss_mob(loc)
	boss_baby.faction = faction
	new loot_drop(loc)
	qdel(src)

/obj/effect/nest_break/Initialize(mapload, loot_drop, boss_mob)
	. = ..()
	src.loot_drop = loot_drop
	src.boss_mob = boss_mob
	visible_message(span_boldannounce("The nest rumbles violently as the entrance begins to crack and break apart!"))
	playsound(loc,'sound/effects/tendril_destroyed.ogg', 200, FALSE, 50, TRUE, TRUE)
	addtimer(CALLBACK(src, PROC_REF(rustle)), 5 SECONDS, TIMER_DELETE_ME)
	do_jiggle()

/obj/structure/spawner/tarkon_xenos/common
	name = "infested nest"
	desc = "A deep tunnel lined with weeds, something can be heard stirring within..."
	icon_state = "hole"
	icon = 'icons/mob/simple/lavaland/nest.dmi'
	max_integrity = 300
	max_mobs = 2
	spawn_time = 40 SECONDS
	boss_mob = /mob/living/basic/alien/queen
	loot_drop = /obj/effect/spawner/random/astrum/sci_loot/tarkon

/obj/structure/spawner/tarkon_xenos/minor
	name = "infested tunnel"
	desc = "A tunnel lined with weeds, something can be heard clicking deep within..."
	icon_state = "hole"
	icon = 'icons/mob/simple/lavaland/nest.dmi'
	max_integrity = 150
	max_mobs = 1
	spawn_time = 40 SECONDS
	mob_types = list(
		/mob/living/basic/alien,
		/mob/living/basic/alien/drone
	)
	boss_mob = /mob/living/basic/alien/sentinel
	loot_drop = /obj/effect/spawner/random/exotic/technology/tarkon

/obj/effect/spawner/random/astrum/sci_loot/tarkon
	name = "abductor scientist loot"
	loot = list(
		/obj/item/circular_saw/alien = 10,
		/obj/item/retractor/alien = 10,
		/obj/item/scalpel/alien = 10,
		/obj/item/hemostat/alien = 10,
		/obj/item/crowbar/abductor = 10,
		/obj/item/screwdriver/abductor = 10,
		/obj/item/wrench/abductor = 10,
		/obj/item/weldingtool/abductor = 10,
		/obj/item/crowbar/abductor = 10,
		/obj/item/wirecutters/abductor = 10,
		/obj/item/multitool/abductor = 10,
	)

/obj/effect/spawner/random/exotic/technology/tarkon
	spawn_loot_count = 1 //we just need one.
