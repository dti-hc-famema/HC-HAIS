/*
select 
  sihosp.get_cns_pessoa(pessoa.seq_pessoa) cns,
  pessoa.nom_pessoa nome,
  pessoa.nom_mae nome_mae,
  case when pessoa.cod_sexo ='M' then 'MASCULINO'
       when pessoa.cod_sexo ='F' then 'FEMININO'
         else 'IGNORADO' end sexo,
  etnia.nom_etnia raca,
  pessoa.dat_nascimento data_nascimento,
  pais.nom_pais pais_nascimento,
  case when pessoa.seq_pais = 1
    then municipio.nom_municipio end municipio_nascimento,
  pais.seq_pais pais_residencia,
  endereco.seq_municipio municipio_residencia,
  pessoa.seq_pessoa seq_pessoa
from pessoa
  inner join etnia ON etnia.seq_etnia = pessoa.seq_etnia_pessoa
  inner join municipio on ( municipio.seq_municipio = pessoa.seq_municipio and 
                            municipio.seq_pais = pessoa.seq_pais )
  inner join pais on pessoa.seq_pais = pais.seq_pais
  inner join endereco ON endereco.seq_pessoa = pessoa.seq_pessoa
     where sihosp.get_cns_pessoa(pessoa.seq_pessoa) is not null
*/
INSERT INTO person
(
    person_id,
    gender_concept_id,
    year_of_birth,
    month_of_birth,
    day_of_birth,
    birth_datetime,
    death_datetime,
    race_concept_id,
    ethnicity_concept_id,
    location_id,
    location_id, -- [!#WARNING!#] THIS TARGET FIELD WAS ALREADY USED
    location_id, -- [!#WARNING!#] THIS TARGET FIELD WAS ALREADY USED
    provider_id,
    care_site_id,
    person_source_value,
    person_source_value, -- [!#WARNING!#] THIS TARGET FIELD WAS ALREADY USED
    gender_source_value,
    gender_source_concept_id,
    race_source_value,
    race_source_concept_id,
    ethnicity_source_value,
    ethnicity_source_concept_id
)
SELECT
    individuo.seq_pessoa AS person_id,

    individuo.sexo AS gender_concept_id,

    individuo.data_nascimento AS year_of_birth,

    individuo.data_nascimento AS month_of_birth,

    individuo.data_nascimento AS day_of_birth,

    individuo.data_nascimento AS birth_datetime,

 -- [!WARNING!] no source column found. See possible comment at the INSERT INTO
    NULL AS death_datetime,

    individuo.raca AS race_concept_id,

    individuo.pais_nascimento AS ethnicity_concept_id,

    individuo.pais_residencia AS location_id,

    individuo.municipio_residencia AS location_id,

    individuo.cep_residencia AS location_id,

 -- [!WARNING!] no source column found. See possible comment at the INSERT INTO
    NULL AS provider_id,

 -- [!WARNING!] no source column found. See possible comment at the INSERT INTO
    NULL AS care_site_id,

    individuo.nome AS person_source_value,

    individuo.seq_pessoa AS person_source_value,

    individuo.sexo AS gender_source_value,

    individuo.sexo AS gender_source_concept_id,

    individuo.raca AS race_source_value,

    individuo.raca AS race_source_concept_id,

    individuo.pais_nascimento AS ethnicity_source_value,

    individuo.pais_nascimento AS ethnicity_source_concept_id

FROM individuo
;