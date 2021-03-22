---PROBLEMA DIAGNÓSTICO

select 'CID-10' terminologia,
       '2.16.840.1.113883.6.3' versao,
       cid.cod_cid problema,
       'Sim' indicador_admissao,
       'Principal' categoria
  from anamnese 
 inner join cid on
      (anamnese.seq_cid = cid.seq_cid)
 where anamnese.dat_hora_anamnese > sysdate -365

union all

  select 'CID-10' terminologia,
       '2.16.840.1.113883.6.3' versao,
       cid.cod_cid problema,
       'Não' indicador_admissao,
       'Principal' categoria
  from evolucao 
 inner join cid on
      (evolucao.seq_cid = cid.seq_cid)
 where evolucao.dat_hora_evolucao > sysdate -365
