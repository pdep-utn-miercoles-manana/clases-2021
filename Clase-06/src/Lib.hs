
factorial :: Int -> Int
factorial 0 = 1                      -- CASO BASE
factorial n = n * factorial (n - 1)  -- CASO RECURSIVO

factorial' :: Int -> Int
factorial' n
  | n == 0    = 1                    -- CASO BASE
  | n >= 1    = n * factorial' (n-1) -- CASO RECURSIVO
  | otherwise = error "Flaco! el factorial no existe para los numeros negativos!!!" -- FALLA

fibonacci :: Int -> Int
fibonacci 0 = 0                                 -- CASO BASE
fibonacci 1 = 1                                 -- CASO BASE
fibonacci n = fibonacci (n-1) + fibonacci (n-2) -- CASO RECURSIVO


head' :: [a] -> a
head' (x:_) = x

tail' (_:xs) = xs

esLaListaVacia []            = True
esLaListaVacia (cabeza:cola) = False

sumarElPrimeroYElSegundoElemento (x:y:_) = x + y

-- funcionRara
plegar operacion valorInicial []     = valorInicial
plegar operacion valorInicial (x:xs) = operacion x (plegar operacion valorInicial xs)

sumatoria :: Num n => [n] -> n
sumatoria numeros = plegar (+) 0 numeros

productoria :: Num n => [n] -> n
productoria numeros = plegar (*) 1 numeros

concatenacion :: [[a]] -> [a]
concatenacion listas = plegar (++) [] listas

conjuncion :: [Bool] -> Bool
conjuncion booleanos = plegar (&&) True booleanos

disyuncion :: [Bool] -> Bool
disyuncion booleanos = plegar (||) False booleanos

longitud :: [a] -> Int
longitud unaLista = plegar transformarCabezaEnUno 0 unaLista

transformarCabezaEnUno cabeza longDeLaCola =  longDeLaCola + 1


-- PLEGAR

foldr :: (b -> a -> a) -> a -> [b] -> a
foldr operacion valorInicial []     = valorInicial
foldr operacion valorInicial (x:xs) = operacion x (plegar operacion valorInicial xs)

foldl :: (a -> b -> a) -> a -> [b] -> a
foldl operacion valorInicial []     = valorInicial
foldl operacion valorInicial (x:xs) = foldl operacion (operacion valorInicial x) xs

-- Agrego un comentario

siguiente unNumero = unNumero + 1

doble = (*2)

-- git init   -> creo un album nuevo
-- git clone  -> me descargo el album por primera vez
-- git pull   -> bajando los cambios del album remoto
-- git commit -> Saco la foto de la escena
-- git push   -> Subo los cambios al album remoto
-- git add    -> "metete en la escena"
-- git status -> Estado de la escena
-- git log    -> Ver el estado del album

-- Escribir otra cosa