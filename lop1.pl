student(1, "张三", 90.2).
student(2, "李四", 95.5).
student(3, "王五", 96.4).
print :- student(Number, Name, Score),
		write(Number, Name, Score), nl,
		Number = 3.