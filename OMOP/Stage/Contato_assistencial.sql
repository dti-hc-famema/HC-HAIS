---AMBULATORIO

--anamnese
select '2025507' estabelecimento,
       anamnese.des_historia dados_admissao,
       anamnese.dat_hora_anamnese data_admissao,
       12 procedencia,
       modalidade_atendimento.nom_modalidade_atendimento modalidade_assistencial,
       carater_atendimento.nom_carater_atendimento carater_atendimento,
       encaminhamento.nom_encaminhamento dados_desfecho,
       encaminhamento.nom_encaminhamento motivo_desfecho,
       atendimento.dat_hora_encaminhamento data_desfecho
  from anamnese 
 inner join atendimento on
       (anamnese.seq_atendimento = atendimento.seq_atendimento)
 inner join modalidade_atendimento on
       (atendimento.seq_modalidade_atendimento = modalidade_atendimento.seq_modalidade_atendimento)
 inner join carater_atendimento on
       (atendimento.seq_carater_atendimento = carater_atendimento.seq_carater_atendimento)
 inner join encaminhamento on
       (atendimento.seq_encaminhamento = encaminhamento.seq_encaminhamento)       
 where exists ( select seq_anamnese 
                  from evolucao 
                 where seq_anamnese = anamnese.seq_anamnese )
   and anamnese.dat_hora_anamnese > sysdate -365 

union all

--evolucao
select '2025507' estabelecimento,
       evolucao.des_hipotese_diagnostica dados_admissao,
       evolucao.dat_hora_evolucao data_admissao,
       11 procedencia,
       modalidade_atendimento.nom_modalidade_atendimento modalidade_assistencial,
       carater_atendimento.nom_carater_atendimento carater_atendimento,
       encaminhamento.nom_encaminhamento dados_desfecho,
       encaminhamento.nom_encaminhamento motivo_desfecho,
       atendimento.dat_hora_encaminhamento data_desfecho
  from anamnese 
 inner join evolucao on  
    (evolucao.seq_anamnese = anamnese.seq_anamnese)
 inner join atendimento on
    (evolucao.seq_atendimento = atendimento.seq_atendimento)
 inner join modalidade_atendimento on
    (atendimento.seq_modalidade_atendimento = modalidade_atendimento.seq_modalidade_atendimento) 
 inner join carater_atendimento on
    (atendimento.seq_carater_atendimento = carater_atendimento.seq_carater_atendimento)
 inner join encaminhamento on
    (atendimento.seq_encaminhamento = encaminhamento.seq_encaminhamento) 
 where anamnese.dat_hora_anamnese > sysdate -30    
   and evolucao.des_hipotese_diagnostica is not null