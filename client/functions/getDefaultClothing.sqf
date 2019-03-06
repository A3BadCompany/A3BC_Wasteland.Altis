// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Version: 1.0
//	@file Name: getDefaultClothing.sqf
//	@file Author: AgentRev
//  @file Modifications to LEVEL LOADOUTS: [BC]CeccaTTo

private ["_unit", "_item", "_side", "_result"];

_unit = _this select 0;
_item = _this select 1;

if (typeName _unit == "OBJECT") then
{
	_side = if (_unit == player) then { playerSide } else { side _unit };
	_unit = typeOf _unit;
}
else
{
	_side = _this select 2;
};

_result = "";

switch (_side) do
{
	case BLUFOR:
	{
		switch (true) do
		{
			default
			{
				if (_item == "uniform") then { _result = "U_B_CombatUniform_mcam_vest" };
			};
		};
		if (_item == "headgear") then { _result = "H_Cap_blu" };
	};
	case OPFOR:
	{
		switch (true) do
		{
			default
			{
				if (_item == "uniform") then { _result = "U_O_OfficerUniform_ocamo" };
			};
		};
		if (_item == "headgear") then { _result = "H_Cap_red" };
	};
	default
	{
		switch (true) do
		{
			default
			{
				if (_item == "uniform") then { _result = "U_I_CombatUniform" };
			};
		};
		if (_item == "headgear") then { _result = "H_Cap_grn" };
	};
};

_result