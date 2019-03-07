domains
number=integer*
strings=string*

predicates
numtostr(number,strings)
nondeterm func(integer,string)

clauses
numtostr([X|Xt],[S|St]):-func(X,S),
numtostr(Xt,St).
 
func(0,"Zero").
func(1,"One").
func(2,"Two").
func(3,"Three").
func(4,"Four").
func(5,"Five").
func(6,"Six").
func(7,"Seven").
func(8,"Eight").
func(9,"Nine").

goal
write("Input number for search: "),
readReal(Y),
func(Y,X).