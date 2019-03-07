domains
A,B=string

predicates
nondeterm search(string,string,string)
str(string,char)
 
   /*frontchar have: 1-string, 2- first letter in string, 3- rest of line*/
   /*isin have: 1-second line, 2-rest of first of line*/
   
clauses
str("",_) :- fail.
str(S,C) :- frontchar(S,C,_), !.
str(S,C) :- frontchar(S,_,RS), str(RS,C).
 
search("",_,""). /*proverka na pystyu stroky*/
search(A,B,R) :- frontchar(A,A1,RA), str(B,A1), search(RA,B,RR), frontchar(R,A1,RR), !.
search(A,B,R) :- frontchar(A,_,RA), search(RA,B,R).
 
goal
write("Input first line: "),
readln(A),
write("Input second line: "),
readln(B),
search(A,B,R).