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
temp_is(���������) :- it_is(������_��������),
it_is(������),
negative(�����, ������),
negative(�����, �����),
negative(�����, ������),
positive(�����, ���������_����������_����),
positive(�����, �����).

temp_is(�������_�������) :- it_is(�������),
it_is(��������),
positive(�����, ������),
positive(�����, �������_�����),
positive(�����, �������_������),
positive(������, ���_�����_������).

temp_is(����������_�������) :- it_is(�������),
it_is(��������),
negative(������, ���_�����_������),
positive(�����, �������_������),
positive(�����, ������).

temp_is(���������_��������) :- it_is(��������_��������),
it_is(��������),
negative(������, ���_�����_������),
positive(�������, ��_����_��������_����),
positive(�����, �����).

temp_is(�����������) :- it_is(��������_��������),
it_is(��������),
negative(�����, �������_������),
positive(�����, ������_����).

temp_is(���) :- it_is(���),
it_is(��������),
positive(�����, ���������_������).

it_is(������_��������):- positive(������, �_����).
it_is(������_��������):- positive(�����, ���������_������).

it_is(�������):- positive(�����, �������_������).
it_is(�������):- positive(�����, �������_�����),
		 positive(�������, ��_����_��������_����),
	         negative(�����, ���������_������),
	         negative(������, �����).
	       
it_is(��������):- positive(������, ��_�����).
it_is(��������):- negative(�����, �������_�����),
	       positive(������, ������).
	       
it_is(������):- negative(������, ��_�����).
it_is(������):- positive(�����, �����),
	        negative(������, ������).
	        
it_is(��������):- it_is(��������),
		   positive(������, �_�����������_����_����),
		   negative(�����, ������).
it_is(���):-it_is(��������).
it_is(���������):-it_is(������).
it_is(�����������):-it_is(��������).
		   
		   
positive(X,Y) :- xpositive(X,Y), !.
positive(X,Y) :- not(xnegative(X,Y)), 
	ask(X,Y, ��).

negative(X,Y) :- xnegative(X,Y), !.
negative(X,Y) :- not(xpositive(X,Y)),
	ask(X,Y, ���).

ask(X,Y, ��) :- !, write(X, " �������� ", Y, '\n'),
	readln(Reply), nl, frontchar(Reply, '�', _),
	remember(X,Y, ��).
ask(X,Y, ���) :- !, write(X, " �������� ", Y, '\n'),
	readln(Reply), nl, frontchar(Reply, '�', _),
	remember(X,Y, ���).
	
remember(X,Y, ��):- assertz(xpositive(X,Y)).
remember(X,Y, ���):- assertz(xnegative(X,Y)).

clear_facts :- write(" \n\n ������� ������ ��� ���������� ������\n"),
	retractall(_,dbasedom), readchar(_).

run :- temp_is(X), !,
write("\n ��� �������� - ",X), nl,
	clear_facts.
run :- write("��� ����������� ��������"),
	clear_facts.
	
goal
write("����������� ��� ������� ������� � ������ �(� ������ �������������� ������) ���� � ������ �(� ������ �������������� ������)"), nl, 
run.