// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Name: storeOwners.sqf
//	@file Author: AgentRev, JoSchaap, His_Shadow

// Notes: Gun and general stores have position of spawned crate, vehicle stores have an extra air spawn direction
//
// Array contents are as follows:
// Name, Building Position, Desk Direction (or [Desk Direction, Front Offset]), Excluded Buttons
storeOwnerConfig = compileFinal str
[
	["GenStore1", 6, 240, []],
	["GenStore2", 6, 250, []],
	["GenStore3", 6, 45, []],
	["GenStore4", 0, 265, []],
	["GenStore5", 5, 350, []],
	["GenStore6", 6, 43, []],
	["GenStore7", 2, 350, []],

	["GunStore1", 1, 0, []],
	["GunStore2", 1, 75, []],
	["GunStore3", 6, 135, []],
	["GunStore4", 1, 65, []],
	["GunStore5", 5, 83, []],
	["GunStore6", 4, 340, []],

	// Buttons you can disable: "Land", "Armored", "Tanks", "Helicopters", "Boats", "Planes"
	["VehStore1", 1, 75, []],
	["VehStore2", 6, 45, ["Boats"]],
	["VehStore3", 4, 250, ["Boats"]],
	["VehStore4", 5, 155, ["Boats"]],
	["VehStore5", 1e9, 69, ["Planes"]],
	["VehStore6", 1e9, 282, ["Boats", "Planes"]]
];

// Outfits for store owners
storeOwnerConfigAppearance = compileFinal str
[
	["GenStore1", [["weapon", ""], ["uniform", "U_IG_Guerilla2_1"]]],
	["GenStore2", [["weapon", ""], ["uniform", "U_IG_Guerilla2_1"]]],
	["GenStore3", [["weapon", ""], ["uniform", "U_IG_Guerilla2_1"]]],
	["GenStore4", [["weapon", ""], ["uniform", "U_IG_Guerilla2_1"]]],
	["GenStore5", [["weapon", ""], ["uniform", "U_IG_Guerilla2_1"]]],
	["GenStore6", [["weapon", ""], ["uniform", "U_IG_Guerilla2_1"]]],
	["GenStore7", [["weapon", ""], ["uniform", "U_IG_Guerilla2_1"]]],

	["GunStore1", [["weapon", ""], ["uniform", "U_IG_Guerilla2_2"]]],
	["GunStore2", [["weapon", ""], ["uniform", "U_IG_Guerilla2_2"]]],
	["GunStore3", [["weapon", ""], ["uniform", "U_IG_Guerilla2_2"]]],
	["GunStore4", [["weapon", ""], ["uniform", "U_IG_Guerilla2_2"]]],
	["GunStore5", [["weapon", ""], ["uniform", "U_IG_Guerilla2_2"]]],
	["GunStore6", [["weapon", ""], ["uniform", "U_IG_Guerilla2_2"]]],

	["VehStore1", [["weapon", ""], ["uniform", "U_IG_Guerilla2_3"]]],
	["VehStore2", [["weapon", ""], ["uniform", "U_IG_Guerilla2_3"]]],
	["VehStore3", [["weapon", ""], ["uniform", "U_IG_Guerilla2_3"]]],
	["VehStore4", [["weapon", ""], ["uniform", "U_IG_Guerilla2_3"]]],
	["VehStore5", [["weapon", ""], ["uniform", "U_IG_Guerilla2_3"]]],
	["VehStore6", [["weapon", ""], ["uniform", "U_IG_Guerilla2_3"]]]
];
