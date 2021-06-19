% Tecnológico Nacional de México Campus La Laguna
% Programación Lógica y Funcional - U3, U4
% PROLOG
% Alumno: 18131209 - ADAME SANDOVAL JOSE MISAEL
% 02_Cancion_estupida.pl

% cancionesestupida(0), canta lo siguiente
cancionestupida(0) :- nl,write('Gomo ya no gueda shevvezza, -hic- be boy a doddmig...').

% cancionesestupida(N>1), canta N veces lo siguiente, después de que se canta
% una vez, se resta 1 y se vuelve a llamar la función (recursividad) mientras se 
% cumpla la condición ya cuando es N = 1, se llama la última función de cancionestupida
cancionestupida(N):- N>1,nl,write(N),write(' botellas de cerveza en el suelo'),nl,
    write(N),write(' botellas de cerveza'),nl,
    write('Cojo una y me la bebo'),nl,
    A is N-1, cancionestupida(A).

% cancionestupida(N=1), canta lo siguiente, después de cantar se resta 1,
% por lo tanto, N = 0, y cuando se llama la función otra vez, ahora ingresa
% a la primera funcion escrita de cancionestupida
cancionestupida(N):-N=1,nl,write(N),write(' bodellia de shegvezza en el zsduelo'),nl,
    write(N),write(' bodella de segbezha'),nl,
    write('La gojo y be la bhebo'),nl,
    A is N-1, cancionestupida(A).
