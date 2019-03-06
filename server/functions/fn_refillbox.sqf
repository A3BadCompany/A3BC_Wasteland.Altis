// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Version: 1.0
//	@file Name: fn_refillbox.sqf  "fn_refillbox"
//	@file Author: [404] Pulse , [404] Costlyy , [404] Deadbeat, AgentRev
//	@file Created: 22/1/2012 00:00
//	@file Args: [OBJECT (Weapons box that needs filling), STRING (Name of the fill to give to object)]

if (!isServer) exitWith {};

#define RANDOM_BETWEEN(START,END) ((START) + floor random ((END) - (START) + 1))
#define RANDOM_ODDS(ODDS) ([0,1] select (random 1 < (ODDS))) // between 0.0 and 1.0

private ["_box", "_boxType", "_boxItems", "_item", "_qty", "_mag"];
_box = _this select 0;
_boxType = _this select 1;

_box setVariable [call vChecksum, true];

_box allowDamage false; // No more fucking busted crates
_box setVariable ["allowDamage", false, true];
_box setVariable ["A3W_inventoryLockR3F", true, true];

// Clear pre-existing cargo first
//clearBackpackCargoGlobal _box;
clearMagazineCargoGlobal _box;
clearWeaponCargoGlobal _box;
clearItemCargoGlobal _box;

if (_boxType == "mission_USSpecial2") then { _boxType = "mission_USSpecial" };

switch (_boxType) do
{
	case "mission_USLaunchers":
	{
		_boxItems =
		[
			// Item type, Item class(es), # of items, # of magazines per weapon
			["wep", ["Laserdesignator", "Laserdesignator_02", "Laserdesignator_03"], 1, 1],
			["wep",[
				"launch_NLAW_F",
				["launch_RPG32_F", "launch_RPG32_ghex_F"],
				["launch_Titan_short_F", "launch_O_Titan_short_F", "launch_I_Titan_short_F", "launch_B_Titan_short_tna_F", "launch_O_Titan_short_ghex_F"],
				["launch_MRAWS_green_rail_F", "launch_MRAWS_olive_rail_F", "launch_MRAWS_sand_rail_F", "launch_MRAWS_green_F", "launch_MRAWS_olive_F", "launch_MRAWS_sand_F"],
				["launch_O_Vorona_brown_F", "launch_O_Vorona_green_F"]
			], RANDOM_BETWEEN(2,5), RANDOM_BETWEEN(1,3)],
			["wep", ["launch_Titan_F", "launch_O_Titan_F", "launch_I_Titan_F", "launch_B_Titan_tna_F", "launch_O_Titan_ghex_F"], RANDOM_BETWEEN(1,2), RANDOM_BETWEEN(1,3)],
			["mag", ["APERSTripMine_Wire_Mag", "APERSBoundingMine_Range_Mag", "APERSMine_Range_Mag", "ClaymoreDirectionalMine_Remote_Mag"], RANDOM_BETWEEN(2,5)],
			["mag", ["SLAMDirectionalMine_Wire_Mag", "ATMine_Range_Mag", "DemoCharge_Remote_Mag", "SatchelCharge_Remote_Mag"], RANDOM_BETWEEN(2,5)],
			["mag", "HandGrenade", RANDOM_BETWEEN(5,10)],
			["mag", "1Rnd_HE_Grenade_shell", RANDOM_BETWEEN(5,10)],
			["itm", [["H_HelmetB", "H_HelmetIA"], ["H_HelmetSpecB", "H_HelmetSpecO_ocamo"], "H_HelmetLeaderO_ocamo"], RANDOM_BETWEEN(1,4)],
			["itm", [
				["V_PlateCarrier1_rgr", "V_PlateCarrier1_blk", "V_PlateCarrierIA1_dgtl"], // Lite
				["V_PlateCarrier2_rgr", "V_PlateCarrier2_blk", "V_PlateCarrierIA2_dgtl"], // Rig
				["V_PlateCarrierSpec_rgr", "V_PlateCarrierSpec_blk", "V_PlateCarrierSpec_mtp"], // Special
				["V_PlateCarrierGL_rgr", "V_PlateCarrierGL_blk", "V_PlateCarrierGL_mtp", "V_PlateCarrierIAGL_dgtl", "V_PlateCarrierIAGL_oli"] // GL
			], RANDOM_BETWEEN(1,4)]
		];
	};
	case "mission_USSpecial":
	{
		_boxItems =
		[
			// Item type, Item class(es), # of items, # of magazines per weapon
			//["itm", "NVGoggles", 5],
			["wep", ["Binocular", "Rangefinder"], RANDOM_BETWEEN(0,3)],
			["itm", "Medikit", RANDOM_BETWEEN(1,3)],
			["itm", "Toolkit", RANDOM_BETWEEN(1,3)],
			["itm", ["optic_Aco", "optic_Aco_grn", "optic_MRCO", "optic_Hamr", "optic_Arco"], RANDOM_BETWEEN(2,4)],
			["itm", ["muzzle_snds_M", "muzzle_snds_H", "muzzle_snds_H_MG", "muzzle_snds_B", "muzzle_snds_acp", ["muzzle_snds_338_black", "muzzle_snds_338_green", "muzzle_snds_338_sand"], ["muzzle_snds_93mmg", "muzzle_snds_93mmg_tan"]], RANDOM_BETWEEN(1,5)],
			["wep", [["MMG_02_sand_F", "MMG_02_camo_F", "MMG_02_black_F"], ["MMG_01_tan_F", "MMG_01_hex_F"]], RANDOM_BETWEEN(2,4), RANDOM_BETWEEN(2,4)],
			["wep", ["LMG_Mk200_F", "LMG_Zafir_F"], RANDOM_BETWEEN(2,4), RANDOM_BETWEEN(2,4)],
			["wep", ["srifle_EBR_F", "srifle_DMR_01_F"], RANDOM_BETWEEN(0,2), RANDOM_BETWEEN(4,8)],
			["wep", ["srifle_LRR_LRPS_F", "srifle_LRR_camo_LRPS_F", "srifle_LRR_tna_LRPS_F", "srifle_GM6_LRPS_F", "srifle_GM6_camo_LRPS_F", "srifle_GM6_ghex_LRPS_F"], RANDOM_BETWEEN(0,2), RANDOM_BETWEEN(6,12)],
			["wep", "arifle_SDAR_F", RANDOM_BETWEEN(0,2), RANDOM_BETWEEN(3,5)],
			["wep", ["hgun_Pistol_heavy_01_F", "hgun_Pistol_heavy_01_MRD_F", "hgun_Pistol_heavy_02_F", "hgun_Pistol_heavy_02_Yorris_F"], RANDOM_BETWEEN(1,3), RANDOM_BETWEEN(4,8)],
			["mag", "30Rnd_556x45_Stanag", RANDOM_BETWEEN(5,10)],
			["mag", "30Rnd_65x39_caseless_mag", RANDOM_BETWEEN(5,10)],
			["mag", "30Rnd_65x39_caseless_green", RANDOM_BETWEEN(5,10)],
			["mag", "9Rnd_45ACP_Mag", RANDOM_BETWEEN(5,10)],
			["mag", "16Rnd_9x21_Mag", RANDOM_BETWEEN(5,10)],
			["itm", [["H_HelmetB", "H_HelmetIA"], ["H_HelmetSpecB", "H_HelmetSpecO_ocamo"], "H_HelmetLeaderO_ocamo"], RANDOM_BETWEEN(1,4)],
			["itm", [
				["V_PlateCarrier1_rgr", "V_PlateCarrier1_blk", "V_PlateCarrierIA1_dgtl"], // Lite
				["V_PlateCarrier2_rgr", "V_PlateCarrier2_blk", "V_PlateCarrierIA2_dgtl"], // Rig
				["V_PlateCarrierSpec_rgr", "V_PlateCarrierSpec_blk", "V_PlateCarrierSpec_mtp"], // Special
				["V_PlateCarrierGL_rgr", "V_PlateCarrierGL_blk", "V_PlateCarrierGL_mtp", "V_PlateCarrierIAGL_dgtl", "V_PlateCarrierIAGL_oli"] // GL
			], RANDOM_BETWEEN(1,4)]
		];
	};
	case "mission_Main_A3snipers":
	{
		_boxItems =
		[
			// Item type, Item class(es), # of items, # of magazines per weapon
			["wep", "Rangefinder", RANDOM_BETWEEN(1,4)],
			["wep", ["srifle_LRR_LRPS_F", "srifle_LRR_camo_LRPS_F", "srifle_LRR_tna_LRPS_F", "srifle_GM6_LRPS_F", "srifle_GM6_camo_LRPS_F", "srifle_GM6_ghex_LRPS_F"], RANDOM_BETWEEN(2,4), RANDOM_BETWEEN(6,12)],
			["wep", [
				["srifle_DMR_02_F", "srifle_DMR_02_camo_F", "srifle_DMR_02_sniper_F"], // MAR-10
				["srifle_DMR_03_F", "srifle_DMR_03_multicam_F", "srifle_DMR_03_khaki_F", "srifle_DMR_03_tan_F", "srifle_DMR_03_woodland_F"], // Mk-I
				["srifle_DMR_05_blk_F", "srifle_DMR_05_hex_F", "srifle_DMR_05_tan_f"], // Cyrus
				["srifle_DMR_06_camo_F", "srifle_DMR_06_olive_F"] // Mk14
			], RANDOM_BETWEEN(0,3), RANDOM_BETWEEN(5,10)],
			["wep", ["srifle_EBR_F", "srifle_DMR_01_F"], RANDOM_BETWEEN(1,3), RANDOM_BETWEEN(5,10)],
			["itm", ["optic_SOS", "optic_DMS", "optic_LRPS"], RANDOM_BETWEEN(2,4)],
			["itm", ["optic_AMS", "optic_AMS_khk", "optic_AMS_snd", "optic_KHS_blk", "optic_KHS_hex", "optic_KHS_tan"], RANDOM_BETWEEN(1,3)],
			["itm", "optic_NVS", RANDOM_BETWEEN(1,3)],
			["itm", ["bipod_01_F_blk", "bipod_01_F_mtp", "bipod_01_F_snd", "bipod_02_F_blk", "bipod_02_F_hex", "bipod_02_F_tan", "bipod_03_F_blk", "bipod_03_F_oli"], RANDOM_BETWEEN(1,4)],
			["itm", ["muzzle_snds_B", ["muzzle_snds_338_black", "muzzle_snds_338_green", "muzzle_snds_338_sand"], ["muzzle_snds_93mmg", "muzzle_snds_93mmg_tan"]], RANDOM_BETWEEN(1,4)],
			["itm", [["H_HelmetB", "H_HelmetIA"], ["H_HelmetSpecB", "H_HelmetSpecO_ocamo"], "H_HelmetLeaderO_ocamo"], RANDOM_BETWEEN(1,4)],
			["itm", [
				["V_PlateCarrier1_rgr", "V_PlateCarrier1_blk", "V_PlateCarrierIA1_dgtl"], // Lite
				["V_PlateCarrier2_rgr", "V_PlateCarrier2_blk", "V_PlateCarrierIA2_dgtl"], // Rig
				["V_PlateCarrierSpec_rgr", "V_PlateCarrierSpec_blk", "V_PlateCarrierSpec_mtp"], // Special
				["V_PlateCarrierGL_rgr", "V_PlateCarrierGL_blk", "V_PlateCarrierGL_mtp", "V_PlateCarrierIAGL_dgtl", "V_PlateCarrierIAGL_oli"] // GL
			], RANDOM_BETWEEN(1,4)]
		];
	};
	case "APOC_boxWeapons_arifle":
	{
		_boxItems =
		[
			// Item type, Item class(es), # of items, # of magazines per weapon
			["wep", "Laserdesignator", 1],
			["wep", "hgun_Pistol_heavy_01_F", 1,5],
			["wep", "arifle_SDAR_F", 1,5],
			["wep", "arifle_Mk20C_plain_F", 1,5],
			["wep", "arifle_Mk20C_F", 1,5],
			["wep", "arifle_Mk20_plain_F", 1,5],
			["wep", "arifle_Mk20_F", 1,5],
			["wep", "arifle_Mk20_GL_plain_F", 1,5],
			["wep", "arifle_Mk20_GL_F", 1,5],
			["wep", "arifle_TRG20_F", 1,5],
			["wep", "arifle_TRG21_F", 1,5],
			["wep", "arifle_TRG21_GL_F", 1,5],
			["wep", "arifle_Katiba_C_F", 1,5],
			["wep", "arifle_Katiba_F", 1,5],
			["wep", "arifle_Katiba_GL_F", 1,5],
			["wep", "arifle_MXC_F", 1,5],
			["wep", "arifle_MXC_Black_F", 1,5],
			["wep", "arifle_MXC_khk_F", 1,5],
			["wep", "arifle_MX_F", 1,5],
			["wep", "arifle_MX_Black_F", 1,5],
			["wep", "arifle_MX_khk_F", 1,5],
			["wep", "arifle_MX_GL_F", 1,5],
			["wep", "arifle_MX_GL_Black_F", 1,5],
			["wep", "arifle_MX_GL_khk_F", 1,5],
			["wep", "arifle_SPAR_01_blk_F", 1,5],
			["wep", "arifle_SPAR_01_khk_F", 1,5],
			["wep", "arifle_SPAR_01_snd_F", 1,5],
			["wep", "arifle_SPAR_01_GL_blk_F", 1,5],
			["wep", "arifle_SPAR_01_GL_khk_F", 1,5],
			["wep", "arifle_SPAR_01_GL_snd_F", 1,5],
			["wep", "arifle_CTAR_blk_F", 1,5],
			["wep", "arifle_CTAR_hex_F", 1,5],
			["wep", "arifle_CTAR_ghex_F", 1,5],
			["wep", "arifle_CTAR_GL_blk_F", 1,5],
			["wep", "arifle_CTAR_GL_hex_F", 1,5],
			["wep", "arifle_CTAR_GL_ghex_F", 1,5],
			["wep", "arifle_ARX_blk_F", 1,5],
			["wep", "arifle_ARX_hex_F", 1,5],
			["wep", "arifle_ARX_ghex_F", 1,5],
			["wep", "arifle_AKS_F", 1,5],
			["wep", "arifle_AKM_F", 1,5],
			["wep", "arifle_AK12_F", 1,5],
			["wep", "arifle_AK12_GL_F", 1,5],
			["wep", "arifle_MXM_F", 1,5],
			["wep", "arifle_MXM_Black_F", 1,5],
			["wep", "arifle_MXM_khk_F", 1,5],
			["wep", "arifle_SPAR_03_blk_F", 1,5],
			["wep", "arifle_SPAR_03_khk_F", 1,5],
			["wep", "arifle_SPAR_03_snd_F", 1,5],
			["wep", "arifle_MX_SW_F", 1,5],
			["wep", "arifle_MX_SW_Black_F", 1,5],
			["wep", "arifle_MX_SW_khk_F", 1,5],
			["wep", "arifle_SPAR_02_blk_F", 1,5],
			["wep", "arifle_SPAR_02_khk_F", 1,5],
			["wep", "arifle_SPAR_02_snd_F", 1,5],
			["wep", "arifle_CTARS_blk_F", 1,5],
			["wep", "arifle_CTARS_hex_F", 1,5],
			["wep", "arifle_CTARS_ghex_F", 1,5],
			["mag", "3Rnd_HE_Grenade_shell", 10],
			["mag", "1Rnd_HE_Grenade_shell", 10],
			["mag", "SmokeShell", 10],
			["mag", "MiniGrenade", 10],
			["mag", "HandGrenade", 10],
			["itm", "optic_MRD", 1],
			["itm", "optic_aco_smg", 1],
			["itm", "optic_Aco", 1],
			["itm", "optic_Holosight_smg", 1],
			["itm", "optic_MRCO", 1],
			["itm", "optic_ERCO_blk_F", 1],
			["itm", "optic_Arco", 1],
			["itm", "optic_Hamr", 1],
			["itm", "optic_SOS", 1],
			["itm", "optic_DMS", 1],
			["itm", "optic_KHS_old", 1],
			["itm", "optic_AMS", 1],
			["itm", "optic_LRPS", 1],
			["itm", "optic_NVS", 1],
			["itm", "muzzle_snds_acp", 1]
		];
	};
	case "APOC_boxWeapons_srifle":
	{
		_boxItems =
		[
			// Item type, Item class(es), # of items, # of magazines per weapon
			["wep", "Laserdesignator", 1],
			["wep", "hgun_Pistol_heavy_01_F", 1,5],
			["wep", "srifle_DMR_01_F", 1,10],
			["wep", "srifle_EBR_F", 1,10],
			["wep", "srifle_DMR_07_blk_F", 1,10],
			["wep", "srifle_DMR_07_hex_F", 1,10],
			["wep", "srifle_DMR_07_ghex_F", 1,10],
			["wep", "srifle_DMR_06_camo_F", 1,10],
			["wep", "srifle_DMR_06_olive_F", 1,10],
			["wep", "srifle_DMR_03_F", 1,10],
			["wep", "srifle_DMR_03_multicam_F", 1,10],
			["wep", "srifle_DMR_03_khaki_F", 1,10],
			["wep", "srifle_DMR_03_tan_F", 1,10],
			["wep", "srifle_DMR_03_woodland_F", 1,10],
			["wep", "srifle_DMR_02_F", 1,10],
			["wep", "srifle_DMR_02_camo_F", 1,10],
			["wep", "srifle_DMR_02_sniper_F", 1,10],
			["wep", "srifle_DMR_05_blk_F", 1,10],
			["wep", "srifle_DMR_05_hex_F", 1,10],
			["wep", "srifle_DMR_05_tan_f", 1,10],
			["wep", "srifle_LRR_LRPS_F", 1,10],
			["wep", "srifle_LRR_camo_LRPS_F", 1,10],
			["wep", "srifle_LRR_tna_LRPS_F", 1,10],
			["wep", "srifle_GM6_LRPS_F", 1,10],
			["wep", "srifle_GM6_camo_LRPS_F", 1,10],
			["wep", "srifle_GM6_ghex_LRPS_F", 1,10],
			["wep", "srifle_DMR_04_F", 1,10],
			["wep", "srifle_DMR_04_tan_F", 1,10],
			["mag", "SmokeShell", 10],
			["mag", "MiniGrenade", 10],
			["mag", "HandGrenade", 10],
			["itm", "optic_MRD", 1],
			["itm", "optic_aco_smg", 1],
			["itm", "optic_Aco", 1],
			["itm", "optic_Holosight_smg", 1],
			["itm", "optic_MRCO", 1],
			["itm", "optic_ERCO_blk_F", 1],
			["itm", "optic_Arco", 1],
			["itm", "optic_Hamr", 1],
			["itm", "optic_SOS", 1],
			["itm", "optic_DMS", 1],
			["itm", "optic_KHS_old", 1],
			["itm", "optic_AMS", 1],
			["itm", "optic_LRPS", 1],
			["itm", "optic_NVS", 1],
			["itm", "muzzle_snds_acp", 1]
		];
	};
	case "APOC_boxWeapons_lmg_mmg":
	{
		_boxItems =
		[
			// Item type, Item class(es), # of items, # of magazines per weapon
			["wep", "Laserdesignator", 1],
			["wep", "hgun_Pistol_heavy_01_F", 1,5],
			["wep", "LMG_Mk200_F", 1,5],
			["wep", "LMG_Zafir_F", 1,5],
			["wep", "LMG_03_F", 1,5],
			["wep", "MMG_02_sand_F", 1,5],
			["wep", "MMG_02_camo_F", 1,5],
			["wep", "MMG_02_black_F", 1,5],
			["wep", "MMG_01_tan_F", 1,5],
			["wep", "MMG_01_hex_F", 1,5],
			["mag", "SmokeShell", 10],
			["mag", "MiniGrenade", 10],
			["mag", "HandGrenade", 10],
			["itm", "optic_MRD", 1],
			["itm", "optic_aco_smg", 1],
			["itm", "optic_Aco", 1],
			["itm", "optic_Holosight_smg", 1],
			["itm", "optic_MRCO", 1],
			["itm", "optic_ERCO_blk_F", 1],
			["itm", "optic_Arco", 1],
			["itm", "optic_Hamr", 1],
			["itm", "optic_SOS", 1],
			["itm", "optic_DMS", 1],
			["itm", "optic_KHS_old", 1],
			["itm", "optic_AMS", 1],
			["itm", "optic_LRPS", 1],
			["itm", "optic_NVS", 1],
			["itm", "muzzle_snds_acp", 1]
		];
	};
	case "APOC_boxLaunchers":
	{
		_boxItems =
		[
			// Item type, Item class(es), # of items, # of magazines per weapon
			["wep", "Laserdesignator", 1],
			["wep", "hgun_Pistol_heavy_01_F", 1,5],
			["wep", "launch_RPG32_F", 1,2],
			["wep", "launch_RPG32_ghex_F", 1,2],
			["wep", "launch_NLAW_F", 1,2],
			["wep", "launch_MRAWS_sand_rail_F", 1,2],
			["wep", "launch_MRAWS_sand_F", 1,2],
			["wep", "launch_O_Vorona_brown_F", 1,2],
			["wep", "launch_Titan_short_F", 1,2],
			["wep", "launch_Titan_F", 1,2],
			["mag", "SmokeShell", 10],
			["mag", "MiniGrenade", 10],
			["mag", "HandGrenade", 10],
			["itm", "optic_MRD", 1],
			["itm", "muzzle_snds_acp", 1]
		];
	};
};

[_box, _boxItems] call processItems;

if (["A3W_artilleryStrike"] call isConfigOn) then
{
	if (random 1.0 < ["A3W_artilleryCrateOdds", 1/10] call getPublicVar) then
	{
		_box setVariable ["artillery", 1, true];
	};
};
