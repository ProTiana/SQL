-- Создайте функцию, которая принимает кол-во сек и форматирует их в кол-во дней, часов, минут и секунд.

DELIMITER //
CREATE FUNCTION time_convert(num INT)
RETURNS VARCHAR(50)
DETERMINISTIC
BEGIN
	DECLARE days INT DEFAULT 0;
    DECLARE hours INT DEFAULT 0;
    DECLARE minutes INT DEFAULT 0;
    DECLARE result VARCHAR(50) DEFAULT ' ';
	set days = floor(num/86400);
    set num = num%86400;
    set hours = floor(num/3600);
    set num = num%3600;
    set minutes = floor(num/60);
    set num = num%60;
	set result = concat(days, 'days', hours, 'hours', minutes, 'minutes', num, 'seconds');
    return result;
    end //
    DELIMITER ;
    
  SELECT time_convert(123458);
  
    -- Выведите только четные числа от 1 до 10 включительно.
-- вариант 1
        
DROP PROCEDURE IF EXISTS get_numbers;

DELIMITER $$
CREATE PROCEDURE even_numbers()
BEGIN
    DECLARE x INT DEFAULT 1;
    DECLARE even VARCHAR(45) DEFAULT '';
    WHILE x <= 10 DO
        IF x % 2 = 0 THEN
            IF even = '' THEN
                SET even = x;
            ELSE
                SET even = CONCAT(even, ',', x);
            END IF;
        END IF;
        SET x = x + 1;
    END WHILE;
    SELECT even;
END $$
DELIMITER ;

CALL even_numbers();   
    
  -- вариант 2  
   DROP PROCEDURE IF EXISTS get_even_numers;
    
    DELIMITER $$
    CREATE PROCEDURE get_even_numers()
    DETERMINISTIC     
    begin 
    declare num int default 10;
    declare x int default 2;
    declare even varchar(50) default '7';
	IF num < x then 
    set even = 0;
		if num = x then 
			set even = x;
		    if num > x then
				 repeat 
				 set even=concat(x, ',');
				 set x = x+2;
				 until num>x
				 end repeat;
			end if;
		end if;
    end if; 
    select even;
    end $$
    delimiter ;
    
   call get_even_numers(); 
    