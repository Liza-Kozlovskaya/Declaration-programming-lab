domains
N = integer

predicates
nondeterm mouth(integer, string)

clauses
mouth(N, "january") :- N=1.
mouth(N, "february") :- N=2.
mouth(N, "march") :- N=3.
mouth(N, "april") :- N=4.
mouth(N, "may") :- N=5.
mouth(N, "june") :- N=6.
mouth(N, "july") :- N=7.
mouth(N, "august") :- N=8.
mouth(N, "september") :- N=9.
mouth(N, "october") :- N=10.
mouth(N, "november") :- N=11.
mouth(N, "december") :- N=12.
mouth(N, "Error") :- N>=13.
mouth(N, "Error") :- N<=0.



goal
write("Input number: "),
readReal(N),
mouth(N, Y).





