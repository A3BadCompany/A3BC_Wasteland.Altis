// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Version: 2.1
//	@file Name: mission_drugsRunners.sqf
//	@file Author: JoSchaap / routes by Del1te - (original idea by Sanjo), AgentRev, LouD
//	@file Created: 31/08/2013 18:19

if (!isServer) exitwith {};
#include "moneyMissionDefines.sqf";

private ["_convoyVeh", "_veh1", "_createVehicle", "_vehicles", "_leader", "_waypoint", "_vehicleName", "_numWaypoints", "_drop_item", "_drugpile", "_cashamount", "_cashpile", "_cash"];

_setupVars = {
	_missionType = "Drugs Runners";
};

_setupObjects = {
	
	_skippedTowns =
	[
		"Town_Pirates_Island",
		"Town_Moray",
		"Town_Montain_Military_Base"
	];
	_town = ""; _missionPos = [0,0,0]; _radius = 0;
	_townOK = false;
	while {!_townOK} do {
		_town = selectRandom (call cityList);
		_missionPos = markerPos (_town select 0);
		_radius = (_town select 1);
		_anyPlayersAround = (nearestObjects [_missionPos,["MAN"],_radius]) select {isPlayer _x};
		if (((count _anyPlayersAround) isEqualTo 0) && !((_town select 0) in _skippedTowns)) exitWith {
			_townOK = true;
		};
		sleep 0.1;
    };
	
	_convoyVeh = ["I_MRAP_03_F"];

	_veh1 = _convoyVeh select 0;

	_createVehicle = {
		private ["_type", "_position", "_direction", "_vehicle", "_soldier"];

		_type = _this select 0;
		_position = _this select 1;
		_direction = _this select 2;

		_vehicle = createVehicle [_type, _position, [], 0, "NONE"];
		_vehicle setVariable ["R3F_LOG_disabled", true, true];
		[_vehicle] call vehicleSetup;

		_vehicle setDir _direction;
		_aiGroup addVehicle _vehicle;

		_soldier = [_aiGroup, _position] call createRandomSoldier;
		_soldier moveInDriver _vehicle;

		_soldier = [_aiGroup, _position] call createRandomSoldier;
		_soldier moveInCargo [_vehicle, 0];

		switch (true) do {
			case (_type isKindOf "I_MRAP_03_F"): {
				[_vehicle, "#(rgb,1,1,1)color(0.01,0.01,0.01,1)", [0]] call applyVehicleTexture; // Apply black color
			};
		};

		[_vehicle, _aiGroup] spawn checkMissionVehicleLock;

		_vehicle
	};

	_aiGroup = createGroup CIVILIAN;

	_pos = getMarkerPos (_town select 0);
	_rad = _town select 1;
	_vehiclePos = [_pos,5,_rad,5,0,0,0] call findSafePos;
	
	_vehicles =
	[
		[_veh1, _vehiclePos, 0] call _createVehicle
	];

	_leader = effectiveCommander (_vehicles select 0);
	_aiGroup selectLeader _leader;

	_aiGroup setCombatMode "GREEN";
	_aiGroup setBehaviour "CARELESS";
	_aiGroup setFormation "STAG COLUMN";
	_aiGroup setSpeedMode "FULL";

	{
		_waypoint = _aiGroup addWaypoint [markerPos (_x select 0), 0];
		_waypoint setWaypointType "MOVE";
		_waypoint setWaypointCompletionRadius 50;
		_waypoint setWaypointCombatMode "YELLOW";
		_waypoint setWaypointBehaviour "CARELESS";
		_waypoint setWaypointFormation "STAG COLUMN";
		_waypoint setWaypointSpeed "FULL";
	} forEach ((call cityList) call BIS_fnc_arrayShuffle);

	_missionPos = getPosATL leader _aiGroup;

	_missionPicture = getText (configFile >> "CfgVehicles" >> _veh1 >> "picture");
	_vehicleName = getText (configFile >> "CfgVehicles" >> _veh1 >> "displayName");

	_missionHintText = format ["Drug runners have been spotted driving a <t color='%2'>%1</t>. Stop them quickly and retrieve their drugs and money!", _vehicleName, moneyMissionColor];

	_numWaypoints = count waypoints _aiGroup;
};

_waitUntilMarkerPos = {getPosATL _leader};
_waitUntilExec = nil;
_waitUntilCondition = {currentWaypoint _aiGroup >= _numWaypoints};

_failedExec = nil;

_drop_item = 
{
	private["_item", "_pos"];
	_item = _this select 0;
	_pos = _this select 1;

	if (isNil "_item" || {typeName _item != typeName [] || {count(_item) != 2}}) exitWith {};
	if (isNil "_pos" || {typeName _pos != typeName [] || {count(_pos) != 3}}) exitWith {};

	private["_id", "_class"];
	_id = _item select 0;
	_class = _item select 1;

	private["_obj"];
	_obj = createVehicle [_class, _pos, [], 5, "NONE"];
	_obj setPos ([_pos, [[2 + random 3,0,0], random 360] call BIS_fnc_rotateVector2D] call BIS_fnc_vectorAdd);
	_obj setVariable ["mf_item_id", _id, true];
};

_successExec =
{
	_drugpile = selectRandom [2,4,6];

	for "_i" from 1 to _drugpile do
	{
		private["_item"];
		_item = selectRandom [["lsd", "Land_WaterPurificationTablets_F"],["marijuana", "Land_VitaminBottle_F"],["cocaine","Land_PowderedMilk_F"],["heroin", "Land_PainKillers_F"]];
		[_item, _lastPos] call _drop_item;
	};

	_cashamount = floor(random 18750);
	_cashpile = selectRandom [4,6,8];

	for "_i" from 1 to _cashpile do
	{
		_cash = createVehicle ["Land_Money_F",[(_lastPos select 0), (_lastPos select 1) - 5,0],[], 0, "NONE"];
		_cash setPos ([_lastPos, [[2 + random 3,0,0], random 360] call BIS_fnc_rotateVector2D] call BIS_fnc_vectorAdd);
		_cash setDir random 360;
		_cash setVariable ["cmoney", _cashamount, true];
		_cash setVariable ["owner", "world", true];
	};

	_successHintMessage = "You have stopped the drug runners. The drugs and money are yours to take!";
};

_this call moneyMissionProcessor;