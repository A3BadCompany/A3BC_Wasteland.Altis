// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Name: mission_TownInvasion.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy, JoSchaap, AgentRev, Zenophon
//  @file Information: JoSchaap's Lite version of 'Infantry Occupy House' Original was made by: Zenophon

if (!isServer) exitwith {};

#include "moneyMissionDefines.sqf"

private ["_nbUnits", "_box1", "_box2", "_randomBox1", "_randomBox2", "_townName", "_missionPos", "_cashbox1", "_cashbox2", "_buildingRadius", "_putOnRoof", "_fillEvenly", "_tent1", "_chair1", "_chair2", "_cFire1", "_drop_item"];

_setupVars =
{
	_skippedTowns =
	[
		"Town_Corton",
		"Town_Pirates_Island",
		"Town_Faro",
		"Town_Montain_Military_Base"
	];
	_locArray = ""; _missionPos = [0,0,0]; _radius = 0;
	_townName = false;
	while {!_townName} do {
		_locArray = selectRandom (call cityList);
		_missionPos = markerPos (_locArray select 0);
		_radius = (_locArray select 1);
		_anyPlayersAround = (nearestObjects [_missionPos,["MAN"],_radius]) select {isPlayer _x};
		if (((count _anyPlayersAround) isEqualTo 0) && !((_locArray select 0) in _skippedTowns)) exitWith {
			_townName = true;
		};
		sleep 0.1;
    };
	
	_missionType = "Town Invasion";
	_nbUnits = if (missionDifficultyHard) then { AI_GROUP_LARGE } else { AI_GROUP_MEDIUM };
	_buildingRadius = _locArray select 1;
	_townName = _locArray select 2;

	_nbUnits = _nbUnits + round(random (_nbUnits*0.5));
	_buildingRadius = if (_buildingRadius > 201) then {(_buildingRadius*0.5)} else {_buildingRadius};
	if (random 1 < 0.75) then { _putOnRoof = true } else { _putOnRoof = false };
	if (random 1 < 0.75) then { _fillEvenly = true } else { _fillEvenly = false };
};

_setupObjects =
{
	_cashbox1 = floor(random 150000);
	_cashbox2 = floor(random 150000);
	_box1 = createVehicle ["Box_NATO_Wps_F", _missionPos, [], 5, "NONE"];
	_box1 setDir random 360;
	_box1 setVariable ["cmoney", _cashbox1, true];
	_randomBox1 = selectRandom ["mission_USLaunchers","mission_USSpecial","mission_Main_A3snipers"];
	[_box1, _randomBox1] call fn_refillbox;

	_box2 = createVehicle ["Box_East_Wps_F", _missionPos, [], 5, "NONE"];
	_box2 setDir random 360;
	_box2 setVariable ["cmoney", _cashbox2, true];
	_randomBox2 = selectRandom ["mission_USLaunchers","mission_USSpecial","mission_Main_A3snipers"];
	[_box2, _randomBox2] call fn_refillbox;
	
	_tent1 = createVehicle ["Land_cargo_addon02_V2_F", _missionPos, [], 3, "NONE"];
	_tent1 setDir random 360;
	_chair1 = createVehicle ["Land_CampingChair_V1_F", _missionPos, [], 2, "NONE"];
	_chair1 setDir random 90;
	_chair2 = createVehicle ["Land_CampingChair_V2_F", _missionPos, [], 2, "NONE"];
	_chair2 setDir random 180;
	_cFire1	= createVehicle ["Campfire_burning_F", _missionPos, [], 2, "NONE"];


	{ _x setVariable ["R3F_LOG_disabled", true, true] } forEach [_box1, _box2];

	_aiGroup = createGroup CIVILIAN;
	[_aiGroup, _missionPos, _nbUnits] call createCustomGroup2;

	[_aiGroup, _missionPos, _buildingRadius, _fillEvenly, _putOnRoof] call moveIntoBuildings;

	_missionHintText = format ["Hostiles have taken over <br/><t size='1.25' color='%1'>%2</t><br/><br/>There seem to be <t color='%1'>%3 enemies</t> hiding inside or on top of buildings. Get rid of them all, and take their supplies!<br/>Watch out for those windows!", moneyMissionColor, _townName, _nbUnits];
};

_waitUntilMarkerPos = nil;
_waitUntilExec = nil;
_waitUntilCondition = nil;

_failedExec =
{
	{ deleteVehicle _x } forEach [_box1, _box2, _tent1, _chair1, _chair2, _cFire1];
};

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
	{ _x setVariable ["R3F_LOG_disabled", false, true] } forEach [_box1, _box2];

	for "_i" from 2 to 6 do
	{
		private["_item"];
		_item = selectRandom [["lsd", "Land_WaterPurificationTablets_F"],["marijuana", "Land_VitaminBottle_F"],["cocaine","Land_PowderedMilk_F"],["heroin", "Land_PainKillers_F"]];
		[_item, _lastPos] call _drop_item;
	};
	
	_successHintMessage = format ["Nice work!<br/><br/><t color='%1'>%2</t><br/>is a safe place again!<br/>Their belongings are now yours to take!", moneyMissionColor, _townName];
	{ deleteVehicle _x } forEach [_tent1, _chair1, _chair2, _cFire1];
};

_this call moneyMissionProcessor;