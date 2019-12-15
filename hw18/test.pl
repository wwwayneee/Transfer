supplier(4099, 2018, com24, com19, 4, 190).
supplier(4100, 2018, com32, com33, 11, 123).%干扰项
supplier(4101, 2018, com24, com19, 5, 240).
client(4102, 2018, com19, com24, 6, 245).
client(4103, 2018, com34, com56, 10, 245).% test for conflict 4
client(4104, 2018, com34, com56, 11, 245).% test for conflict 4
client(4105, 2018, com37, com59, 14, 567).% test for conflict 5
client(4106, 2018, com37, com59, 14, 578).% test for conflict 5

% A 是 B 的第5大供应商
% A 是 B 的第4大供应商
conflict1 :- 
	supplier(ID1, Time_ignored, Com_X1, Com_Y1, K1, Value1),
	supplier(ID2, Time_ignored, Com_X2, Com_Y2, K2, Value2),
	Com_X1 = Com_X2,
	Com_Y1 = Com_Y2,
	ID1 > ID2,
	\+ K1 = K2,
	write("Conflict Type 1"), nl, write(ID1), nl, write(ID2).


% A 是 B 的第5大供应商，交易额 xxx
% A 是 B 的第5大供应商，交易额 yyy
conflict2 :- 
	supplier(ID1, Time_ignored, Com_X1, Com_Y1, K1, Value1),
	supplier(ID2, Time_ignored, Com_X2, Com_Y2, K2, Value2),
	Com_X1 = Com_X2,
	Com_Y1 = Com_Y2,
	K1 = K2,
	ID1 > ID2,
	\+ Value1 = Value2,
	write("Conflict Type 2"), nl, write(ID1), nl, write(ID2).

% A 是 B 的第 X1 大供应商，交易额 xxx
% B 是 A 的第 X2 大顾客，  交易额 yyy (xxx != yyy)
conflict3 :- 
	supplier(ID1, Time_ignored, Com_X1, Com_Y1, K1, Value1), % Com_X1 是 Com_Y1 的第 K1 大供应商
	client(ID2, Time_ignored, Com_X2, Com_Y2, K2, Value2), % Com_X2 是 Com_Y2 的第 K2 大顾客
	Com_X1 = Com_Y2,
	Com_X2 = Com_Y1,
	\+ Value1 = Value2,
	write("Conflict Type 3"), nl, write(ID1), nl, write(ID2).

% A 是 B 的第5大顾客
% A 是 B 的第5大顾客
conflict4 :- 
	client(ID1, Time_ignored, Com_X1, Com_Y1, K1, Value1),
	client(ID2, Time_ignored, Com_X2, Com_Y2, K2, Value2),
	Com_X1 = Com_X2,
	Com_Y1 = Com_Y2,
	ID1 > ID2,
	\+ K1 = K2,
	write("Conflict Type 4"), nl, write(ID1), nl, write(ID2).

% A 是 B 的第5大顾客，交易额 xxx
% A 是 B 的第5大顾客，交易额 yyy
conflict5 :- 
	client(ID1, Time_ignored, Com_X1, Com_Y1, K1, Value1),
	client(ID2, Time_ignored, Com_X2, Com_Y2, K2, Value2),
	Com_X1 = Com_X2,
	Com_Y1 = Com_Y2,
	K1 = K2,
	ID1 > ID2,
	\+ Value1 = Value2,
	write("Conflict Type 5"), nl, write(ID1), nl, write(ID2).

conflicts :- 
	conflict1;
	conflict2;
	conflict3;
	conflict4;
	conflict5.

