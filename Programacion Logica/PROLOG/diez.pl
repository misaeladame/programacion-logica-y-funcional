%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   diez.pl
%   Programa en Prolog
%   Comprension de listas
%   Operaciones con listas
%   Semestre EJ 2021
%   Programacion logica y funcional
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Comprension de listas
lista([1, 2, 3, 4, 5]).
meses([ene, feb, mar, abr, may, jun, jul, ago, sep, oct, nov, dic]).

%% Es lista
es_lista([]).
es_lista([_|Cola]) :-
    es_lista(Cola).


escribeCadena([]).
escribeCadena([Cabeza]|[Resto]) :-
    put(Cabeza),
    escribeCadena(Resto).

%% Longitud de una cadena
longitud([], 0).
longitud([_|Cola], Cuenta) :-
    longitud(Cola, Cont),
    Cuenta is Cont + 1.

%% Busca un elemento en la lista
busca(X, [X|_]).  % en la cabeza
busca(X, [_|Cola]) :-
    busca(X, Cola).

%% Concatenar
concatenar([], Lista, Lista).
concatenar([X|L1], L2, [X|L3]) :-
    concatenar(L1, L2, L3).

