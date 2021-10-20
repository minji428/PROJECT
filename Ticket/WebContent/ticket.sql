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
    ticket_name VARCHAR(50),
    ticket_price int(50),
    ticket_stock int(50),
    ticket_image VARCHAR(100),
    ticket_info VARCHAR(100),
    discount_rate int(50),
    reg_date VARCHAR(50),
	sold int(50)
);

CREATE TABLE cart(
	cart_number int(50),
	buyer VARCHAR(50),
	ticket_name VARCHAR(16),
	buy_price int(50),
	buy_count int(50),
	ticket_image VARCHAR(50)
);

CREATE TABLE buy(
	customer_id VARCHAR(50),
	customer_name VARCHAR(50),
	cart_number int(50),
	ticket_name VARCHAR(50),
	buy_price int(50),
	buy_count int(50),
	ticket_image VARCHAR(50),
	buy_date VARCHAR(50),
	howpay VARCHAR(50),
	address VARCHAR(100)
);

CREATE table manager(
	id varchar(50),
    pw varchar(50),
    name varchar(50)
);

CREATE TABLE location(
	ticket_number int(50),
	ticket_name VARCHAR(50),
	ticket_category VARCHAR(10),
    Y_position varchar(20),
    X_position varchar(20)
);

CREATE TABLE board(
	num int(10),
    writer varchar(20),
    title varchar(50),
    pw varchar(20),
    reg_date date,
    ref int(100),
    re_step int(100),
    re_level int(100),
    readcount int(100),
    content varchar(1000)
);
insert into location values(1, '[안덕]카멜리아힐 입장권', 200, '33.288974', '126.370141');
insert into location values(2, '[�꽌洹��룷]�쐢�뱶移대뱶1947', 200, '33.289068', '126.587548');
insert into location values(3, '[議곗쿇]�뿉肄붾옖�뱶 �엯�옣沅�', '200', '33.289068', '126.587548');
insert into location values(4, '[�븞�뜒]�궛諛⑹궛 �깂�궛�삩泥�', '200', '33.289068', '126.587548');
insert into location values(5, '[�넚�뙆]濡��뜲�썡�뱶 �븘�씠�뒪留곹겕', '100', '33.289068', '126.587548');
insert into location values(6, '[留덊룷]誘몄뒪�꽣�옄留�', '100', '33.289068', '126.587548');
insert into location values(7, '[�븷�썡]9.81�뙆�겕', '200', '33.289068', '126.587548');
insert into location values(8, '[��援�]�씠�썡�뱶 �옄�쑀�씠�슜沅�', '700', '33.289068', '126.587548');
insert into location values(9, '[�룊李�]�슜�룊由ъ“�듃猷⑥�', '400', '33.289068', '126.587548');

select * from ticket;
select * from customer;
select * from cart;
select * from buy;
select * from location;
select * from manager;

insert into manager values('admin', 'admin', '관리자'); 


drop table location;

select * from ticket where ticket_number=1;
select * from manager where id="admin" and pw="admin";

insert into manager values('admin2','admin2','愿�由ъ옄');
insert into ticket values(1, '200', '[안덕]카멜리아힐 입장권', 5000, 3, '02_camelliahill.jpg', '입장권', 10, now(), 0);
insert into ticket values(2, '200', '[�꽌洹��룷]�쐢�뱶移대뱶1947', 20000, 5, '02_windcart1947.jpg', '�븸�떚鍮꾪떚', 15, now(), 0);
insert into ticket values(3, '200', '[議곗쿇]�뿉肄붾옖�뱶 �엯�옣沅�', 10000, 5, '02_ecoland.jpg', '�엯�옣沅�', 20, now(), 0);
insert into ticket values(4, '200', '[�븞�뜒]�궛諛⑹궛 �깂�궛�삩泥�', 5000, 3, '02_sanbangsan.jpg', '�뒪�뙆/�옄留�', 10, now(), 0);
insert into ticket values(5, '100', '[�넚�뙆]濡��뜲�썡�뱶 �븘�씠�뒪留곹겕', 16000, 5, '01_lotteicerink.jpg', '�븸�떚鍮꾪떚', 20, now(), 1);
insert into ticket values(6, '100', '[留덊룷]誘몄뒪�꽣�옄留�', 13000, 5, '01_misterhilling.jpg', '�뒪�뙆/�옄留�', 20, now(), 1);
insert into ticket values(7, '200', '[�븷�썡]9.81�뙆�겕', 23500, 10, '02_981park.jpg', '�븸�떚鍮꾪떚', 10, now(), 1);
insert into ticket values(8, '700', '[��援�]�씠�썡�뱶 �옄�쑀�씠�슜沅�', 31000, 5, '07_eworld.jpg', '�븸�떚鍮꾪떚', 40, now(), 2);

insert into location values('[�넚�뙆]濡��뜲�썡�뱶 �븘�씠�뒪留곹겕', '100', 37.51112, 127.095973);

