select endereco.seq_pessoa,
       'Rua '||endereco.nom_logradouro ||' ,'||
       endereco.nro_numero||' - '||
       municipio.nom_municipio address
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

select count(endereco.nom_logradouro) "Somatório endereços"
from endereco
