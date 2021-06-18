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

%% Concatenar   reformar esta regla --tarea
concatenar([], Lista, Lista).
concatenar([X|L1], L2, [X|L3]) :-
    concatenar(L1, L2, L3).

%% Agregar al inicio
inicio(X, L, [X|L]).

%% Agregar al final
final(X, L, F) :-
    concatenar(L, [X], F).

%% 
%% Boorado de la primera ocurrencia
%% Borrar : al inicio de la lista (primer elemento)
borrar(X, [X|Cola], Cola).
%% Borrar : cuando no es la cabeza
borrar(X, [Y|Cola1], [Y|Cola2]) :-
    borrar(X, Cola1, Cola2).

%%
%% Borrado de todas las ocurrencias
%% Borrar : un elemento en una lista vacia.
borrar(_, [], []).
%% Borrar: lista solo contiene el elemento a borrar
borrar(X, [X], []).
%% Borrar : borrar elemento de la cabeza
borrar(X, [X | Cola1], Cola2) :-
    borrar(X, Cola1, Cola2).
%% Borrar : elemento no es la cabeza
borrar(X, [Y | Cola1], [Y | Cola2]) :-
    borrar(X, Cola1, Cola2).

%% Lista: subconjunto
sublista(Sub, Lista) :-
    concatenar(_, L2, Lista),
    concatenar(Sub, _, L2).

%% Invertir una ista
invertir([], []).
invertir([Cabeza|Cola], X) :-
    invertir(Cola, Cola1),
    final(Cabeza, Cola1, X).