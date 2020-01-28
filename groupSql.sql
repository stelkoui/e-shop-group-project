CREATE DATABASE IF NOT EXISTS shoeseshop DEFAULT CHARACTER SET utf8; 
use shoeseshop ;

create table product(
pcode int unsigned primary key auto_increment,
pcategory varchar(45) not null,
psubcat varchar(45) not null,
pcolor varchar(25) not null,
psize varchar (25) not null,
pdescr varchar(45) not null,
pdescr2 varchar(100) not null,
pgender varchar (25) not null,
pquant int unsigned not null,
pprice decimal(7,2) unsigned default 0,
purl varchar (500) ,
 pcreated TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
 pupdated TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

insert into product values
(1,'adidas','Superstar','White','44','Lifestyle','Adidas Superstar Foundation','MEN',40,99.00,'https://assets.adidas.com/images/w_600,f_auto,q_auto:sensitive,fl_lossy/4e894c2b76dd4c8e9013aafc016047af_9366/Superstar_Shoes_White_FV3284_01_standard.jpg','2020-01-20 22:02:23','2020-01-20 22:02:23'),
(2,'nike','Airmax','Black','41','Lifestyle','Nike Air Max 90 - Men Shoes','WOMEN',40,99.00,'https://c.static-nike.com/a/images/t_PDP_1280_v1/f_auto/gorfwjchoasrrzr1fggt/air-max-270-shoe-ntl0RF.jpg','2020-01-20 22:02:23','2020-01-20 22:02:23'),
(3,'nike','Zoom','Black','40','Running','Nike Zoom HyperAce 2 Women Running Shoe','WOMEN',40,166.00,'https://c.static-nike.com/a/images/t_PDP_1280_v1/f_auto/psl4yspu3qw9w624ihyc/zoom-hyperace-2-womens-volleyball-shoe-KlrjdK.jpg','2020-01-20 22:02:23','2020-01-20 22:02:39'),
(4,'nike','Zoom','Blue','43','Running','Nike Blue running shoes for Men','MEN',40,116.00,'https://5.imimg.com/data5/UX/UM/MY-14554186/nike-500x500.jpg','2020-01-20 22:02:23','2020-01-20 22:02:39'),
(5,'nike','React Element','White-Blue','45','Basketball','Nike Royal Kentucky Wildcats React Element 55 Shoes Basketball','MEN',40,102.00,'https://images.footballfanatics.com/FFImage/thumb.aspx?i=/productimages/_3486000/altimages/ff_3486469-dcb8286f7e338efd23caalt1_full.jpg','2020-01-20 22:02:23','2020-01-20 22:02:39'),
(6,'nike','Airmax','White-Blue','44','Crossfit','AIR MAX 90/1 for Crossfit Training','MEN',40,112.00,'https://www.flightclub.com/media/catalog/product/cache/1/image/1600x1140/9df78eab33525d08d6e5fb8d27136e95/8/0/804843_01.jpg','2020-01-20 22:02:23','2020-01-20 22:02:39'),
(7,'nike','Zoom Freak','Blue','46','Basketball','Zoom Freak 1    Basketball','MEN',40,255.00,'https://greekcitytimes.com/wp-content/uploads/2019/08/thumbnail_IMG_4531.jpg','2020-01-20 22:02:23','2020-01-20 22:02:39'),
(8,'nike','SUPERFLY','Blue','45','Football','SUPERFLY 7 ACADEMY FG/MG Football Shoes For Men','MEN',40,199.00,'https://rukminim1.flixcart.com/image/800/960/jyxaw7k0/shoe/b/p/c/at7946-414-10-nike-blue-hero-white-obsidian-original-imafj23sxjfd58pz.jpeg','2020-01-20 22:02:23','2020-01-20 22:02:39'),
(9,'adidas','Ultraboost','White','45','Running','Adidas Ultraboost 20 Seoul City Pack Shoes','MEN',40,119.00,'https://www.adidas.com.ph/dw/image/v2/bcbs_prd/on/demandware.static/-/Sites-adidas-products/default/dw6c393ac3/zoom/FX7813_01_standard.jpg','2020-01-20 22:02:23','2020-01-20 22:02:39'),
(10,'adidas','RunFalcon','Indigo-Pink','40','Running','Adidas RunFalcon Girls Running Shoe - Raw Indigo/True Pink/Core Black','WOMEN',40,68.00,'https://sportsmart.com.au/products/A32_870332_500.jpg','2020-01-20 22:02:23','2020-01-20 22:02:39'),
(11,'asics','GT-1000','Shark/Black','43','Running','Asics Women GT-1000 7 Stability Running Shoes Grand Shark/Black','WOMEN',40,78.00,'https://resources.mandmdirect.com/Images/_default/a/s/1/as1794_1_cloudzoom.jpg','2020-01-20 22:02:23','2020-01-20 22:02:39'),
(12,'asics','Gel Excite','Black','45','Running','Asics GEL-EXCITE 6 Running Shoes','MEN',40,87.00,'https://images.sportsdirect.com/images/products/21195540_l.jpg','2020-01-20 22:02:23','2020-01-20 22:02:39'),
(13,'reebok','Nano 5.0','Black','45','Crossfit','Reebok-CrossFit-Nano-5.0 for Crossfit Training','MEN',40,95.00,'https://i.pinimg.com/236x/ab/e4/fe/abe4fea66583d2f5b29d009187ea06b8--gym-products-crossfit-shoes.jpg','2020-01-20 22:02:23','2020-01-20 22:02:39'),
(14,'newbalance','Nubuck','Blue','44','Lifestyle','New Balance Man 991 Lifestyle Shoe Nubuck','MEN',40,91.00,'https://www.khloefemme.com/media/image/8d/75/92/scarpa-new-balance-uomo-991-lifestyle-nubuck-npn-npn-navy-2868071263025-1_400x600.jpg','2020-01-20 22:02:23','2020-01-20 22:02:39'),
(15,'puma','Axelion','Black','45','Running','PUMA Men Axelion Dynamic Running Shoes','MEN',40,68.00,'https://www.famousfootwear.com/ProductImages/shoes_ia75212.jpg','2020-01-20 22:02:23','2020-01-20 22:02:39'),
(16,'skechers','Dyna-Lite','Blue','29','Running','SKECHERS KIDS BOYS DYNA-LITE SNEAKER - BLUE','KIDS',40,35.00,'https://deichmann.scene7.com/asset/deichmann/US_02_620266_00','2020-01-20 22:02:23','2020-01-20 22:02:39'),
(17,'lotto','Dinamika','Blue-Black','31','Lifestyle','LOTTO DINAMICA 200 II ','KIDS',40,68.00,'https://www.cosmossport.gr/1603121/lotto-dinamica-200-ii.jpg','2020-01-20 22:02:23','2020-01-20 22:02:39');


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

  create table role(
  rid  int auto_increment primary key,
  rname varchar(30),
  unique(rname)
  );
insert into role(rname) values('ROLE_ADMIN'),('ROLE_USER');


  
  create table user_role(
  uid int,
  rid int ,
  primary key(uid,rid),
  constraint userrolefk1 foreign key(uid) references user (uid),
  constraint userrolefk2 foreign key(rid) references role (rid)
  );
  insert into user_role values(1,1);
 

 
create table message(
mid int unsigned primary key auto_increment,
mtext varchar(500) not null,
musername varchar(30) not null,
mcreated TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);



  create table orders(
ocode int unsigned primary key auto_increment,
oquant int unsigned default 0,
ototal int unsigned default 0,
puid int ,
constraint fk_inventory foreign key (puid)
references user (uid) 
);

 
