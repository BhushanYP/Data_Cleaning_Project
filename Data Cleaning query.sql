create table hb_layoff
Like hotel_bookings;

select * from hb_layoff;

insert hb_layoff
select * from hotel_bookings;

-- finding dublicates

select *,row_number() over(
partition by hotel,	is_canceled,	lead_time,	arrival_date_year,	arrival_date_month,	arrival_date_week_number,	arrival_date_day_of_month,	stays_in_weekend_nights,	stays_in_week_nights,	adults,	children,	babies,	meal,	country,	market_segment,	distribution_channel,	is_repeated_guest,	previous_cancellations,	previous_bookings_not_canceled,	reserved_room_type,	assigned_room_type,	booking_changes,	deposit_type,	agent,	company,	days_in_waiting_list,	customer_type,	adr,	required_car_parking_spaces,	total_of_special_requests,	reservation_status,	reservation_status_date)as Cust_ID
From hb_layoff;

CREATE TABLE `hb_layoff2` (
  `hotel` text,
  `is_canceled` int DEFAULT NULL,
  `lead_time` int DEFAULT NULL,
  `arrival_date_year` int DEFAULT NULL,
  `arrival_date_month` text,
  `arrival_date_week_number` int DEFAULT NULL,
  `arrival_date_day_of_month` int DEFAULT NULL,
  `stays_in_weekend_nights` int DEFAULT NULL,
  `stays_in_week_nights` int DEFAULT NULL,
  `adults` int DEFAULT NULL,
  `children` int DEFAULT NULL,
  `babies` int DEFAULT NULL,
  `meal` text,
  `country` text,
  `market_segment` text,
  `distribution_channel` text,
  `is_repeated_guest` int DEFAULT NULL,
  `previous_cancellations` int DEFAULT NULL,
  `previous_bookings_not_canceled` int DEFAULT NULL,
  `reserved_room_type` text,
  `assigned_room_type` text,
  `booking_changes` int DEFAULT NULL,
  `deposit_type` text,
  `agent` text,
  `company` text,
  `days_in_waiting_list` int DEFAULT NULL,
  `customer_type` text,
  `adr` int DEFAULT NULL,
  `required_car_parking_spaces` int DEFAULT NULL,
  `total_of_special_requests` int DEFAULT NULL,
  `reservation_status` text,
  `reservation_status_date` text,
  `Cust_Id` int
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


select * from hb_layoff2;

insert into hb_layoff2
select *,row_number() over(
partition by hotel,	is_canceled,	lead_time,	arrival_date_year,	arrival_date_month,	arrival_date_week_number,	arrival_date_day_of_month,	stays_in_weekend_nights,	stays_in_week_nights,	adults,	children,	babies,	meal,	country,	market_segment,	distribution_channel,	is_repeated_guest,	previous_cancellations,	previous_bookings_not_canceled,	reserved_room_type,	assigned_room_type,	booking_changes,	deposit_type,	agent,	company,	days_in_waiting_list,	customer_type,	adr,	required_car_parking_spaces,	total_of_special_requests,	reservation_status,	reservation_status_date)as Cust_ID
From hb_layoff;

select * from hb_layoff2
where Cust_Id > 1;

delete from hb_layoff2
where Cust_Id > 1;

select * from hb_layoff2;

-- standadizing data

select distinct hotel
from hb_layoff2
order by 1;

select `reservation_status_date`,
str_to_date(`reservation_status_date`,'%d-%m-%y')
from hb_layoff2;

update hb_layoff2
set `reservation_status_date` = str_to_date(`reservation_status_date`,'%d-%m-%y');

alter table hb_layoff2
modify column `reservation_status_date` date;

-- finding null values

select * from hb_layoff2
where agent is null
and  company is null;

delete from hb_layoff2
where agent is null
and  company is null;

alter table hb_layoff2
drop column Cust_Id;

alter table hb_layoff2
drop column company;

select * from hb_layoff2;