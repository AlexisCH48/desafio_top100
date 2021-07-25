DROP DATABASE peliculas;

CREATE DATABASE peliculas;
\c peliculas;

CREATE TABLE peliculas(
    id INT,
    Pelicula VARCHAR(100),
    Año_estreno VARCHAR(4),
    Director VARCHAR(30),
    PRIMARY KEY(id)
);

CREATE TABLE reparto(
    id_pelicula INT,
    nombre_actores VARCHAR(30),
    FOREIGN KEY (id_pelicula) REFERENCES peliculas(id)
);

--cargar datos en tablas
\copy peliculas FROM 'peliculas.csv' csv header;

\copy reparto FROM 'reparto.csv' csv header;

--Obtener id 
SELECT id FROM peliculas WHERE Pelicula = 'Titanic';}

--lista de actores 
SELECT peliculas.Pelicula, reparto.nombre_actores
FROM reparto
LEFT JOIN peliculas ON peliculas.id = reparto.id_pelicula
WHERE Pelicula = 'Titanic';

--cantiadad de peliculas del actor
SELECT COUNT(id_pelicula) 
FROM reparto 
WHERE nombre_actores = 'Harrison Ford';

--filtrar peliculas por rango de años
SELECT * FROM peliculas
WHERE Año_estreno BETWEEN '1990' AND '1999'
ORDER BY Pelicula ASC;

--longitud titulos
SELECT Pelicula, LENGTH(Pelicula) 
AS longitud_titulo FROM peliculas;

--mayor longitud de titulo
SELECT Pelicula,LENGTH(Pelicula) 
AS mayor_longitud_titulo 
FROM peliculas 
ORDER BY 2 DESC LIMIT 1;