create table shop.categories (
  id serial primary key,
  parent_id int references categories (id),
  category_name varchar not null,
  category_image bytea
);


create table shop.products(
id serial primary key,
product_name varchar not null,
product_desc text,
category_id int references categories (id),
price int,
image_1 bytea,
image_2 bytea,
image_3 bytea,
image_4 bytea
);

create table shop.orders(
id serial primary key,
order_amount int,
user_name varchar not null,
user_surname varchar not null,
user_country varchar not null,
user_city varchar not null,
user_postal_code varchar not null,
user_address varchar not null,
user_phone varchar not null,
user_email varchar not null,
order_status varchar not null,
order_text_note text
);

create table shop.order_detail(
id serial primary key,
order_id int references orders (id),
product_id int references products (id),
price int,
quantity int
);

INSERT INTO shop.categories
(id, parent_id, category_name, category_image)
VALUES(1, null, 'Motori', null),
(2, null, 'Automobili', null),
(3, null, 'Nautika', null),
(4, 1, 'Yamaha', null),
(5, 1, 'Honda', null),
(6, 2, 'Mercedes', null),
(7, 2, 'Ferrari', null),
(8, 2, 'BMW', null),
(9, 3, 'Bayliner', null),
(10, 3, 'Seadoo', null),
(11, 3, 'Mercury', null),
(12, 3, 'Catepillar', null);

INSERT INTO shop.products
(id, product_name, product_desc, category_id, price, image_1, image_2, image_3, image_4)
VALUES(1, 'Stiker za motor Yamaha', 'Opis stikera za motor Yamaha', 4, 1254, null, null, null, null),
(2, 'Stiker za motor Honda', 'Opis stikera za motor Honda', 5, 2454, null, null, null, null),
(3, 'Stiker za automobil Mercedes', 'Opis stikera za automobil Mercedes', 6, 4255, null, null, null, null),
(4, 'Stiker za automobil Ferrari', 'Opis stikera za automobil Ferrari', 7, 2365, null, null, null, null),
(5, 'Stiker za automobil BMW', 'Opis stikera za automobil BMW', 8, 7653, null, null, null, null),
(6, 'Stiker za nautiku Bayliner', 'Opis stikera za nautiku Bayliner', 9, 2453, null, null, null, null),
(7, 'Stiker za nautiku Seadoo', 'Opis stikera za nautiku Seadoo', 10, 7674, null, null, null, null),
(8, 'Stiker za nautiku Mercury', 'Opis stikera za nautiku Mercury', 11, 5677, null, null, null, null),
(9, 'Stiker za nautiku Catepillar', 'Opis stikera za nautiku Catepillar', 12, 9088, null, null, null, null);


select * from shop.categories where parent_id is null ;

select * from shop.categories where parent_id = 1;

select * from shop.products where category_id = 10;

select * from shop.products where product_name ilike '%Moto%';

select * from shop.products where product_name ilike '%Moto%' and category_id = 4;


CREATE TABLE shop.users (
                            user_id serial,
                            username varchar NOT NULL,
                            password varchar NOT NULL,
                            lastname varchar NULL,
                            firstname varchar NOT NULL,
                            CONSTRAINT user_id_pkey PRIMARY KEY (user_id),
                            CONSTRAINT user_username_uniq UNIQUE (username)
);

select * from shop.users;

insert into shop.users(username, password, lastname, firstname) values ('test', MD5('test'), 'Cvjetkovic', 'Vladimir');
