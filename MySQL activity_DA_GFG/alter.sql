use shopmart;

select * from inventory;

alter table inventory add new_column_4 INT;
alter table inventory modify new_column_4 VARCHAR(10);

alter table inventory rename column new_column_4 to new_column_5;

alter table inventory drop column new_column_5;

rename table inventory to inventories;

select * from inventories;