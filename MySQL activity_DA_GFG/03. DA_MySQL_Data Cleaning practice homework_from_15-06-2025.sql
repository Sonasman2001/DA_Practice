use swiggy;
select * from restaurants;

select link, name, city, rating, rating_count, cuisine, cost from restaurants;

select substring_index(link, '/',-1) as id, link, name, city, rating, rating_count, cuisine, cost from restaurants;


select substring_index(substring_index(link, '/',-1), '-',-1) as id,
		name, city, rating, rating_count, cuisine, cost from restaurants;


create table if not exists rest_1 as 
				( select substring_index(substring_index(link, '/',-1), '-',-1) as id, name, city, rating, 
						rating_count, cuisine, cost from restaurants );
select * from rest_1;


create table if not exists rest_2 as 
				( select id, lower(trim(name)) as name, city, rating, rating_count, cuisine, cost from rest_1 );
select * from rest_2;


create table if not exists rest_3 as 
				( select id, lower(trim(name)) as name, lower(city) as 'city', rating, rating_count,
						lower(cuisine) as 'cuisine', cost from rest_2 );
select * from rest_3;


create table if not exists clean as 
				( select * from rest_3 where cuisine not in ('combo', 'na','
						discount offer from garden cafe express kankurgachi',
                        'svanidhi street food vendor', 'tex-mex', 'special discount from (hotel swagath)', 
                        'free delivery ! limited stocks!'));
select * from clean;


drop table if exists rest_1, rest_2, rest_3;
