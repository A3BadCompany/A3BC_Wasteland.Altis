// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Name: setupMissionArrays.sqf
//	@file Author: AgentRev

if (!isServer) exitWith {};

MainMissions =
[
	["mission_AbandonedJet", 0.3],
	["mission_AbandonedHeli", 0.3],
	["mission_MBT", 0.3],
	["mission_AA", 0.3],
	["mission_Smugglers", 0.5],
	["mission_Coastal_Convoy", 1],
	["mission_ArmedDiversquad", 1],
	["mission_Convoy", 1],
	["mission_CivHeli", 1]
];

SideMissions =
[
	["mission_Occupation", 1],
	["mission_Outpost", 1],
	["mission_SunkenSupplies", 1],
	["mission_HostileHelicopter", 1],
	["mission_Sniper", 1],
	["mission_Truck", 1],
	["mission_MiniConvoy", 1],
	["mission_HostageRescue", 1]
	
];

MoneyMissions =
[
	["mission_MoneyShipment", 0.3],
	["mission_SunkenTreasure", 0.3],
	["mission_TownInvasion", 0.5],
	["mission_Roadblock", 0.7],
	["mission_drugsRunners", 1]
];

MissionSpawnMarkers = (allMapMarkers select {["Mission_", _x] call fn_startsWith}) apply {[_x, false]};
ForestMissionMarkers = (allMapMarkers select {["ForestMission_", _x] call fn_startsWith}) apply {[_x, false]};
SunkenMissionMarkers = (allMapMarkers select {["SunkenMission_", _x] call fn_startsWith}) apply {[_x, false]};
RoadblockMissionMarkers = (allMapMarkers select {["Roadblock_", _x] call fn_startsWith}) apply {[_x, false]};
SniperMissionMarkers = (allMapMarkers select {["Sniper_", _x] call fn_startsWith}) apply {[_x, false]};
OccupationMissionMarkers = (allMapMarkers select {["Occupation_", _x] call fn_startsWith}) apply {[_x, false]};

if !(ForestMissionMarkers isEqualTo []) then
{
	SideMissions append
	[
		["mission_AirWreck", 1],
		["mission_WepCache", 1]
	];
};

LandConvoyPaths = (call compile preprocessFileLineNumbers "mapConfig\convoys\landConvoysList.sqf") apply {[_x, false]};
CoastalConvoyPaths = (call compile preprocessFileLineNumbers "mapConfig\convoys\coastalConvoysList.sqf") apply {[_x, false]};

MainMissions = [MainMissions, [["A3W_heliPatrolMissions", ["mission_Coastal_Convoy", "mission_HostileHeliFormation"]], ["A3W_underWaterMissions", ["mission_ArmedDiversquad"]]]] call removeDisabledMissions;
SideMissions = [SideMissions, [["A3W_heliPatrolMissions", ["mission_HostileHelicopter"]], ["A3W_underWaterMissions", ["mission_SunkenSupplies"]]]] call removeDisabledMissions;
MoneyMissions = [MoneyMissions, [["A3W_underWaterMissions", ["mission_SunkenTreasure"]]]] call removeDisabledMissions;

{ _x set [2, false] } forEach MainMissions;
{ _x set [2, false] } forEach SideMissions;
{ _x set [2, false] } forEach MoneyMissions;
