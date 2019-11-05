rp.Config = rp.Config or {}

-- currency abbreviation with space or not for symbols
rp.Config.Currency = " RUR"

rp.Config.StartMoney = 500

rp.Config.StartModels = {
    "models/player/Group01/male_02.mdl", 
    "models/player/Group01/male_06.mdl",
    "models/player/Group01/male_07.mdl",
    "models/player/Group01/male_03.mdl",
    "models/player/Group01/female_01.mdl",
    "models/player/Group01/female_02.mdl",
    "models/player/Group01/female_03.mdl",
    "models/player/Group01/female_06.mdl"
}
       
rp.Config.PropBlacklist = {
	["models/props_combine/combinetrain02b.mdl"] = true,
	["models/props_combine/combinetrain02a.mdl"] = true,
	["models/props_combine/combinetrain01.mdl"] = true,
	["models/cranes/crane_frame.mdl"] = true,
	["models/props_wasteland/cargo_container01.mdl"] = true,
	["models/props_junk/trashdumpster02.mdl"] = true,
	["models/props_c17/oildrum001_explosive.mdl"] = true,
	["models/props_canal/canal_bridge02.mdl"] = true,
	["models/props_canal/canal_bridge01.mdl"] = true,
	["models/props_canal/canal_bridge03a.mdl"] = true,
	["models/props_canal/canal_bridge03b.mdl"] = true,
	["models/props_wasteland/cargo_container01.mdl"] = true,
	["models/props_wasteland/cargo_container01c.mdl"] = true,
	["models/props_wasteland/cargo_container01b.mdl"] = true,
	["models/props_combine/combine_mine01.mdl"] = true,
	["models/props_junk/glassjug01.mdl"] = true,
	["models/props_c17/paper01.mdl"] = true,
	["models/props_junk/garbage_takeoutcarton001a.mdl"] = true,
	["models/props_c17/trappropeller_engine.mdl"] = true,
	["models/props/cs_office/microwave.mdl"] = true,
	["models/items/item_item_crate.mdl"] = true,
	["models/props_junk/gascan001a.mdl"] = true,
	["models/props_c17/consolebox01a.mdl"] = true,
	["models/props_buildings/building_002a.mdl"] = true,
	["models/props_phx/mk-82.mdl"] = true,
	["models/props_phx/cannonball.mdl"] = true,
	["models/props_phx/ball.mdl"] = true,
	["models/props_phx/amraam.mdl"] = true,
	["models/props_phx/misc/flakshell_big.mdl"] = true,
	["models/props_phx/ww2bomb.mdl"] = true,
	["models/props_phx/torpedo.mdl"] = true,
	["models/props/de_train/biohazardtank.mdl"] = true,
	["models/props_buildings/project_building01.mdl"] = true,
	["models/props_combine/prison01c.mdl"] = true,
	["models/props/cs_militia/silo_01.mdl"] = true,
	["models/props_phx/huge/evildisc_corp.mdl"] = true,
	["models/props_phx/misc/potato_launcher_explosive.mdl"] = true,
	["models/props_combine/combine_citadel001.mdl"] = true,
	["models/props_phx/oildrum001_explosive.mdl"] = true
}

rp.Config.DropDisallow = {
    ["gmod_camera"] = true,
    ["gmod_tool"] = true,
    ["stunstick"] = true,
    ["weapon_physcannon"] = true,
    ["weapon_physgun"] = true,
}