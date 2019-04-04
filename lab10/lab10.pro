facts
xpositive(symbol, symbol)
xnegative(symbol, symbol)

predicates
nondeterm temp_is(symbol)
nondeterm it_is(symbol)
ask(symbol, symbol, symbol)
remember(symbol, symbol, symbol)
positive(symbol, symbol)
negative(symbol, symbol)
clear_facts
run

clauses
temp_is(водоросли) :- it_is(водные_растения),
it_is(водные),
negative(имеют, листья),
negative(имеют, корни),
negative(имеют, стебли),
positive(имеют, желтовато_коричневый_цвет),
positive(имеют, слизь).

temp_is(хвойные_деревья) :- it_is(деревья),
it_is(наземные),
positive(имеют, иголки),
positive(имеют, большие_корни),
positive(имеет, длинные_стволы),
positive(растут, при_любой_погоде).

temp_is(лиственные_деревья) :- it_is(деревья),
it_is(наземные),
negative(растут, при_любой_погоде),
positive(имеет, длинные_стволы),
positive(имеет, листья).

temp_is(цветковые_растения) :- it_is(наземные_растения),
it_is(наземные),
negative(растут, при_любой_погоде),
positive(обитают, во_всех_регионах_мира),
positive(имеют, цветы).

temp_is(папоротники) :- it_is(наземные_растения),
it_is(наземные),
negative(имеют, длинные_стволы),
positive(имеют, зелёный_цвет).

temp_is(мхи) :- it_is(мхи),
it_is(наземные),
positive(имеет, небольшой_размер).

it_is(водные_растения):- positive(растут, в_воде).
it_is(водные_растения):- positive(имеют, небольшой_размер).

it_is(деревья):- positive(имеют, длиннын_стволы).
it_is(деревья):- positive(имеют, большую_крону),
		 positive(обитают, во_всех_регионах_мира),
	         negative(имеют, небольшой_размер),
	         negative(растут, цветы).
	       
it_is(наземные):- positive(растут, на_земле).
it_is(наземные):- negative(имеют, большую_крону),
	       positive(растут, дольше).
	       
it_is(водные):- negative(растут, на_земле).
it_is(водные):- positive(имеют, слизь),
	        negative(растут, дольше).
	        
it_is(растения):- it_is(наземные),
		   positive(растут, в_определённую_пору_года),
		   negative(имеют, иголки).
it_is(мхи):-it_is(наземные).
it_is(водоросли):-it_is(водные).
it_is(папоротники):-it_is(наземные).
		   
		   
positive(X,Y) :- xpositive(X,Y), !.
positive(X,Y) :- not(xnegative(X,Y)), 
	ask(X,Y, да).

negative(X,Y) :- xnegative(X,Y), !.
negative(X,Y) :- not(xpositive(X,Y)),
	ask(X,Y, нет).

ask(X,Y, да) :- !, write(X, " растение ", Y, '\n'),
	readln(Reply), nl, frontchar(Reply, 'д', _),
	remember(X,Y, да).
ask(X,Y, нет) :- !, write(X, " растение ", Y, '\n'),
	readln(Reply), nl, frontchar(Reply, 'н', _),
	remember(X,Y, нет).
	
remember(X,Y, да):- assertz(xpositive(X,Y)).
remember(X,Y, нет):- assertz(xnegative(X,Y)).

clear_facts :- write(" \n\n Нажмите пробел для завершения работы\n"),
	retractall(_,dbasedom), readchar(_).

run :- temp_is(X), !,
write("\n Это растение - ",X), nl,
	clear_facts.
run :- write("Это неизвестное растение"),
	clear_facts.
	
goal
write("Используйте при ответах клавиши с буквой д(в случае положительного ответа) либо с буквой н(в слечае отрицательного ответа)"), nl, 
run.