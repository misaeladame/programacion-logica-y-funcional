%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   cinco.pl
%   Programa en Prolog
%   Ejemplo de operaciones aritmeticas
%   Semestre EJ 2021
%   Programacion logica y funcional
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

cuadrado(X, Y) :- Y is X * X.
%%%Modificando
%cuadrado(X, Y) :- var(X), nonvar(Y), X is sqrt(Y).
%cuadrado(X, Y) :- nonvar(X), Y is X * X