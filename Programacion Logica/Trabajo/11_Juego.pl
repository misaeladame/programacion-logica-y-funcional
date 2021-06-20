% Tecnológico Nacional de México Campus La Laguna
% Programación Lógica y Funcional - U3, U4
% PROLOG
% Alumno: 18131209 - ADAME SANDOVAL JOSE MISAEL
% 11_Juego.pl

/*---- JUEGO DE LÓGICA ----*/

mensaje :- nl,write('Ejemplo "Juego Logico" cargado.'),nl,
    write('Se lanza con ?- iniciar.'),
    nl,nl.

/*---- PROGRAMA PRINCIPAL ----*/

/* iniciar <- llamada inicial del programa */
iniciar :- write('Base de Conocimientos: '),
    read(BC),
    consult(BC),!,
    nl,write('Base de Conocimientos '),write(BC),
    write(' consultada'),nl,nl,
    numeroPropiedades(N),
    objetosUniverso(M),
    iniciar(N,M).

iniciar :- nl,write('ERROR: Base de Conocimientos no encontrada'),nl.
iniciar(2,M) :- !,ini(M,[],[]).
iniciar(3,M) :- !,ini(M,[],[],[]).
iniciar(4,M) :- !,ini(M,[],[],[],[]).
iniciar(5,M) :- !,ini(M,[],[],[],[],[]).
iniciar(N,_) :- nl,write('ERROR: Número de Propiedades incorrecto = '),
    write(N),nl.

/* ini(Sol1,Sol2,...) <- Sol1 es una lista con los objetos del dominio 1,
Sol2 la lista con los objetos del dominio 2, ...
con las soluciones respectivamente relacionadas. */
/* Correlacionar 2 propiedades */
ini(M,L1,L2) :- nel(L1,M),escribir(L1,L2),nl,pausa,fail.
ini(M,L1,L2) :- r1(Obj1,Obj2),
    nopertenece(Obj1,L1),
    nopertenece(Obj2,L2),
    ini(M,[Obj1|L1],[Obj2|L2]).

/* Correlacionar 3 propiedades */
ini(M,L1,L2,L3) :- nel(L1,M),escribir(L1,L2,L3),nl,pausa,fail.
ini(M,L1,L2,L3) :- r1(Obj1,Obj2),
    nopertenece(Obj1,L1),
    nopertenece(Obj2,L2),
    r2(Obj1,Obj3),
    nopertenece(Obj3,L3),
    r3(Obj2,Obj3),
    ini(M,[Obj1|L1],[Obj2|L2],[Obj3|L3]).

/* Correlacionar 4 propiedades */
ini(M,L1,L2,L3,L4) :- nel(L1,M),escribir(L1,L2,L3,L4),nl,pausa,fail.
ini(M,L1,L2,L3,L4) :- r1(Obj1,Obj2),
    nopertenece(Obj1,L1),
    nopertenece(Obj2,L2),
    r2(Obj1,Obj3),
    nopertenece(Obj3,L3),
    r3(Obj1,Obj4),
    nopertenece(Obj4,L4),
    r4(Obj2,Obj3),
    r5(Obj2,Obj4),
    r6(Obj3,Obj4),
    ini(M,[Obj1|L1],[Obj2|L2],[Obj3|L3],[Obj4|L4]).

/* Correlacionar 5 propiedades */
ini(M,L1,L2,L3,L4,L5) :- nel(L1,M),escribir(L1,L2,L3,L4,L5),nl,pausa,fail.
ini(M,L1,L2,L3,L4,L5) :- r1(Obj1,Obj2),
    nopertenece(Obj1,L1),
    nopertenece(Obj2,L2),
    r2(Obj1,Obj3),
    nopertenece(Obj3,L3),
    r3(Obj1,Obj4),
    nopertenece(Obj4,L4),
    r4(Obj1,Obj5),
    nopertenece(Obj5,L5),
    r5(Obj2,Obj3),
    r6(Obj2,Obj4),
    r7(Obj2,Obj5),
    r8(Obj3,Obj4),
    r9(Obj3,Obj5),
    r10(Obj4,Obj5),
    ini(M,[Obj1|L1],[Obj2|L2],[Obj3|L3],[Obj4|L4],[Obj5|L5]).

/*---- RUTINAS GENERALES ----*/

/* escribir(Lista1,Lista2,...) <- escribe las soluciones correlacionadas
de las listas: Lista1, Lista2 ... */
escribir([],[]).
escribir([Obj1|Resto1],[Obj2|Resto2]) :-
    write(Obj1), write(' - '),write(Obj2),nl,
    escribir(Resto1,Resto2).

escribir([],[],[]).
escribir([Obj1|Resto1],[Obj2|Resto2],[Obj3|Resto3]) :-
    write(Obj1), write(' - '),write(Obj2),
    write(' - '), write(Obj3),nl,
    escribir(Resto1,Resto2,Resto3).

escribir([],[],[],[]).
escribir([Obj1|Resto1],[Obj2|Resto2],[Obj3|Resto3],[Obj4|Resto4]) :-
    write(Obj1), write(' - '),write(Obj2),
    write(' - '), write(Obj3),write(' - '),write(Obj4),nl,
    escribir(Resto1,Resto2,Resto3,Resto4).

escribir([],[],[],[],[]).
escribir([Obj1|Resto1],[Obj2|Resto2],[Obj3|Resto3],[Obj4|Resto4],[Obj5|Resto5]) :-
    write(Obj1), write(' - '),write(Obj2),write(' - '),
    write(Obj3),write(' - '),write(Obj4),write(' - '),
    write(Obj5),nl,
    escribir(Resto1,Resto2,Resto3,Resto4,Resto5).

/* pausa <- detiene la ejecución del programa hasta que se pulse una tecla */
pausa :- write('Pulsa <return> para buscar otra solucion'),
skip(10),nl.

/*---- RUTINAS DE MANEJO DE LISTAS ----*/

/* nopertenece(Elem,Lista)) <- el elemento Elem no pertenece a la lista Lista */
nopertenece(_,[]).
nopertenece(E,[X|L]) :- E\=X,
    nopertenece(E,L).

/* nel(Lista,N) <- el número de elementos de la lista Lista es N */
nel([],0).
nel([_|L],N) :- nel(L,M),
    N is M+1.

:- mensaje.