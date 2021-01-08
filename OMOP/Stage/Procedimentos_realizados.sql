---AMBULATORIO

--anamnese
select '01' financiamento,
       'Tabela SUS' terminologia,
       '2.16.840.1.113883.2.21.1.121' versao,
       procedimento_geral.cod_procedimento procedimento,
       movimento.qtd_procedimento quantidade,
       atendimento.dat_hora_atendimento data_realizacao,
       atendimento.nro_faa autorizacao,
       movimento.cod_cbo cbo,
       sihosp.get_cns_profissional(movimento.seq_pessoa_realiza) cns,
       null estabelecimento_terceiro,
       null equipe_terceira
  from anamnese 
 inner join atendimento on
       (anamnese.seq_atendimento = atendimento.seq_atendimento)
 inner join modalidade_atendimento on
       (atendimento.seq_modalidade_atendimento = modalidade_atendimento.seq_modalidade_atendimento)
 inner join carater_atendimento on
       (atendimento.seq_carater_atendimento = carater_atendimento.seq_carater_atendimento)
 inner join encaminhamento on
       (atendimento.seq_encaminhamento = encaminhamento.seq_encaminhamento)   
 inner join movimento on 
       (atendimento.seq_atendimento = movimento.seq_atendimento)
 inner join procedimento_geral on
       (movimento.seq_procedimento_geral = procedimento_geral.seq_procedimento_geral)
 where exists ( select seq_anamnese 
                  from evolucao 
                 where seq_anamnese = anamnese.seq_anamnese )
   and anamnese.dat_hora_anamnese > sysdate -30 


union all

select '01' financiamento,
       'Tabela SUS' terminologia,
       '2.16.840.1.113883.2.21.1.121' versao,
       procedimento_geral.cod_procedimento procedimento,
       movimento.qtd_procedimento quantidade,
       atendimento.dat_hora_atendimento data_realizacao,
       atendimento.nro_faa autorizacao,
       movimento.cod_cbo cbo,
       sihosp.get_cns_profissional(movimento.seq_pessoa_realiza) cns,
       null estabelecimento_terceiro,
       null equipe_terceira
  from evolucao 
 inner join atendimento on
       (evolucao.seq_atendimento = atendimento.seq_atendimento)
 inner join modalidade_atendimento on
       (atendimento.seq_modalidade_atendimento = modalidade_atendimento.seq_modalidade_atendimento)
 inner join carater_atendimento on
       (atendimento.seq_carater_atendimento = carater_atendimento.seq_carater_atendimento)
 inner join encaminhamento on
       (atendimento.seq_encaminhamento = encaminhamento.seq_encaminhamento)   
 inner join movimento on 
       (atendimento.seq_atendimento = movimento.seq_atendimento)
 inner join procedimento_geral on
       (movimento.seq_procedimento_geral = procedimento_geral.seq_procedimento_geral)
   where evolucao.dat_hora_evolucao > sysdate -30 
   
