
-- indices titulos_ratings
drop INDEX if exists titulo_ratings_idx;
CREATE INDEX titulo_ratings_idx ON cleaned.titulos_ratings (titulo_identificador NULLS LAST);

-- indices titulos_directores_escritores
drop INDEX if exists titulo_directores_idx;
CREATE INDEX titulo_directores_idx ON cleaned.titulos_directores_escritores (titulo_identificador NULLS LAST);

-- indices titulos_atributos
drop INDEX if exists titulo_atributos_idx;
CREATE INDEX titulo_atributos_idx ON cleaned.titulos_atributos (titulo_identificador NULLS LAST);

-- indices titulos_episodios
drop INDEX if exists titulo_episodios_idx;
CREATE INDEX titulo_episodios_idx ON cleaned.titulos_episodios (titulo_identificador NULLS LAST);

