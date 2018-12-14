mkList(0, []).
mkList(N, [N|T]) :- N > 0, X is N-1, mkList(X, T).

s(0) --> [].
s(N) --> {mkList(N, List), member(Item, List), Remainder is N-Item}, [Item], s(Remainder).
