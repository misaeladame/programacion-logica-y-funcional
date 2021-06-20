% Tecnológico Nacional de México Campus La Laguna
% Programación Lógica y Funcional - U3, U4
% PROLOG
% Alumno: 18131209 - ADAME SANDOVAL JOSE MISAEL
% 09_Listas.pl

/* miembro(Elem,Lista) <- el término Elem pertenece a la lista Lista */
miembro(X,[X|_]).
miembro(X,[_|Y]) :- miembro(X,Y).

/* nel(Lista,N) <- el número de elementos de la lista Lista es N */
nel([],0).
nel([_|Y],N) :- nel(Y,M),
    N is M+1.

/* es_lista(Lista) <- Lista es una lista */
es_lista([]).
es_lista([_|_]).

/* concatena(L1,L2,L3) <- concatenación de las listas L1 y L2 dando lugar a L3 */
concatena([],L,L).
concatena([X|L1],L2,[X|L3]) :- concatena(L1,L2,L3).

/* ultimo(Elem,Lista) <- Elem es el último elemento de la lista Lista */
ultimo(X,[X]).
ultimo(X,[_|Y]) :- ultimo(X,Y).

/* inversa(Lista,Inver) <- Inver es la inversa de la lista Lista */
inversa([],[]).
inversa([X|Y],L) :- inversa(Y,Z),
    concatena(Z,[X],L).

/* borrar(Elem,L1,L2) <- se borra el elemento Elem de la lista L1 obteniendose L2 */
borrar(X,[X|Y],Y).
borrar(X,[Z|L],[Z|M]) :- borrar(X,L,M).

/* subconjunto(L1,L2) <- la lista L1 es un subconjunto de la lista L2 */
subconjunto([X|Y],Z) :- miembro(X,Z),
    subconjunto(Y,Z).
    subconjunto([],_).

/* insertar(Elem,L1,L2) <- se inserta el elemento Elem en la lista L1 obteniendose L2 */
insertar(E,L,[E|L]).
insertar(E,[X|Y],[X|Z]) :- insertar(E,Y,Z).

/* permutacion(L1,L2) <- la lista L2 es una permutación de la lista L1 */
permutacion([],[]).
permutacion([X|Y],Z) :- permutacion(Y,L),
    insertar(X,L,Z).

/* sust(E1,E2,L1,L2) <- L2 es L1 sustituyendo las ocurrencias del elemento E1 por E2 */
sust(_,_,[],[]).
sust(E1,E2,[E1|L1],[E2|L2]) :- !, sust(E1,E2,L1,L2).
sust(E1,E2,[Y|L1],[Y|L2]) :- sust(E1,E2,L1,L2).

/* union(L1,L2,L3) <- L3 es la lista-conjunto unión de L1 y L2 */
union([],L,L).
union([X|L1],L2,L3) :- miembro(X,L2), !,
    union(L1,L2,L3).
    union([X|L1],L2,[X|L3]) :- union(L1,L2,L3).
    