-- indices titulos_lenguas_extranjeras
drop INDEX if exists titulo_lenguas_extranjeras_idx;
CREATE INDEX titulo_lenguas_extranjeras_idx ON cleaned.titulos_lenguas_extranjeras (titulo_identificador NULLS LAST);

-- indices titulos_elenco
drop INDEX if exists titulo_elenco_idx;
CREATE INDEX titulo_elenco_idx ON cleaned.titulos_elenco (titulo_identificador NULLS LAST);
