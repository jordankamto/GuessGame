/*retract pour retirer (X pour le tout)
assert pour inserer

Jean (variable) jean (objet)
, et ; ou _ muete
\+ negation



     [1]  ?- aime(jean,_).
true .

[1]  ?- aime(jean,_).
true ;
true.

[1]  ?- aime(jean,marie),aime(marie,jean).
false.

[1]  ?- aime(paul,marie),aime(paul,jean).
false.

[1]  ?- aime(paul,marie),aime(marie,paul).
true.

[1]  ?- aime(X,Y),aime(Y,X).
X = marie,
Y = paul ;
X = paul,
Y = marie ;
false.

*/

aime(marie,X):-roi(X,_).
aime(paul,X):-aime(X,bierre).

roi(tintin,france).


