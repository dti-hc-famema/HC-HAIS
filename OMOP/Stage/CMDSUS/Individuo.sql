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