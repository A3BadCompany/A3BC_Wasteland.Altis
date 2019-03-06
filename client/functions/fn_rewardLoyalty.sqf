multiPlyWith = 2;
_i=0;

while {_i < 3} do
{
	if ( _i == 1) then 
	{
		_reward = (500 * multiPlyWith);
		player setVariable ["cmoney", ((player getVariable ["cmoney", 0]) + _reward), true];
		_msg = parseText format ["<t align='center' color='#FFFFFF' shadow='2' size='1.75'>Gift!</t><br/><t align='center' color='#17FF41'>------------------------------</t><br/><t align='center' color='#FFFFFF'>%1 thanks for playing on our server. You received </t><t align='center' color='#40FF00'>$%2</t>", name player, _reward];
		hint _msg;
		multiPlyWith = multiPlyWith + 1;
		_i = 0;
	};
	sleep 300;
	_i = _i + 1;
};