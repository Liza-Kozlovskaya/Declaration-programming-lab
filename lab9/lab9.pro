/*Example 10.2 page 116*/

domains
treetype = tree(string, treetype, treetype); empty()

predicates
create_tree(string, treetype)
insert_left(treetype, treetype, treetype)
insert_right(treetype, treetype, treetype)
run

clauses
create_tree(A, tree(A, empty, empty)).
insert_left(X, tree(A,_,B), tree(A,X,B)).
insert_right(X, tree(A,B,_), tree(A,B,X)).

run:-
create_tree("Oksana", Ch), 
create_tree("Ivan", H),
create_tree("Viktor", Mi), 
create_tree("Nina", J),
create_tree("Ylia", E), 
create_tree("Ekaterina", Me),
create_tree("Petr", Ca), 

insert_left(Ch, Mi, Mi2), insert_right(H, Mi2, Mi3),
insert_left(J, Me,Me2), insert_right(E, Me2, Me3),
insert_left(Mi3, Ca, Ca2),
insert_right(Me3, Ca2, Ca3),

write(Ca3, '\n').

goal
run.