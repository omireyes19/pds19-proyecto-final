-- limpieza raw.title_akas1 y 2
drop table if exists cleaned.titulos_lenguas_extranjeras;

create table cleaned.titulos_lenguas_extranjeras 
as (
SELECT  "titleId" as titulo_identificador,
	try_cast_int(ordering) as titulo_identificador_traduccion,
	title as titulo_local,
	region as titulo_region,
	language as titulo_lenguaje,
	types as titulo_tipo_distribucion,
	attributes as titulo_local_descripcion,
	"isOriginalTitle" as titulo_lenguaje_original
FROM raw.title_akas1
UNION
SELECT  "titleId" as titulo_identificador,
	try_cast_int(ordering) as titulo_identificador_traduccion,
	title as titulo_local,
	region as titulo_region,
	language as titulo_lenguaje,
	types as titulo_tipo_distribucion,
	attributes as titulo_local_descripcion,
	"isOriginalTitle" as titulo_lenguaje_original
FROM raw.title_akas2
);

comment on table cleaned.titulos_lenguas_extranjeras  is  'describe la distribucion global de los titulos al otorgar informacion de los lenguajes en los que se tradujo.';

-- limpieza raw.title_principals
drop table if exists cleaned.titulos_elenco;

create table cleaned.titulos_elenco 
as (
SELECT  tconst as titulo_identificador,
  	try_cast_int(ordering) as titulo_identificador_persona,
  	nconst as nombre_identificador,
  	category as persona_categoria_trabajo,
  	job as persona_especifico_trabajo,
  	 (
      CASE
      WHEN characters in ('\N') THEN
         'STAFF'
      ELSE
         characters
      END
   ) AS persona_personaje
FROM raw.title_principals1
UNION
SELECT  tconst as titulo_identificador,
  	try_cast_int(ordering) as titulo_identificador_persona,
  	nconst as nombre_identificador,
  	category as persona_categoria_trabajo,
  	job as persona_especifico_trabajo,
  	 (
      CASE
      WHEN characters in ('\N') THEN
         'STAFF'
      ELSE
         characters
      END
   ) AS persona_personaje
FROM raw.title_principals2
UNION
SELECT  tconst as titulo_identificador,
  	try_cast_int(ordering) as titulo_identificador_persona,
  	nconst as nombre_identificador,
  	category as persona_categoria_trabajo,
  	job as persona_especifico_trabajo,
  	 (
      CASE
      WHEN characters in ('\N') THEN
         'STAFF'
      ELSE
         characters
      END
   ) AS persona_personaje
FROM raw.title_principals3
UNION
SELECT  tconst as titulo_identificador,
  	try_cast_int(ordering) as titulo_identificador_persona,
  	nconst as nombre_identificador,
  	category as persona_categoria_trabajo,
  	job as persona_especifico_trabajo,
  	 (
      CASE
      WHEN characters in ('\N') THEN
         'STAFF'
      ELSE
         characters
      END
   ) AS persona_personaje
FROM raw.title_principals4
);

comment on table cleaned.titulos_elenco  is  'Describe las caracteristicas de todas las personas que trabajan en los titulos de las peliculas.';



