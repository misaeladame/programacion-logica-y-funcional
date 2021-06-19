% Tecnológico Nacional de México Campus La Laguna
% Programación Lógica y Funcional - U3, U4
% PROLOG
% Alumno: 18131209 - ADAME SANDOVAL JOSE MISAEL
% 06_Red_semantica.pl

% A que categoría pertenecen unas especies
% Los que son animales
es_un(ave,animal).
es_un(mamifero,animal).
es_un(avestruz, animal).
es_un(albatros, animal).
es_un(ballena, animal).
es_un(tigre, animal).

% Los que son aves
es_un(avestruz,ave).
es_un(albatros,ave).

% Los que son mamiferos
es_un(ballena,mamifero).
es_un(tigre,mamifero).

% Los atributos que tienen las especies (la red)
% Los que pueden respirar
atributo(animal,puede,respirar).
atributo(ave, puede, respirar).
atributo(mamifero, puede, repirar).
atributo(avestruz, puede, respirar).
atributo(albatros, puede, respirar).
atributo(ballena, puede, repirar).
atributo(tigre, puede, respirar).

% Vuelan bien
atributo(ave,vuela,bien).
atributo(albatros,vuela,bien).

% Tienen plumas
atributo(ave,tiene,plumas).
atributo(avestruz,tiene,plumas).
atributo(albatros, tiene, plumas).

% Ponen huevos
atributo(ave,pone,huevos).
atributo(avestruz,pone,huevos).
atributo(albatros,pone,huevos).

% El de patas largas
atributo(avestruz,patas,largas).

% Los que tienen pelo
atributo(mamifero,tiene,pelo).
atributo(tigre,tiene,pelo).

% Dan leche
atributo(mamifero,da,leche).
atributo(ballena,da,leche).
atributo(tigre,da,leche).

% Viven en el mar
atributo(ballena,vive_en,mar).

% Come carne
atributo(tigre,come,carne).

% Situaciones especiales de unas especies
particular(avestruz,vuela,no_puede).
particular(albatros,vuela,muy_bien).
particular(ballena,tiene,piel).