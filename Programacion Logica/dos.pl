%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   dos.pl
%   Primer programa en Prolog
%   Demuestra base de conocimientos
%   Semestre EJ 2021
%   Programacion logica y funcional
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%hechos
gusta(lola, ricardo).
%gusta(lola, robles).
%regla
gusta(juan, X) :- gusta(lola, X).

%%%% Agregando
%Error esFeliz(ricardo).
esHombre(juan).
esHombre(ricardo).
%%%%
observa(lola, ricardo).
esFeliz(X) :- observa(lola, X).


