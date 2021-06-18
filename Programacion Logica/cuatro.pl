padre(juan, carlos).
padre(juan, rosario).
padre(juan, soltero).
padre(victor, belen).   %ok
padre(carlos, elena).   %ok
padre(carlos, carlitos).

madre(maria, soltero).   %ok
madre(maria, carlos).
madre(maria, rosario).
madre(consuelo, belen).  %ok
madre(belen, elena).     %ok
madre(belen, carlitos).

abuelo(Ab, Nieto) :- padre(Ab, Hijo), padre(Hijo, Nieto).
abuelo(Ab, Nieto) :- padre(Ab, Hija), madre(Hija, Nieto).
abuela(Ab, Nieto) :- madre(Ab, Hijo), padre(Hijo, Nieto).
abuela(Ab, Nieto) :- madre(Ab, Hija), madre(Hija, Nieto).

