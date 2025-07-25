/datum/config_entry/string/blackoutpolicy
	config_entry_value = "You remember nothing after you've blacked out and you do not remember who or what events killed you, however, you can have faint recollection of what led up to it."

/datum/config_entry/flag/russian_text_formation

// Overflow server HARD pop cap
/datum/config_entry/number/player_hard_cap

// Overflow server SOFT pop cap - Notifiaction to join the overflow
/datum/config_entry/number/player_soft_cap

// Overflow server IP
/datum/config_entry/string/overflow_server_ip

// Do we broadcast our OOC to all dem servers in cross servers?
/datum/config_entry/flag/enable_cross_server_ooc

// Do we broadcast our asay to all dem servers in cross servers?
/datum/config_entry/flag/enable_cross_server_asay

// Name of our server, ooc.
/datum/config_entry/string/cross_server_name

// DISCORD GAME ALERT CONFIGS
// Role id to ping
/datum/config_entry/string/game_alert_role_id

// Reaction roles channel
/datum/config_entry/string/role_assign_channel_id

// To turn off SSDecay based on a config. You're welcome.
/datum/config_entry/flag/ssdecay_disabled

// To turn off SSDecay nests based on a config. If SSDecay is disabled, this won't matter.
/datum/config_entry/flag/ssdecay_disable_nests

// Turn on/off guncargo permit-locked firing pins
/datum/config_entry/flag/permit_pins

// Disables the ability to commit suicide
/datum/config_entry/flag/disable_suicide

/// Disables the stationary singularity created by bag of holding tears
/datum/config_entry/flag/disable_stationary_boh_singularity

/// The gravitational pull of the stationary singularity created by bag of holding tears. TG's default is 21.
/datum/config_entry/number/stationary_boh_singularity_grav_pull
	default = 4

/// Disables bagulo (the singularity created by bag of holding tears)
/datum/config_entry/flag/disable_roaming_boh_singularity

/// Config entry for enabling flavortext min character count, good to disable for debugging purposes
// DISABLE THIS instead of setting flavor_text_character_requirement to 0 or I'll chop your arms off
/datum/config_entry/flag/min_flavor_text
	default = FALSE

/// Config entry for enabling flavortext min character count, good to disable for debugging purposes
// NEVER set this value to 0!!
/datum/config_entry/number/flavor_text_character_requirement
	default = 150

/// Defines whether or not mentors can see ckeys alongside mobnames.
/datum/config_entry/flag/mentors_mobname_only

/// Defines whether the server uses the legacy donator system with donators.txt or the SQL system.
/datum/config_entry/flag/donator_legacy_system
	protection = CONFIG_ENTRY_LOCKED

/// Defines whether the server uses the legacy mentor system with mentors.txt or the SQL system.
/datum/config_entry/flag/mentor_legacy_system
	protection = CONFIG_ENTRY_LOCKED

/// Defines whether the server uses the legacy star system with nova_star_players.txt or the SQL system.
/datum/config_entry/flag/nova_star_legacy_system
	protection = CONFIG_ENTRY_LOCKED

/// RUIN BUDGETS ///
/datum/config_entry/number/jungle_budget
	default = 2
	integer = FALSE
	min_val = 0

/datum/config_entry/number/jungle_cave_budget
	default = 2
	integer = FALSE
	min_val = 0

/// Defines whether or not the whitelist (if configured using USEWHITELIST) uses the SQL system.
/datum/config_entry/flag/sql_whitelist
	protection = CONFIG_ENTRY_LOCKED

/// Message that gets displayed to non-whitelisted players when they try to join the server
/// while it has an active whitelist. The \n allows the message to be displayed on a separate line,
/// to make it more readable in the BYOND window.
/datum/config_entry/string/missing_whitelist_message
	default = "\nThis server requires you to be whitelisted in order to be allowed to play. Apply on our Discord by simply filling the Access Request form from the #application-instructions channel under the 'Landing Zone' category. Here's the invite link: https://discord.gg/novasector"
