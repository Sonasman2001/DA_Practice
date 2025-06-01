use products;

select * from data;

select product_name as "Product Name",
       brand_name as "Brand Name",
       marked_price as "Marked Price",
       discounted_price as "Discounted Price",
       marked_price - discounted_price as "Discounted Amount",
       round(((marked_price - discounted_price)/marked_price)*100,2) as "Discounted Percentage"
from data;


select * from data;
select count(*) from data;


select count(distinct brand_name) as "Unique Brand Names",
	count(distinct brand_tag) as "Unique Brand Tags"
from data;


select count(distinct brand_name), 
	count(distinct product_link) 
from data;

select * from data;
select * from data where brand_name = 'Biba';

select distinct product_tag from data where brand_name = 'Biba';

create table products.dataset as

select sum(rating_count) from data
		where brand_name = 'Biba' and product_tag = 'dupatta'
			order by rating_count desc
				limit 50;

select sum(rating_count*discounted_price)*20 from data;


