%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   seis.pl
%   Programa en Prolog
%   Ejemplo de operaciones aritméticas-relaciones
%   Semestre EJ 2021
%   Programacion logica y funcional
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

suma( X, Result) :- X =< 1, Result is 1.

%% Con operaciones aritméticas
objeto('celular', 6, 12).
objeto('tablet', 15, 20).
area(Objeto, D) :-
    objeto(Objeto, B, A),
    D is B * A,
    write(Objeto), write(' : '),
    write(D).

%% Con operadores relacionales
maximo(X, Y, X) :- X >= Y.
maximo(X, Y, Y) :- Y >= X.

libro('C++', autor1, 2020).
libro('C#', autor1, 2021).
libro('Java', autor1, 2019).
libro('JavaScript', autor2, 2019).
busca(Autor, X) :-
    libro(Titulo, Autor, Anio),
    Anio =< X,
    write(Titulo), nl.
