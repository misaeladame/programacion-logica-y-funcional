% Tecnológico Nacional de México Campus La Laguna
% Programación Lógica y Funcional - U3, U4
% PROLOG
% Alumno: 18131209 - ADAME SANDOVAL JOSE MISAEL
% 05_Arbol.pl

% Se basa en el arbol genealógico

% Hechos, de los padres
padre(enrique7, enrique8).
padre(enrique7, arturo).
padre(enrique7, margarita).

padre(enrique8, catalina).
padre(enrique8, juana).
padre(enrique8, ana).

% Seccion de las madres
madre(anita, enrique8).
madre(juana, eduardo).
madre(ana, isabel).
madre(catalina, maria).

% Las personas que son del sexo masculino
hombre(enrique7).
hombre(enrique8).
hombre(arturo).
hombre(eduardo).

% Las personas que son del sexo femnenino
mujer(anita).
mujer(margarita).
mujer(catalina).
mujer(juana).
mujer(ana).
mujer(isabel).
mujer(maria).

% Las relaciones de hermano, que son de un padre o madre en común
hermano(A, B) :- hombre(A), padre(C,A), padre(C,B), A \= B.
hermano(A, B) :- hombre(A), madre(C,A), madre(C,B), A \= B.

hermana(D, E) :- mujer(D), padre(F,E), padre(F,D), D \= E.
hermana(D, E) :- mujer(D), madre(F,E), madre(F,D), D \= E. 

% En caso de que el abuelo es hombre, padre del hijo y el hijo es padre del nieto
abuelo(Ab, Nieto) :- hombre(Ab), padre(Ab, Hijo), padre(Hijo, Nieto).
% En caso de que el abuelo es hombre, padre del hija y el hijo es madre del nieto
abuelo(Ab, Nieto) :- hombre(Ab), padre(Ab, Hija), madre(Hija, Nieto).
% En caso de que la abuela es mujer, madre del hijo y el hijo es padre del nieto
abuela(Ab, Nieto) :- mujer(Ab), madre(Ab, Hijo), padre(Hijo, Nieto).
% En caso de que la abuela es mujer, madre de la hija y la hija es madre del nieto
abuela(Ab, Nieto) :- mujer(Ab), madre(Ab, Hija), madre(Hija, Nieto).
