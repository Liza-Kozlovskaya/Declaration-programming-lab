predicates
inside(real, real, string)

clauses
inside(X,Y, "popadaet"):- X*X+Y*Y<1, X+1>Y,-X-1<Y,!.

goal
write("Input X-coordinaty: "), readreal (X), nl,
write("Input Y-coordinaty: "), readreal (Y), nl, inside(X,Y,R).