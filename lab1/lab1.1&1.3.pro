
predicates
line (integer L)
text1
text2
text3

clauses
line(0):-!.
line(L):- write('*'),K=L-1, line(K).
text1:-write("\n\t Kozlovskaya Elizaveta Alexandrovna" ).
text2:-write("\n Age:\t\t 19 age"),
write("\n Gender:\t\t female"),
write("\n Study:\t student 3 kursa grgy").
text3:-write("\n Groups:\t\t poit 161.1"),
write("\n Kurs:\t\t Osnov declarativnogo programmirovaniy"),
write("\n Facultet: \t Matematiki i informatiki").

goal
Lk=100
,line(Lk)
,text1
,nl
,line(Lk)
,nl
,text2
,text3
,nl
,line(Lk)
,nl.