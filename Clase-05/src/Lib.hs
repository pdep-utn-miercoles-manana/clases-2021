import Text.Show.Functions
import Data.List

data Alumno = Alumno {
    nombreAlumno :: String,
    legajoAlumno :: Int
} deriving (Show)

data Persona = Persona {
    nombrePersona :: String,
    edadPersona :: Int
} deriving (Show)

juli :: Persona
juli = Persona "Julian" 26

saludar :: Persona -> String
saludar unaPersona = "Hola " ++ nombrePersona unaPersona

cumplirAño :: Persona -> Persona

cumplirAño  (Persona nombre edad) = Persona nombre (edad + 1)

cumplirAño' unaPersona = Persona (nombrePersona unaPersona) (edadPersona unaPersona + 1)

olaf :: Alumno
olaf = Alumno "Olaf Querol" 1733709

data DiaDeSemana = Lunes | Martes | Miercoles | Jueves | Viernes | Sabado | Domingo deriving (Show)

esFinDeSemana :: DiaDeSemana -> Bool
esFinDeSemana Sabado  = True
esFinDeSemana Domingo = True
esFinDeSemana _       = False
