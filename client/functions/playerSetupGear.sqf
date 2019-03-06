// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Name: playerSetupGear.sqf
//	@file Author: [GoT] JoSchaap, AgentRev
//  @file Modifications to LEVEL LOADOUTS: [BC]CeccaTTo

private ["_player", "_bmoney", "_playerScore", "_uniform", "_headgear"];
_player = _this;
_bmoney = _player getVariable ["bmoney", 0];
_playerScore = (([_player, "playerKills"] call fn_getScore) - ([_player, "teamKills"] call fn_getScore));
_uniform = [_player, "uniform"] call getDefaultClothing;
_headgear = [_player, "headgear"] call getDefaultClothing;

if (_uniform != "") then { _player addUniform _uniform };
if (_headgear != "") then { _player addHeadgear _headgear };

sleep 0.1;

switch (true) do {
	case (_bmoney >= 0 && _bmoney <= 9999999): {
		removeAllItems _player;
		removeAllWeapons _player;
		removeVest _player;
		removeBackpack _player;
		removeAllWeapons _player;
		removeVest _player;
		removeBackpack _player;
		_player addVest "V_HarnessO_brn";
		_player addBackpack "B_FieldPack_blk";
		_player addWeapon "Binocular";
		_player addItem "FirstAidKit";
		_player addItem "SmokeShell";
		_player addMagazine "30Rnd_556x45_Stanag";
		_player addMagazine "1Rnd_HE_Grenade_shell";
		_player addWeapon "arifle_Mk20_GL_plain_F";
		_player addMagazine "30Rnd_556x45_Stanag";
		_player addMagazine "30Rnd_556x45_Stanag";
		_player addMagazine "1Rnd_HE_Grenade_shell";
		_player addMagazine "1Rnd_HE_Grenade_shell";
		_player addMagazine "9Rnd_45ACP_Mag";
		_player addWeapon "hgun_ACPC2_F";
		_player addMagazine "9Rnd_45ACP_Mag";
		_player addMagazine "9Rnd_45ACP_Mag";
		_player addPrimaryWeaponItem "optic_Aco";
	};
	case (_bmoney >= 10000000 && _bmoney <= 19999999): {
		removeAllItems _player;
		removeAllWeapons _player;
		removeVest _player;
		removeBackpack _player;
		removeAllWeapons _player;
		removeVest _player;
		removeBackpack _player;
		_player addVest "V_HarnessO_brn";
		_player addBackpack "B_FieldPack_blk";
		_player addWeapon "Binocular";
		_player addItem "FirstAidKit";
		_player addItem "SmokeShell";
		_player addMagazine "30Rnd_556x45_Stanag";
		_player addMagazine "1Rnd_HE_Grenade_shell";
		_player addWeapon "arifle_TRG21_GL_F";
		_player addMagazine "30Rnd_556x45_Stanag";
		_player addMagazine "30Rnd_556x45_Stanag";
		_player addMagazine "1Rnd_HE_Grenade_shell";
		_player addMagazine "1Rnd_HE_Grenade_shell";
		_player addMagazine "9Rnd_45ACP_Mag";
		_player addWeapon "hgun_ACPC2_F";
		_player addMagazine "9Rnd_45ACP_Mag";
		_player addMagazine "9Rnd_45ACP_Mag";
		_player addPrimaryWeaponItem "optic_Aco";
	};
	case (_bmoney >= 20000000 && _bmoney <= 29999999): {
		removeAllItems _player;
		removeAllWeapons _player;
		removeVest _player;
		removeBackpack _player;
		removeAllWeapons _player;
		removeVest _player;
		removeBackpack _player;
		_player addVest "V_HarnessO_brn";
		_player addBackpack "B_FieldPack_blk";
		_player addWeapon "Binocular";
		_player addItem "FirstAidKit";
		_player addItem "SmokeShell";
		_player addMagazine "200Rnd_556x45_Box_F";
		_player addWeapon "LMG_03_F";
		_player addMagazine "200Rnd_556x45_Box_F";
		_player addMagazine "9Rnd_45ACP_Mag";
		_player addWeapon "hgun_ACPC2_F";
		_player addMagazine "9Rnd_45ACP_Mag";
		_player addMagazine "9Rnd_45ACP_Mag";
		_player addPrimaryWeaponItem "optic_ERCO_blk_F";
	};
	case (_bmoney >= 30000000 && _bmoney <= 39999999): {
		removeAllItems _player;
		removeAllWeapons _player;
		removeVest _player;
		removeBackpack _player;
		removeAllWeapons _player;
		removeVest _player;
		removeBackpack _player;
		_player addVest "V_HarnessO_brn";
		_player addBackpack "B_FieldPack_blk";
		_player addWeapon "Binocular";
		_player addItem "FirstAidKit";
		_player addItem "SmokeShell";
		_player addMagazine "30Rnd_65x39_caseless_green";
		_player addMagazine "1Rnd_HE_Grenade_shell";
		_player addWeapon "arifle_Katiba_GL_F";
		_player addMagazine "30Rnd_65x39_caseless_green";
		_player addMagazine "30Rnd_65x39_caseless_green";
		_player addMagazine "1Rnd_HE_Grenade_shell";
		_player addMagazine "1Rnd_HE_Grenade_shell";
		_player addMagazine "9Rnd_45ACP_Mag";
		_player addWeapon "hgun_ACPC2_F";
		_player addMagazine "9Rnd_45ACP_Mag";
		_player addMagazine "9Rnd_45ACP_Mag";
		_player addPrimaryWeaponItem "optic_Arco";
	};
	case (_bmoney >= 40000000 && _bmoney <= 49999999): {
		removeAllItems _player;
		removeAllWeapons _player;
		removeVest _player;
		removeBackpack _player;
		removeAllWeapons _player;
		removeVest _player;
		removeBackpack _player;
		_player addVest "V_HarnessO_brn";
		_player addBackpack "B_FieldPack_blk";
		_player addWeapon "Binocular";
		_player addItem "FirstAidKit";
		_player addItem "SmokeShell";
		_player addMagazine "30Rnd_65x39_caseless_mag";
		_player addMagazine "3Rnd_HE_Grenade_shell";
		_player addWeapon "arifle_MX_GL_F";
		_player addMagazine "30Rnd_65x39_caseless_mag";
		_player addMagazine "30Rnd_65x39_caseless_mag";
		_player addMagazine "3Rnd_HE_Grenade_shell";
		_player addMagazine "3Rnd_HE_Grenade_shell";
		_player addMagazine "9Rnd_45ACP_Mag";
		_player addWeapon "hgun_ACPC2_F";
		_player addMagazine "9Rnd_45ACP_Mag";
		_player addMagazine "9Rnd_45ACP_Mag";
		_player addPrimaryWeaponItem "optic_Arco";
	};	
	case (_bmoney >= 50000000 && _bmoney <= 59999999): {
		removeAllItems _player;
		removeAllWeapons _player;
		removeVest _player;
		removeBackpack _player;
		removeAllWeapons _player;
		removeVest _player;
		removeBackpack _player;
		_player addVest "V_HarnessO_brn";
		_player addBackpack "B_FieldPack_blk";
		_player addWeapon "Binocular";
		_player addItem "FirstAidKit";
		_player addItem "SmokeShell";
		_player addMagazine "200Rnd_65x39_cased_Box";
		_player addWeapon "LMG_Mk200_F";
		_player addMagazine "200Rnd_65x39_cased_Box";
		_player addMagazine "9Rnd_45ACP_Mag";
		_player addWeapon "hgun_ACPC2_F";
		_player addMagazine "9Rnd_45ACP_Mag";
		_player addMagazine "9Rnd_45ACP_Mag";
		_player addPrimaryWeaponItem "optic_Hamr";
	};
	case (_bmoney >= 60000000 && _bmoney <= 69999999): {
		removeAllItems _player;
		removeAllWeapons _player;
		removeVest _player;
		removeBackpack _player;
		removeAllWeapons _player;
		removeVest _player;
		removeBackpack _player;
		_player addVest "V_HarnessO_brn";
		_player addBackpack "B_FieldPack_blk";
		_player addWeapon "Binocular";
		_player addItem "FirstAidKit";
		_player addItem "SmokeShell";
		_player addMagazine "30Rnd_762x39_Mag_F";
		_player addMagazine "1Rnd_HE_Grenade_shell";
		_player addWeapon "arifle_AK12_GL_F";
		_player addMagazine "30Rnd_762x39_Mag_F";
		_player addMagazine "30Rnd_762x39_Mag_F";
		_player addMagazine "1Rnd_HE_Grenade_shell";
		_player addMagazine "1Rnd_HE_Grenade_shell";
		_player addMagazine "9Rnd_45ACP_Mag";
		_player addWeapon "hgun_ACPC2_F";
		_player addMagazine "9Rnd_45ACP_Mag";
		_player addMagazine "9Rnd_45ACP_Mag";
		_player addPrimaryWeaponItem "optic_Hamr";
	};
	case (_bmoney >= 70000000 && _bmoney <= 79999999): {
		removeAllItems _player;
		removeAllWeapons _player;
		removeVest _player;
		removeBackpack _player;
		removeAllWeapons _player;
		removeVest _player;
		removeBackpack _player;
		_player addVest "V_HarnessO_brn";
		_player addBackpack "B_FieldPack_blk";
		_player addWeapon "Binocular";
		_player addItem "FirstAidKit";
		_player addItem "SmokeShell";
		_player addMagazine "150Rnd_762x54_Box";
		_player addWeapon "LMG_Zafir_F";
		_player addMagazine "150Rnd_762x54_Box";
		_player addMagazine "9Rnd_45ACP_Mag";
		_player addWeapon "hgun_ACPC2_F";
		_player addMagazine "9Rnd_45ACP_Mag";
		_player addMagazine "9Rnd_45ACP_Mag";
		_player addPrimaryWeaponItem "optic_DMS";
	};
	case (_bmoney >= 80000000 && _bmoney <= 89999999): {
		removeAllItems _player;
		removeAllWeapons _player;
		removeVest _player;
		removeBackpack _player;
		removeAllWeapons _player;
		removeVest _player;
		removeBackpack _player;
		_player addVest "V_HarnessO_brn";
		_player addBackpack "B_FieldPack_blk";
		_player addWeapon "Binocular";
		_player addItem "FirstAidKit";
		_player addItem "SmokeShell";
		_player addMagazine "130Rnd_338_Mag";
		_player addWeapon "MMG_02_sand_F";
		_player addMagazine "130Rnd_338_Mag";
		_player addMagazine "9Rnd_45ACP_Mag";
		_player addWeapon "hgun_ACPC2_F";
		_player addMagazine "9Rnd_45ACP_Mag";
		_player addMagazine "9Rnd_45ACP_Mag";
		_player addPrimaryWeaponItem "optic_AMS";
	};
	case (_bmoney >= 90000000 && _bmoney <= 100000000): {
		removeAllItems _player;
		removeAllWeapons _player;
		removeVest _player;
		removeBackpack _player;
		removeAllWeapons _player;
		removeVest _player;
		removeBackpack _player;
		_player addVest "V_HarnessO_brn";
		_player addBackpack "B_FieldPack_blk";
		_player addWeapon "Binocular";
		_player addItem "FirstAidKit";
		_player addItem "SmokeShell";
		_player addMagazine "150Rnd_93x64_Mag";
		_player addWeapon "MMG_01_tan_F";
		_player addMagazine "150Rnd_93x64_Mag";
		_player addMagazine "9Rnd_45ACP_Mag";
		_player addWeapon "hgun_ACPC2_F";
		_player addMagazine "9Rnd_45ACP_Mag";
		_player addMagazine "9Rnd_45ACP_Mag";
		_player addPrimaryWeaponItem "optic_AMS";
	};
};

switch (true) do {
	case (["_medic_", typeOf _player] call fn_findString != -1):
	{
		_player removeItem "FirstAidKit";
		_player addItem "Medikit";
	};
	case (["_engineer_", typeOf _player] call fn_findString != -1):
	{
		_player addItem "MineDetector";
		_player addItem "Toolkit";
	};
	case (["_sniper_", typeOf _player] call fn_findString != -1):
	{
		_player removeItem "Binocular";
		_player addWeapon "Rangefinder";
	};
};

switch (true) do {
	case (_playerScore >= 100 && _playerScore <= 149): {
		_player addItem "MiniGrenade";
		_player addItem "HandGrenade";
	};
	case (_playerScore >= 150 && _playerScore <= 199): {
		_player addItem "MiniGrenade";
		_player addItem "MiniGrenade";
		_player addItem "HandGrenade";
		_player addItem "HandGrenade";
	};
	case (_playerScore >= 200 && _playerScore <= 249): {
		_player addItem "MiniGrenade";
		_player addItem "HandGrenade";
		_player addItem "APERSTripMine_Wire_Mag";
	};
	case (_playerScore >= 250 && _playerScore <= 299): {
		_player addItem "MiniGrenade";
		_player addItem "HandGrenade";
		_player addItem "APERSBoundingMine_Range_Mag";
	};
	case (_playerScore >= 300 && _playerScore <= 349): {
		_player addItem "MiniGrenade";
		_player addItem "HandGrenade";
		_player addItem "APERSMine_Range_Mag";
	};
	case (_playerScore >= 350 && _playerScore <= 399): {
		_player addItem "MiniGrenade";
		_player addItem "HandGrenade";
		_player addItem "ClaymoreDirectionalMine_Remote_Mag";
	};
	case (_playerScore >= 400 && _playerScore <= 449): {
		_player addItem "MiniGrenade";
		_player addItem "HandGrenade";
		_player addItem "SLAMDirectionalMine_Wire_Mag";
	};
	case (_playerScore >= 450 && _playerScore <= 499): {
		_player addItem "MiniGrenade";
		_player addItem "HandGrenade";
		_player addItem "DemoCharge_Remote_Mag";
	};
	case (_playerScore >= 500 && _playerScore <= 999): {
		_player addItem "MiniGrenade";
		_player addItem "HandGrenade";
		_player addItem "DemoCharge_Remote_Mag";
		_player addMagazine "RPG32_F";
		_player addWeapon "launch_RPG32_F";
		_player addMagazine "RPG32_F";
	};
	case (_playerScore >= 1000): {
		_player removeItem "Binocular";
		_player removeItem "Rangefinder";
		_player addMagazine "Laserbatteries";
		_player addWeapon "Laserdesignator";
		_player addItem "MiniGrenade";
		_player addItem "HandGrenade";
		_player addItem "DemoCharge_Remote_Mag";
		_player addMagazine "RPG32_HE_F";
		_player addWeapon "launch_RPG32_F";
		_player addMagazine "RPG32_HE_F";
	};
};

if (_player == player) then
{
	thirstLevel = 100;
	hungerLevel = 100;
};