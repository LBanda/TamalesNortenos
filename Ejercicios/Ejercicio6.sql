-- Película(título, año, duración, encolor, presupuesto, nomestudio, idproductor)
-- Elenco(título, año, nombre, sueldo)
-- Actor(nombre, dirección, telefono, fechanacimiento, sexo)
-- Productor(idproductor, nombre, dirección, teléfono)
-- Estudio(nomestudio, dirección)

-- 1.- Actrices de “Las brujas de Salem”.
-- 2.- Nombres de los actores que aparecen en películas producidas por MGM en 1995.
-- 3.- Películas que duran más que “Lo que el viento se llevó” (de 1939).
-- 4.- Productores que han hecho más películas que George Lucas.
-- 5.- Nombres de los productores de las películas en las que ha aparecido Sharon Stone.
-- 6.- Título de las películas que han sido filmadas más de una vez

-- 1. Actrices de “Las brujas de Salem”.
SELECT A.nombre
FROM Actor A, Elenco E
WHERE A.nombre = E.nombre
AND sexo = 'F'
AND titulo = 'La brujas de Salem'

SELECT nombre
FROM Elenco
WHERE titulo = 'Las brujas de Salem'
AND nombre IN (
    SELECT nombre
    FROM Actor
    WHERE sexo = F 
)

-- 2. Nombres de los actores que aparecen en películas producidas por MGM en 1995.
SELECT nombre
FROM Elenco E, Pelicula P
WHERE E.titulo = P.titulo
AND E.año = P.año
AND E.año = 1995
AND nomestudio = 'MGM'

SELECT nombre
FROM Elenco
WHERE año = 1995
AND nombre IN (
    SELECT nomestudio
    FROM Pelicula
    WHERE nomestudio = 'MGM'
)

-- 3. Películas que duran más que “Lo que el viento se llevó” (de 1939).
SELECT titulo
FROM Pelicula
WHERE duracion > duracion IN (
    SELECT titulo
    FROM Pelicula
    WHERE titulo = 'Lo que el viento se llevo'
    AND año = 1939
)

-- 4. Productores que han hecho más películas que George Lucas.
SELECT nombre COUNT(titulo)
FROM Productor PO, Pelicula PE
WHERE PO.idproductor = PE.idproductor
HAVING COUNT(titulo) > COUNT(titulo) IN (
    SELECT nombre COUNT (titulo)
    FROM Productor PO, Pelicula PE
    WHERE PO.idproductor = PE.idproductor
    AND nombre = 'George Lucas'
)

-- 5. Nombres de los productores de las películas en las que ha aparecido Sharon Stone.
SELECT PO.nombre
FROM Productor PO, Pelicula PE
WHERE PO.idproductor = PE.idproductor
AND PE.titulo IN (
    SELECT PE.titulo
    FROM Elenco E, Pelicula PE 
    WHERE E.titulo = PE.titulo
    AND E.año = PE.año
    AND E.nombre = 'Sharon Stone'
)

-- 6. Título de las películas que han sido filmadas más de una vez.
SELECT titulo COUNT(titulo)
FROM Pelicula
HAVING COUNT(titulo) > 1


