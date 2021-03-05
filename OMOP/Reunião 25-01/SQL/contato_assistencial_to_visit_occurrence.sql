
INSERT INTO visit_occurrence
(
    visit_occurrence_id,
    person_id,
    visit_concept_id,
    visit_start_date,
    visit_start_datetime,
    visit_end_date,
    visit_end_datetime,
    visit_type_concept_id,
    provider_id,
    care_site_id,
    visit_source_value,
    visit_source_concept_id,
    admitting_source_concept_id,
    admitting_source_value,
    discharge_to_concept_id,
    discharge_to_source_value,
    preceding_visit_occurrence_id
)
SELECT
 -- [!WARNING!] no source column found. See possible comment at the INSERT INTO
    NULL AS visit_occurrence_id,

    contato_assistencial.seq_pessoa AS person_id,

    contato_assistencial.modalidade AS visit_concept_id,

    contato_assistencial.data_admissao AS visit_start_date,

    contato_assistencial.data_admissao AS visit_start_datetime,

    contato_assistencial.data_desfecho AS visit_end_date,

    contato_assistencial.data_desfecho AS visit_end_datetime,

 -- [!WARNING!] no source column found. See possible comment at the INSERT INTO
    NULL AS visit_type_concept_id,

 -- [!WARNING!] no source column found. See possible comment at the INSERT INTO
    NULL AS provider_id,

    contato_assistencial.estabelecimento_saude AS care_site_id,

    contato_assistencial.dados_admissao AS visit_source_value,

 -- [!WARNING!] no source column found. See possible comment at the INSERT INTO
    NULL AS visit_source_concept_id,

    contato_assistencial.procedencia AS admitting_source_concept_id,

    contato_assistencial.procedencia AS admitting_source_value,

    contato_assistencial.motivo_desfecho AS discharge_to_concept_id,

    contato_assistencial.dados_desfecho AS discharge_to_source_value,

 -- [!WARNING!] no source column found. See possible comment at the INSERT INTO
    NULL AS preceding_visit_occurrence_id

FROM contato_assistencial
;