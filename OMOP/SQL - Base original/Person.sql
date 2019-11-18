create or replace view view_person AS
  select          
         case when pessoa.cod_sexo ='M' then 8507
              when pessoa.cod_sexo ='F' then 8532
         else 8521 end gender ,
         EXTRACT(YEAR FROM pessoa.dat_nascimento) year_of_birth,
         EXTRACT(MONTH FROM pessoa.dat_nascimento) month_of_birth,
         EXTRACT(DAY FROM pessoa.dat_nascimento) day_of_birth,
         case when pais.seq_pais in (1,40,124,165,134,38,42,119,239,57) then 38003563
              else 38003564 end Ethnicity,
         case when pessoa.seq_etnia_pessoa = 1 then 8527
         when pessoa.seq_etnia_pessoa = 2 then 38003576
         when pessoa.seq_etnia_pessoa in (3,5) then 9178
              else 8552 end Race,
         pessoa.dat_obito,
         pessoa.seq_pessoa person_source_value,
         pessoa.cod_sexo gender_source_value,
         pais.seq_pais ethnicity_source_value
  from pessoa
  inner join paciente ON pessoa.seq_pessoa = paciente.seq_paciente
  inner join etnia on pessoa.seq_etnia_pessoa = etnia.seq_etnia
  inner join municipio on ( municipio.seq_municipio = pessoa.seq_municipio and 
                            municipio.seq_pais = pessoa.seq_pais )
   inner join pais on municipio.seq_pais = pais.seq_pais
  where seq_paciente in (select distinct seq_paciente
        from view_movimento v
        where v.dat_hora_movimento > sysdate - 90)
        
select * from view_person
        
        
        
select pais.nom_pais, pais.seq_pais,count(*)
  from pessoa inner join municipio 
  on ( pessoa.seq_municipio =municipio.seq_municipio   and pessoa.seq_pais = municipio.seq_pais)
  inner join pais on municipio.seq_pais = pais.seq_pais 
 group by pais.nom_pais,pais.seq_pais
 having count(*) > 1
 
