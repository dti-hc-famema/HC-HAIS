create or replace view view_location AS
  select
         endereco.seq_endereco location_id,
         endereco.nom_logradouro address_1,
         endereco.nom_complemento address_2,
         municipio.nom_municipio city,
         uf.sig_uf state,
         cep.nro_cep zip,
         pais.nom_pais country,
         endereco.nom_logradouro || endereco.nom_complemento || ' - ' || municipio.nom_municipio ||'/'|| uf.sig_uf location_source_value,
         pessoa.seq_pessoa person_source
    from pessoa
    inner join endereco ON pessoa.seq_pessoa = endereco.seq_pessoa
    inner join paciente ON pessoa.seq_pessoa = paciente.seq_paciente
    inner join municipio on ( municipio.seq_municipio = pessoa.seq_municipio and 
                              municipio.seq_pais = pessoa.seq_pais )
    inner join uf ON municipio.seq_uf = uf.seq_uf
    inner join pais on municipio.seq_pais = pais.seq_pais
    inner join cep ON endereco.seq_cep = cep.seq_cep
    where paciente.seq_paciente in (select distinct paciente.seq_paciente
          from view_movimento v
          where v.dat_hora_movimento > sysdate - 90)
    and endereco.nom_logradouro is not null
    and municipio.seq_municipio = 3584
