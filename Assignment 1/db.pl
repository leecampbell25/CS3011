pterm(null).
pterm(f0(X)) :- pterm(X).
pterm(f1(X)) :- pterm(X).
%----------------------------------------------------------%
same(null, null).
same(f0(X), f0(Y)) :- same(X, Y).
same(f1(X), f1(Y)) :- same(X, Y).
%----------------------------------------------------------%
incr(null, f1(null)).
incr(f0(X), f1(Y)) :- same(X, Y).
incr(f1(X), f0(Y)) :- incr(X, Y).
%----------------------------------------------------------%
legal(f0(null)).
legal(Z) :- legal(X), incr(X, Z).
%----------------------------------------------------------%
incrR(X, Y) :- legal(X), incr(X, Y).
%----------------------------------------------------------%
add(f0(null), Y, Y).
add(X, Y, Z) :- incr(A, X), add(A, Y, B), incr(B, Z).
%----------------------------------------------------------%
mult(f1(null), Y, Y).
mult(X, Y, Z) :- incr(A, X), mul(A, Y, B), add(B, Z).
%----------------------------------------------------------%
revers(X, Y) :- revers1(X, null, Y).

revers1(null, X, X).
revers1(f0(X), A, Y) :- revers1(X, f0(A), Y).
revers1(f1(X), A, Y) :- revers1(X, f1(A), Y).
%----------------------------------------------------------%
normalize(null, f0(null)).
normalize(f0(null), f0(null)).
normalize(X, Y) :- revers(X, Z), trim(Z, A), revers(A, Y).

trim(f1(X), f1(X)).
trim(f0(X), A) :- trim(X, A).
