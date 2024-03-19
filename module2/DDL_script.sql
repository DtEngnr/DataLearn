CREATE TABLE geography
(
 geo_id      serial NOT null primary KEY,
 country     varchar(13) NOT NULL,
 city        varchar(17) NOT NULL,
 "state"       varchar(20) NOT NULL,
 postal_code integer,
 region      varchar(7) NOT NULL

); 

insert into geography(country, city, state, postal_code, region)
select distinct on (country, city, state, postal_code, region) 
country, city, state, postal_code, region 
from orders;
 
CREATE TABLE calendar
(
 order_date date NOT null,
 ship_date  date NOT null,
 year       integer NOT NULL,
 quarter    varchar(5) NOT NULL,
 month      integer NOT NULL,
 week       integer NOT NULL,
 week_day   integer NOT null,
 primary key(order_date, ship_date)
);

insert into calendar 
SELECT 
  order_date, ship_date,
  EXTRACT(year FROM order_date) AS year,
  EXTRACT(quarter FROM order_date) AS quarter,
  EXTRACT(month FROM order_date) AS month,
  EXTRACT(week FROM order_date) AS week,
  EXTRACT(dow FROM order_date) AS week_day 
from (select distinct on(order_date, ship_date) order_date, ship_date from orders) s;


CREATE TABLE customer
(
 customer_id   serial NOT null primary KEY,
 customer_name varchar(100) NOT NULL,
 segment       varchar(50) NOT NULL

);

insert into customer(customer_name, segment)
select distinct on (customer_name, segment) customer_name, segment  
from orders;

CREATE TABLE product
(
 product_id   serial NOT null primary key,
 category     varchar(15) NOT NULL,
 "sub-category" varchar(11) NOT NULL,
 product_name varchar(127) NOT NULL

);

insert into product(category, "sub-category", product_name) 
select 
  distinct on (product_name)
  category,
  subcategory,
  product_name
from orders;

CREATE TABLE shipping
(
 ship_id   serial NOT null primary key,
 ship_mode varchar(14) NOT NULL

);

insert into shipping(ship_mode) 
select distinct ship_mode from orders ;

CREATE TABLE sales
(
 row_id      integer NOT null primary key,
 order_id    varchar(14) NOT NULL,
 sales       numeric(9,4) NOT NULL,
 quantity    integer NOT NULL,
 discount    numeric(4,2) NOT NULL,
 profit      numeric(21,16) NOT NULL,
 returned    varchar(4) NOT NULL,
 geo_id      serial NOT NULL,
 ship_id     serial NOT NULL,
 order_date  date NOT NULL,
 ship_date   date NOT NULL,
 product_id  serial NOT NULL,
 customer_id serial NOT null,
 foreign key (geo_id) references geography (geo_id),
 foreign key (ship_id) references shipping (ship_id),
 foreign key (order_date, ship_date) references calendar (order_date, ship_date),
 foreign key (product_id) references product (product_id),
 foreign key (customer_id) references customer (customer_id)

);

update orders set postal_code = 00000 where postal_code isnull;
update geography  set postal_code = 00000 where postal_code isnull;

insert into sales 
select 
	row_number() over(order by order_date) as row_id, order_id, sales, quantity, discount, profit, 
	coalesce(returned,'No') returned, geo_id, ship_id, order_date, ship_date, p.product_id, c.customer_id
from orders o
	left join (select distinct * from returns) r using(order_id)
	inner join geography g on 
	o.country = g.country and o.city = g.city and o.state = g.state and o.postal_code = g.postal_code and o.region = g.region
	inner join shipping using(ship_mode)
	inner join product p using(product_name)
	inner join customer c using(customer_name);

  
CREATE INDEX FK_1 ON sales
(
 order_date,
 ship_date
);

CREATE INDEX FK_2 ON sales
(
 ship_id
);

CREATE INDEX FK_3 ON sales
(
 geo_id
);

CREATE INDEX FK_4 ON sales
(
 customer_id
);

CREATE INDEX FK_5 ON sales
(
 product_id
);
