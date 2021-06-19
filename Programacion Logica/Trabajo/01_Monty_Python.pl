% Tecnológico Nacional de México Campus La Laguna
% Programación Lógica y Funcional - U3, U4
% PROLOG
% Alumno: 18131209 - ADAME SANDOVAL JOSE MISAEL
% 01_Monty_Python.pl

% una bruja es una mujer que arde
witch(X) :- burns(X),female(X).
% La madera se quema
burns(X) :- wooden(X).
% La madera flota
wooden(X) :- floats(X).
% ¿Qué más flota en el agua? Un pato; si algo tiene el mismo peso que un 
% pato debe flotar.
floats(X) :- sameweight(duck, X).
% La chica es una mujer
female(girl).
% La chica y el pato se equilibran perfectamente con el mismo peso
sameweight(duck,girl).
