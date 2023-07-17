use secondDB;
drop table if exists cars;
create table cars (
id INT AUTO_INCREMENT PRIMARY KEY,
	model VARCHAR(50) NOT NULL,
	price INT
    );
    
    insert into cars (model, price)
    values
 ('Audi', 52642),
 ('Mercedes', 57127),
 ('Skoda', 9000),
 ('Volvo', 29000),
 ('Bentley', 350000),
 ('Citroen', 21000),
 ('Hummer', 41400),
 ('Volkswagen', 21600);
 
-- Создайте представление, в которое попадут автомобили стоимостью  до 25 000 долларов
drop view if exists chipcars;
create view chipcars as
select * from cars
where price < 25000;

/* Изменить в существующем представлении порог для стоимости: пусть цена
 будет до 30 000 долларов (используя оператор ALTER VIEW)*/
alter view chipcars as
select * from cars
where price <30000;

-- Создайте представление, в котором будут только автомобили марки “Шкода” и “Ауди”
drop view if exists AudiAndSkoda;

create view AudiAndSkoda as
select * from cars
where model like 'audi';

alter view AudiAndSkoda as
select * from cars
where model like 'skoda' or model like 'audi';





