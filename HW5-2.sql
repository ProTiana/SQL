create table Analysis (
id int AUTO_INCREMENT PRIMARY KEY,
name varchar (40),
cost float,
price float,
group_id int
);

insert into analysis (name, cost, price, group_id)
value
('total', 1500, 2690, 1),
('hormones', 2500, 6790,3),
('vitamins', 3000, 5990, 2),
('microflora', 2460, 5980, 1),
('viruses', 1200, 2490, 1),
('imunitet', 1990, 5500, 2);

/*Есть таблица групп анализов Groups:
gr_id — ID группы;
gr_name — название группы;
gr_temp — температурный режим хранения.*/

create table Group_analysis (
gr_id int AUTO_INCREMENT PRIMARY KEY,
gr_name varchar (40),
gr_temp float
);

insert into group_analysis (gr_name, gr_temp)
value
('total_gr', 15.5),
('vitamin_gr', 36.0),
('hormon_gr', 36.6);

/*Есть таблица заказов Orders:
ord_id — ID заказа;
ord_datetime — дата и время заказа;
ord_an — ID анализ*/

drop table if exists orders_analisis;

create table orders_analisis (
ord_id int AUTO_INCREMENT PRIMARY KEY,
ord_datetime datetime,
ord_an int
);

insert into orders_analisis (ord_datetime, ord_an)
value
('2022-02-3 10:40:00', 1),
('2021-02-1 14:10:00', 2),
('2020-02-4 12:00:00', 3),
('2020-02-5 15:00:00', 4),
('2020-02-5 10:00:00', 5),
('2023-02-7 20:58:00', 6),
('2020-02-10 12:00:00', 7),
('2020-02-13 11:00:00', 8),
('2021-03-15 19:03:00', 9),
('2022-03-6 13:12:00', 10),
('2022-02-24 10:11:00', 11),
('2020-03-27 11:17:00', 12),
('2023-01-11 17:15:00', 13),
('2021-12-12 16:30:00', 14),
('2021-09-9 07:25:00', 15);

-- Вывести название и цену для всех анализов, которые продавались 5 февраля 2020 и всю следующую неделю.
drop view if exists order_price;
create view order_price as
Select id, price from analysis join orders_analisis on analysis.id = orders_analisis.ord_an and
 ord_datetime between '2020-02-5' and '2020-02-12';



