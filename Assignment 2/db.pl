% s(X,Z):-  np(X,Y),  vp(Y,Z).
%
% np(X,Z):-  det(X,Y),  n(Y,Z).
%
% vp(X,Z):-    v(X,Y),  np(Y,Z).
%
% vp(X,Z):-    v(X,Z).
%
% det([the|W],W).
% det([a|W],W).
%
% n([woman|W],W).
% n([man|W],W).
%
% v([shoots|W],W).
%

% s  -->  np,vp.
%
% np  -->  det,n.
%
% vp  -->  v,np.
% vp  -->  v.
%
% det  -->  [the].
% det  -->  [a].
%
% n  -->  [woman].
% n  -->  [man].
%
% v  -->  [shoots].


% s --> l(0).
%
% l(Count) --> [0], l(succ(Count)).
% l(Count) --> [1], l(Count).
% l(Count) --> [2], r(Count).
%
% r(0) --> [].
% r(Count) --> [0], r(Count).
% r(succ(succ(Count))) --> [1], r(Count).

% s(Count)  -->  ablock(Count),bblock(Count),cblock(Count).
%
% ablock(0)  -->  [].
% ablock(succ(Count))  -->  [a],ablock(Count).
%
% bblock(0)  -->  [].
% bblock(succ(Count))  -->  [b],bblock(Count).
%
% cblock(0)  -->  [].
% cblock(succ(Count))  -->  [c],cblock(Count).
%

% s --> person(Col1, Nat1, Pet1), person(Col2, Nat2, Pet2), person(Col3 ,Nat3, Pet3),
% {Col1 \== Col2, Col1 \== Col3, Col2 \== Col3,
%  Nat1 \== Nat2, Nat1 \== Nat3, Nat2 \== Nat3,
%  Pet1 \== Pet2, Pet1 \== Pet3, Pet2 \== Pet3}.
%
% person(Col, Nat, Pet) --> col(Col), nat(Nat), pet(Pet).
%
% col('red') --> [red].
% col('blue') --> [blue].
% col('green') --> [green].
%
% nat('english') --> [english].
% nat('spanish') --> [spanish].
% nat('japanese') --> [japanese].
%
% pet('snail') --> [snail].
% pet('jaguar') --> [jaguar].
% pet('zebra') --> [zebra].


mkList(0, []).
mkList(N, [N|T]) :- N > 0, X is N-1, mkList(X, T).

(s(0,A,A):-true).
s(N,A,B):-(mkList(N,DescList),member(Item,DescList),Remainder is N-Item),A=[Item|C],s(Remainder,C,B).
