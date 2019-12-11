element:-member(A, [1, 2, 3, 4, 5]),
		write(A).

subset([], []).
subset(M, [_|N]):-subset(M, N).
subset([X|M], [X|N]):-subset(M, N).

subsets:-subset(X, [1, 2, 3, 4, 5]),
		write(X).