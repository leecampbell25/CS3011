pterm(null).
pterm(f0(X)) :- pterm(X).
pterm(f1(X)) :- pterm(X).

same(null, null).
same(f0(X), f0(Y)) :- same(X, Y).
same(f1(X), f1(Y)) :- same(X, Y).

incr(null, f1(null)).
incr(f0(X), f1(Y)) :- same(X, Y).
incr(f1(X), f0(Y)) :- incr(X, Y).

legal(f0(null)).
legal(Z) :- legal(X), incr(X, Z).

%incrR(f0(null),f1(null)).
incrR(X,Y) :- legal(X), incr(X,Y).
