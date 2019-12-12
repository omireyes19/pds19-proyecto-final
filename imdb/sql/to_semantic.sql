-- crear entidad de semantic
drop table if exists semantic.entidad_directores;

create table semantic.entidad_directores 
as (
  SELECT A.* FROM cleaned.nombres_atributos A
  INNER JOIN (
    select distinct nombre_identificador 
    from cleaned.titulos_elenco 
    where persona_categoria_trabajo = 'director'
  ) B
  ON A.nombre_identificador = B.nombre_identificador
);

comment on table semantic.entidad_directores is 'Creamos la entidad de directores donde vienen todos los directores en la base junto con sus atributos';

-- crear eventos de semantic
drop table if exists semantic.eventos_peliculas_dirigidas;

create table semantic.eventos_peliculas_dirigidas 
as (
  select A.*, B.numero_traducciones, D.nombre_identificador, E.rating_promedio from 
  (
    select * from cleaned.titulos_atributos 
    where titulo_formato in ('tvShort','short','movie','tvMovie') 
  ) A
  LEFT JOIN (
    select titulo_identificador, count(*) as numero_traducciones
    from cleaned.titulos_episodios 
    group by titulo_identificador
  ) B
  ON A.titulo_identificador = B.titulo_identificador
  LEFT JOIN (
    select titulo_identificador, trim(nombre_identificador) as nombre_identificador
    from
    (
      select titulo_identificador, director_primario as nombre_identificador
      from cleaned.titulos_directores_escritores
      union
      select titulo_identificador, director_secundario as nombre_identificador
      from cleaned.titulos_directores_escritores
      where director_secundario is not null
      union
      select titulo_identificador, director_terciario as nombre_identificador
      from cleaned.titulos_directores_escritores
      where director_terciario is not null
      ) C
      where length(nombre_identificador) > 0
    ) D
  ON A.titulo_identificador = D.titulo_identificador
  LEFT JOIN (
    select titulo_identificador, rating_promedio
    from cleaned.titulos_ratings
  ) E
  ON A.titulo_identificador = E.titulo_identificador
);

comment on table semantic.eventos_peliculas_dirigidas is 'Creamos la base donde los eventos son las peliculas dirigidas con sus principales caracteristicas y su rating';
