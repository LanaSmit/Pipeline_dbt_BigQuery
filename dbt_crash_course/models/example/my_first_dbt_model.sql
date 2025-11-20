
/*
    Welcome to your first dbt model!
    Did you know that you can also configure models directly within SQL files?
    This will override configurations stated in dbt_project.yml

    Try changing "table" to "view" below
*/

{{ config(materialized='table') }}

with source_data as (

<<<<<<< HEAD
        select 1 as id, 'a' as first_name
        union all
        select 2 as id, 'b' as first_name

=======
    select 1 as id
    union all
    select null as id
>>>>>>> aa8cd2a06d4d351f3364c40aefe4935a53bf2351

)

select *
from source_data

/*
    Uncomment the line below to remove records with null `id` values
*/

-- where id is not null
