
INSERT INTO procedure_occurrence
(
    procedure_occurrence_id,
    person_id,
    procedure_concept_id,
    procedure_date,
    procedure_datetime,
    procedure_type_concept_id,
    procedure_type_concept_id, -- [!#WARNING!#] THIS TARGET FIELD WAS ALREADY USED
    modifier_concept_id,
    quantity,
    provider_id,
    provider_id, -- [!#WARNING!#] THIS TARGET FIELD WAS ALREADY USED
    visit_occurrence_id,
    visit_detail_id,
    procedure_source_value,
    procedure_source_concept_id,
    modifier_source_value
)
SELECT
 -- [!WARNING!] no source column found. See possible comment at the INSERT INTO
    NULL AS procedure_occurrence_id,

 -- [!WARNING!] no source column found. See possible comment at the INSERT INTO
    NULL AS person_id,

    procedimentos.procedimento AS procedure_concept_id,

    procedimentos.data_realizacao AS procedure_date,

    procedimentos.data_realizacao AS procedure_datetime,

    procedimentos.terminologia AS procedure_type_concept_id,

    procedimentos.versao AS procedure_type_concept_id,

 -- [!WARNING!] no source column found. See possible comment at the INSERT INTO
    NULL AS modifier_concept_id,

    procedimentos.quantidade AS quantity,

    procedimentos.cbo AS provider_id,

    procedimentos.cns AS provider_id,

 -- [!WARNING!] no source column found. See possible comment at the INSERT INTO
    NULL AS visit_occurrence_id,

 -- [!WARNING!] no source column found. See possible comment at the INSERT INTO
    NULL AS visit_detail_id,

 -- [!WARNING!] no source column found. See possible comment at the INSERT INTO
    NULL AS procedure_source_value,

 -- [!WARNING!] no source column found. See possible comment at the INSERT INTO
    NULL AS procedure_source_concept_id,

 -- [!WARNING!] no source column found. See possible comment at the INSERT INTO
    NULL AS modifier_source_value

FROM procedimentos
;