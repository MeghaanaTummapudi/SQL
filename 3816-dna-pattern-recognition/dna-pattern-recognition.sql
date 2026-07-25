# Write your MySQL query statement below

select *, 
       (case when lower(dna_sequence) like 'atg%' then 1 else 0 end) as has_start, 
       (case when (lower(dna_sequence) like '%taa') or (lower(dna_sequence) like '%tag') or (lower(dna_sequence) like '%tga') then 1 else 0 end) as has_stop, 
       (case when lower(dna_sequence) like '%atat%' then 1 else 0 end) as has_atat,
       (case when lower(dna_sequence) like '%ggg%' then 1 else 0 end) as has_ggg
from samples
order by sample_id asc