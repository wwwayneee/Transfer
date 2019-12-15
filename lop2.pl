student(1, "zhangsan", 90.2).
student(2, "lisi", 95.5).
student(3, "wangwu", 96.4).
print :- student(Number, Name, Score),
		write(Number, Name, Score), nl,
		Number = 3.