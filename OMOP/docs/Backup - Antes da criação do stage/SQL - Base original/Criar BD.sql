CREATE TABLE pessoa (
  seq_pessoa integer,
  cod_sexo varchar(1),
  dat_nascimento DATE,
  dat_obito DATE,
  seq_etnia_pessoa integer,
  seq_pais integer
)


CREATE TABLE ETNIA (
   seq_etnia integer,
   nom_etnia varchar(200)
)


CREATE TABLE pais (
  seq_pais integer,
  nom_pais varchar(200)
)

create table paciente (
	seq_pessoa integer,
	seq_paciente integer,
	nro_prontuario integer,
	nom_conjuge varchar(200),
	nro_filho integer,
	nro_cns varchar(15)
)

create table profissional (
	id_profissional integer,
	nro_conselho varchar(16),
	cns_profissional varchar(20),
	seq_pessoa integer
)

create table cbo (
	cod_cbo varchar(6),
	descricao varchar(200)
)

create table endereco (
	seq_endereco integer,
	nom_logradouro varchar(200),
	nom_complemento varchar(200),
	seq_cep integer,
	seq_pessoa integer
)