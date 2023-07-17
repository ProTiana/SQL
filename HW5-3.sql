use secondDB;

create table trains_shed (
train_id int,
station varchar(40),
station_time time
);

insert into trains_shed (train_id, station, station_time)
value
(110, 'San Francisco', '10:00:00'),
(110, 'Redwood City', '10:54:00'),
(110, 'Palo Aito', '11:02:00'),
(110, 'San Jose', '12:35:00'),
(120, 'San Francisco', '11:00:00'),
(120, 'Palo Aito', '12:49:00'),
(120, 'San Jose', '13:30:00');


SELECT *,
LEAD(station_time, 1, 'end') OVER (PARTITION BY train_id ORDER BY station_time) as 'next_station_time'
from trains_shed;

select subtime (
LEAD(station_time, 1, 'end') OVER (PARTITION BY train_id ORDER BY station_time),
 station_time)
 as 'diff_station_time'
 from  trains_shed;


