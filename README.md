# Proyecto final: Análisis de la base de datos Internet Movie Database (IMDb)

##### Integrantes:

Fernanda Rubio  130441
Karla Alfaro  137314
Luis Eugenio Rojón  138442 
Omar Reyes  127131

## Fuente de datos:

Las bases de datos de la IMDb son 7 y en general, contienen información sobre la producción de películas, series y programas de televisión, videojuegos, entre otros. También traen información sobre el elenco, directores y escritores. La bases pueden ser descargadas de: [base_IMDB](https://datasets.imdbws.com).  

**IMPORTANTE**: En estas bases se le llama título a cada producto ya sea película, serir de tv, programa de tv, videojuego, etc .

Las 7 bases de datos y las variables que contiene cada una son las siguientes: 

1. **title.akas.tsv.gz**: Contiene información sobre los títulos y sus variaciones en distintos lenguajes y regiones. 

..* titleId (string) - Identificador alfanumérico único de cada título
..* ordering (integer) - Identificador numérico de filas para identificador de título titleId
..* title (string) - El título
..* region (string) - La región para cada versión del título
..* language (string) - El idioma para cada versión del título
..* types (array) - Uno o más atributos enumerados para este título alternativo: "alternative", "dvd", "festival", "tv", "video", "working", "original", "imdbDisplay".
..* attributes (array) - Otros atributos no enumerados para describir este título alternativo
..* isOriginalTitle (boolean) – 0: no es el título original; 1: es el título original

2. **title.basics.tsv.gz**: Contiene información general sobre los títulos como su tipo, género, duración, año de lanzamiento, etc. 

..* tconst (string) - Identificador alfanumérico único de cada título
..* titleType (string) – Tipo/formato del título (e.g. película, corto, serie de tv, episodio de tv, video, etc)
..* primaryTitle (string) – El título más popular/ el título usado por los cineastas en el lanzamiento 
..* originalTitle (string) - Título original en su lenguaje original
..* isAdult (boolean) - 0 - título no para adultos; 1: título para adultos
..* startYear (YYYY) – Año de lanzamiento del título. Para las series de tv, es el año inicio de la serie  
..* endYear (YYYY) – Año de finalización de las series de tv. ‘\N’ para los otros tipos de títulos
..* runtimeMinutes – Duración del título en minutos
..* genres (string array) – Hasta 3 genéros relacionados con el título

3. **title.crew.tsv.gz**: Contiene información sobre los directores y escritores de cada título

..* tconst (string) - Identificador alfanumérico único de cada título
..* directors (array of nconsts) - Director(es) del título
..* writers (array of nconsts) – Escritor(es) del título

4. **title.episode.tsv.gz**: Contiene información sobre los episodios de las series de tv

..* tconst (string) - Identificador alfanumérico único de cada episodio
..* parentTconst (string) - Identificador alfanumérico único de la serie de tv padre
..* seasonNumber (integer) – Temporada a la que pertenece el episodio dentro de la serie
..* episodeNumber (integer) – Número de episodio dentro de la serie

5. **title.principals.tsv.gz**: Contiene información sobre los miembros principales del elenco/personal de cada título

tconst (string) - Identificador alfanumérico único de cada título
ordering (integer) – Identificador numérico de filas para cada identificador de título titleId
nconst (string) - Identificador alfanumérico único para cada nombre/persona
category (string) - La categoría del trabajo de cada persona
job (string) - El título específico de cada trabajo, en otro caso '\N'
characters (string) - El nombre del personaje en el título si aplica, en otro caso '\N'

6. **title.ratings.tsv.gz**: Contiene información sobre los ratings y votos de cada título

tconst (string) - Identificador alfanumérico único de cada título
averageRating – Promedio ponderado de todos los ratings individuales de usuario
numVotes - Número de votos que cada título ha recibido

7. **name.basics.tsv.gz**: Contiene información sobre los nombres de personas

nconst (string) - Identificador alfanumérico único para cada nombre/persona
primaryName (string)– Nombre por el cual la persona es acreditada con mayor frecuencia
birthYear – Año de nacimiento en el formato YYYY
deathYear – Año de defunción si aplica en el formato YYYY, en otro caso '\N'
primaryProfession (array of strings)– Las primeras 3 profesiones de cada persona 
knownForTitles (array of tconsts) – Títulos por los que se conoce a cada persona3


## Entidad: 

Edpisodios 

## Estructura:

## Instrucciones para correr el código:

