import Text.Show.Functions

type Nivel = Int
type Arma  = Rehen -> Rehen
type Plan  = Ladron -> Ladron

data Ladron = Ladron {
    nombreLadron :: String,
    habilidades  :: [String],
    armas        :: [Arma]
} deriving(Show)

data Rehen = Rehen {
    nombreRehen  :: String,
    nivelComplot :: Nivel,
    nivelMiedo   :: Nivel,
    plan         :: Plan
} deriving(Show)


mapArmas        f rehen = rehen { armas        = f $ armas        rehen }
mapNombreRehen  f rehen = rehen { nombreRehen  = f $ nombreRehen  rehen }
mapNivelComplot f rehen = rehen { nivelComplot = max 0 . f $ nivelComplot rehen }
mapNivelMiedo   f rehen = rehen { nivelMiedo   = max 0 . f $ nivelMiedo   rehen }


incNivelMiedo cantidad   = mapNivelMiedo (+cantidad)
incNivelComplot cantidad = mapNivelComplot (+cantidad)

decNivelMiedo cantidad   = mapNivelMiedo (subtract cantidad)
decNivelComplot cantidad = mapNivelComplot (subtract cantidad)


--------------
-- Punto 01 --
--------------

tokio    = Ladron "Tokio" ["trabajo psicológico", "entrar en moto"] [pistola 9, pistola 9, ametralladora 30]
rio      = Ladron "Rio" ["hackear", "hacer reir"] [ametralladora 45]
berlin   = Ladron "Berlin" ["enloquecer", "dar discursos", "dar ordenes"] [pistola 45, pistola 45]
nairobi  = Ladron "Nairobi" ["empezar el matriarcado"] [ametralladora 25]
profesor = Ladron "Profesor" ["disfrazarse de linyera", "disfrazarse de payaso", "estar siempre un paso adelante"] []


ariadna  = Rehen "Ariadna" 20 60 id
pablo    = Rehen "Pablo" 40 30 esconderse
arturito = Rehen "Arturo" 70 50 (atacarAlLadron pablo . esconderse)


ladrones = [tokio, rio, berlin, nairobi, profesor]
rehenes  = [ariadna, pablo, arturito]

pistola :: Int -> Arma
pistola calibre rehen = incNivelMiedo (3 * length (nombreRehen rehen)) . decNivelComplot (calibre * 5) $ rehen

ametralladora :: Int -> Arma
ametralladora balas = incNivelMiedo balas . mapNivelComplot (// 2)


--------------
-- Punto 02 --
--------------

esInteligente :: Ladron -> Bool
esInteligente ladron = es ladron "Profesor" || cantidadHabilidades ladron > 2

es ladron nombre = nombreLadron ladron == nombre

cantidadHabilidades = length . habilidades


--------------
-- Punto 03 --
--------------

conseguirArma :: Arma -> Ladron -> Ladron
conseguirArma arma = mapArmas (arma :)


--------------
-- Punto 04 --
--------------

disparos :: Rehen -> Ladron -> Rehen
disparos rehen = ($ rehen) . armaMasMiedosaPara rehen

hacerseElMalo :: Rehen -> Ladron -> Rehen
hacerseElMalo rehen ladron
    | es ladron "Berlin" = (incNivelMiedo . sum . map length . habilidades) ladron $ rehen
    | es ladron "Rio"    = incNivelComplot 20 rehen
    | otherwise          = incNivelMiedo 10 rehen


armaMasMiedosaPara rehen = maximumBy (nivelMiedo . ($ rehen)) . armas

maximumBy f = foldl1 (maxBy f)

maxBy f x y
  | f x > f y = x
  | otherwise = y


--------------
-- Punto 05 --
--------------

calmarLasAguas :: Ladron -> [Rehen] -> [Rehen]
calmarLasAguas ladron = filter ((> 60) . nivelComplot) . map (flip disparos ladron)


--------------
-- Punto 06 --
--------------

puedeEscaparseDeLaPolicia :: Ladron ->  Bool
puedeEscaparseDeLaPolicia = any (empiezaCon "Disfrazarse de") . habilidades

empiezaCon sublista = (== sublista) . take (length sublista)


--------------
-- Punto 07 --
--------------

pintaMal :: [Ladron] -> [Rehen] -> Bool
pintaMal ladrones rehenes = nivelComplotPromedio rehenes > nivelMiedoPromedio rehenes * cantidadTotalArmas ladrones

nivelComplotPromedio = promedioSegun nivelComplot
nivelMiedoPromedio = promedioSegun nivelMiedo

promedioSegun f xs = sum (map f xs) // length xs

(//) = div   -- Hago esta funcion auxiliar para poder usar la funcion div de forma infija. En el parcial valía usar (/) directamente


--------------
-- Punto 08 --
--------------

rebelarseContra :: [Rehen] -> Ladron -> Ladron
rebelarseContra rehenes ladron = foldl rebelarse ladron rehenes

rebelarse ladron rehen
  | esSubversivo rehen = (plan rehen) ladron
  | otherwise          = ladron

esSubversivo rehen = nivelComplot rehen > nivelMiedo rehen

atacarAlLadron :: Rehen -> Plan
atacarAlLadron rehenAliado = quitarArmas (cantidadLetrasNombre rehenAliado // 10)

cantidadLetrasNombre = length . nombreRehen

esconderse :: Plan
esconderse ladron = quitarArmas (cantidadHabilidades ladron // 3) ladron

quitarArmas :: Int -> Ladron -> Ladron
quitarArmas cantidad = mapArmas (drop cantidad)

--------------
-- Punto 09 --
--------------

planValencia :: [Rehen] -> [Ladron] -> Int
planValencia rehenes ladrones = (*1000000) . cantidadTotalArmas . map (rebelarseContra rehenes . conseguirArma (ametralladora 45)) $ ladrones

cantidadTotalArmas = sum . map cantidadArmas

cantidadArmas = length . armas

--------------
-- Punto 10 --
--------------

-- No se puede, el plan valencia necesita saber la cantidad de armas del ladron.
-- La consulta nunca terminaría de ejecutarse y se colgaría


--------------
-- Punto 11 --
--------------

-- Puede ser sí, como no. Depende del plan que tiene el rehen.
-- Si el plan es esconderse necesita saber la cantidad de habilidades del ladron
-- Si pasa eso, ocurre lo mismo que se explicó anteriormente.
