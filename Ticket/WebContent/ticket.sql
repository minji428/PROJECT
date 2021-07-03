CREATE DATABASE ticket;
use ticket;

CREATE TABLE customer(
	id VARCHAR(50),
    pw VARCHAR(16),
    name VARCHAR(10),
    reg_date VARCHAR(50),
    tel VARCHAR(20),
    address VARCHAR(100),
	email VARCHAR(20)
);

CREATE TABLE ticket(
	ticket_number int(50),
	ticket_category VARCHAR(10),
    ticket_name VARCHAR(16),
    ticket_price int(50),
    ticket_stock int(50),
    ticket_image VARCHAR(100),
    ticket_info VARCHAR(100),
    discount_rate int(50),
    reg_date VARCHAR(50),
	sold int(50)
);
select * from ticket;
select * from customer;
drop table ticket;
select * from ticket where ticket_number=1;







insert into ticket values(1, '200', '[안덕]카멜리아힐 입장권', 5000, 3, '02_camelliahill.jpg', '입장권', 10, now(), 0);
insert into ticket values(2, '200', '[서귀포]윈드카드1947', 20000, 5, '02_windcart1947.jpg', '액티비티', 15, now(), 0);
insert into ticket values(3, '200', '[조천]에코랜드 입장권', 10000, 5, '02_ecoland.jpg', '입장권', 20, now(), 0);
insert into ticket values(4, '200', '[안덕]산방산 탄산온천', 5000, 3, '02_sanbangsan.jpg', '스파/힐링', 10, now(), 0);
insert into ticket values(5, '100', '[송파]롯데월드 아이스링크', 16000, 5, '01_lotteicerink.jpg', '액티비티', 20, now(), 1);
insert into ticket values(6, '100', '[마포]미스터힐링', 13000, 5, '01_misterhilling.jpg', '스파/힐링', 20, now(), 1);
insert into ticket values(7, '200', '[애월]9.81파크', 23500, 10, '02_981park.jpg', '액티비티', 10, now(), 1);
insert into ticket values(8, '700', '[대구]이월드 자유이용권', 31000, 5, '07_eworld.jpg', '액티비티', 40, now(), 2);

