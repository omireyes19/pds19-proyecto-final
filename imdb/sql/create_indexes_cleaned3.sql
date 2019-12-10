-- indices nombres_atributos
drop INDEX if exists nombres_atributos_idx;
CREATE INDEX nombres_atributos_idx ON cleaned.nombres_atributos (nombre_identificador NULLS LAST);

-- indices titulos_elenco
drop INDEX if exists titulo_nombre_elenco_idx;
CREATE INDEX titulo_nombre_elenco_idx ON cleaned.titulos_elenco ( nombre_identificador NULLS LAST);
