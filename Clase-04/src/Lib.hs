import Text.Show.Functions

--
-- (.) :: (b -> c) -> (a -> b) -> (a -> c)
--        ^^^^^^^^    ^^^^^^^^    ^^^^^^^^
--           f           g           ret
--
-- (==) :: Eq d => d -> d -> Bool
--
-- rem :: Integral e => e -> e -> e
--
-- (== 0) :: (Eq d, Num d) => d -> Bool
--                           ^^^   ^^^^
--                            b      c
--
-- rem numero1 :: Integral e => e -> e
--                             ^^^    ^^^
--                              a      b
--
-- (.) (== 0) :: (Eq d, Num d) => (a -> d) -> (a -> Bool)
--
-- (.) (== 0) (rem numero1) :: Integral e => (e -> Bool)
--

esMultiploDe :: Integral a => a -> a -> Bool
esMultiploDe numero1 numero2 = ((== 0) . rem numero1)  numero2
--                             ^^^^^^^^^^^^^^^^^^^^^^  ^^^^^^^

siguiente numero = numero + 1

-- Expresion lambda
siguiente' = \numero -> numero + 1


suma :: Num a => a -> a -> a
suma numero1 numero2 = numero1 + numero2

suma' :: Num a => a -> (a -> a)
suma' numero1 = \numero2 -> numero1 + numero2

suma'' :: Num a => (a -> (a -> a))
suma'' = \numero1 -> \numero2 -> numero1 + numero2


-- fog(x) = f(g(x))

-- (.) :: (b -> c) -> (a -> b) -> (a -> c)
composicion f g = \x -> f (g x)

-- (.) :: (b -> c) -> (a -> b) -> a -> c
composicion' f g x = f (g x)

-----------------------------------------------------------------
-- GUARDAS
modulo :: (Ord a, Num a) => a -> a
modulo numero
  | numero >= 0 =  numero
  | otherwise   = -numero

signo :: (Ord a, Num a) => a -> a
signo numero
  | numero <  0 = -1
  | numero >  0 =  1
  | otherwise   =  0

-- discriminante (b^2 - 4.a.c)

-- "Raíz doble" = 0
-- "Dos raíces simples" > 0
-- "Raíces complejas" < 0

tipoDeRaices a b c
  | discriminante a b c == 0 = "Raíz doble"
  | discriminante a b c  > 0 = "Dos raíces simples"
  | otherwise                = "Raíces complejas"

discriminante a b c = b^2 - 4 * a * c

cuantoPagoDeCubierto edad
  | edad >= 65 =  3
  | edad >= 19 = 60
  | edad >= 13 = 30
  | edad >   0 =  0

-- gustoDeHeladoFavorito:
-- * Si es "Feli": "Chocolate"
-- * Si es "Ger" : "Dulce de leche"
-- * Si es "Fede": "Vainilla"

gustoDeHeladoFavorito :: String -> String
gustoDeHeladoFavorito persona
  | persona == "Feli"  = "Chocolate"
  | persona == "Fede"  = "Vainilla"
  | persona == "Ger"   = "Dulce de Leche"
  | persona == "Marco" = "Tramontana"
  | otherwise          = "Nada Rico xD"

-- Pattern Matching

gustoDeHeladoFavorito' "Feli"  = "Chocolate"
gustoDeHeladoFavorito' "Fede"  = "Vainilla"
gustoDeHeladoFavorito' "Ger"   = "Dulce de Leche"
gustoDeHeladoFavorito' "Marco" = "Tramontana"
gustoDeHeladoFavorito' _       = "Nada Rico XD"