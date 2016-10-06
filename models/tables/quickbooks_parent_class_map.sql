with classes as (

  select * from {{ ref('quickbooks_classes') }}

), d1 as (

  select
    c1.id as c1_id,
    c2.id as c2_id,
    c3.id as c3_id,
    c4.id as c4_id,
    c5.id as c5_id
  from classes c1
    left outer join classes c2 on c1.id = c2.parent_class_id
    left outer join classes c3 on c2.id = c3.parent_class_id
    left outer join classes c4 on c3.id = c4.parent_class_id
    left outer join classes c5 on c4.id = c5.parent_class_id
  where c1.parent_class_id is null

), d2 as (

  select
    c1_id as top_level_class_id,
    c1_id as class_id
  from d1

  union all

  select
    c1_id as top_level_class_id,
    c2_id as class_id
  from d1

  union all

  select
    c1_id as top_level_class_id,
    c3_id as class_id
  from d1

  union all

  select
    c1_id as top_level_class_id,
    c4_id as class_id
  from d1

  union all

  select
    c1_id as top_level_class_id,
    c5_id as class_id
  from d1

),

pivoted as (

    select distinct class_id, top_level_class_id
    from d2
    where class_id is not null

)

select class_id, top_level_class_id, c1.name as class_name, c2.name as top_level_class_name
from pivoted
join classes c1 on c1.id = class_id
join classes c2 on c2.id = top_level_class_id
