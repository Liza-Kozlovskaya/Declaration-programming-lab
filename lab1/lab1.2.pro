domains
Name = anna; masha; olya; flowers; son(Name); sweets; katya

predicates
nondeterm like(Name, Name)
nondeterm love(Name, Name)
nondeterm grandmother(Name, Name)
nondeterm mother(Name, Name)
nondeterm z1
nondeterm z2
z3
z4
z5    
nondeterm z6
nondeterm z7
z8
nondeterm z9
nondeterm z10
nondeterm z11

clauses
like(masha, flowers).
like(X, Z) :- love(X, Y),like(Y, Z).
like(son(katya), sweets).
love(anna, son(anna)).
love(son(anna), masha).
love(olya, X) :- love(anna, X).
love(son(katya), masha).
mother(masha, olya).
mother(katya, masha).
grandmother(katya, X) :- mother(masha, X).
z1 :- nl, like(son(anna), flowers), write ("Son Anna liked flowers? Yes.").
z1 :- nl, write ("Son Anna liked flowers? No.").
z2 :- nl, love(anna, masha), write("Anna love Misha? Yes.").
z2 :- nl, write("Anna love Misha? No.").
z3 :- nl, write("When like flowers? "), like (X, flowers), write (X, ", "), fail.
z3 :- nl, write("Now no").
z4 :- nl, write("When love Olya? "), like (olya, X), write (X, ", "), fail.
z4 :- nl, write("Now no").
z5 :- nl, write("When  love Masha and flowers? "), love(X, masha), like(X, flowers), write(X, ", "), fail.
z5 :- nl, write("Now no").
z6 :- nl, like(anna, flowers), write("Anna like flowers? Yes.").
z6 :- nl, write("Anna like flowers? No."), nl.
z7 :- nl, like(son(anna), flowers), write("Son Anna like flowers? Yes.").
z7 :- nl, write("Son Anna like flowers? No"), nl.
z8 :- nl, write("When love sweets? "), like(X, sweets), write(X, ", "), fail.
z8 :- nl, write("Now no").
z10 :- nl, write("Katya mother Anna?"), mother(katya, X), write(", ", X).
z9 :- nl, write("Whose grandmother is Masha? "), grandmother(katya, X), write(X, ", ").
z11 :- nl, write("Katya love son Anna? "), love(katya, son(anna)).
goal
z1, nl, z2, nl, z3, nl, z4, nl, z5, nl, z6, nl, z7, nl, z8, nl, z9, nl, z10, nl, z11.