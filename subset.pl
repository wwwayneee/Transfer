domains
 ilist=integer*
 
predicates
 nondeterm subset(ilist, ilist)
 
clauses
 subset([], []).
 subset([X|Set], [X|SubSet]):-subset(Set, SubSet).
 subset([_|Set], SubSet):-subset(Set, SubSet).
 
goal
 subset([1,2,3], Subset),
 write(Subset), nl,
 fail.
