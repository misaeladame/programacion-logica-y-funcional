-- Tecnológico Nacional de México Campus La Laguna
-- Programación Lógica y Funciona - U2
-- Haskell
-- Alumno: 18131209 - ADAME SANDOVAL JOSE MISAEL

-- Vectores y matrices

-- ---------------------------------------------------------------------
-- Introduccción
-- ---------------------------------------------------------------------

-- El objetivo de esta relación es hacer ejercicios sobre vectores y
-- matrices con el tipo de las tablas, definido en el módulo
-- Data.Array y explicado en el tema 18 que se encuentra en
--   http://www.cs.us.es/-jalonso/cursos/ilm-17/temas/tema-18.html

-- ---------------------------------------------------------------------
-- Importación de librerías
-- ---------------------------------------------------------------------

import Data.Array

-- ---------------------------------------------------------------------
-- Tipos de los vectores y de las matrices
-- ---------------------------------------------------------------------

-- Los vectores son tablas cuyos índice son números naturales
type Vector a = Array Int a

-- Las matrices son tablas cuyos índices son pares de números
-- naturales.
type Matriz a = Array (Int, Int) a 

-- ---------------------------------------------------------------------
-- Operaciones básicas con matrices
-- ---------------------------------------------------------------------

-- ---------------------------------------------------------------------
-- Ejercicio 1.
-- ---------------------------------------------------------------------

listaVector :: Num a => [a] -> Vector a 
listaVector xs = listArray (1, n) xs
    where n = length xs

-- ---------------------------------------------------------------------
-- Ejercicio 2. 
-- ---------------------------------------------------------------------

listaMatriz :: Num a => [[a]] -> Matriz a
listaMatriz xss = listArray ((1,1),(m,n)) (concat xss)
    where m = length xss
          n = length (head xss)

-- ---------------------------------------------------------------------
-- Ejercicio 3. 
-- ---------------------------------------------------------------------

numFilas :: Num a => Matriz a -> Int
numFilas = fst . snd . bounds

-- ---------------------------------------------------------------------
-- Ejercicio 4. 
-- ---------------------------------------------------------------------

numColumnas :: Num a => Matriz a -> Int
numColumnas = snd . snd . bounds

-- ---------------------------------------------------------------------
-- Ejercicio 5. 
-- ---------------------------------------------------------------------

dimension :: Num a => Matriz a -> (Int, Int)
dimension = snd . bounds

-- ---------------------------------------------------------------------
-- Ejercicio 6. 
-- ---------------------------------------------------------------------

separa :: Int -> [a] -> [[a]]
separa _ [] = []
separa n xs = take n xs : separa n (drop n xs)

-- ---------------------------------------------------------------------
-- Ejercicio 7. 
-- ---------------------------------------------------------------------

matrizLista :: Num a => Matriz a -> [[a]]
matrizLista p = separa (numColumnas p) (elems p)

-- ---------------------------------------------------------------------
-- Ejercicio 8. 
-- ---------------------------------------------------------------------

vectorLista :: Num a => Vector a -> [a]
vectorLista = elems

-- ---------------------------------------------------------------------
-- Suma de matrices
-- ---------------------------------------------------------------------

-- ---------------------------------------------------------------------
-- Ejercicio 9
-- ---------------------------------------------------------------------
