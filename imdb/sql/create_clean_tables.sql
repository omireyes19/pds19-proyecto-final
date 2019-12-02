create table cleaned.titulos_atributos 
as (
SELECT  tconst as title_identifier,
	titleType as titulo_formato,
	primaryTitle as titulo_promocional,
	originalTitle as titulo_original,
	(
      CASE
      WHEN isAdult = "0" THEN
         FALSE
      ELSE
         TRUE
      END
   ) AS titulo_para_adultos,
    TO_DATE(startYear || '/01/01', 'YYYY/MM/DD') as anio_estreno,
	(
      CASE
      WHEN endYear = "\N" THEN
         fecha_estreno
      ELSE
         TO_DATE(endYear || '/01/01', 'YYYY/MM/DD')
      END
   ) AS anio_fin,
 split_part(genres,',',1) as genero_primario,
 split_part(genres,',',2) as genero_secundario,
 split_part(genres,',',3) as genero_terciario,
(
      CASE
      WHEN runtimeMinutes = "\N" THEN
         0::INTEGER
      ELSE
         runtimeMinutes::INTEGER
      END
   ) AS duracion_minutos
FROM raw.title_basics
);

comment on table cleaned.titulos_atributos  is 'describe las características de las obras con su formato adecuado respecto audiencia, anos, generos duracion, etc.';


create table cleaned.titulos_atributos 
as (
SELECT  parentTconst as title_identifier,
	tconst as episode_identifier,
	 (
      CASE
      WHEN seasonNumber = "\N" THEN
         0::INTEGER
      ELSE
         seasonNumber::INTEGER
      END
   ) AS numero_temporada,
	 (
      CASE
      WHEN seasonNumber = "\N" THEN
         0::INTEGER
      ELSE
         episodeNumber::INTEGER
      END
   ) AS numero_episodio
FROM raw.title_episode
);

comment on table cleaned.titulos_episodios  is  'describe las características de los episodios de las series';
