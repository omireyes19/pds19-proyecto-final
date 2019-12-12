--funciones de cambio de tipos
drop function if exists try_cast_int;

create function try_cast_int(p_in text, p_default int default null)
   returns int
as
$$
begin
  begin
    return $1::integer;
  exception 
    when others then
       return p_default;
  end;
end;
$$
language plpgsql;

drop function if exists try_cast_float;

create function try_cast_float(p_in text, p_default int default null)
   returns float
as
$$
begin
  begin
    return $1::float;
  exception 
    when others then
       return p_default;
  end;
end;
$$
language plpgsql;

-- limpieza raw.title_ratings
drop table if exists cleaned.titulos_ratings;

create table cleaned.titulos_ratings 
as (
SELECT  tconst as titulo_identificador,
  	try_cast_float("averageRating") as rating_promedio,
  	try_cast_int("numVotes") as numero_votos

FROM raw.title_ratings
);

comment on table cleaned.titulos_ratings  is 'describe el desempeño en cuanto a popularidad de los titulos.';

-- limpieza raw.title_crew
drop table if exists cleaned.titulos_directores_escritores;

create table cleaned.titulos_directores_escritores 
as (
SELECT tconst as titulo_identificador,
	split_part(directors,',',1) as director_primario,
	split_part(directors,',',2) as director_secundario,
	split_part(directors,',',3) as director_terciario,
  	split_part(writers,',',1) as escritor_primario,
	split_part(writers,',',2) as escritor_secundario,
	split_part(writers,',',3) as escritor_terciario

FROM raw.title_crew
);

comment on table cleaned.titulos_directores_escritores  is 'describe los directores y escritores principales que participaron por pelicula.';

-- limpieza raw.name_basics
drop table if exists cleaned.nombres_atributos;

create table cleaned.nombres_atributos 
as (
SELECT  nconst as nombre_identificador,
	"primaryName" as nombre_artistico,
	TO_DATE(try_cast_int("birthYear") || '/01/01', 'YYYY/MM/DD') as fecha_nacimiento,
	(
      CASE
      WHEN "deathYear" in ('\N') THEN
         NULL
      ELSE
         TO_DATE(try_cast_int("deathYear") || '/01/01', 'YYYY/MM/DD')
      END
   	) AS fecha_muerte,
	 split_part("primaryProfession",',',1) as profesion_primario,
	 split_part("primaryProfession",',',2) as profesion_secundario,
	 split_part("primaryProfession",',',3) as profesion_terciario
FROM raw.name_basics
);

comment on table cleaned.nombres_atributos  is 'describe las características de los elencos que trabajan en los titulos.';

-- limpieza raw.title.basics
drop table if exists cleaned.titulos_atributos;

create table cleaned.titulos_atributos 
as (
SELECT  tconst as titulo_identificador,
	"titleType" as titulo_formato,
	"primaryTitle" as titulo_promocional,
	"originalTitle" as titulo_original,
	(
      CASE
      WHEN "isAdult" in ('0') THEN
         FALSE
      ELSE
         TRUE
      END
   ) AS titulo_para_adultos,
    TO_DATE(try_cast_int("startYear") || '/01/01', 'YYYY/MM/DD') as fecha_estreno,
	(
      CASE
      WHEN "endYear" in ('\N') THEN
         TO_DATE(try_cast_int("startYear") || '/01/01', 'YYYY/MM/DD') 
      ELSE
         TO_DATE(try_cast_int("endYear") || '/01/01', 'YYYY/MM/DD')
      END
   ) AS fecha_fin,
 split_part(genres,',',1) as genero_primario,
 split_part(genres,',',2) as genero_secundario,
 split_part(genres,',',3) as genero_terciario,
(
      CASE
      WHEN "runtimeMinutes" in ('\N') THEN
         0::INTEGER
      ELSE
         try_cast_int("runtimeMinutes")
      END
   ) AS duracion_minutos
FROM raw.title_basics
);

comment on table cleaned.titulos_atributos  is 'describe las características de las obras con su formato adecuado respecto audiencia, anos, generos duracion, etc.';

-- limpieza raw.title_episodes
drop table if exists cleaned.titulos_episodios;

create table cleaned.titulos_episodios 
as (
SELECT  "parentTconst" as titulo_identificador,
	tconst as episodio_identificador,
	 (
      CASE
      WHEN "seasonNumber" in ('\N') THEN
         0::INTEGER
      ELSE
         try_cast_int("seasonNumber")
      END
   ) AS numero_temporada,
	 (
      CASE
      WHEN "seasonNumber" in ('\N') THEN
         0::INTEGER
      ELSE
         try_cast_int("episodeNumber")
      END
   ) AS numero_episodio
FROM raw.title_episode
);

comment on table cleaned.titulos_episodios  is  'describe las características de los episodios de las series';



