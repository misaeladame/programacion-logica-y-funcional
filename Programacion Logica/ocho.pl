%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   ocho.pl
%   Programa en Prolog
%   Ejemplo de operacin predefinida
%   Semestre EJ 2021
%   Programacion logica y funcional
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%% HECHOS
obs(fer, maria).
obs(fer, lola).
%%% REGLAS
novios :- write("Novix : "),
        read(X),
        write("Novix de : "), write(X), write(" es "),
        obs(X, Y),
        write(Y).