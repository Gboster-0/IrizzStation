//DO NOT CHANGE THOSE LISTS UNLESS YOU KNOW WHAT YOURE DOING (will mess savefiles)

GLOBAL_LIST_INIT(marking_zone_to_bitflag, list(
	BODY_ZONE_HEAD = HEAD,
	BODY_ZONE_CHEST = CHEST,
	BODY_ZONE_L_LEG = LEG_LEFT,
	BODY_ZONE_R_LEG = LEG_RIGHT,
	BODY_ZONE_L_ARM = ARM_LEFT,
	BODY_ZONE_R_ARM = ARM_RIGHT,
	BODY_ZONE_PRECISE_L_HAND = HAND_LEFT,
	BODY_ZONE_PRECISE_R_HAND = HAND_RIGHT
	))

GLOBAL_LIST_INIT(marking_zones, list(
	BODY_ZONE_HEAD,
	BODY_ZONE_CHEST,
	BODY_ZONE_L_LEG,
	BODY_ZONE_R_LEG,
	BODY_ZONE_L_ARM,
	BODY_ZONE_R_ARM,
	BODY_ZONE_PRECISE_L_HAND,
	BODY_ZONE_PRECISE_R_HAND,
	))

// IRIS EDIT: Added "Advanced" reskin
GLOBAL_LIST_INIT(robotic_styles_list, list(
	"None" = "None",
	"Surplus" = 'icons/mob/augmentation/surplus_augments.dmi',
	"Cyborg" = 'icons/mob/augmentation/augments.dmi',
	"Advanced" = 'modular_iris/master_files/icons/mob/augmentation/advanced_augments.dmi',
	"Engineering" = 'icons/mob/augmentation/augments_engineer.dmi',
	"Mining" = 'icons/mob/augmentation/augments_mining.dmi',
	"Security" = 'icons/mob/augmentation/augments_security.dmi',
	"Morpheus Cyberkinetics" = 'modular_nova/master_files/icons/mob/augmentation/mcgipc.dmi',
	"Bishop Cyberkinetics" = 'modular_nova/master_files/icons/mob/augmentation/bshipc.dmi',
	"Bishop Cyberkinetics 2.0" = 'modular_nova/master_files/icons/mob/augmentation/bs2ipc.dmi',
	"E3N AI" = 'modular_nova/master_files/icons/mob/augmentation/e3n.dmi',
	"Hephaestus Industries" = 'modular_nova/master_files/icons/mob/augmentation/hsiipc.dmi',
	"Hephaestus Industries 2.0" = 'modular_nova/master_files/icons/mob/augmentation/hi2ipc.dmi',
	"Shellguard Munitions Standard Series" = 'modular_nova/master_files/icons/mob/augmentation/sgmipc.dmi',
	"Ward-Takahashi Manufacturing" = 'modular_nova/master_files/icons/mob/augmentation/wtmipc.dmi',
	"Xion Manufacturing Group" = 'modular_nova/master_files/icons/mob/augmentation/xmgipc.dmi',
	"Xion Manufacturing Group 2.0" = 'modular_nova/master_files/icons/mob/augmentation/xm2ipc.dmi',
	"Zeng-Hu Pharmaceuticals" = 'modular_nova/master_files/icons/mob/augmentation/zhpipc.dmi',
	"Mariinsky Ballet Company" = 'modular_nova/master_files/icons/mob/augmentation/mariinskyipc.dmi',
	"Zhenkov & Co. Foundries" = 'modular_nova/master_files/icons/mob/augmentation/zhenkovipc.dmi',
	"Zhenkov & Co. Foundries - Dark" = 'modular_nova/master_files/icons/mob/augmentation/zhenkovipc_dark.dmi',
	))

//ghoul colors
GLOBAL_LIST_INIT(color_list_ghoul, list( \
	"Necrotic Green" = "bfc474", \
	"Rotting Tan" = "c4af7c", \
	"Plutonium Blue" = "a5cfcc", \
	"Marked Red" = "f05b68" \
))
