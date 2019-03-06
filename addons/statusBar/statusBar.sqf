/*
	@file Version: 0.1
	@file Name: statusBar.sqf
	@file  EpochMod StatusBar Port for Wasteland by CRE4MPIE
	@file Created: 21/4/2015
	@notes: Added custom Icons and ported Wasteland info. Still
	needs to be cleaned up a bit.
	@file Edit By: Vishpala
*/

waitUntil {!(isNull (findDisplay 46))};
disableSerialization;

ZGO_StatusEnabled = true;

[] spawn
{
	uiSleep 1;
	_uid = getPlayerUID player;

	while {true} do
	{
		uisleep 1;
		if !(ZGO_StatusEnabled) then
		{
			_rscLayer = "RscWastelandStatusBar" call BIS_fnc_rscLayer;
			_rscLayer cutText ["","PLAIN",1,false];
		}
		else
		{
			_rscLayer = "RscWastelandStatusBar" call BIS_fnc_rscLayer;
			_rscLayer cutRsc ["RscWastelandStatusBar","PLAIN",1,false];

			if(isNull ((uiNamespace getVariable "RscWastelandStatusBar")displayCtrl 55554)) then
			{
				diag_log "statusbar is null create";
				disableSerialization;
				_rscLayer = "RscWastelandStatusBar" call BIS_fnc_rscLayer;
				_rscLayer cutRsc ["RscWastelandStatusBar","PLAIN",1,false];
			};
			_unit = _this select 0;
			_damage = round ((1 - (damage player)) * 100);
			_wallet = player getVariable ["cmoney",0] call fn_numbersText;
			_atm = player getVariable ["bmoney",0] call fn_numbersText;
			_serverFPS = round diag_fps;
			_pos = getPosATL player;
			_dir = round (getDir (vehicle player));
			_grid = mapGridPosition  player; _xx = (format[_grid]) select  [0,3];
			_yy = (format[_grid]) select  [3,3];
			_time = (round(239-(serverTime)/60));  //edit the '240' value (60*4=240) to change the countdown timer if your server restarts are shorter or longer than 4 hour intervals
			_hours = (floor(_time/60));
			_minutes = (_time - (_hours * 60));

			switch(_minutes) do
			{
				case 9: {_minutes = "09"};
				case 8: {_minutes = "08"};
				case 7: {_minutes = "07"};
				case 6: {_minutes = "06"};
				case 5: {_minutes = "05"};
				case 4: {_minutes = "04"};
				case 3: {_minutes = "03"};
				case 2: {_minutes = "02"};
				case 1: {_minutes = "01"};
				case 0: {_minutes = "00"};
			};

			//Color Default
			_colourDefault 	= parseText "#00A1FF";
			
			//Color Damage Gradient 
			_colourDamageDefault 	= parseText "#76FF00";
			_colour90 				= parseText "#B2FF00";
			_colour80 				= parseText "#CCFF00";
			_colour70 				= parseText "#E5FF00";
			_colour60 				= parseText "#FFFF00";
			_colour50 				= parseText "#FFE500";
			_colour40 				= parseText "#FFD000";
			_colour30 				= parseText "#FFB200";
			_colour20 				= parseText "#FF9400";
			_colour10 				= parseText "#FF7700";
			_colour0 				= parseText "#FF4800";
			_colourDead 			= parseText "#FF1500";

			//Colour Damage
			_colourDamage = _colourDamageDefault;
			if(_damage >= 100) then{_colourDamage = _colourDamageDefault;};
			if((_damage >= 90) && (_damage < 100)) then {_colourDamage =  _colour90;};
			if((_damage >= 80) && (_damage < 90)) then {_colourDamage =  _colour80;};
			if((_damage >= 70) && (_damage < 80)) then {_colourDamage =  _colour70;};
			if((_damage >= 60) && (_damage < 70)) then {_colourDamage =  _colour60;};
			if((_damage >= 50) && (_damage < 60)) then {_colourDamage =  _colour50;};
			if((_damage >= 40) && (_damage < 50)) then {_colourDamage =  _colour40;};
			if((_damage >= 30) && (_damage < 40)) then {_colourDamage =  _colour30;};
			if((_damage >= 20) && (_damage < 30)) then {_colourDamage =  _colour20;};
			if((_damage >= 10) && (_damage < 20)) then {_colourDamage =  _colour10;};
			if((_damage >= 1) && (_damage < 10)) then {_colourDamage =  _colour0;};
			if(_damage < 1) then{_colourDamage =  _colourDead;};
			
			//Color FPS Gradient
			_colourFPSDefault 	= parseText "#76FF00";
			_colourFPS40 		= parseText "#FAFF00";
			_colourFPS30 		= parseText "#FFBF00";
			_colourFPS20 		= parseText "#FF6600";
			_colourFPS10 		= parseText "#FF0000";
			_colourFPS0 		= parseText "#FF0000";
			
			//Colour FPS
			_colourFPS = _colourFPSDefault;
			if(_serverFPS >= 50) then{_colourFPS = _colourFPSDefault;};
			if((_serverFPS >= 40) && (_serverFPS < 50)) then {_colourFPS =  _colourFPS40;};
			if((_serverFPS >= 30) && (_serverFPS < 40)) then {_colourFPS =  _colourFPS30;};
			if((_serverFPS >= 20) && (_serverFPS < 30)) then {_colourFPS =  _colourFPS20;};
			if((_serverFPS >= 10) && (_serverFPS < 20)) then {_colourFPS =  _colourFPS0;};
			if((_serverFPS >= 1) && (_serverFPS < 10)) then {_colourFPS =  _colourFPS0;};
			if(_serverFPS < 1) then{_colourFPS =  _colourFPS0;};

			//display the information
			((uiNamespace getVariable "RscWastelandStatusBar")displayCtrl 55554) ctrlSetStructuredText
			parseText
			format
			["
				<t shadow='1' shadowColor='#000000' color='%11'><img size='1.6'  shadowColor='#000000' image='addons\statusbar\icons\players.paa' color='%11'/> %2</t>
				<t shadow='1' shadowColor='#000000' color='%12'><img size='1.0'  shadowColor='#000000' image='addons\statusbar\icons\health.paa' color='%11'/> %3%1</t>
				<t shadow='1' shadowColor='#000000' color='%11'><img size='1.0'  shadowColor='#000000' image='addons\statusbar\icons\money.paa' color='%11'/> %4</t>
				<t shadow='1' shadowColor='#000000' color='%11'><img size='1.0'  shadowColor='#000000' image='addons\statusbar\icons\atm.paa' color='%11'/> %6</t>
				<t shadow='1' shadowColor='#000000' color='%13'>FPS: %5</t>
				<t shadow='1' shadowColor='#000000' color='%11'><img size='1.0'  shadowColor='#000000' image='addons\statusbar\icons\compass.paa' color='%11'/> %8</t>
				<t shadow='1' shadowColor='#000000' color='%11'><img size='1.6'  shadowColor='#000000' image='addons\statusbar\icons\restart.paa' color='%11'/>%9:%10</t>",

						"%",
						count allPlayers,
						_damage,
						_wallet,
						_serverFPS,
						_atm,
						format["%1/%2",_xx,_yy],
						_dir,
						_hours,
						_minutes,
						_colourDefault,
						_colourDamage,
						_colourFPS
			];
		};
	};
};