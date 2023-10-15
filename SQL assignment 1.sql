create database brands
use brands

create table items_table(
item_id int primary key, 
item_discription varchar(50) not null,
vendor_nos bigint, 
vendor_name varchar(50) not null,
bottle_size bigint ,
bottle_price float
);

drop table items_table
create table product_table(
product_id int,
country varchar (50) not null,
product varchar(50) not null,
units_sold bigint,
manufatcuring_price float,
sales_price float,
gross_sales bigint,
sales bigint,
cogs bigint,
profit bigint,
date int,
month_number int,
month_name varchar(50) not null,
year int
);

insert into items_table 
(
item_id,item_discription,
vendor_nos,vendor_name,
bottle_size,bottle_price )
values (1,'travis hasse apple pie',305,'mhw ltd',705,$9.77),
(2,'daristi xtabentun',391,'anchor distilling(preiss imports)',750,$14.12),
(3,'hiram walker peach brandy',370,'pernod ricard usa/austin nichols',1000,$6.50),
(4,'oak cross whisky',305,'mhw ltd',750,$25.33),
(5,'uv red(cherry)vodka',380,'phillips beverage company',200,$1.97),
(6,'heaven hill old style white label',259,'heaven hill distilleries inc.',750,$6.37),
(7,'Hyde Herbal Liqueur',194,'Fire Tail Brands Llc',750,$5.06 ),
(8,'Dupont Calvados Fine Reserve',403,'Robert Kacher Selections',750,$23.61 );

insert into product_table
(product_id,country,product,units_sold,
manufatcuring_price,sales_price,gross_sales,
sales,cogs,profit,date,month_number,month_name,year)
values(1,'Canada','Carretera',1618.5 , $3.00, $20.00, $32370.00, $32370.00, $16185.00, $16185.00,01-01-2014, 1,' January ',2014),
(2,'Germany',' Carretera ',1321, $3.00, $20.00, $26420.00, $26420.00, $13210.00, $13210.00,01-01-2014,1,' January',2015),
(3,'France',' Carretera',2178, $3.00, $15.00,  $32670.00, $32670.00, $21780.00, $10890.00,01-06-2014,6,' June',2016),
(4,'Germany',' Carretera',888, $3.00 , $3.00, $13320.00, $13320.00, $8880.00, $4440.00,01-06-2014,6,' June',2017),
(5,'Mexico'	,' Carretera' ,	2470,	 $3.00 , $15.00,  $37050.00,  $37050.00, $24700.00 ,$12350.00 ,	01-06-2014,	6,'June',2018),
(6,'Germany',' Carretera', 	1513,	 $3.00 ,	 $350.00 , $529550.00,  $529550.00, $393380.00 ,$136170.00,	01-12-2014,	12,' December', 2019),
(7,'Germany',' Montana',    921,     $5.00 ,    $15.00,  $13815.00,  $13815.00,  $9210.00,	$4605.00, 01-03-2014, 3,'March',2020),
(8,'Canada','Montana',    2518,      $5.00,    $12.00, 	$30216.00 , $30216.00,	 $7554.00, 	 $22662.00, 01-06-2014,	6,'June',2021);

select * from items_table
select * from product_table

begin tran
delete from product_table where Units_Sold=1618
delete from product_table where units_sold=888
delete from product_table where units_sold=2470
--commit/rollback

select * from product_table

drop table product_table;

create table product_table(
product_id int,
country varchar (50) not null,
product varchar(50) not null,
units_sold bigint,
manufatcuring_price float,
sales_price float,
gross_sales bigint,
sales bigint,
cogs bigint,
profit bigint,
date int,
month_number int,
month_name varchar(50) not null,
year int
);
insert into product_table						
(product_id,country,product,units_sold,						
manufatcuring_price,sales_price,gross_sales,						
sales,cogs,profit,date,month_number,month_name,year)						
values(1,'Canada','Carretera',1618.5 , $3.00, $20.00, $32370.00, $32370.00, $16185.00, $16185.00,01-01-2014, 1,' January ',2014),						
(2,'Germany',' Carretera ',1321, $3.00, $20.00, $26420.00, $26420.00, $13210.00, $13210.00,01-01-2014,1,' January',2015),						
(3,'France',' Carretera',2178, $3.00, $15.00,  $32670.00, $32670.00, $21780.00, $10890.00,01-06-2014,6,' June',2016),						
(4,'Germany',' Carretera',888, $3.00 , $3.00, $13320.00, $13320.00, $8880.00, $4440.00,01-06-2014,6,' June',2017),						
(5,'Mexico'	,' Carretera' ,	2470,	 $3.00 , $15.00,  $37050.00,  $37050.00, $24700.00 ,$12350.00 ,	01-06-2014,	6,'June',2018),	
(6,'Germany',' Carretera', 	1513,	 $3.00 ,	 $350.00 , $529550.00,  $529550.00, $393380.00 ,$136170.00,	01-12-2014,	12,' December', 2019),	
(7,'Germany',' Montana',    921,     $5.00 ,    $15.00,  $13815.00,  $13815.00,  $9210.00,	$4605.00, 01-03-2014, 3,'March',2020),					
(8,'Canada','Montana',    2518,      $5.00,    $12.00, 	$30216.00 , $30216.00,	 $7554.00, 	 $22662.00, 01-06-2014,	6,'June',2021);	
select *from product_table

select  sum(sales_price) as sales_price
from product_table
select sum(gross_sales) as gross_sales
from product_table

select * from product_table where sales=(select max(sales) from product_table);
select * from product_table where sales=37050.00;
select * from product_table where profit=$ 4605 
select * from product_table where profit=$ 22662.00
select * from product_table where sales=$24700.00

select * from items_table where bottle_size=750
select * from items_table where vendor_nos=305
select * from items_table where vendor_nos=380
select * from items_table where vendor_nos=391
select sum(bottle_price) as bottle_price 
from items_table
select * from items_table
where bottle_price=$5.06


--inner join
select items_table.item_id,items_table.item_discription,items_table.vendor_nos,items_table.vendor_name,items_table.bottle_size,items_table.bottle_price,
product_table.product_id,product_table.country,product_table.product,product_table.units_sold,product_table.manufatcuring_price,product_table.sales_price,
product_table.gross_sales,product_table.sales,product_table.cogs,product_table.profit,product_table.date,product_table.month_number,product_table.month_name,
product_table.year
from items_table
inner join product_table
on items_table.item_id=product_table.product_id;


select it.item_id,it.item_discription,it.vendor_nos,
pt.product_id,pt.country,pt.product,
pt.gross_sales,pt.sales,pt.profit,pt.month_number
from items_table as it
inner join product_table as pt
on it.item_id=pt.product_id;

--full outer join
select it.item_id,it.item_discription,it.vendor_nos,
pt.product_id,pt.country,pt.product,
pt.gross_sales,pt.sales,pt.profit,pt.month_number
from items_table as it
full outer join product_table as pt
on it.item_id=pt.product_id;

--right join
select it.item_id,it.item_discription,it.vendor_nos,
pt.product_id,pt.country,pt.product,
pt.gross_sales,pt.sales,pt.profit,pt.month_number
from items_table as it
right join product_table as pt
on it.item_id=pt.product_id;

--left join
select it.item_id,it.item_discription,it.vendor_nos,
pt.product_id,pt.country,pt.product,
pt.gross_sales,pt.sales,pt.profit,pt.month_number
from items_table as it
left join product_table as pt
on it.item_id=pt.product_id;

--cross join
select * from items_table
cross join product_table

--Find the item_description and Product having the gross sales of 13,320.00
select * from items_table where item_discription=13320.00--( doubt)

select * from product_table where gross_sales=13320.00


SELECT * FROM items_table
select 
   SUBSTRING(item_discription,1,CHARINDEX(' ',item_discription)-1) as item_desc1 ,
   SUBSTRING(item_discription,CHARINDEX(' ',item_discription)+1,len(item_discription)) as item_desc2
from items_table
----------------------------------------------------------------------------------------



















 

 
 
 
 
 


 



 


 
 

 






 



 
 






 


 
 




















