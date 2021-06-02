%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   nueve.pl
%   Programa en Prolog
%   Escritura de caracteres: equivalencia del tab
%   Semestre EJ 2021
%   Programacion logica y funcional
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

tabu(0) :- !.
tabu(M) :- put(32),
        I is M-1,
        tab(I).