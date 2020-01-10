create or replace view view_person AS
  select
         pessoa.seq_pessoa person_id,
         case when pessoa.cod_sexo ='M' then 8507
              when pessoa.cod_sexo ='F' then 8532
         else 8521 end gender_concept_id,
         EXTRACT(YEAR FROM pessoa.dat_nascimento) year_of_birth,
         EXTRACT(MONTH FROM pessoa.dat_nascimento) month_of_birth,
         EXTRACT(DAY FROM pessoa.dat_nascimento) day_of_birth,
         case
           when  pessoa.dat_obito is not null then EXTRACT(YEAR FROM pessoa.dat_obito)  || '-' || EXTRACT(MONTH FROM pessoa.dat_obito) || '-' ||EXTRACT(DAY FROM pessoa.dat_obito) || ' 00:00:00'
         else null end death_datetime,
         --pessoa.dat_obito death_datetime,
         case when pessoa.seq_etnia_pessoa = 1 then 8527
         when pessoa.seq_etnia_pessoa = 2 then 38003598
         when pessoa.seq_etnia_pessoa in (3,5) then 9178
              else 8522 end race_concept_id,
         case when pais.seq_pais in (124, 38, 1, 42, 233, 149, 239, 119, 263, 298, 270, 156, 165, 154, 299, 57, 304, 305, 306, 307) then 38003563
              else 38003564 end ethnicity_concept_id,
         endereco.seq_endereco location_id,
         pessoa.seq_pessoa person_source_value,
         pessoa.cod_sexo gender_source_value,
         etnia.nom_etnia race_source_value,
         pais.nom_pais ethnicity_source_value
  from pessoa
  inner join paciente ON pessoa.seq_pessoa = paciente.seq_paciente
  inner join etnia on pessoa.seq_etnia_pessoa = etnia.seq_etnia
  inner join municipio on ( municipio.seq_municipio = pessoa.seq_municipio and 
                            municipio.seq_pais = pessoa.seq_pais )
   inner join pais on municipio.seq_pais = pais.seq_pais
   inner join endereco ON endereco.seq_pessoa = pessoa.seq_pessoa
  where seq_paciente in (select distinct seq_paciente
        from view_movimento v
        where v.dat_hora_movimento > sysdate - 90)





/*
select pais.nom_pais, pais.seq_pais,count(*)
  from pessoa inner join municipio
  on ( pessoa.seq_municipio =municipio.seq_municipio   and pessoa.seq_pais = municipio.seq_pais)
  inner join pais on municipio.seq_pais = pais.seq_pais
 group by pais.nom_pais,pais.seq_pais
 having count(*) > 1

*/
