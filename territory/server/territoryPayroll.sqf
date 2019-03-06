// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Name: territoryPayroll.sqf
//	@file Author: AgentRev

#define SLEEP_REALTIME(SECS) if (hasInterface) then { sleep SECS } else { uiSleep SECS }

if (!isServer) exitWith {};

private "_money";

_timeInterval = ["A3W_payrollInterval", 30*60] call getPublicVar;
_moneyAmount1 = ["A3W_payrollAmount1", 100] call getPublicVar;
_moneyAmount2 = ["A3W_payrollAmount2", 200] call getPublicVar;
_moneyAmount3 = ["A3W_payrollAmount3", 300] call getPublicVar;
_moneyAmount4 = ["A3W_payrollAmount4", 400] call getPublicVar;
_moneyAmount5 = ["A3W_payrollAmount5", 500] call getPublicVar;
_players = count allPlayers;

_territoryCapped = false;

while {true} do
{
	if (_territoryCapped) then
	{
		SLEEP_REALTIME(_timeInterval);
	}
	else
	{
		SLEEP_REALTIME(60);
	};

	_payouts = [];

	{
		_territoryOwner = _x select 2;
		_territoryChrono = _x select 3;

		if (_territoryChrono > 0) then
		{
			_territoryCapped = true;

			if (_territoryChrono >= _timeInterval) then
			{
				_added = false;

				{
					if ((_x select 0) isEqualTo _territoryOwner) exitWith
					{
						_x set [1, (_x select 1) + 1];
						_added = true;
					};
				} forEach _payouts;

				if (!_added) then
				{
					_payouts pushBack [_territoryOwner, 1];
				};
			};
		};
	} forEach currentTerritoryDetails;

	{
		_team = _x select 0;
		_count = _x select 1;
		
		switch (true) do {
			case (_players >= 0 && _players <= 9): {
			_money = _count * _moneyAmount1;
			};
			case (_players >= 10 && _players <= 19): {
			_money = _count * _moneyAmount2;
			};
			case (_players >= 20 && _players <= 29): {
			_money = _count * _moneyAmount3;
			};
			case (_players >= 30 && _players <= 39): {
			_money = _count * _moneyAmount4;
			};
			case (_players >= 40): {
			_money = _count * _moneyAmount5;
			};
		};
		
		_message =  format ["Your team received a $%1 bonus for holding %2 territor%3 during the past %4 minutes", [_money] call fn_numbersText, _count, if (_count == 1) then { "y" } else { "ies" }, ceil (_timeInterval / 60)];

		[[_message, _money], "A3W_fnc_territoryActivityHandler", _team, false] call A3W_fnc_MP;
	} forEach _payouts;
};
