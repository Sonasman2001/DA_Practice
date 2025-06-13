select * from swiggy.restaurants;

-- 1. Which restaurant of abohar is visied by least number of people?
select * from swiggy.restaurants 
	where city = 'Abohar' and rating_count = (
												select min(rating_count) from swiggy.restaurants
														where city = 'Abohar');

-- 2. Which restaurant has generated maximum revenue all over india?
select * from swiggy.restaurants 
	where cost*rating_count = (
									select max(cost*rating_count) from swiggy.restaurants);

-- 3. How many restaurants are having rating more than the average rating?
select * from swiggy.restaurants where rating > (
													select avg(rating) from swiggy.restaurants);

-- 4. Which restaurant of Delhi has generated most revenue?
select * from swiggy.restaurants 
	where city = 'Delhi' and cost*rating_count = (
													select max(cost*rating_count) from swiggy.restaurants 
														where city = 'Delhi');

-- 5. Which restaurant chain has maximum number of restaurants?
select name, count(name) as 'no_of_chains' from swiggy.restaurants
group by name order by count(name) desc limit 10;

-- 6. Which restaurant chain has generated maximum revenue?
select name, sum(rating_count * cost) as 'revenue' from swiggy.restaurants
group by name order by sum(rating_count * cost) desc limit 10;

-- 7. Which city has maximum number of restaurants?
select name, count(*) as 'no_of_restaurants' from swiggy.restaurants
group by name order by count(*) desc limit 10;

-- 8. Which city has generated maximum revenue all over india?
select city, sum(rating_count * cost) as 'revenue' from swiggy.restaurants
group by city order by sum(rating_count * cost) desc limit 10;

-- 9. List 10 least expensive cuisines?
select cuisine, avg(cost) as 'avg_cost' from swiggy.restaurants
group by cuisine order by avg_cost asc limit 10;

-- 10. List 10 most expensive cuisines?
select cuisine, avg(cost) as 'avg_cost' from swiggy.restaurants
group by cuisine order by avg_cost desc limit 10;

-- 11. What is the city is having Biryani as most popular cuisine
select city, avg(cost), count(*) as 'Restaurants' from swiggy.restaurants
	where cuisine = 'Biryani'
	group by city 
	order by Restaurants desc;

-- 12. List top 10 unique restaurants with unique name only thorughout the dataset as per generate maximum revenue (Single restaurant with that name)
select name, sum(rating_count * cost) as 'revenue' from swiggy.restaurants
	group by name having count(name) = 1
    order by revenue desc limit 10;
    

