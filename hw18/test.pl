supplier(4099, 2018, com24, com19, 4, 190).
supplier(4100, 2018, com32, com33, 11, 123).%干扰项
supplier(4101, 2018, com24, com19, 5, 240).
client(4102, 2018, com19, com24, 6, 245).
client(4103, 2018, com34, com56, 10, 245).	% test for conflict 4
client(4104, 2018, com34, com56, 11, 245).	% test for conflict 4
client(4105, 2018, com37, com59, 14, 567).	% test for conflict 5
client(4106, 2018, com37, com59, 14, 578).	% test for conflict 5
supplier(4107, 2018, com24, com19, 4, 191).	% test for conflict 6
supplier(4108, 2018, com25, com19, 5, 239).	% test for conflict 6
client(4109, 2018, com41, com67, 12, 567).	% test for conflict 5
client(4110, 2018, com43, com67, 14, 578).	% test for conflict 5
is_relation(27, com27, 2018, amount, 158).	% test for conflict 8
is_relation(29, com29, 2018, amount, 366400).%干扰项
is_relation(28, com27, 2018, amount, 999).	% test for conflict 8


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

% A 是 B 的第3大供应商，交易额 xxx
% C 是 B 的第4大供应商，交易额 yyy (A != C, 3 < 4, xxx < yyy)
conflict6 :- 
	supplier(ID1, Time_ignored, Com_X1, Com_Y1, K1, Value1),
	supplier(ID2, Time_ignored, Com_X2, Com_Y2, K2, Value2),
	\+ Com_X1 = Com_X2,
	Com_Y1 = Com_Y2,
	K1 < K2,
	Value1 < Value2,
	write("Conflict Type 6"), nl, write(ID1), nl, write(ID2).

% A 是 B 的第3大顾客，交易额 xxx
% C 是 B 的第4大顾客，交易额 yyy (A != C, 3 < 4, xxx < yyy)
conflict7 :- 
	client(ID1, Time_ignored, Com_X1, Com_Y1, K1, Value1),
	client(ID2, Time_ignored, Com_X2, Com_Y2, K2, Value2),
	\+ Com_X1 = Com_X2,
	Com_Y1 = Com_Y2,
	K1 < K2,
	Value1 < Value2,
	write("Conflict Type 7"), nl, write(ID1), nl, write(ID2).

%is_relation中同一个公司amount有两个值
conflict8 :- 
	is_relation(ID1, Com_X1, Time1, Amount_ignored, Value1),
	is_relation(ID2, Com_X2, Time2, Amount_ignored, Value2),
	Com_X1 = Com_X2,
	Time1 = Time2,
	\+ Value1 = Value2,
	ID2 > ID1,
	write("Conflict Type 8"), nl, write(ID1), nl, write(ID2).

conflicts :- 
	conflict1;
	conflict2;
	conflict3;
	conflict4;
	conflict5;
	conflict6;
	conflict7;
	conflict8.

