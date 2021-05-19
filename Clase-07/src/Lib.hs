import Text.Show.Functions
-- Repaso clase anterior

data Materia = Materia {
    código :: Int,
    nombreMateria :: String
} deriving (Show)

data Estudiante = Estudiante {
    legajo :: Int,
    nombreEstudiante :: String,
    materias :: [Materia]
}

fede = Estudiante 1231232 "Federico Scarpa" []
juli = Estudiante 1597532 "Julián Berbel Alt" []

algebra  = Materia 084545 "Algebra y Geometría Analítica"
analisis = Materia 084546 "Análisis Matemático I"
syo      = Materia 084547 "Sistemas y Organizaciones"

cursar materia (Estudiante legajo nombre materias) =
                Estudiante legajo nombre (materia:materias)

cursarTodo :: Estudiante -> [Materia] -> Estudiante
cursarTodo estudiante materias = foldr cursar estudiante materias

-- foldl :: (b -> a -> b) -> b -> [a] -> b

cursarTodo' estudiante []     = estudiante
cursarTodo' estudiante (m:ms) = cursarTodo' (cursar m estudiante) ms



-- Lazy evaluation / Evaluación diferida / Evaluación perezosa
-- Eager evaluation / Evaluación ansiosa

-- [1..]
--
-- 1 : [2..]
--
-- 1 : 2 : 3 : 4 : 5 ... : []

--take 0 _      = []
--take n (cabeza : cola) = cabeza : take (n - 1) cola
--

--repeat
--
--iterate (+1) 5
--[5, (+1) 5, (+1) ((+1) 5), ....]



iterar :: (a -> a) -> a -> [a]
iterar unaFuncion unaSemilla = unaSemilla : iterar unaFuncion (unaFuncion unaSemilla)

--replicate


--any (< 10) [11..]
--12 < 10
--
--[1..]
--
--5 : 4 : 3 : 2 : 1 : []


--map (* 2) [1 ..]

-- [1,2,3,error "hola!",5,6,7,8] !! 5
-- [error "hola!",5,6,7,8] !! 4

doble x = x + x
unaFuncionReLoca f = f . f

-- Call by name
-- doble (doble 4)
-- doble 4 + doble 4
-- 4 + 4 + doble 4
-- 8 + doble 4
-- 8 + 4 + 4
-- 12 + 4
-- 16


-- Call by value
-- doble (doble 4)
-- doble (4 + 4)
-- doble (8)
-- 8 + 8
-- 16

-- Call by name
-- Memory sharing
-- doble (doble 4)
-- doble 4 + doble 4
-- 4 + 4 + 4 + 4
-- 8 + 8
-- 16

-- instance Show Estudiante where
--   show unEstudiante = "un estudiante!"
--
--
-- Estudiante 123456 (error "Esto es un error!") []
--
--
-- Estudiante (error "Esto es un error!") []




tieneNombreLargo mascota = length (fst mascota) > 9

--sumarEnergia (Persona nombre energia edad listaDeIntereses) = Persona nombre (energia + 5) edad listaDeIntereses
--sumarEnergia unaPersona = unaPersona { energia = energia unaPersona + 5 }

triplicarLosPares :: [Int] -> [Int]
triplicarLosPares numeros = map (*3) . filter even $ numeros

esMamifero _ = True
sonTodosMamiferos animales = all esMamifero animales

{-
abrirVentanas :: Casa -> Casa
abrirVentanas = id
prenderEstufa :: Casa -> Casa
type Casa = String
mudarseA :: String -> Casa -> Casa
mudarseA unaDireccion unaCasa = unaCasa
encenderElAireA :: Int -> Casa -> Casa
encenderElAireA unaTemperatura unaCasa = ...

miCasaInteligente = Casa
   { direccion = "Medrano 951",
     temperatura = 26,
     reguladoresDeTemperatura = [
       abrirVentanas,
       prenderEstufa,
       mudarseA "Medrano 952",
       flip encenderElAireA 24
     ]
   }

flip :: (a -> b -> c) -> (b -> a -> c)
-}
esBeatle "Ringo"  = True
esBeatle "John"   = True
esBeatle "George" = True
esBeatle "Paul"   = True
esBeatle _        = False

--sumaDeLasEdadesRecursiva []              = 0
--sumaDeLasEdadesRecursiva (cabeza : cola) =
--   edad cabeza + sumaDeLasEdadesRecursiva cola
--
lista = [1,2,3]

--abrirVentanas casa = casa {
--  temperatura = temperatura casa - 2
--}
--
--abrirVentanas (Casa direccion temperatura reguladores) = Casa direccion (temperatura - 2) reguladoresDeTemperatura

--agregarValor valor indice lista =
--   take (indice - 1) lista ++ valor : drop indice lista
--
--poneleUnNombre numeros = sum (map (*3) (filter even numeros)) < 100
--poneleUnNombre numeros = ((< 100) . sum . map (* 3) . filter even) numeros
--
--poneleUnNombre :: ([Int] -> Bool)
--poneleUnNombre numero = ((< 100) . sum . map (* 3) . filter even) numero

-- Paréntesis
-- Aplicación prefija
-- Composición
-- * /
-- + -
-- && ==
-- $
--

unaFuncion (2, z) = "Matchea"
unaFuncion _      = "No matchea"
