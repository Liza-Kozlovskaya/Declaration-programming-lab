domains
Vessel = bottle; glass; jug; jar
Liquid = milk; lemonade; kvass; water

predicates
nondeterm vessel(Vessel)
nondeterm liquid(Liquid)
nondeterm is(Vessel, Liquid)
nondeterm answer(Vessel, Liquid, Vessel, Liquid, Vessel, Liquid, Vessel, Liquid)

clauses
vessel(bottle).
vessel(glass).
vessel(jug).
vessel(jar).

liquid(milk).
liquid(lemonade).
liquid(kvass).
liquid(water).

is(X,Y):- vessel(X), X=bottle, liquid(Y), not(Y=milk), not(Y=water).
is(X,Y):- vessel(X), X=glass, liquid(Y), not(Y=milk).
is(X,Y):- vessel(X), X=jug, liquid(Y), not(Y=lemonade), not(Y=kvass).
is(X,Y):- vessel(X), X=jar, liquid(Y), not(Y=lemonade), not(Y=water), not(Y=milk).

answer(X1, Y1, X2, Y2, X3, Y3, X4, Y4) :-
X1=bottle, is(X1, Y1), 
X2=glass, is(X2, Y2),
X3=jug, is(X3, Y3),
X4=jar, is(X4, Y4), not(Y1=Y2), not(Y2=Y3), not(Y3=Y4),not(Y1=Y3), not(Y2=Y4),not(Y1=Y4).

goal
answer(X1, Y1, X2, Y2, X3, Y3, X4, Y4).
