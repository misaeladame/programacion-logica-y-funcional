-- Tecnológico Nacional de México Campus La Laguna
-- Programación Lógica y Funcional, - U2
-- Haskell
-- Alumno: 18131209 - ADAME SANDOVAL JOSE MISAEL

-- Relacion 20

-- Método de Gauss para triangulziar matrices

-- ---------------------------------------------------------------------
-- Introducción	--
-- ---------------------------------------------------------------------

-- ---------------------------------------------------------------------
-- El objetivo de esta relación es definir el método de Gauss para
-- triangularizar matrices.
-- Además, en algunos ejemplos de usan matrices con números racionales.
-- En Haskell, el número  racional x/y se representa por x%y.  El TAD  de
-- los números racionales está definido en el módulo Data.Ratio.
-- ---------------------------------------------------------------------

-- ---------------------------------------------------------------------
-- Importación de librerías	--
-- ---------------------------------------------------------------------

import Data.Array
    ( (!), array, assocs, bounds, elems, listArray, Array ) 
import Data.Ratio

-- ---------------------------------------------------------------------
-- Tipos de los vectores y de las matrices	--
-- ---------------------------------------------------------------------

-- Los vectores son tablas cuyos índices son números naturales.
type Vector a = Array Int a

-- Las matrices son tablas cuyos índices son pares de números
-- naturales.
type Matriz a = Array (Int,Int) a


-- ---------------------------------------------------------------------
-- Funciones auxiliares	--
-- ---------------------------------------------------------------------

-- ---------------------------------------------------------------------
-- Ejercicio 1. Definir la función
--	listaMatriz :: Num a => [[a]] -> Matriz a
-- tal que (listaMatriz xss) es la matriz cuyas filas son los elementos
-- de xss. Por ejemplo,
--	ghci> listaMatriz [[1,3,5],[2,4,7]]
--	array ((1,1),(2,3)) [((1,1),1),((1,2),3),((1,3),5),
--	((2,1),2),((2,2),4),((2,3),7)]
-- ---------------------------------------------------------------------

listaMatriz :: Num a => [[a]] -> Matriz a
listaMatriz xss = listArray ((1,1),(m,n)) (concat xss)
  where m = length xss
        n = length (head xss)

-- ---------------------------------------------------------------------
-- Ejercicio 2. Definir la función
--	separa :: Int -> [a] -> [[a]]
-- tal que (separa n xs) es la lista obtenida separando los elementos de
-- xs en grupos de n elementos (salvo el último que puede tener menos de
-- n elementos). Por ejemplo,
--	separa 3 [1..11]	==	[[1,2,3],[4,5,6],[7,8,9],[10,11]]
-- ---------------------------------------------------------------------

separa :: Int -> [a] -> [[a]] 
separa _ [] = []
separa n xs = take n xs : separa n (drop n xs)


-- ---------------------------------------------------------------------
-- Ejercicio 3. Definir la función
--	matrizLista :: Num a => Matriz a -> [[a]]
-- tal que (matrizLista x) es la lista de las filas de la matriz x. Por
-- ejemplo, 
--	ghci> m = listaMatriz [[5,1,0],[3,2,6]]
--	ghci> m
--	array ((1,1),(2,3)) [((1,1),5),((1,2),1),((1,3),0),
--	((2,1),3),((2,2),2),((2,3),6)]
--	ghci> matrizLista m
--	[[5,1,0],[3,2,6]]
-- ---------------------------------------------------------------------

matrizLista :: Num a => Matriz a -> [[a]] 
matrizLista p = separa (numColumnas p) (elems p)


-- ---------------------------------------------------------------------
-- Ejercicio 4. Definir la función
--	numFilas :: Num a => Matriz a -> Int
-- tal que (numFilas m) es el número de filas de la matriz m. Por
-- ejemplo,
--	numFilas (listaMatriz [[1,3,5],[2,4,7]])	==	2
-- ---------------------------------------------------------------------

numFilas :: Num a => Matriz a -> Int
numFilas = fst . snd . bounds


-- ---------------------------------------------------------------------
-- Ejercicio 5. Definir la función
--	numColumnas :: Num a => Matriz a -> Int
-- tal que (numColumnas m) es el número de columnas de la matriz
-- m. Por ejemplo,
--	numColumnas (listaMatriz [[1,3,5],[2,4,7]])	==	3
-- ---------------------------------------------------------------------

numColumnas :: Num a => Matriz a -> Int
numColumnas = snd . snd . bounds

-- ---------------------------------------------------------------------
-- Ejercicio 6. Definir la función
--	dimension :: Num a => Matriz a -> (Int,Int)
-- tal que (dimension m) es la dimensión de la matriz m. Por ejemplo,
--	dimension (listaMatriz [[1,3,5],[2,4,7]])	==	(2,3)
-- ---------------------------------------------------------------------
 
dimension :: Num a => Matriz a -> (Int,Int)
dimension p = (numFilas p, numColumnas p)


-- ---------------------------------------------------------------------
-- Ejercicio 7. Definir la función
--	diagonalPral :: Num a => Matriz a -> Vector a
-- tal que (diagonalPral p) es la diagonal principal de la matriz p. Por
-- ejemplo,
--	ghci> p = listaMatriz [[5,1,0],[3,2,6]]
--	ghci> diagonalPral p
--	array (1,2) [(1,5),(2,2)]
--	ghci> elems (diagonalPral p)
--	[5,2]
-- ---------------------------------------------------------------------


diagonalPral :: Num a => Matriz a -> Vector a 
diagonalPral p = array (1,n) [(i,p!(i,i)) | i <- [1..n]]
  where n = min (numFilas p) (numColumnas p)


-- ---------------------------------------------------------------------
-- Transformaciones elementales	--
-- ---------------------------------------------------------------------

-- ---------------------------------------------------------------------
-- Ejercicio 8. Definir la función
--	intercambiaFilas :: Num a => Int -> Int -> Matriz a -> Matriz a
-- tal que (intercambiaFilas k l p) es la matriz obtenida intercambiando
-- las filas k y l de la matriz p. Por ejemplo,
--	ghci> p = listaMatriz [[5,1,0],[3,2,6],[4,6,9]]
--	ghci> intercambiaFilas 1 3 p
--	array ((1,1),(3,3)) [((1,1),4),((1,2),6),((1,3),9),
--	((2,1),3),((2,2),2),((2,3),6),
--	((3,1),5),((3,2),1),((3,3),0)]
--	ghci> matrizLista (intercambiaFilas 1 3 p)
--	[[4,6,9],[3,2,6],[5,1,0]]
-- ---------------------------------------------------------------------

intercambiaFilas :: Num a => Int -> Int -> Matriz a -> Matriz a
intercambiaFilas k l p =
  array ((1,1), (m,n))
        [((i,j), p! f i j) | i <- [1..m], j <- [1..n]]
  where (m,n) = dimension p
        f i j | i == k	= (l,j)
              | i == l	= (k,j)
              | otherwise = (i,j)


-- ---------------------------------------------------------------------
-- Ejercicio 9. Definir la función
--	intercambiaColumnas :: Num a => Int -> Int -> Matriz a -> Matriz a
-- tal que (intercambiaColumnas k l p) es la matriz obtenida
-- intercambiando las columnas k y l de la matriz p. Por ejemplo,
--	ghci> p = listaMatriz [[5,1,0],[3,2,6],[4,6,9]]
--	ghci> matrizLista (intercambiaColumnas 1 3 p)
--	[[0,1,5],[6,2,3],[9,6,4]]
-- ---------------------------------------------------------------------

intercambiaColumnas :: Num a => Int -> Int -> Matriz a -> Matriz a 
intercambiaColumnas k l p =
  array ((1,1), (m,n))
        [((i,j), p ! f i j) | i <- [1..m], j <- [1..n]]
  where (m,n) = dimension p
        f i j | j == k	= (i,l)
              | j == l	= (i,k)
              | otherwise = (i,j)


-- ---------------------------------------------------------------------
-- Ejercicio 10. Definir la función
--	multFilaPor :: Num a => Int -> a -> Matriz a -> Matriz a
-- tal que (multFilaPor k x p) es a matriz obtenida multiplicando la
-- fila k de la matriz p por el número x. Por ejemplo,
--	ghci> p = listaMatriz [[5,1,0],[3,2,6],[4,6,9]]
--	ghci> matrizLista (multFilaPor 2 3 p)
--	[[5,1,0],[9,6,18],[4,6,9]]
-- ---------------------------------------------------------------------

multFilaPor :: Num a => Int -> a -> Matriz a -> Matriz a 
multFilaPor k x p =
  array ((1,1), (m,n))
        [((i,j), f i j) | i <- [1..m], j <- [1..n]]
  where (m,n) = dimension p
        f i j | i == k	= x*(p!(i,j))
              | otherwise = p!(i,j)


-- ---------------------------------------------------------------------
-- Ejercicio 11. Definir la función
--	sumaFilaFila :: Num a => Int -> Int -> Matriz a -> Matriz a
-- tal que (sumaFilaFila k l p) es la matriz obtenida sumando la fila l
-- a la fila k d la matriz p. Por ejemplo,
--	ghci> p = listaMatriz [[5,1,0],[3,2,6],[4,6,9]]
--	ghci> matrizLista (sumaFilaFila 2 3 p)
--	[[5,1,0],[7,8,15],[4,6,9]]
-- ---------------------------------------------------------------------

sumaFilaFila :: Num a => Int -> Int -> Matriz a -> Matriz a 
sumaFilaFila k l p =
  array ((1,1), (m,n))
        [((i,j), f i j) | i <- [1..m], j <- [1..n]]
  where (m,n) = dimension p
        f i j | i == k	= p!(i,j) + p!(l,j)
              | otherwise = p!(i,j)


-- ---------------------------------------------------------------------
-- Ejercicio 12. Definir la función
--	sumaFilaPor :: Num a => Int -> Int -> a -> Matriz a -> Matriz a
-- tal que (sumaFilaPor k l x p) es la matriz obtenida sumando a la fila
-- k de la matriz p la fila l multiplicada por x. Por ejemplo,
--	ghci> p = listaMatriz [[5,1,0],[3,2,6],[4,6,9]]
--	ghci> matrizLista (sumaFilaPor 2 3 10 p)
--	[[5,1,0],[43,62,96],[4,6,9]]
-- ---------------------------------------------------------------------

sumaFilaPor :: Num a => Int -> Int -> a -> Matriz a -> Matriz a 
sumaFilaPor k l x p =
  array ((1,1), (m,n))
        [((i,j), f i j) | i <- [1..m], j <- [1..n]]
  where (m,n) = dimension p
        f i j | i == k	= p!(i,j) + x*p!(l,j)
              | otherwise = p!(i,j)


-- ---------------------------------------------------------------------
-- Triangularización de matrices	--
-- ---------------------------------------------------------------------

-- ---------------------------------------------------------------------
-- Ejercicio 13. Definir la función
--	buscaIndiceDesde :: (Num a, Eq a) =>
--	Matriz a -> Int -> Int -> Maybe Int
-- tal que (buscaIndiceDesde p j i) es el menor índice k, mayor o igual
-- que i, tal que el elemento de la matriz p en la posición (k,j) es no
-- nulo. Por ejemplo,
--	ghci> p = listaMatriz [[5,1,0],[3,2,6],[4,6,9]]
--	ghci> buscaIndiceDesde p 3 2
--	Just 2
--	ghci> q = listaMatriz [[5,1,1],[3,2,0],[4,6,0]]
--	ghci> buscaIndiceDesde q 3 2
--	Nothing
-- ---------------------------------------------------------------------

buscaIndiceDesde :: (Num a, Eq a) => Matriz a -> Int -> Int -> Maybe Int
buscaIndiceDesde p j i
  | null xs	= Nothing
  | otherwise = Just (head xs)
  where xs = [k | ((k,j'),y) <- assocs p, j == j', y /= 0, k >= i]


-- ---------------------------------------------------------------------
-- Ejercicio 14. Definir la función
--	buscaPivoteDesde :: (Num a, Eq a) =>
--	Matriz a -> Int -> Int -> Maybe a
-- tal que (buscaPivoteDesde p j i) es el elemento de la matriz p en la
-- posición (k,j) donde k es (buscaIndiceDesde p j i). Por ejemplo,
--	ghci> p = listaMatriz [[5,1,0],[3,2,6],[4,6,9]]
--	ghci> buscaPivoteDesde p 3 2
--	Just 6
--	ghci> q = listaMatriz [[5,1,1],[3,2,0],[4,6,0]]
--	ghci> buscaPivoteDesde q 3 2
--	Nothing
-- ---------------------------------------------------------------------

buscaPivoteDesde :: (Num a, Eq a) => Matriz a -> Int -> Int -> Maybe a 
buscaPivoteDesde p j i
  | null xs	= Nothing
  | otherwise = Just (head xs)
  where xs = [y | ((k,j'),y) <- assocs p, j == j', y /= 0, k >= i]


-- ---------------------------------------------------------------------
-- Ejercicio 15. Definir la función
--	anuladaColumnaDesde :: (Num a, Eq a) =>
--	Int -> Int -> Matriz a -> Bool
-- tal que (anuladaColumnaDesde j i p) se verifica si todos los
-- elementos de la columna j de la matriz p desde i+1 en adelante son
-- nulos. Por ejemplo,
--	ghci> q = listaMatriz [[5,1,1],[3,2,0],[4,6,0]]
--	ghci> anuladaColumnaDesde q 3 2
--	True
--	ghci> p = listaMatriz [[5,1,0],[3,2,6],[4,6,9]]
--	ghci> anuladaColumnaDesde p 3 2
--	False
-- ---------------------------------------------------------------------

anuladaColumnaDesde :: (Num a, Eq a) => Matriz a -> Int -> Int -> Bool
anuladaColumnaDesde p j i =
  buscaIndiceDesde p j (i+1) == Nothing


-- ---------------------------------------------------------------------
-- Ejercicio 16. Definir la función
--	anulaEltoColumnaDesde :: (Fractional a, Eq a) =>
--	Matriz a -> Int -> Int -> Matriz a
-- tal que (anulaEltoColumnaDesde p j i) es la matriz obtenida a partir
-- de p anulando el primer elemento de la columna j por debajo de la
-- fila i usando el elemento de la posición (i,j). Por ejemplo,
--	ghci> p = listaMatriz [[2,3,1],[5,0,5],[8,6,9]] :: Matriz Double
--	ghci> matrizLista (anulaEltoColumnaDesde p 2 1)
--	[[2.0,3.0,1.0],[5.0,0.0,5.0],[4.0,0.0,7.0]]
-- ---------------------------------------------------------------------

anulaEltoColumnaDesde :: (Fractional a, Eq a) =>
                         Matriz a -> Int -> Int -> Matriz a 
anulaEltoColumnaDesde p j i =
  sumaFilaPor l i (-(p!(l,j)/a)) p
  where Just l = buscaIndiceDesde p j (i+1)
        a      = p!(i,j)


-- ---------------------------------------------------------------------
-- Ejercicio 17. Definir la función
--	anulaColumnaDesde :: (Fractional a, Eq a) =>
--	Matriz a -> Int -> Int -> Matriz a
-- tal que (anulaColumnaDesde p j i) es la matriz obtenida anulando
-- todos los elementos de la columna j de la matriz p por debajo del la
-- posición (i,j) (se supone que el elemnto p_(i,j) es no nulo). Por
-- ejemplo,
--	ghci> p = listaMatriz [[2,2,1],[5,4,5],[10,8,9]] :: Matriz Double
--	ghci> matrizLista (anulaColumnaDesde p 2 1)
--	[[2.0,2.0,1.0],[1.0,0.0,3.0],[2.0,0.0,5.0]]
--	ghci>  p  =  listaMatriz  [[4,5],[2,7%2],[6,10]]
--	ghci> matrizLista (anulaColumnaDesde p 1 1)
--	[[4 % 1,5 % 1],[0 % 1,1 % 1],[0 % 1,5 % 2]]
-- ---------------------------------------------------------------------

anulaColumnaDesde :: (Fractional a, Eq a) =>
                     Matriz a -> Int -> Int -> Matriz a 
anulaColumnaDesde p j i
  | anuladaColumnaDesde p j i = p
  | otherwise = anulaColumnaDesde (anulaEltoColumnaDesde p j i) j i


-- ---------------------------------------------------------------------
-- Algoritmo de Gauss para triangularizar matrices	--
-- ---------------------------------------------------------------------

-- ---------------------------------------------------------------------
-- Ejercicio 18. Definir la función
--	elementosNoNulosColDesde :: (Num a, Eq a) =>
--	Matriz a -> Int -> Int -> [a]
-- tal que (elementosNoNulosColDesde p j i) es la lista de los elementos
-- no nulos de la columna j a partir de la fila i. Por ejemplo,
--	ghci> p = listaMatriz [[3,2],[5,1],[0,4]]
--	ghci> elementosNoNulosColDesde p 1 2
--	[5]
-- ---------------------------------------------------------------------

elementosNoNulosColDesde :: (Num a, Eq a) => Matriz a -> Int -> Int -> [a]
elementosNoNulosColDesde p j i =
  [x | ((k,j'),x) <- assocs p, x /= 0, j' == j, k >= i]


-- ---------------------------------------------------------------------
-- Ejercicio 19. Definir la función
--	existeColNoNulaDesde :: (Num a, Eq a) =>
--	Matriz a -> Int -> Int -> Bool
-- tal que (existeColNoNulaDesde p j i) se verifica si la matriz p tiene
-- una columna a partir de la j tal que tiene algún elemento no nulo por
-- debajo de la fila i; es decir, si la submatriz de p obtenida
-- eliminando las i-1 primeras filas y las j-1 primeras columnas es no
-- nula. Por ejemplo,
--	ghci> p = listaMatriz [[3,2,5],[5,0,0],[6,0,0]]
--	ghci> existeColNoNulaDesde p 2 2
--	False
--	ghci> q = listaMatriz [[3,2,5],[5,7,0],[6,0,0]]
--	ghci> existeColNoNulaDesde q 2 2
-- ---------------------------------------------------------------------

existeColNoNulaDesde :: (Num a, Eq a) => Matriz a -> Int -> Int -> Bool
existeColNoNulaDesde p j i =
  or [not (null (elementosNoNulosColDesde p l i)) | l <- [j..n]]
  where n = numColumnas p


-- ---------------------------------------------------------------------
-- Ejercicio 20. Definir la función
--	menorIndiceColNoNulaDesde :: (Num a, Eq a) =>
--	Matriz a -> Int -> Int -> Maybe Int
-- tal que (menorIndiceColNoNulaDesde p j i) es el índice de la primera
-- columna, a partir de la j, en el que la matriz p tiene un elemento no
-- nulo a partir de la fila i. Por ejemplo,
--	ghci> p = listaMatriz [[3,2,5],[5,7,0],[6,0,0]]
--	ghci> menorIndiceColNoNulaDesde p 2 2
--	Just 2
--	ghci> q = listaMatriz [[3,2,5],[5,0,0],[6,0,2]]
--	ghci> menorIndiceColNoNulaDesde q 2 2
--	Just 3
--	ghci> r = listaMatriz [[3,2,5],[5,0,0],[6,0,0]]
--	ghci> menorIndiceColNoNulaDesde r 2 2
--	Nothing
-- ---------------------------------------------------------------------

menorIndiceColNoNulaDesde :: (Num a, Eq a) =>
                             Matriz a -> Int -> Int -> Maybe Int
menorIndiceColNoNulaDesde p j i
  | null js	= Nothing
  | otherwise = Just (head js)
  where n = numColumnas p
        js = [j' | j' <- [j..n],
                   not (null (elementosNoNulosColDesde p j' i))]


-- ---------------------------------------------------------------------
-- Ejercicio 21. Definir la función
--	gaussAux :: (Fractional a, Eq a) =>
--	Matriz a -> Int -> Int -> Matriz a
-- tal que (gaussAux p i j) es la matriz que en el que las i-1 primeras
-- filas y las j-1 primeras columnas son las de p y las restantes están
-- triangularizadas por el método de Gauss; es decir,
--	1. Si la dimensión de p es (i,j), entonces p.
--	2. Si la submatriz de p sin las i-1 primeras filas y las j-1
--	primeras columnas es nulas, entonces p.
--	3. En caso contrario, (gaussAux p' (i+1) (j+1)) siendo
--	3.1. j' la primera columna a partir de la j donde p tiene
--	algún elemento no nulo a partir de la fila i,
--	3.2. p1 la matriz obtenida intercambiando las columnas j y j'
--	de p,
--	3.3. i' la primera fila a partir de la i donde la columna j de
--	p1 tiene un elemento no nulo,
--	3.4. p2 la matriz obtenida intercambiando las filas i e i' de
--	la matriz p1 y
--	3.5. p' la matriz obtenida anulando todos los elementos de la
--	columna j de p2 por debajo de la fila i.
-- Por ejemplo,
--	ghci> p = listaMatriz [[1.0,2,3],[1,2,4],[3,2,5]]
--	ghci> matrizLista (gaussAux p 2 2)
--	[[1.0,2.0,3.0],[1.0,2.0,4.0],[2.0,0.0,1.0]]
-- ---------------------------------------------------------------------

gaussAux :: (Fractional a, Eq a) => Matriz a -> Int -> Int -> Matriz a 
gaussAux p i j
  | dimension p == (i,j)	= p	--  1
  | not (existeColNoNulaDesde p j i) = p	--  2
  | otherwise	= gaussAux p' (i+1) (j+1) --  3
  where Just j' = menorIndiceColNoNulaDesde p j i	-- 3.1
        p1	    = intercambiaColumnas j j' p	-- 3.2
        Just i' = buscaIndiceDesde p1 j i	-- 3.3
        p2	    = intercambiaFilas i i' p1	-- 3.4
        p'	    = anulaColumnaDesde p2 j i	-- 3.5


-- ---------------------------------------------------------------------
-- Ejercicio 22. Definir la función
--	gauss :: (Fractional a, Eq a) => Matriz a -> Matriz a
--	tal que (gauss p) es la triangularización de la matriz p por
-- de Gauss. Por ejemplo,
-- ghci> p = listaMatriz [[1.0,2,3],[1,2,4],[1,2,5]] ghci> gauss p	el método
--	array ((1,1),(3,3)) [((1,1),1.0),((1,2),3.0),((1,3),2.0),	
--	((2,1),0.0),((2,2),1.0),((2,3),0.0),	
--	((3,1),0.0),((3,2),0.0),((3,3),0.0)]	
--	ghci> matrizLista (gauss p)	
--	[[1.0,3.0,2.0],[0.0,1.0,0.0],[0.0,0.0,0.0]]	
--	ghci>  p  =  listaMatriz  [[3.0,2,3],[1,2,4],[1,2,5]]	
--	ghci> matrizLista (gauss p)	
--	[[3.0,2.0,3.0],[0.0,1.3333333333333335,3.0],[0.0,0.0,1.0]]	
--	ghci>  p  =  listaMatriz  [[3%1,2,3],[1,2,4],[1,2,5]]	
--	ghci> matrizLista (gauss p)	
--	[[3 % 1,2 % 1,3 % 1],[0 % 1,4 % 3,3 % 1],[0 % 1,0 % 1,1 %	1]]
--	ghci>  p  =  listaMatriz  [[1.0,0,3],[1,0,4],[3,0,5]]	
--	ghci> matrizLista (gauss p)	
--	[[1.0,3.0,0.0],[0.0,1.0,0.0],[0.0,0.0,0.0]]	
-- ---------------------------------------------------------------------

gauss :: (Fractional a, Eq a) => Matriz a -> Matriz a 
gauss p = gaussAux p 1 1


-- ---------------------------------------------------------------------
-- Determinante	--
-- ---------------------------------------------------------------------

-- ---------------------------------------------------------------------
-- Ejercicio 23. Definir la función
--	gaussCAux :: (Fractional a, Eq a) =>
--	Matriz a -> Int -> Int -> Int -> Matriz a
-- tal que (gaussCAux p i j c) es el par (n,q) donde q es la matriz que
-- en el que las i-1 primeras filas y las j-1 primeras columnas son las
-- de p y las restantes están triangularizadas por el método de Gauss;
-- es decir,
--	1. Si la dimensión de p es (i,j), entonces p.
--	2. Si la submatriz de p sin las i-1 primeras filas y las j-1
--	primeras columnas es nulas, entonces p.
--	3. En caso contrario, (gaussAux p' (i+1) (j+1)) siendo
--	3.1. j' la primera columna a partir de la j donde p tiene
--	algún elemento no nulo a partir de la fila i,
--	3.2. p1 la matriz obtenida intercambiando las columnas j y j'
--	de p,
--	3.3. i' la primera fila a partir de la i donde la columna j de
--	p1 tiene un elemento no nulo,
--	3.4. p2 la matriz obtenida intercambiando las filas i e i' de
--	la matriz p1 y
--	3.5. p' la matriz obtenida anulando todos los elementos de la
--	columna j de p2 por debajo de la fila i.
-- y n es c más el número de intercambios de columnas y filas que se han
-- producido durante el cálculo. Por ejemplo,
--	ghci> gaussCAux (listaMatriz [[1.0,2,3],[1,2,4],[1,2,5]]) 1 1 0
--	(1,array ((1,1),(3,3)) [((1,1),1.0),((1,2),3.0),((1,3),2.0),
--	((2,1),0.0),((2,2),1.0),((2,3),0.0),
--	((3,1),0.0),((3,2),0.0),((3,3),0.0)])
-- ---------------------------------------------------------------------

gaussCAux :: (Fractional a, Eq a) =>
             Matriz a -> Int -> Int -> Int -> (Int,Matriz a) 
gaussCAux p i j c
  | dimension p == (i,j)	= (c,p)	--  1
  | not (existeColNoNulaDesde p j i) = (c,p)	--  2
  | otherwise	= gaussCAux p' (i+1) (j+1) c' -- 3
  where Just j' = menorIndiceColNoNulaDesde p j i	-- 3.1
        p1	= intercambiaColumnas j j' p	-- 3.2
        Just i' = buscaIndiceDesde p1 j i	-- 3.3
        p2	= intercambiaFilas i i' p1	-- 3.4
        p'	= anulaColumnaDesde p2 j i	-- 3.5
        c'	= c + signum (abs (j-j')) + signum (abs (i-i'))


-- ---------------------------------------------------------------------
-- Ejercicio 24. Definir la función
--	gaussC :: (Fractional a, Eq a) => Matriz a -> Matriz a
-- tal que (gaussC p) es el par (n,q), donde q es la triangularización
-- de la matriz p por el método de Gauss y n es el número de
-- intercambios de columnas y filas que se han producido durante el
-- cálculo. Por ejemplo,
--	ghci> gaussC (listaMatriz [[1.0,2,3],[1,2,4],[1,2,5]])
--	(1,array ((1,1),(3,3)) [((1,1),1.0),((1,2),3.0),((1,3),2.0),
--	((2,1),0.0),((2,2),1.0),((2,3),0.0),
--	((3,1),0.0),((3,2),0.0),((3,3),0.0)])
-- ---------------------------------------------------------------------

gaussC :: (Fractional a, Eq a) => Matriz a -> (Int,Matriz a) 
gaussC p = gaussCAux p 1 1 0


-- ---------------------------------------------------------------------
-- Ejercicio 25. Definir la función
--	determinante :: (Fractional a, Eq a) => Matriz a -> a
-- tal que (determinante p) es el determinante de la matriz p. Por
-- ejemplo,
--	ghci> determinante (listaMatriz [[1.0,2,3],[1,3,4],[1,2,5]])
--	2.0
-- ---------------------------------------------------------------------

determinante :: (Fractional a, Eq a) => Matriz a -> a 
determinante p = (-1)^c * product (elems (diagonalPral p'))
  where (c,p') = gaussC p






