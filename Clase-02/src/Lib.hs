import Text.Show.Functions
{-
int multiplicar(int unNumero, int otroNumero) {
  return unNumero * otroNumero
}

int sumar(int unNumero, int otroNumero) {
  return unNumero + otroNumero
}
-}

-- Inferencia de tipos
e :: Float
e = 2.718281

soyMayorDeEdad :: Bool
soyMayorDeEdad = True

miNombre :: String
miNombre = "Juli"

miEdad :: Int
miEdad = 26

pie :: Float
pie = 3.1415926535897938324626

multiplicar :: Int -> Int -> Int
--             ^^^    ^^^    ^^^
--             p1     p2     retorno
multiplicar unNumero otroNumero = unNumero * otroNumero

siguiente :: Int -> Int
siguiente unNumero = unNumero + 1

anterior unNumero = unNumero - 1

doble unNumero = unNumero * 2

masDos unNumero = siguiente (siguiente unNumero)


-- Sintaxis de declaración de una función
-- nombreDeLaFuncion parametro1 parametro2 ... parametroN = valorDeRetorno

-- Sintaxis de aplicación de una función
-- funcion parametro1 parametro2 ... parametroN

-- siguiente unNumero
-- ^^^^^^^^^ notación prefija

-- unNumero + 1
--          ^ notación infija

{-
  Expresión: se puede evaluar y da un resultado

-}



dobleDelSiguiente unNumero = doble (siguiente unNumero)

-- siguiente (1 + 1)
--           ^^^^^^^ 2
-- siguiente 2
-- 3

-- siguiente 1 + 1
-- ^^^^^^^^^^^ 2
-- 2 + 1
-- 3

-- sumaDe3
--sumaDe3 :: una cosa que es un numero -> una cosa que es un numero -> una cosa que es un numero -> una cosa que es un numero
sumaDe3 :: Num a => a -> a -> a -> a
sumaDe3 unNumero numero2 numero3 = unNumero + numero2 + numero3

identidad :: a -> a
identidad unValor = unValor

constante :: a -> b -> a
constante unValor otroValor = unValor

suma :: Num a => a -> a -> a
suma unNumero otroNumero = unNumero + otroNumero

-- Familia de tipos

-- Num: Int, Float, Double, Integer
-- (+), (-), (*)

-- Eq: Int, Float, Bool, String, Char, .....
-- (==), (/=)

-- Ord: Int, Float, Char, String
-- (>), (<)

-- Integral: Int
-- div, rem, even, odd

-- Fractional: Float
-- (/)

-- Show: Int, Float, Bool, String, Char

longitud :: String -> Int
longitud unString = length unString

cumplirAños :: Int -> Int
cumplirAños unaEdad = unaEdad + 1

--esMayorDeEdad :: Ord a => a -> Bool
esMayorDeEdad :: (Num a, Ord a) => a -> Bool
esMayorDeEdad unaEdad = unaEdad >= 18