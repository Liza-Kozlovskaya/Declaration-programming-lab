domains
list =integer*


predicates
insert(integer, list,list)
ask_order(integer, integer)
sortL(list, list)
readlist(list)

nondeterm isOrdered(list)

clauses
insert(X, [Y|Sorted_list], [Y|Sorted_list1]) :- ask_order(X,Y),!,
insert(X, Sorted_list, Sorted_list1).
insert(X, Sorted_list, [X|Sorted_list]).
ask_order(X,Y) :- X>Y.
sortL([],[]).
sortL([X|T], Sorted_list):- sortL(T, Sorted_tail),
insert(X, Sorted_tail, Sorted_list).

readlist([H|T]) :- readInt(H),!, readlist(T).
readlist([]).

isOrdered([_]).
isOrdered([X,Y]) :- Y<X.
isOrdered([X,Y|H]) :- Y<X, isOrdered([Y|H]).


goal
write("Input number: \n"),
readlist(TheList), nl,
isOrdered(TheList), nl,
write("Sorted: \n"),
sortL(TheList, LS).