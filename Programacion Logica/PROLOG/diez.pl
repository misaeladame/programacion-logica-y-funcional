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