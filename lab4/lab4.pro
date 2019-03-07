domains
name=symbol
objem,cena=real
O,D=real

predicates
nondeterm mashina(name,objem,cena)
pr1(real,real,real)
pr2(real,real,real)

clauses
mashina("HyundaiEquus", 3.0, 10000.0).
mashina("InfinityQ70", 4.0, 12000.0).
mashina("AudiA6", 2.0, 15300.0).
mashina("MersedesEClass", 4.2, 11400.0).

pr1(M,O,D):-mashina(X,Y,Z),
M=1,
O<=Y,
Y<=D,
writef("Mashina: %, Objem: %, Cena: % \n", X,Y,Z),fail;
true.

pr2(M, O, D):-mashina(X,Y,Z),
M=2,
O<=Z,
Z<=D,
writef("Mashina: %, Objem: %, Cena: % \n", X,Y,Z),fail;
true.

goal
write("Poisk po objemy -1 method, poisk po cene -2 method: "),
readReal(M),
write("Poisk ot: "),
readReal(O),
write("Poisk do: "),
readReal(D),
pr1(M, O, D),
pr2(M, O, D).