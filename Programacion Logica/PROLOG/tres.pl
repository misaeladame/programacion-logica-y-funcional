%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   dos.pl
%   Programa en Prolog
%   Backtraking unico antecedente
%   Semestre EJ 2021
%   Programacion logica y funcional
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%% HECHOS
obs(belen, carlos).
obs(fer, maria).
obs(fer, lola).
%obs(_,maria).
feliz(pedro).  %"Si pasa la materia" - Aaron
%%% REGLAS
feliz(X) :- obs(fer, X).
feliz(X) :- obs(belen, X).