select distinct  pessoa.nom_pessoa,
       profissional.nro_conselho,
       EXTRACT (YEAR FROM pessoa.dat_nascimento) "YEAR OF BIRTH",
       omop_specialty.concept_id specialty,
       omop_specialty.concept_name
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
     
     
     
select * from cbo where dat_fim is null for update 



select * FROM OMOP_SPECIALTY for update 


select pessoa.nom_pessoa, equipe.nom_equipe, cbo.descricao, cbo.cod_cbo
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
where pessoa.nom_pessoa like '%MACHADO%'
    

