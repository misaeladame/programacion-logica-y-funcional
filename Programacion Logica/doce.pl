%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   doce.pl
%   Programa en Prolog
%   Operaciones aritméticas
%   Semestre EJ 2021
%   Programacion logica y funcional
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Promedio
promedio(X, Y, Promedio) :- 
        Promedio is (X + Y) / 2.

%% Factorial
factorial(0, 1).
factorial(M, N) :-
        M1 is (M - 1),
        factorial(M1, N1),
        N is M * N1.

%% Maximo comun divisor
mcd(X, 0, X).
mcd(X, Y, M) :-
        X1 is X mod Y,
        mod(Y, X1, M).