% Tecnológico Nacional de México Campus La Laguna
% Programación Lógica y Funcional - U3, U4
% PROLOG
% Alumno: 18131209 - ADAME SANDOVAL JOSE MISAEL
% 04_Planificador.pl

% El transporte a una ciudad y su costo
transporte(roma,20000).
transporte(londres,25000).
transporte(tunez,15000).

% El tipo, ciudad y costo que tendrá el alojamiento
alojamiento(hotel,roma,25000).
alojamiento(hotel,londres,15000).
alojamiento(hotel,tunez,10000).
alojamiento(hostal,roma,15000).
alojamiento(hostal,londres,10000).
alojamiento(hostal,tunez,8000).
alojamiento(camping,roma,10000).
alojamiento(camping,londres,5000).
alojamiento(camping,tunez,5000).

% Calcular el costo del viaje
% W = Ciudad destino
% X = Dias del alojamiento
% Y = Tipo de alojamiento
% A = El costo del transporte
% Z = Costo total del 
%       viaje = costo total del alojamiento + costo de transporte
% C = Costo de un dia de alojamiento
% B = Costo total del alojamiento

viaje(W,X,Y,Z):-transporte(W,A),alojamiento(Y,W,C),B is C*X,Z is A+B.
