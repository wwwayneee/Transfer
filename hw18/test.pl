supplier(4099, 2018, com24, com19, 5, 190).
supplier(4100, 2018, com24, com19, 4, 190).

% A 是 B 的第5大供应商
% A 是 B 的第4大供应商
conflict :- 
	supplier(ID1, Time_ignored, Com_X1, Com_Y1, K1, Value1),
	supplier(ID2, Time_ignored, Com_X2, Com_Y2, K2, Value2),
	Com_X1 = Com_X2,
	Com_Y1 = Com_Y2,
	\+ K1 = K2，
	write(ID1), nl, write(ID2).

/*
% A 是 B 的第5大供应商，交易额 xxx
% A 是 B 的第5大供应商，交易额 yyy
conflict :- 
	supplier(ID1, Time_ignored, Com_X1, Com_Y1, K1, Value1),
	supplier(ID2, Time_ignored, Com_X2, Com_Y2, K2, Value2),
	Com_X1 = Com_X2,
	Com_Y1 = Com_Y2,
	K1 = K2，
	\+ Value1 = Value1.

*/
