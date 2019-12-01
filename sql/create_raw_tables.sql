create schema if not exists raw;

drop table if exists raw.name_basics;

create table raw.name_basics (
	"nconst" TEXT,
	"primaryName" TEXT,
	"birthYear" TEXT,
	"deathYear" TEXT,
	"primaryProfession" TEXT,
	"knownForTitles" TEXT

);

comment on table raw.name_basics is 'describe las características estáticas de una persona';

drop table if exists raw.title_basics;

create table raw.title_basics (
	"tconst" TEXT,
  	"titleType" TEXT,
  	"primaryTitle" TEXT,
  	"originalTitle" TEXT,
  	"isAdult" TEXT,
  	"startYear" TEXT,
  	"endYear" TEXT,
  	"runtimeMinutes" TEXT,
  	"genres" TEXT
);

comment on table raw.title_basics is 'describe las características de las obras con su formato audiencia, anos, generos duracion, etc.';

drop table if exists raw.title_episode;

create table raw.title_episode (
	"tconst" TEXT,
  	"parentTconst" TEXT,
  	"seasonNumber" TEXT,
  	"episodeNumber" TEXT
);

comment on table raw.title_episode is 'describe las características de los episodios de las series';

drop table if exists raw.title_ratings;

create table raw.title_ratings (
	"tconst" TEXT,
  	"averageRating" TEXT,
  	"numVotes" TEXT
);

comment on table raw.title_ratings is 'describe las características de los ratings de las obras';

drop table if exists raw.title_akas;

create table raw.title_akas (
	"titleId" TEXT,
  	"ordering" TEXT,
  	"title" TEXT,
	"region" TEXT,
  	"language" TEXT,
  	"types" TEXT,
  	"attributes" TEXT,
  	"isOriginalTitle" TEXT

);

comment on table raw.title_akas is 'describe las características de los titulos en distintas regiones y lenguas';

drop table if exists raw.title_crew;

create table raw.title_crew (
	"tconst" TEXT,
  	"directors" TEXT,
  	"writers" TEXT
);

comment on table raw.title_crew is 'describe las características de los directores y escritores de las obras';

drop table if exists raw.title_principals;

create table raw.title_principals (
	"tconst" TEXT,
  	"ordering" TEXT,
  	"nconst" TEXT,
  	"category" TEXT,
  	"job" TEXT,
  	"characters" TEXT
);

comment on table raw.title_crew is 'describe las características de las tareas que realizan las personas en las peliculas';
