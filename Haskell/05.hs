{-*****************************
  * 05.hs                     *
  * Autor: Yo                 *
  *****************************-}

{-
data Color = Rojo | Anaranjado | Amarillo | Azul | Verde | Blanco | Negro 

color_RGB Rojo = (255, 0, 0)
color_RGB Anaranjado = (255, 128, 0)
color_RGB Amarillo = (255, 255, 0)
color_RGB Azul = (0, 0, 255)
color_RGB Verde = (0, 255, 0)
color_RGB Blanco = (255, 255, 255)
color_RGB Negro = (0, 0, 0)
-}

-- Creando tipos de datos definidos por el usuario
-- Con dos constructores
data Figura = Rect Double Double | Cir Double 
area (Rect x y) = x * y
area (Cir r) = 3.1416 * r * r 

-- Tipos de datos definidos por el usuario
data Alumno = Dato String [Int] deriving (Show)
hugo = Dato "Hugo" [70, 80, 75, 90]
paco = Dato "Francisco" [100, 95, 90, 92]

--Ejemplo de coordenadas
data Punto = Punto Double Double deriving (Show)
distancia :: Punto -> Punto -> Double 
distancia (Punto x1 y1) (Punto x2 y2) = sqrt (dx^2 + dy^2)
                                        where dx = x1 - x2 
                                              dy = y1 - y2

distancia_origen :: Punto -> Double
distancia_origen = distancia (Punto 0 0)