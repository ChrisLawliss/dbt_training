with ranked as (
  select 
    *,
    dense_rank() over (
      partition by customer_id
      order by order_id
    ) as order_num
from {{ref('fct_order_items')}}
)

select 
  customer_id,
{% for order in [1,2,3] %}
sum(
    case when order_num = {{order}}
    then price
    else 0
    end
) as order_{{order}}_total
{{ "," if not loop.last }}
{% endfor %}
  
  from ranked
  group by 1