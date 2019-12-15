student(1, "ZhangSan", 90.2).
student(2, "LiSi", 95.5).
student(3, "WangWu", 96.4).
print :- student(Number, Name, Score),
		write(Number, Name, Score), nl,
		fail.
print :-.
