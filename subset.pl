/*
 subset([], []).
 subset([X|Set], [X|SubSet]):-subset(Set, SubSet).
 subset([_|Set], SubSet):-subset(Set, SubSet).
 

 subset([1,2,3], Subset),
 write(Subset), nl,
 fail.
*/

subset([], []).
subset([X|SubSet], [X|Set]):-subset(SubSet, Set).

subset(A, [1, 2, 3]);
write(A).