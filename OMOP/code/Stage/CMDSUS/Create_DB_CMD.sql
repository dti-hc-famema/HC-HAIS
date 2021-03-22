create table individuo(
	CNS integer,
	justificativa_impossibilidade varchar(200),
	nome varchar(200),
	nome_mae varchar(200),
	sexo varchar(1),
	raca integer,
	data_nascimento date,
	pais_nascimento integer,
	municipio_nascimento integer,
	pais_residencia integer,
	municipio_residencia integer,
	cep_residencia integer,
	seq_pessoa integer
)

create table contato_assistencial(
	estabelecimento_saude integer,
	dados_admissao varchar(200),
	data_admissao date,
	procedencia integer,
	modalidade varchar(200),
	carater varchar(200),
	motivo_desfecho varchar(200),
	data_desfecho date
)

create table diagnostico(
	terminologia varchar(50),
	versao varchar(200),
	problema varchar(50),
	indicador_admissao varchar(50),
	categoria varchar(50)
)

create table procedimentos(
	financiamento integer,
	terminologia varchar(50),
	versao varchar(200),
	procedimento integer,
	quantidade integer,
	data_realizacao date,
	autorizacao integer,
	cbo integer,
	cns integer,
	estabelecimento_terceiro integer,
	equipe_terceira integer
)