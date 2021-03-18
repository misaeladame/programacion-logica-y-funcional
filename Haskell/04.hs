{-*****************************
  * 04.hs                     *
  * Autor: Yo                 *
  *****************************-}

--PATRONEs

--Funcion probrando surte - Comportamiento de una funcion
suerte :: (Integral a) => a -> String 
suerte 3 = ":)"
suerte x = ":(" -- Patron más general

--Funcion no exhaustiva
car :: Char -> String 
car 'a' = "Andres"
car 'b' = "Brenda"
car 'c' = "Cecilia"

--Funcion de suma de vectores duplas
sumaV :: (Num a) => (a, a) -> (a, a) -> (a,a)
sumaV (x1, y1) (x2, y2) = (x1 + x2, y1 + y2)

--Funcion de extraccion de elementos
primero :: (a, b) -> a  
primero (x,_) = x
segundo :: (a, b) -> b
segundo (_,y) = y

--Funcion extrae primeros dos elementos de una lista
extraeDos :: (Show a) => [a] -> String 
extraeDos [] = "Lista vacia"
extraeDos (x : []) = "Primer elemento: " ++ show x
extraeDos (x : y : []) = "Tiene dos elementos: " ++ show x ++ "," ++show y
--extraeDos (x:y:_) = "Primeros dos: " ++show x++","++ show y

--Funcion de guardas
--Se utiliza RealFloat (Float y Double) por facilidad
--Subclase de Fractional
--https://www.haskell.org/tutorial/numbers.html
estatura :: RealFloat a => a -> String
estatura m
    | m <= 1.50 = "Estatura muy baja"
    | m <= 1.65 = "Estatura baja"
    | m <= 1.75 = "Estarura alta"
    | otherwise = "Estatura muy alta"

--Funcion max
mayor :: (Ord a) => a -> a -> a
mayor x y 
    | x > y = x
    | otherwise = y 

--Funcion comparacion
compa :: (Ord a) => a -> a -> Ordering 
x `compa` y
    | x > y     = GT 
    | x == y    = EQ 
    | otherwise = LT

--Recursion Guardas Factorial
facto :: Integer -> Integer 
facto x
    | x <= 0 = 1
    | otherwise = x * facto (x - 1)

--Recursion GuardasFibonacci
fibo :: Integer -> Integer 
fibo x
    | x <= 0 = 0
    | x == 1 = 1
    | x >= 2 = fibo ( x - 1 ) + fibo ( x - 2)

--where: variables solo visibles en esa funcion
--Permite no repetir codigo
temp :: (RealFloat a) => a -> a-> String
temp m v 
    | (m + v) / 2 <= 10.0 = "Frio"
    | (m + v) / 2 <= 20.0 = "Templado"
    | (m + v) / 2 <= 22.0 = "Caliente"
    | otherwise = "Muy caliente"

--Reduciendo con where
temp1 :: (RealFloat a) => a -> a -> String 
temp1 m v 
    | t <= 10.0 = "Frio"
    | t <= 20.0 = "Templado"
    | t <= 22.0 = "Caliente"
    | otherwise = "Muy Caliente"
    where t = (m + v) / 2

--Sentencia where y let
potencia :: Int -> Int 
potencia x = x * x where x = 2

pottencia :: Int -> Int 
pottencia x = let x = 2 in x * x

formula = do 
    let a = 1
        b = 2
        c = 1
        in (-1)*b+sqrt((b*b)-(4*a*c))/(2*a)