student("zhangsan",23).
student("lisi",243).
student("wangwu",143).

grade:-write("input a name"),
		read(Name),
		student(Name,Score),
		write(Score).
grade:-write("no people").

