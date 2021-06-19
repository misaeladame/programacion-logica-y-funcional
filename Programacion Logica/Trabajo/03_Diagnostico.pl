% Tecnológico Nacional de México Campus La Laguna
% Programación Lógica y Funcional - U3, U4
% PROLOG
% Alumno: 18131209 - ADAME SANDOVAL JOSE MISAEL
% 03_Diagnostico.pl

% Manuel esta enfermo de gripe
enfermo_de(manuel,gripe).
% alicia tiene sintomas de cansancio
tiene_sintoma(alicia,cansancio).
% la fiebre es un sintoma de gripe
sintoma_de(fiebre,gripe).
% la tos es un sintoma de gripe
sintoma_de(tos,gripe).
% el cansancio es un sintoma de anemia
sintoma_de(cansancio,anemia).
% las vitaminas eliminan el cansancio
elimina(vitaminas,cansancio).
% las aspirinas eliminan la fiebre
elimina(aspirinas,fiebre).
% el jarabe elimina la tos
elimina(jarabe,tos).

% se va a recetar un medicamento que alivia a un enfermo
recetar_a(X,Y):-enfermo_de(Y,A),alivia(X,A).
% el medicamento recetado alivia eliminando un sintoma
alivia(X,Y):-elimina(X,A),sintoma_de(A,Y).

% Se checa quien esta enfermo por los sintomas que tiene
enfermo_de(X,Y):-tiene_sintoma(X,Z),sintoma_de(Z,Y).
