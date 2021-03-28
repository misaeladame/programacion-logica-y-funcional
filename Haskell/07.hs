import Data.Char (toUpper)
{-*****************************
  * 07.hs                     *
  * Autor: Yo                 *
  *****************************-}

main :: IO ()
main = putStrLn "Hola Mundo!"

captura :: IO ()
captura = do 
    putStrLn "Hola, cuál es tu nombre?"
    nombre <- getLine -- getLine :: IO String
    putStrLn (nombre ++ ", Haskell te saluda.")

-- Ejemplo de lectura de un archivo plano
archivos :: IO ()
archivos = do
    arch <- readFile "numeros.txt"
    putStrLn(arch)

archupper fuente destino = do 
    arch1 <- readFile fuente
    writeFile destino (map toUpper arch1)