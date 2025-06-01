select * from data;
# 1. how many brands are associated with us?
select count(distinct brand_name) from data;

# 2. how many tshirts do we have in the database?
select count(*) from data where product_tag = 'tshirts';

# 3. how many tshirts do we have in the database under 2000?
select count(distinct product_link) from data 
	where product_tag = 'tshirts' and discounted_price < 2000;

# 4. how many brands are selling tshirts?
select count(distinct brand_name) from data where product_tag = 'tshirts';

# 5. how many different product categories H&M selling?
select count(distinct product_tag) from data 
	where brand_name = 'H&M';

# 6. list top 5 tshirts of nike
select * from data 
	where product_tag = 'tshirts' and brand_name = 'nike'
    order by rating_count desc
    limit 5;

# 7. list top 5 worse rated products from GUESS
select * from data 
	where brand_name = 'guess' and rating_count > 0
    order by rating_count asc
    limit 5;

# 8. find total products sold by Levis
select sum(rating_count) from data where brand_name = 'levis';

# 9. how many tshirts are sold in total?
select sum(rating_count) from data where product_tag = 'tshirts';

# 10. which product category among tshirts and shirt has generated more revenue?
select sum(rating_count * discounted_price) from data where product_tag = 'tshirts';
select sum(rating_count * discounted_price) from data where product_tag = 'shirts';

# 11. list top 5 best-selling brands
select brand_name, sum(rating_count) as 'product_sold' from data
	group by brand_name
		order by product_sold desc
			limit 5;

# 12. list top 5 best-selling product categories
select product_tag, sum(rating_count) as 'product_categories' from data
	group by product_tag
		order by product_categories desc
			limit 5;

# 13. which brand has sold maximum products?
select brand_name, sum(rating_count * discounted_price) as 'revenue' from data
	group by brand_name
		order by revenue desc
			limit 5;

# 14.  which product_category has generated maximum revenue?
select product_tag, sum(rating_count * discounted_price) as 'revenue' from data
	group by product_tag
		order by revenue desc
			limit 5;

# 15. which category among tshirts & shirts has generated more revenue?
select product_tag, sum(rating_count * discounted_price) as 'revenue'
	from data where product_tag in ('tshirts','shirts')
		group by product_tag
			order by revenue desc;






