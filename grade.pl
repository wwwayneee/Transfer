student(1,"zhangsan",23).
student(2,"lisi",243).
student(3,"wangwu",143).	
grade:-write("input a name"),
		read(Name),
		student(_,Name,Score),
		write(Score).
grade:-write("no people").