# Proyecto final: Análisis de la base de datos Internet Movie Database (IMDb)

##### Integrantes:

Fernanda Rubio  130441
Karla Alfaro  137314
Luis Eugenio Rojón  138442 
Omar Reyes  127131


## Pregunta de investigación:

Queremos responder la pregunta del impacto del director en la popularidad de las películas que dirige medido por el rating que reciben en la plataforma IMDB

## Entidad y eventos: 

Entidad: Dada la pregunta de investigación, nuestra entidad son los directores junto con sus principales atributos

Evento: Películas (títulos) realizadas por los directores a través del tiempo junto con su rating

## Fuente de datos:

Las bases de datos de la IMDb son 7 y en general, contienen información sobre la producción de películas, series y programas de televisión, videojuegos, entre otros. También traen información sobre el elenco, directores y escritores. Las bases pueden ser descargadas de: [base_IMDB](https://datasets.imdbws.com).  

**NOTA**: En estas bases se le llama título a cada producto ya sea película, serie de tv, programa de tv, videojuego, entre otros.

Las 7 bases de datos y las variables que contiene cada una son las siguientes: 

1. **title.akas.tsv.gz**: Contiene información sobre los títulos y sus variaciones en distintos lenguajes y regiones. 

- titleId (string) - Identificador alfanumérico único de cada título
- ordering (integer) - Identificador numérico de filas para identificador de título titleId
- title (string) - El título
- region (string) - La región para cada versión del título
- language (string) - El idioma para cada versión del título
- types (array) - Uno o más atributos enumerados para este título alternativo: "alternative", "dvd", "festival", "tv", "video", "working", "original", "imdbDisplay"
- attributes (array) - Otros atributos no enumerados para describir este título alternativo
- isOriginalTitle (boolean) – 0: no es el título original; 1: es el título original

2. **title.basics.tsv.gz**: Contiene información general sobre los títulos como su tipo, género, duración, año de lanzamiento, etc. 

- tconst (string) - Identificador alfanumérico único de cada título
- titleType (string) – Tipo/formato del título (e.g. película, corto, serie de tv, episodio de tv, video, etc)
- primaryTitle (string) – El título más popular/ el título usado por los cineastas en el lanzamiento 
- originalTitle (string) - Título original en su lenguaje original
- isAdult (boolean) - 0 - título no para adultos; 1: título para adultos
- startYear (YYYY) – Año de lanzamiento del título. Para las series de tv, es el año inicio de la serie  
- endYear (YYYY) – Año de finalización de las series de tv. ‘\N’ para los otros tipos de títulos
- runtimeMinutes – Duración del título en minutos
- genres (string array) – Hasta 3 géneros relacionados con el título

3. **title.crew.tsv.gz**: Contiene información sobre los directores y escritores de cada título

- tconst (string) - Identificador alfanumérico único de cada título
- directors (array of nconsts) - Director(es) del título
- writers (array of nconsts) – Escritor(es) del título

4. **title.episode.tsv.gz**: Contiene información sobre los episodios de las series de tv

- tconst (string) - Identificador alfanumérico único de cada episodio
- parentTconst (string) - Identificador alfanumérico único de la serie de tv padre
- seasonNumber (integer) – Temporada a la que pertenece el episodio dentro de la serie
- episodeNumber (integer) – Número de episodio dentro de la serie

5. **title.principals.tsv.gz**: Contiene información sobre los miembros principales del elenco/personal de cada título

- tconst (string) - Identificador alfanumérico único de cada título
- ordering (integer) – Identificador numérico de filas para cada identificador de título titleId
- nconst (string) - Identificador alfanumérico único para cada nombre/persona
- category (string) - La categoría del trabajo de cada persona
- job (string) - El título específico de cada trabajo, en otro caso '\N'
- characters (string) - El nombre del personaje en el título si aplica, en otro caso '\N'

6. **title.ratings.tsv.gz**: Contiene información sobre los ratings y votos de cada título

- tconst (string) - Identificador alfanumérico único de cada título
- averageRating – Promedio ponderado de todos los ratings individuales de usuario
- numVotes - Número de votos que cada título ha recibido

7. **name.basics.tsv.gz**: Contiene información sobre los nombres de personas

- nconst (string) - Identificador alfanumérico único para cada nombre/persona
- primaryName (string)– Nombre por el cual la persona es acreditada con mayor frecuencia
- birthYear – Año de nacimiento en el formato YYYY
- deathYear – Año de defunción si aplica en el formato YYYY, en otro caso '\N'
- primaryProfession (array of strings)– Las primeras 3 profesiones de cada persona 
- knownForTitles (array of tconsts) – Títulos por los que se conoce a cada persona3

## Diagrama de Entidad-Relación (estructura de la base de datos):

|Diagrama de entidad-relación con las tablas del esquema raw|  
|-------------------------------------------------|
|![Diagrama_raw](https://github.com/omireyes19/pds19-proyecto-final/blob/master/docs/raw_ent_rel.png)| 

**Notas:**

- La mayoría de las tablas se relacionan a través de la variable **tconst** que se refiere al identificador alfanumérico único de cada título.
- La tabla de *Personas* se relaciona con elenco a través de **nconst** que se refiere al identificador alfanumérico para cada nombre/persona. La relación con creadores se da a través de la unión de las 3 tablas. *Personas* se cruza con *Elenco* y *Elenco* con *Creadores* a través de **tconst**.
- La tabla de *Versiones* se relaciona con *Títulos* y todas las demás a través de **titleID** y **tconst**. Ambas variables son las mismas. 
- En la tabla de *Episodios*, **tconst** se refiere no al identificador del título de la serie, sino al identificador alfanumérico único de cada episodio. Esta tabla se relaciona con las demás a través de **parentTconst** que es igual a **tconst** en las demás tablas. 

## Instrucciones para correr el código:

##### 1. Copiar y descargar el repositorio en la ruta deseada. 

Dentro de vagrant clonar el [repositorio](https://github.com/omireyes19/pds19-proyecto-final)

~~~~bash
cd [escribir aquí la ruta donde se desea descargar el repositorio]
git clone https://github.com/omireyes19/pds19-proyecto-final.git
~~~~

##### 2. Instalar la paquetería necesaria.

~~~~bash
cd /home/vagrant/pds19-proyecto-final/imdb
pyenv virtualenv 3.7.3 imdb
echo 'imdb' > .python-version
pip install configparser psycopg2 click dynaconf 
~~~~

##### 3. Descargar y descomprimir las bases de datos.  

Una vez dentro del repositorio acceder a la ruta imdb/data y correr el siguiente código bash. 

~~~~bash
cd /home/vagrant/pds19-proyecto-final/imdb/data
./download_data.sh
~~~~

##### 4. Crear usuario y base de datos en Postgres  

~~~~bash
cd /home/vagrant/pds19-proyecto-final/imdb
./imdb.sh
~~~~

Este código descargará las bases de datos [base_IMDB](https://datasets.imdbws.com) en formato .gz, y las descomprimirá para dejarlas en formato .tsv 

##### 5. Pipeline para estructura de datos. 

En este apartado se ejecutarán los métodos que están dentro del archivo imdb.py para realizar los esquemas raw, cleaned y semantic con sus respectivas tablas.

**NOTA:** Se dividieron los archivos `title.akas.tsv` y `title.principals.tsv` por temas de memoria. Los procesos `to-cleaned` y `create-indexes-cleaned` también se divideron para prevenir que se sature la memoria.

~~~~bash
cd /home/vagrant/pds19-proyecto-final/imdb
python imdb.py create-schemas
python imdb.py create-raw-tables
python imdb.py load-imdb
python imdb.py to-cleaned
python imdb.py to-cleaned2
python imdb.py create-indexes-cleaned
python imdb.py create-indexes-cleaned2
python imdb.py create-indexes-cleaned3
python imdb.py to-semantic
~~~~

**NOTA:** En la creación de los índices, también se dividieron en 3 las tablas por problemas de memoria nuevamente. 

## Descripción y diagrama de la estructura clean: 

En el siguiente diagrama de entidad-relación se observan las nuevas tablas que se crearon usando estos índices.

|Diagrama de entidad-relación con las tablas del esquema clean|  
|-------------------------------------------------|
| ![Diagrama_clean](https://github.com/omireyes19/pds19-proyecto-final/blob/master/docs/clean_ent_rel.png)| 

**Descripción de limpieza:**

- Primero, se crearon dos funciones de SQL `try_cast_int` y `try_cast_float` para transformar las columnas numéricas a los tipos correspondientes.
- Segundo, después se cambiaron los nombres de todas las variables al idioma español y a nombres que fuera intuitivos.
- Tercero, se crearon y modificaron algunas variables:
      - Algunas columnas que tenían arrays de tamaño determinado, por ejemplo, **primaryProfession** que traía hasta 3 nombres, se dividió en 3 variables distintas. Lo mismo para **genres** de *Títulos*, **directors** y **writers** de *Creadores*.
      - Los arrays que no especificaban el número de elementos, se dejaron en el esquema raw. 
- Cuarto, los años se estandarizaron al formato de fecha YYYY/MM/DD.
- Por último, se cambió el valor de \N que representa valores faltantes por valores específicos como "STAFF" para **characters** de *Elenco* o, por NULL dependiendo el caso. 
