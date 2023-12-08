DROP DATABASE IF EXISTS mcd;
CREATE DATABASE mcd CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

USE mcd;
#客戶資料表
DROP table if exists customers;
CREATE TABLE customers
( 
客戶編號 varchar(5) unique,
客戶帳號 VARCHAR(20) unique ,
登入密碼 VARCHAR(30) not null,
客戶姓名 varchar(10) not null,
客戶地址 VARCHAR(50),
客戶電話 VARCHAR(10),
客戶性別 VARCHAR(2),
客戶生日 date,
信用卡卡號 VARCHAR(16),
 PRIMARY KEY (客戶編號)
);
INSERT INTO customers VALUE("c001","0001","pas0001","一一","桃園市中壢區中山東路路1號","0900000001","女","1996/01/01","1234123412341234");
INSERT INTO customers VALUE("c002","0002","pas0002","二二","桃園市中壢區弘揚路87號","0900000002","女","1996/02/02","2234123412341234");
INSERT INTO customers VALUE("c003","0003","pas0003","三三","桃園市中壢區大仁一街20號","0900000003","女","1996/03/03","3234123412341234");
INSERT INTO customers VALUE("c004","0004","pas0004","四四","桃園市中壢區新生路4號","0900000004","女","1996/04/04","4234123412341234");
INSERT INTO customers VALUE("c005","0005","pas0005","五五","桃園市中壢區新中北路5號","0900000005","女","1996/05/05","5234123412341234");


USE mcd;
#供應商資料表
CREATE TABLE suppliers
(
供應商編號 VARCHAR(5) unique,
供應商名稱 VARCHAR(10) not null,
統一編號 VARCHAR(8) unique,
主要聯絡人 VARCHAR(10),
供應商電話 VARCHAR(11),
供應商地址 varchar(30),
匯款銀行代號 VaRCHAR(3) not null,
匯款帳號 VARCHAR(16) not null,
PRIMARY KEY (供應商編號),
index suppliers(供應商編號)
);
INSERT INTO suppliers VALUE("s001","漢堡皮供應商","00000001","林麵包","03-0000001","桃園市中壢區忠孝路327號","700","1234123412341234");
INSERT INTO suppliers VALUE("s002","蔬菜供應商","00000002","張蔬菜","03-0000002","桃園市中壢區中美路47號","822","2234123412341234");
INSERT INTO suppliers VALUE("s003","薯條供應商","00000003","陳薯條","03-0000003","桃園市中壢區中山東路二段94號","005","3234123412341234");
INSERT INTO suppliers VALUE("s004","飲料供應商","00000004","王可樂","03-0000004","桃園市中壢區福星七街8號","013","4234123412341234");
INSERT INTO suppliers VALUE("s005","醬料供應商","00000005","吳醬料","03-0000005","桃園市中壢區惠州街72號","071","5234123412341234");
INSERT INTO suppliers VALUE("s006","肉類供應商","00000006","羅雞塊","03-0000006","桃園市中壢區中北路5號","020","4564842156215315");
INSERT INTO suppliers VALUE("s007","包裝供應商","00000007","郭包裝","03-0000007","桃園市中壢區普中路11號","033","4461988523746158");

use mcd;
#商品資料表
CREATE TABLE products
(
    商品編號 VARCHAR(4) unique,
    商品名稱 VARCHAR(30),
    進貨價格 VARCHAR(10),
    銷售價格 VARCHAR(10),
    PRIMARY KEY(商品編號),
    index products(商品編號,進貨價格,銷售價格)
);
INSERT INTO products VALUES ('1','麥香雞套餐','45','99');
INSERT INTO products VALUES ('2','BLT安格斯牛肉堡','150','250');
INSERT INTO products VALUES ('3','麥香魚套餐','80','110');
INSERT INTO products VALUES ('4','大麥克套餐','75','120');
INSERT INTO products VALUES ('5','勁辣雞腿堡套餐','95','120');
INSERT INTO products VALUES ('6','6塊麥克雞套餐','100','140');
INSERT INTO products VALUES ('7','12塊麥克雞套餐','100','160');
INSERT INTO products VALUES ('8','2-原味麥脆雞翅套餐','96','135');
INSERT INTO products VALUES ('9','2-辣味麥脆雞翅套餐','100','135');
INSERT INTO products VALUES ('10','2-原味麥脆雞腿套餐','122','175');
INSERT INTO products VALUES ('11','2-辣味麥脆雞腿套餐','120','175');
INSERT INTO products VALUES ('12','雙層牛肉吉士堡套餐','94','120');
INSERT INTO products VALUES ('13','嫩煎雞腿堡套餐','100','160');
INSERT INTO products VALUES ('14','BLT辣脆雞腿堡套餐','165','210');
INSERT INTO products VALUES ('15','BLT嫩煎雞腿堡套餐','200','230');
INSERT INTO products VALUES ('16','蕈菇安格斯牛肉堡套餐','180','220');
INSERT INTO products VALUES ('17','凱撒辣脆雞沙拉套餐','100','150');
INSERT INTO products VALUES ('18','義式烤雞沙拉套餐','90','150');

DROP TABLE IF EXISTS deliveryman;
CREATE TABLE deliveryman(
	外送員編號 VARCHAR(10) NOT NULL UNIQUE,
    外送員姓名 VARCHAR(10) NOT NULL,
    外送員性別 VARCHAR(2),
    外送員手機 VARCHAR(10) NOT NULL UNIQUE,
    身分證 VARCHAR(10) NOT NULL UNIQUE,
    出勤車牌 VARCHAR(8) NOT NULL,
    PRIMARY KEY (外送員編號)
);

INSERT INTO deliveryman VALUES ('AAA123','王吱一','男','0988555566','A788945456','ABC-7899');
INSERT INTO deliveryman VALUES ('AAA456','王吱二','男','0978654135','B789545641','DCF-7556');
INSERT INTO deliveryman VALUES ('AAA789','王吱三','女','0900654567','C122478998','GJH-8787');


use mcd;
#訂單
CREATE TABLE orders
(
    訂單編號 VARCHAR(5) unique,
    客戶編號 VARCHAR(5) NOT NULL,
    商品編號 VARCHAR(5) NOT NULL,
    商品數量 VARCHAR(10) NOT NULL,
    購買日期 DATE,
    付款與否 VARCHAR(1),
    外送員編號 VARCHAR(6),
    PRIMARY KEY(訂單編號),
    FOREIGN KEY (商品編號) REFERENCES mcd.products (商品編號),
    FOREIGN KEY (外送員編號) REFERENCES deliveryman(外送員編號),
	FOREIGN KEY (客戶編號) REFERENCES mcd.customers (客戶編號)
);
INSERT INTO orders VALUE("A001","c001","1",'2',"2022-01-14 09:10:02","是","AAA123");
INSERT INTO orders VALUE("A002","c002","2",'5',"2022-01-14 12:14:12","是","AAA456");
INSERT INTO orders VALUE("A003","c003","3",'14',"2022-01-14 14:07:14","是","AAA789");
INSERT INTO orders VALUE("A004","c004","4",'8',"2022-01-14 14:27:22","是","AAA123");
INSERT INTO orders VALUE("A005","c005","5",'3',"2022-01-14 14:45:03","是","AAA456");
INSERT INTO orders VALUE("A006","c001","6",'6',"2022-01-14 15:55:32","是","AAA789");
INSERT INTO orders VALUE("A007","c002","7",'1',"2022-01-14 16:06:28","是","AAA123");
INSERT INTO orders VALUE("A008","c003","8",'7',"2022-01-14 16:10:02","是","AAA456");
INSERT INTO orders VALUE("A009","c004","9",'5',"2022-01-14 16:11:02","否","AAA789");
INSERT INTO orders VALUE("A010","c005","10",'9',"2022-01-14 16:20:12","否","AAA123");
INSERT INTO orders VALUE("A011","c001","3",'3',"2022-01-14 17:10:02","否","AAA456");
INSERT INTO orders VALUE("A012","c002","6",'2',"2022-01-14 17:12:02","否","AAA789");
INSERT INTO orders VALUE("A013","c003","7",'5',"2022-01-14 17:13:02","否","AAA123");
INSERT INTO orders VALUE("A014","c004","2",'7',"2022-01-14 17:18:02","否","AAA456");
INSERT INTO orders VALUE("A015","c001","1",'8',"2022-01-14 17:25:02","否","AAA789");

DROP TABLE IF EXISTS orderlist;
CREATE TABLE orderlist(
	訂單編號 VARCHAR(10) NOT NULL ,
    客戶編號 varchar(10) NOT NULL,
	外送員編號 VARCHAR(10) NOT NULL,
    外送費用 VARCHAR(10),
	primary key(訂單編號)
);

INSERT INTO orderlist VALUES ('A001','c001','AAA123','');
INSERT INTO orderlist VALUES ('A002','c002','AAA456','');
INSERT INTO orderlist VALUES ('A003','c003','AAA789','');
INSERT INTO orderlist VALUES ('A004','c004','AAA123','');
INSERT INTO orderlist VALUES ('A005','c005','AAA456','');
INSERT INTO orderlist VALUES ('A006','c001','AAA789','');
INSERT INTO orderlist VALUES ('A007','c002','AAA123','');
INSERT INTO orderlist VALUES ('A008','c003','AAA456','');
INSERT INTO orderlist VALUES ('A009','c004','AAA789','');
INSERT INTO orderlist VALUES ('A010','c005','AAA123','');
INSERT INTO orderlist VALUES ('A011','c001','AAA456','');
INSERT INTO orderlist VALUES ('A012','c002','AAA789','');
INSERT INTO orderlist VALUES ('A013','c003','AAA123','');
INSERT INTO orderlist VALUES ('A014','c004','AAA456','');
INSERT INTO orderlist VALUES ('A015','c005','AAA789','');


use mcd;
#進貨單
CREATE TABLE purchase
(
    進貨單編號 VARCHAR(5) unique,
    供應商編號 VARCHAR(5),
    進貨日期 DATE,
    商品編號 VARCHAR(5) NOT NULL,
    商品數量 VARCHAR(5) NOT NULL,
    付款與否 VARCHAR(1),
    PRIMARY KEY(進貨單編號),
    FOREIGN KEY (供應商編號) REFERENCES mcd.suppliers (供應商編號),
	FOREIGN KEY (商品編號) REFERENCES mcd.products (商品編號),
    index purchase(進貨單編號)
);
INSERT INTO purchase VALUE("y001","s001","2020/01/01","1","13","是");
INSERT INTO purchase VALUE("y002","s002","2020/01/20","2","20","否");
INSERT INTO purchase VALUE("y003","s003","2020/02/01","3","36","是");
INSERT INTO purchase VALUE("y004","s004","2020/02/20","4","40","否");
INSERT INTO purchase VALUE("y005","s005","2020/03/01","5","50","否");
INSERT INTO purchase VALUE("y006","s001","2020/03/20","6","69","是");
INSERT INTO purchase VALUE("y007","s002","2020/04/01","7","70","是");
INSERT INTO purchase VALUE("y008","s003","2020/04/20","9","86","是");
INSERT INTO purchase VALUE("y009","s004","2020/05/01","9","90","否");
INSERT INTO purchase VALUE("y010","s005","2020/05/20","10","100","是");
INSERT INTO purchase VALUE("y011","s001","2020/06/01","1","101","是");
INSERT INTO purchase VALUE("y012","s002","2020/06/20","2","90","否");
INSERT INTO purchase VALUE("y013","s003","2020/07/01","3","84","是");
INSERT INTO purchase VALUE("y014","s004","2020/07/20","4","70","是");
INSERT INTO purchase VALUE("y015","s005","2020/08/01","5","67","是");
INSERT INTO purchase VALUE("y016","s001","2020/08/20","6","50","否");
INSERT INTO purchase VALUE("y017","s002","2020/09/01","7","100","是");
INSERT INTO purchase VALUE("y018","s003","2020/09/20","8","100","是");
INSERT INTO purchase VALUE("y019","s004","2020/10/01","9","22","否");
INSERT INTO purchase VALUE("y020","s005","2020/10/20","10","19","是");

use mcd;
#計算進貨成本的view
	DROP VIEW IF EXISTS purchase_view;
    CREATE VIEW purchase_view AS 
    SELECT products.商品編號,products.商品名稱,sum(purchase.商品數量) as 進貨量,(sum(purchase.商品數量)*products.進貨價格) as 進貨總金額
    FROM mcd.products,mcd.purchase
    WHERE (purchase.商品編號=mcd.products.商品編號)
    GROUP BY products.商品編號;
   
 use mcd;  
#計算銷貨金額的view
	DROP VIEW IF EXISTS orders_view;
    CREATE VIEW orders_view AS 
    SELECT products.商品編號,products.商品名稱,sum(orders.商品數量) as 銷貨量,(sum(orders.商品數量)*products.銷售價格) as 銷貨總金額
    FROM mcd.products,mcd.orders
    WHERE (orders.商品編號=mcd.products.商品編號)
    GROUP BY products.商品編號;

use mcd;
#外送單
	DROP VIEW IF EXISTS out_view;
    CREATE VIEW out_view AS
    SELECT orders.訂單編號,orders.客戶編號,customers.客戶地址,products.商品名稱,orders.商品數量 as 購買數量,
    products.銷售價格*orders.商品數量 as 總金額,orders.付款與否,orders.外送員編號
    FROM mcd.orders,mcd.customers,mcd.products
    WHERE(customers.客戶編號=mcd.orders.客戶編號 ) and (products.商品編號=mcd.orders.商品編號)
    GROUP BY orders.商品編號;
   
use mcd;
#熱銷
DROP VIEW IF EXISTS hot_view;
CREATE VIEW hot_view AS
SELECT orders_view.商品名稱 as 最熱銷,MAX(orders_view.銷貨量) as 銷售量
FROM mcd.orders_view;

   
 use mcd;   
#單筆資料總金額
DROP VIEW IF EXISTS untotal_view;
CREATE VIEW untotal_view AS 
SELECT orderlist.訂單編號,orders.商品編號,
(orders.商品數量*products.銷售價格) as 單筆總金額
FROM mcd.products,mcd.orders,mcd.orderlist
WHERE (mcd.orderlist.訂單編號=mcd.orders.訂單編號)
and (mcd.products.商品編號=mcd.orders.商品編號)
GROUP BY orderlist.訂單編號;
select*from untotal_view;

use mcd; 
#計算各項商品利潤
DELIMITER $$
DROP PROCEDURE IF EXISTS profit; $$
CREATE PROCEDURE profit()
BEGIN    

DROP VIEW IF EXISTS profit;
    CREATE VIEW profit AS 
    select products.商品編號,products.商品名稱,((mcd.products.銷售價格-mcd.products.進貨價格)*sum(orders.商品數量)) as 利潤
    from mcd.products,mcd.orders
	WHERE (mcd.orders.商品編號=mcd.products.商品編號)
    group by products.商品編號;

select*from mcd.profit;

END $$
DELIMITER ;

use mcd; 
#計算存貨並列出總表
DELIMITER $$
DROP PROCEDURE IF EXISTS allview; $$
CREATE PROCEDURE allview()
BEGIN    
	DROP VIEW IF EXISTS stock_view;
    CREATE VIEW stock_view AS 
    select products.商品編號,products.商品名稱,(purchase_view.進貨量-orders_view.銷貨量)庫存量
    from mcd.products,mcd.purchase_view,mcd.orders_view
	WHERE (mcd.products.商品編號=mcd.purchase_view.商品編號) and  (mcd.products.商品編號=mcd.orders_view.商品編號)
    group by products.商品編號;

	DROP VIEW IF EXISTS allview;
    CREATE VIEW allview AS 
    select products.商品編號,products.商品名稱,purchase_view.進貨量,orders_view.銷貨量,stock_view.庫存量
    from mcd.products,mcd.purchase_view,mcd.orders_view,mcd.stock_view
	WHERE (mcd.products.商品編號=mcd.purchase_view.商品編號) and  (mcd.products.商品編號=mcd.orders_view.商品編號)
    and  (mcd.products.商品編號=mcd.stock_view.商品編號)
    group by products.商品編號;

	select*from allview;

END $$
DELIMITER ;

use mcd; 
#查詢商品目前狀況
DELIMITER $$
DROP PROCEDURE IF EXISTS Inquire; $$
CREATE PROCEDURE Inquire(
in 商品編號 VARCHAR(4))
BEGIN    
 select products.商品編號,products.商品名稱,purchase_view.進貨量,orders_view.銷貨量,stock_view.庫存量
    from mcd.products,mcd.purchase_view,mcd.orders_view,mcd.stock_view
	WHERE (mcd.products.商品編號=mcd.purchase_view.商品編號) and  (mcd.products.商品編號=mcd.orders_view.商品編號)
    and  (mcd.products.商品編號=mcd.stock_view.商品編號) and products.商品編號=商品編號
    group by products.商品編號;

END $$
DELIMITER ;

use mcd; 
#查詢已付款訂單或是未付款訂單
DELIMITER $$
DROP PROCEDURE IF EXISTS customerspay; $$
CREATE PROCEDURE customerspay(
in 付款與否 VARCHAR(1))
BEGIN    

select products.商品編號,products.商品名稱,purchase.商品數量,(purchase.商品數量*products.銷售價格) 應付金額,purchase.付款與否 顧客付款與否 ,purchase.進貨日期
from mcd.purchase,mcd.products
where (mcd.purchase.商品編號=mcd.products.商品編號) and purchase.付款與否=付款與否
group by purchase.商品編號;

END $$
DELIMITER ;

use mcd; 
#查詢已付款進貨單或是未付款進貨單
DELIMITER $$
DROP PROCEDURE IF EXISTS supplierspay; $$
CREATE PROCEDURE supplierspay(
in 付款與否 VARCHAR(1))
BEGIN    

select products.商品編號,products.商品名稱,purchase.商品數量,(purchase.商品數量*products.進貨價格) 應付金額,purchase.付款與否 付款與否 ,purchase.進貨日期
from mcd.purchase,mcd.products
where (mcd.purchase.商品編號=mcd.products.商品編號) and purchase.付款與否=付款與否
group by purchase.商品編號;

END $$
DELIMITER ;

use mcd; 
#查詢顧客訂單
DELIMITER $$
DROP PROCEDURE IF EXISTS customersInquire; $$
CREATE PROCEDURE customersInquire(
in 客戶編號 VARCHAR(5))
BEGIN    

select customers.客戶編號,customers.客戶姓名,orders.訂單編號,orders.購買日期,orders.付款與否
from mcd.customers,mcd.orders
where (mcd.customers.客戶編號=mcd.orders.客戶編號) and orders.客戶編號=客戶編號;

END $$
DELIMITER ;



SET GLOBAL log_bin_trust_function_creators = 1;
DELIMITER $$
DROP FUNCTION IF EXISTS fee;
CREATE FUNCTION fee(單筆總金額 INT)
RETURNS INT
BEGIN	
	DECLARE 外送費用 INT DEFAULT 0;
	IF (單筆總金額 BETWEEN 0 AND 99) THEN SET 外送費用 = 50;      
	ELSEIF (單筆總金額 BETWEEN 100 AND 199) THEN SET 外送費用 = 40;  
	ELSEIF (單筆總金額 BETWEEN 200 AND 299) THEN SET 外送費用 = 30;  
	ELSEIF (單筆總金額 BETWEEN 300 AND 399) THEN SET 外送費用 = 20;  
	ELSEIF (單筆總金額 BETWEEN 400 AND 499) THEN SET 外送費用 = 10;  
	ELSEIF (單筆總金額 >= 500) THEN SET 外送費用 = 0;                  
END IF;
	RETURN (外送費用);
END $$
DELIMITER ;

#備份
SELECT * INTO OUTFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/customers.csv' FROM mcd.customers;
SELECT * INTO OUTFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/orders.csv' FROM mcd.orders;
SELECT * INTO OUTFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/products.csv' FROM mcd.products;
SELECT * INTO OUTFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/purchase.csv' FROM mcd.purchase;
SELECT * INTO OUTFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/suppliers.csv' FROM mcd.suppliers;
SELECT * INTO OUTFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/suppliers.csv' FROM mcd.deliveryman;
SELECT * INTO OUTFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/orders_view.csv' FROM mcd.hot_view;
SELECT * INTO OUTFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/orders_view.csv' FROM mcd.orders_view;
SELECT * INTO OUTFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/purchase_view.csv' FROM mcd.purchase_view;
SELECT * INTO OUTFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/out_view.csv' FROM mcd.out_view;
SELECT * INTO OUTFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/out_view.csv' FROM mcd.untotal_view;
SELECT * INTO OUTFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/allview.csv' FROM mcd.allview;
SELECT * INTO OUTFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/customersInquire.csv' FROM mcd.customersInquire;
SELECT * INTO OUTFILE'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/customerspay.csv' FROM mcd.customerspay;
SELECT * INTO OUTFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Inquire.csv' FROM mcd.Inquire;
SELECT * INTO OUTFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/profit.csv' FROM mcd.profit;
SELECT * INTO OUTFILE'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/supplierspay.csv'  FROM mcd.supplierspay;
SELECT * INTO OUTFILE'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/supplierspay.csv'  FROM mcd.fee;

#回復
LOAD DATA INFILE'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/customers.csv' INTO TABLE mcd.customers;
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/customers.csv' INTO TABLE mcd.customers;
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/orders.csv' INTO TABLE mcd.orders;
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/products.csv' INTO TABLE mcd.products;
LOAD DATA INFILE'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/purchase.csv' INTO TABLE mcd.purchase;
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/suppliers.csv' INTO TABLE mcd.suppliers;
LOAD DATA INFILE'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/suppliers.csv' INTO TABLE mcd.deliveryman;
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/orders_view.csv' INTO TABLE mcd.hot_view;
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/orders_view.csv' INTO TABLE mcd.orders_view;
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/purchase_view.csv' INTO TABLE mcd.purchase_view;
LOAD DATA INFILE'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/out_view.csv' INTO TABLE mcd.out_view;
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/out_view.csv' INTO TABLE mcd.untotal_view;
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/allview.csv' INTO TABLE mcd.allview;
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/customersInquire.csv' INTO TABLE mcd.customersInquire;
LOAD DATA INFILE'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/customerspay.csv' INTO TABLE mcd.customerspay;
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Inquire.csv' INTO TABLE mcd.Inquire;
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/profit.csv' INTO TABLE mcd.profit;
LOAD DATA INFILE'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/supplierspay.csv'  INTO TABLE mcd.supplierspay;
LOAD DATA INFILE'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/supplierspay.csv'  INTO TABLE mcd.fee;

