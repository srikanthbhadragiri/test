with
    source as (
        select * from {{source('med_clm_src', 'claim_diagnosis')}}
    ),
    staged as (
        select claim_id, count(diagnosis_code) total_diagnosis
        from source
        group by claim_id
    )
select * from staged
