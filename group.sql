CREATE DATABASE IF NOT EXISTS shoeseshop DEFAULT CHARACTER SET utf8; 

create table product(
pcode int unsigned primary key auto_increment,
pcategory varchar(45) not null,
psubcat varchar(45) not null,
pcolor varchar(25) not null,
psize varchar (25) not null,
pdescr varchar(45) not null,
pgender varchar (25) not null,
pquant int unsigned not null,
pprice decimal(7,2) unsigned default 0,
purl varchar (500) not null,
pcreated TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
pupdated TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);
drop table product;
insert into product values
(1,"adidas","superstar","white","44","Lifestyle","MEN",40,99,"https://assets.adidas.com/images/w_600,f_auto,q_auto:sensitive,fl_lossy/4e894c2b76dd4c8e9013aafc016047af_9366/Superstar_Shoes_White_FV3284_01_standard.jpg",now(),now()),
(2,"nike","airmax","black","43","Lifestyle","WOMEN",40,99,"https://c.static-nike.com/a/images/t_PDP_1280_v1/f_auto/gorfwjchoasrrzr1fggt/air-max-270-shoe-ntl0RF.jpg",now(),now()),
(3,"nike","air","grey","43","Lifestyle","MEN",40,99,"https://a.scdn.gr/images/sku_main_images/014215/14215651/20180508140744_nike_air_max_270_ah8050_100.jpeg",now(),now());


select * from product;

 create table user(
  uid int auto_increment primary key,
  username varchar(30) not null,
  password varchar(68) not null,
  fname varchar(20),
  lname varchar(20),
  email varchar(20),
  unique(username),
  ucreated TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  uupdated TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
  );
 insert into user (username,password,fname,lname,email)
  values('admin','$2a$10$PHROMJqyTB3GrbJllGfMG.SLu9apzPFIYTS.DNepEzCwoLxgk4X26','Stelios','Kouimanis','stelios@mail.com');
select * from user;

  create table role(
  rid  int auto_increment primary key,
  rname varchar(30),
  unique(rname)
  );
insert into role(rname) values('ROLE_USER');
select * from role;

  drop table user;
  
  create table user_role(
  uid int,
  rid int ,
  primary key(uid,rid),
  constraint userrolefk1 foreign key(uid) references user (uid),
  constraint userrolefk2 foreign key(rid) references role (rid)
  );
    insert into user_role values(1,1);
select * from user_role;
select * from user;
 delete from user where uid=5;
 
create table message(
mid int unsigned primary key auto_increment,
mtext varchar(500) not null,
musername varchar(30) not null,
mcreated TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
select * from message;


--  den to exw treksei --
  create table inventory(
icode int unsigned primary key auto_increment,
iquant int unsigned default 0,
pcode int unsigned null,
constraint fk_inventory foreign key (pcode)
references product (pcode) 
);


 
