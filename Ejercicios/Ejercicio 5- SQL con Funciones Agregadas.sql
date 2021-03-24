

/*
Película (título, año, duración, encolor, presupuesto, nomestudio, idproductor)
Elenco (título, año, nombre, sueldo)
Actor (nombre, dirección, telefono, fechanacimiento, sexo)
Productor (idproductor, nombre, dirección, teléfono)
Estudio (nomestudio, dirección)
*/

-- El ingreso total recibido por cada actor, sin importar en cuantas películas haya participado.
SELECT nombre, SUM(sueldo)
FROM Elenco
Group BY nombre

-- El monto total destinado a películas por cada Estudio Cinematográfico, durante la década de los 80's.
SELECT nomestudio, SUM(presupuesto) AS 'Monto total'
FROM Película
WHERE año BETWEEN 1980 AND 1989
Group BY nomestudio

-- Nombre y sueldo promedio de los actores (sólo hombres) que reciben en promedio un pago superior a 5 millones de dolares por película.

SELECT nombre, AVG(e.sueldo) AS 'Salario promedio'
FROM Elenco e, Actor a
WHERE a.sexo = 'hombre' AND a.nombre = e.nombre
HAVING AVG(e.sueldo) > 5000000 
Group BY nombre

-- Título y año de producción de las películas con menor presupuesto. (Por ejemplo, la película de Titanic se ha producido en varias veces 
-- entre la lista de películas estaría la producción de Titanic y el año que fue filmada con menor presupuesto).

SELECT titulo, MIN(presupuesto) as 'Menor presupuesto'
FROM Pelicula
Group BY titulo


-- Mostrar el sueldo de la actriz mejor pagada.
SELECT nombre, sueldo
From Actor
WHERE sueldo = (SELECT MAX(e.sueldo) AS 'Sueldo más grande'
                FROM Actor a, Elenco e 
                WHERE sexo = 'mujer' AND a.nombre = e.nombre
                Group BY nombre)
AND sexo = 'mujer'
