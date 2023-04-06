with
    source as (
        select * from {{source('med_clm_src', 'claim_master')}}
    ),
    staged as (
        select claim_id, submission_date, gross, patientshare, net, vat from source
    )
select * from staged
