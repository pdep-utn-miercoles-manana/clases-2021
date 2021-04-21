import Text.Show.Functions

--unaFuncion :: Tipo p1 -> Tipo p2 -> Tipo p3 -> Tipo retorno
--unaFuncion :: -> -> ->
--unaFuncion p1 p2 p3 = retorno

--siguiente :: Tipo unNumero -> Tipo retorno
--siguiente unNumero = unNumero + 1

--pi :: Float
--pi = 3.141592535897932384626

--siguiente' :: Tipo retorno
--siguiente' :: (Int -> Int)
--siguiente' = ((+) 1)

siguiente :: Int -> Int
--siguiente   unNumero   = unNumero + 1
siguiente   unNumero   =   ((+) 1)    unNumero
-- ^^^^^^   ^^^^^^^^       ^^^^^^^    ^^^^^^^^
--unaFuncion unParametro = otraFuncion unParametro
--siguiente unNumero = 1 + unNumero

siguiente' :: (Int -> Int)
siguiente' = ((+) 1)

doble :: Int -> Int
doble unNumero = unNumero * 2

masDos :: Int -> Int
masDos unNumero = siguiente (siguiente unNumero)
--                ^^^^^^^^^ (^^^^^^^^^ ^^^^^^^^)
--                   f      (   g         x    )
--f (g x) = (f . g) x

masDos' :: Int -> Int
masDos' unNumero = (siguiente . siguiente) unNumero

masDos'' :: Int -> Int
masDos'' = (+ 2)

masDos''' :: Int -> Int
masDos''' = siguiente . ((+) 1)

masTres :: Int -> Int
masTres unNumero = siguiente (siguiente (siguiente unNumero))
--                 ^^^^^^^^^ (^^^^^^^^^ ^^^^^^^^^^^^^^^^^^^^)
--                   f       (   g                x   )
-- (siguiente . siguiente) (siguiente unNumero)
-- ^^^^^^^^^^^^^^^^^^^^^^^  ^^^^^^^^^ ^^^^^^^^
--             f                 g       x
-- (siguiente . siguiente . siguiente) unNumero

masTres' :: Int -> Int
masTres' unNumero = (siguiente . siguiente . siguiente) unNumero

--haceFrioF unaTemperatura = (haceFrioCelsius . farenheitACelsius) unaTemperatura

--f o g
--f . g
--composicion :: (A -> B) -> (B -> C) -> (A -> C)
--composicion unaFuncion otraFuncion = ???

--f (g x) = (f . g) x

--   (f . g) x
--   ^^^^^^^
--  unaFuncion x

dobleDelLargo :: String -> Int
dobleDelLargo unString = doble (length unString)

dobleDelLargo' :: String -> Int
dobleDelLargo' unString = (doble . length) unString

-- doble  :: Int -> Int
-- length :: String -> Int
--
-- (.) :: (b -> c) -> (a -> b) -> (a -> c)
-- (length . even)  10

sumaDeTres :: Int -> Int -> Int -> Int
sumaDeTres unNumero otroNumero otroNumeroMas = unNumero + otroNumero + otroNumeroMas

-- error
-- 6

-- sumaDeTres :: Int -> Int -> Int -> Int
-- sumaDeTres     6     ^^^^^^^^^^^^^^^^^

-- Aplicación parcial!

unEntero :: Int
unEntero = 5

const' :: a -> b -> a
const' unValor otroValor = unValor

--const' :: a -> b -> a
--const'   True :: b -> Bool
--
--(const' True) :: b -> Bool

true :: Bool
true = True

esMultiploDe :: Int -> Int -> Bool
esMultiploDe    multiplo unNumero = (esIgualACero . mod multiplo) unNumero
esMultiploDe''  multiplo unNumero =  esIgualACero . mod multiplo $ unNumero

esMultiploDe' :: Integral a => a -> (a -> Bool)
esMultiploDe' multiplo          =  (== 0) . mod multiplo

esIgualACero unNumero = unNumero == 0

--((== 0) . mod 5) :: Integral a => (a -> Bool)
--
--mod 5 :: Integral a => a -> a
--(== 0) :: (Eq a, Num a) => a -> Bool

-- (+)     :: Num a => a -> a -> a
-- (+) 1   :: Num a =>      a -> a
-- (+) 1 5 :: Num a =>           a

-- (.)                       ::                  (y -> x) -> (z -> y) -> (z -> x)
--                                               ^^^^^^^^ (== 0)
--    (== 0) :: (Eq a, Num a) =>                  a -> Bool

-- (.) (== 0)                :: (Eq a, Num a) =>             (z -> a) -> (z -> Bool)
--                                                           ^^^^^^^^ mod multiplo
-- (mod multiplo) :: Integral a =>                            a -> a

-- (.) (== 0) (mod multiplo) :: Integral a    =>                         (a -> Bool)





-- Orden superior
-- (.) :: (b -> c) -> (a -> b) -> a -> c
-- ($) :: (a -> b) -> a -> b
-- flip :: (a -> b -> c) -> b -> a -> c

-- Precedencia de operadores
-- Paréntesis
-- Aplicacion prefija
-- .
-- + - * / && ||
-- $

-- (doble . length) "hola"
-- ^^^^^^^^^^^^^^^^
-- unaFuncion "hola"
-- 8
--
-- doble . length "hola"
--         ^^^^^^^^^^^^^
--               4
-- doble . 4
--
--
-- doble . length $ "hola"
-- ^^^^^^^^^^^^^^
-- unaFuncion $ "hola"
-- 8

-- Precedencia de operadores
-- Paréntesis
-- Aplicacion prefija
-- .
-- + - * / && ||
-- ++
-- $

saludar            :: String -> String
saludar            unNombre = saludarSegun id unNombre

saludarFormalmente :: String -> String
saludarFormalmente unNombre = saludarSegun ("Sre. " ++) unNombre

saludarEgresadeUTN :: String -> String
saludarEgresadeUTN unNombre = saludarSegun ("Ing. " ++) unNombre

formalmente = ("Sre. " ++)

saludarSegun :: (String -> String) -> String -> String
saludarSegun unaFuncion unNombre = "Hola " ++ unaFuncion unNombre ++ "!"