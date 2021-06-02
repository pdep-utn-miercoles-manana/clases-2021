import Text.Show.Functions
import Data.List (nub)

data Heroe = Heroe {
  nombre         :: String,
  epiteto        :: String,
  reconocimiento :: Int,
  artefactos     :: [Artefacto],
  tareas         :: [Tarea]
} deriving Show

data Artefacto = Artefacto {
  nombreArtefacto :: String,
  rareza :: Int
} deriving (Show, Eq)

-- Auxiliares
mapNombre :: (String -> String) -> Heroe -> Heroe
mapNombre unaFuncion unHeroe = unHeroe { nombre = unaFuncion . nombre $ unHeroe }

mapEpiteto :: (String -> String) -> Heroe -> Heroe
mapEpiteto unaFuncion unHeroe = unHeroe { epiteto = unaFuncion . epiteto $ unHeroe }

mapReconocimiento :: (Int -> Int) -> Heroe -> Heroe
mapReconocimiento unaFuncion unHeroe = unHeroe { reconocimiento = unaFuncion . reconocimiento $ unHeroe }

mapArtefactos :: ([Artefacto] -> [Artefacto]) -> Heroe -> Heroe
mapArtefactos unaFuncion unHeroe = unHeroe { artefactos = unaFuncion . artefactos $ unHeroe }

mapTareas :: ([Tarea] -> [Tarea]) -> Heroe -> Heroe
mapTareas unaFuncion unHeroe = unHeroe { tareas = unaFuncion . tareas $ unHeroe }
-- Auxiliares

pasarALaHistoria :: Heroe -> Heroe
pasarALaHistoria unHeroe
  | suReconocimiento > 1000 = setEpiteto "El mitico" unHeroe
  | suReconocimiento >= 500 = setEpiteto "El magnifico" . agregarArtefacto lanzaDelOlimpo $ unHeroe
  | suReconocimiento >  100 = setEpiteto "Hoplita"      . agregarArtefacto xiphos         $ unHeroe -- repito un poquito de lógica pero no sé que nombre ponerle
  | otherwise               = unHeroe
  where suReconocimiento = reconocimiento unHeroe

setEpiteto :: String -> Heroe -> Heroe
setEpiteto unEpiteto unHeroe = mapEpiteto (const unEpiteto) unHeroe

agregarArtefacto :: Artefacto -> Heroe -> Heroe
agregarArtefacto unArtefacto unHeroe = mapArtefactos (unArtefacto :) unHeroe

lanzaDelOlimpo :: Artefacto
lanzaDelOlimpo = Artefacto "Lanza del Olimpo" 100

xiphos :: Artefacto
xiphos = Artefacto "Xiphos" 50

type Tarea = Heroe -> Heroe

encontrarUnArtefacto :: Artefacto -> Tarea
encontrarUnArtefacto unArtefacto unHeroe = agregarArtefacto unArtefacto . aumentarReconocimiento (rareza unArtefacto) $ unHeroe

aumentarReconocimiento :: Int -> Heroe -> Heroe
aumentarReconocimiento unaCantidad unHeroe = mapReconocimiento (+ unaCantidad) unHeroe

escalarElOlimpo :: Tarea
escalarElOlimpo unHeroe = agregarArtefacto relampagoDeZeus . mapArtefactos (desecharArtefactosMalos . triplicarRarezaDeArtefactos) . aumentarReconocimiento 500 $ unHeroe

triplicarRarezaDeArtefactos :: [Artefacto] -> [Artefacto]
triplicarRarezaDeArtefactos unosArtefactos = map triplicarRareza unosArtefactos

triplicarRareza :: Artefacto -> Artefacto
triplicarRareza unArtefacto = unArtefacto { rareza = rareza unArtefacto * 3 }

desecharArtefactosMalos :: [Artefacto] -> [Artefacto]
desecharArtefactosMalos unosArtefactos = filter ((>= 1000) . rareza) unosArtefactos

relampagoDeZeus :: Artefacto
relampagoDeZeus = Artefacto "Relampago de Zeus" 500

agregarTarea :: Tarea -> Heroe -> Heroe
agregarTarea unaTarea unHeroe = mapTareas (unaTarea :) unHeroe

ayudarACruzarLaCalle :: Int -> Tarea
ayudarACruzarLaCalle unasCuadras unHeroe = setEpiteto ("Gros" ++ replicate unasCuadras 'o') unHeroe

data Bestia = Bestia {
  nombreBestia :: String,
  debilidad    :: Debilidad
}

type Debilidad = Heroe -> Bool

matarA :: Bestia -> Tarea
matarA unaBestia unHeroe
  | puedeMatarA unaBestia unHeroe = setEpiteto ("Asesino de " ++ nombreBestia unaBestia) unHeroe
  | otherwise                     = setEpiteto ("El cobarde") . perderPrimerArtefacto $ unHeroe

perderPrimerArtefacto :: Heroe -> Heroe
perderPrimerArtefacto unHeroe = mapArtefactos (drop 1) unHeroe

puedeMatarA :: Bestia -> Heroe -> Bool
puedeMatarA unaBestia unHeroe = debilidad unaBestia unHeroe

heracles :: Heroe
heracles = Heroe "Heracles" "Guardian del Olimpo" 700 [pistola, relampagoDeZeus] [matarAlLeonDeNemea]

matarAlLeonDeNemea :: Tarea
matarAlLeonDeNemea = matarA leonDeNemea

pistola :: Artefacto
pistola = Artefacto "Pistola" 1000

leonDeNemea :: Bestia
leonDeNemea = Bestia "Leon de Nemea" debilidadDeLeonDeNemea

debilidadDeLeonDeNemea :: Debilidad
debilidadDeLeonDeNemea unHeroe = (>= 20) . length . epiteto $ unHeroe

realizarTarea :: Tarea -> Heroe -> Heroe
realizarTarea unaTarea unHeroe = agregarTarea unaTarea (unaTarea unHeroe)

presumir :: Heroe -> Heroe -> (Heroe, Heroe)
presumir unHeroe otroHeroe
  | reconocimiento                   unHeroe > reconocimiento                 otroHeroe = (unHeroe, otroHeroe)
  | reconocimiento                 otroHeroe > reconocimiento                   unHeroe = (otroHeroe, unHeroe)
  | sumatoriaDeRarezasDeArtefactos   unHeroe > sumatoriaDeRarezasDeArtefactos otroHeroe = (unHeroe, otroHeroe)
  | sumatoriaDeRarezasDeArtefactos otroHeroe > sumatoriaDeRarezasDeArtefactos   unHeroe = (otroHeroe, unHeroe)
  | otherwise                                                                           = presumir (realizarTareasDe otroHeroe unHeroe) (realizarTareasDe unHeroe otroHeroe)

sumatoriaDeRarezasDeArtefactos :: Heroe -> Int
sumatoriaDeRarezasDeArtefactos unHeroe = sum . map rareza . artefactos $ unHeroe

realizarTareasDe :: Heroe -> Heroe -> Heroe
realizarTareasDe unHeroe heroeQueRealizaLasTareas = realizarLabor (tareas unHeroe) heroeQueRealizaLasTareas

type Labor = [Tarea]

realizarLabor :: Labor -> Heroe -> Heroe
realizarLabor unaLabor unHeroe = foldr realizarTarea unHeroe unaLabor


descendientes :: Heroe -> [Heroe]
descendientes unHeroe = tail . iterate descendiente $ unHeroe

descendiente :: Heroe -> Heroe
descendiente unHeroe = realizarTareasDe unHeroe . mapArtefactos nub . mapNombre (++ "*") $ unHeroe

-- descendiente :: Barbaro -> Barbaro
-- descendiente unBarbaro = utilizarObjetos (objetos unBarbaro) . mapHabilidades sinRepetidos . mapNombre (++ "*") $ unBarbaro