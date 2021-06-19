% Tecnológico Nacional de México Campus La Laguna
% Programación Lógica y Funcional - U3, U4
% PROLOG
% Alumno: 18131209 - ADAME SANDOVAL JOSE MISAEL
% 08_Listas.pl

/* sumatorio(Num,Sum) <- Sum es el sumatorio desde 1 hasta Num */
sumatorio(1,1) :- !.
sumatorio(N,S) :- N1 is N-1,
    sumatorio(N1,S1),
    S is N+S1.

/* natural(Num) <- Num es un número perteneciente a los Naturales */
natural(0).
natural(X) :- natural(Y),
    X is Y+1.

/* diventera(Dividendo,Divisor,Cociente) <- Cociente es el resultado de la división */
diventera(A,B,C) :- natural(C),
    Y1 is C*B,
    Y2 is (C+1)*B,
    Y1=<A, Y2>A, !.