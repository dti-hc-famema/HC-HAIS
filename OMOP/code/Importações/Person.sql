select
	seq_pessoa as person_id,
	extract (year from data_nascimento) as year_of_birth,
	extract (month from data_nascimento) as month_of_birth,
	extract (day from data_nascimento) as day_of_birth,
	case when sexo ='MASCULINO' then 8507
              when sexo ='FEMININO' then 8532
         else 8521 end gender_concept_id,
	case when raca = 'PARDO' then 8527
		when raca = 'AMARELO' then 8527
		when raca = 'NEGRA' then 38003598
		when raca = 'BRANCA' then 8527
		when raca = 'INDÍGENA' then 8657
		when raca = 'PRETA' then 38003598
	else 8527 end race_concept_id,
	case when pais_nascimento in ('BRASIL', 'ARGENTINA', 'BOLIVIA', 'CUBA', 'PERU', 'PARAGUAI', 'VENEZUELA', 'EQUADOR') then 38003563
              else 38003564 end ethnicity_concept_id,
    case when sexo ='MASCULINO' then 1
         when sexo ='FEMININO' then 2
    else 3 end gender_source_concept_id,
    sexo as gender_source_value,
    seq_pessoa || ' - ' || nome as person_source_value,
    case when raca = 'PARDO' then 3
		when raca = 'AMARELO' then 5
		when raca = 'NEGRA' then 2
		when raca = 'BRANCA' then 1
		when raca = 'INDÍGENA' then 4
	end race_source_concept_id,
	raca as race_source_value,
	pais_nascimento as ethnicity_source_value
	
from "CMD".individuo i 