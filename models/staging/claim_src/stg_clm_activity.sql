with
    source as (
        select * from {{source('med_clm_src', 'claim_activity')}}
    ),
    staged as (
        select
            claim_id,
            count(activity_id) tot_activities,
            sum(act_net_price * act_quantity) gross
        from 
        group by claim_id
    )
select * from staged
