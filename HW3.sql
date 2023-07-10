use seconddb;

create table SALES(
snum int primary key,
sname VARCHAR(45),
city VARCHAR(45),
comm VARCHAR(45)
);

INSERT INTO sales(snum, sname, city, comm)
values
('1001', 'Peel', 'London', '.12'),
('1002', 'Serres', 'San Jose', '.13'),
('1004', 'Motika','London','.11'),
('1007','Rifkin', 'Barcelona', '.15'),
('1003','Axelrod','New York', '.10');

drop table if exists customers;

create table customers(
cnum int primary key,
cname VARCHAR(45),
city VARCHAR(45),
rating int,
snum int
);

INSERT INTO customers(cnum, cname, city, rating, snum)
values
(2001, 'Hoffman','London', 100, 1001),
(2002, 'Giovanni', 'Rome', 200, 1003),
(2003, 'Liu', 'SanJose', 200, 1002),
(2004, 'Grass', 'Berlin', 300, 1002),
(2006, 'Clemens', 'London', 100, 1001),
(2008, 'Cisneros', 'SanJose', 300, 1007),
(2007, 'Pereira', 'Rome', 100, 1004);

drop table if exists orders;

create table orders(
onum int primary key,
amt int,
odate varchar(40),
cnum int,
snum int
);

INSERT INTO orders (onum, amt, odate, cnum, snum)
values
(3001, 18.69,'10/03/1990', 2008, 1007),
(3003, 767.19, '10/03/1990', 2001, 1001),
(3002, 1900.10, '10/03/1990', 2007, 1004),
(3005, 5160.45, '10/03/1990', 2003, 1002),
(3006, 1098.16, '10/03/1990', 2008, 1007),
(3009, 1713.23, '10/04/1990', 2002, 1003),
(3007, 75.75, '10/04/1990', 2004, 1002),
(3008, 4723.00, '10/05/1990', 2006, 1001),
(3010, 1309.95, '10/06/1990', 2004, 1002),
(3011, 9891.88, '10/06/1990', 2006, 1001);

/* 1. Напишите запрос, который вывел бы таблицу со столбцами в следующем порядке: 
city, sname, snum, comm. (к первой или второй таблице, используя SELECT)*/

select city, sname, snum, comm from sales;

/*2. Напишите команду SELECT, которая вывела бы оценку(rating),
 сопровождаемую именем каждого заказчика в городе San Jose. (“заказчики”)*/

select rating, cname
from customers
where city ='SanJose';


/*3. Напишите запрос, который вывел бы значения snum всех продавцов из таблицы заказов
 без каких бы то ни было повторений. (уникальные значения в  “snum“ “Продавцы”)*/

select distinct snum from orders;

/* 4. Напишите запрос, который бы выбирал заказчиков, чьи имена начинаются с буквы G. 
Используется оператор "LIKE": (“заказчики”)
 https://dev.mysql.com/doc/refman/8.0/en/string-comparison-functions.html*/
 
select cname from customers 
where cname like 'g%';

/* 5. Напишите запрос, который может дать вам все заказы со значениями суммы выше чем $1,000. 
(“Заказы”, “amt”  - сумма)*/

select amt from orders
where amt > 1000;

/*6. Напишите запрос который выбрал бы наименьшую сумму заказа.
 (Из поля “amt” - сумма в таблице “Заказы” выбрать наименьшее значение)*/

select min(amt) from orders;

/*Напишите запрос к таблице “Заказчики”, который может показать всех заказчиков, 
у которых рейтинг больше 100 и они находятся не в Риме.*/

select * from customers 
where city  != 'rome' and rating >100;






