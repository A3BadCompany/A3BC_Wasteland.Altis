// infoPage.sqf
// by CRE4MPIE
// ver 0.1
// 2015-02-01 01:20pm
// contributions from BIStudio Forums, by CRE4MPIE


sleep 20;   //delay before message is displayed after logging in
	
_text = "
<t align='center'><t shadow= 1 shadowColor='#000000'><t size='1.2'><t color='#ff0000'>A3 Bad Company</t>
<br />
<br />
<t align='center'><t size='1.2'><t shadow= 1 shadowColor='#000000'>Keyboard Shortcuts</t><br />
<br />
<t align='left'><img size='2' shadow = 0 image='addons\InfoPage\img\windows.paa'/></t><t align='left'><t size='1'><t shadow= 1 shadowColor='#000000'> Nome dos jogadores</t><br />
<t align='left'><img size='2' shadow = 0 image='addons\InfoPage\img\end.paa'/></t><t align='left'><t size='1'><t shadow= 1 shadowColor='#000000'> Colocar/Retirar protetor auricular</t><br />
<t align='left'><img size='2' shadow = 0 image='addons\InfoPage\img\v.paa'/></t><t align='left'><t size='1'><t shadow= 1 shadowColor='#000000'> Abrir/Fechar paraquedas</t><br />
<t align='left'><img size='2' shadow = 0 image='addons\InfoPage\img\h.paa'/></t><t align='left'><t size='1'><t shadow= 1 shadowColor='#000000'> Guardar arma</t><br />
<t align='left'><img size='2' shadow = 0 image='addons\InfoPage\img\del.paa'/></t><t align='left'><t size='1'><t shadow= 1 shadowColor='#000000'> Ejeção de emergência</t><br />
<br />
<t align='center'><t size='1.2'><t shadow= 1 shadowColor='#0000ff'>Compra com as regras do servidor ou você poderá ser BANIDO... Divirta-se!!!</t><br />
<t align='center'><img size='8' shadow = 0 image='modConfig\A3BC.paa'/></t>
<br />";

hint parseText format ["<t align='center'>%2 Bem-vindo(a) ao</t><br />%1",_text, name player];
 
 
