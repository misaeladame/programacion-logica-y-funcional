% Tecnológico Nacional de México Campus La Laguna
% Programación Lógica y Funcional - U3, U4
% PROLOG
% Alumno: 18131209 - ADAME SANDOVAL JOSE MISAEL
% 11_Base.pl

/*---- BASE DE CONOCIMIENTOS ----*/

numeroPropiedades(3).
objetosUniverso(3).

/*- PROPIEDADES -*/

/* prof(Profesor) <- Profesor es el nombre de un profesor */
prof(maria).
prof(jesus).
prof(faraon).

/* asig(Asignatura) <- Asignatura es el nombre de una asignatura */
asig(logica).
asig(programacion).
asig(matematicas).

/* dia(Dia) <- Dia es un día de la semana que hay alguna clase */
dia(lunes).
dia(miercoles).
dia(jueves).

/*- RELACIONES -*/

/* r1(Profesor,Asignatura) <- Profesor imparte la Asignatura */
r1(maria,programacion).
r1(Profesor,Asignatura) :- prof(Profesor), Profesor\=maria,
    asig(Asignatura).

/* r2(Profesor,Dia) <- Profesor imparte sus clases el Dia de la semana */
r2(faraon,Dia) :- dia(Dia), Dia\=lunes.
r2(Profesor,Dia) :- prof(Profesor), Profesor\=faraon,
    dia(Dia).

/* r3(Asignatura,Dia) <- Asignatura se imparte el Dia de la semana */
r3(logica,Dia) :- dia(Dia), Dia\=lunes, Dia\=jueves.
r3(programacion,Dia) :- dia(Dia), Dia\=lunes.
r3(Asignatura,Dia) :- asig(Asignatura), Asignatura\=logica,
    Asignatura\=programacion, dia(Dia).