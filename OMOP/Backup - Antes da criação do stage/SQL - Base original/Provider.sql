create or replace view view_provider AS
select profissional.id_profissional provider_id,
       pessoa.nom_pessoa provider_name,
       profissional.nro_conselho npi,
       sihosp.get_cns_profissional(profissional.seq_pessoa) dea,
       omop_specialty.concept_id specialty_concept_id,
       EXTRACT (YEAR FROM pessoa.dat_nascimento) "YEAR OF BIRTH",
       case when pessoa.cod_sexo ='M' then 8507
              when pessoa.cod_sexo ='F' then 8532
         else 8521 end gender_concept_id,
       profissional.id_profissional provider_source_value,
       cbo.descricao specialty_source_value,
       cbo.cod_cbo specialty_source_concept_id,
       pessoa.cod_sexo gender_source_value
from profissional 
     inner JOIN pessoa on profissional.seq_pessoa = pessoa.seq_pessoa
     inner join profissional_cbo on ( profissional.seq_profissional = profissional_cbo.seq_profissional
                                      and profissional.seq_pessoa = profissional_cbo.seq_pessoa )
     inner join cbo on profissional_cbo.cod_cbo = cbo.cod_cbo
     inner join omop_specialty on omop_specialty.concept_id = cbo.id_specialty                                     
     where pessoa.dat_obito is null
     and profissional.nro_conselho is not null
     and profissional.dat_desligamento is null
     and profissional_cbo.dat_fim is null 

/*select pessoa.nom_pessoa, equipe.nom_equipe, cbo.descricao, cbo.cod_cbo, cbo.descricao
  from profissional
 inner join centro_custo
    on profissional.seq_centro_custo = centro_custo.seq_centro_custo
 inner join equipe
    on centro_custo.seq_equipe = equipe.seq_equipe
 inner join pessoa
    on profissional.seq_pessoa = pessoa.seq_pessoa
 inner join cargo
    on profissional.seq_cargo  = cargo.seq_cargo
 inner join cbo 
    on to_char(cargo.cod_cbo) = cbo.cod_cbo
where upper(cbo.descricao) like 'CARDIO'*/