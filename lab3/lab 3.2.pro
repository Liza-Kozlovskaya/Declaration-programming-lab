predicates
check(integer,integer,integer,string)

clauses
check(A,B,C,"Equilateral. Side A=B=C."):-A=B,B=C,A=C,!. /*ravn*/
check(A,B,C,"Isosceles. Side A=B."):-A=B,not(A=C),!.  /*ravnobedr*/
check(A,B,C,"Isosceles. Side B=C."):-B=C,not(A=B),!.
check(A,B,C,"Isosceles. Side A=C."):-A=C,not(C=B),!.
check(A,B,C,"Versatile. Side A!=B!=C."):-not(A=B), not(A=C), not(C=B),!. /*raznostor*/

goal
write("Input A-number: "), readreal (A), nl,
write("Input B-number: "), readreal (B), nl, 
write("Input C-number: "), readreal (C), nl, check(A,B,C,R).