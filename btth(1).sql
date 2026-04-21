create database session5;
use session5;

create table Orders(
   orderID int primary key auto_increment,
   total_amount decimal(18, 2) not null,
   `status` varchar(20),
   note text,
   userID int
);

select orderID, total_amount, `status`, note,
   case 
      when total_amount > 4000000 then 'Nguy Hiểm'
      else 'Bình Thường'
   end as Alert_Level
from Orders
where 
   total_amount between 2000000 and 5000000
   and status <> 'CANCELLED'
and (
   note like '%gấp%'
   or userID is null
)

order by total_amount desc

limit 20 offset 40;