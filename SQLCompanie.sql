--baza de date Companie 
-- create database Companie
-- use Companie

create table departament (
id int not null primary key identity(1,1) ,
denumire varchar(50) not null,
cod varchar(50) not null
);

-- presupunem ca firma are sediul in Bucuresti
--pot exista mai multe inregistrari deoarece exista mai multe coduri postale pentru fiecare sector

create table sector(
id int not null primary key identity(1,1),
denumire varchar(50) not null,
cod_postal int 
);

create  table angajat(
id int not null primary key identity(1,1),
id_departament int not null,
id_sector int not null,
nume varchar(50) not null,
prenume varchar(50) not null,
strada varchar(20) not null,
numar int not null,
sex char(1) ,
data_nastere date,
data_angajare date,
salariu int default '2000',
email varchar(50),
foreign key(id_sector) references sector(id),
foreign key(id_departament) references departament(id)
);

create table proiect (
id int not null primary key identity(1,1),
id_departament int not null,
nume varchar(50) not null,
cod varchar(50) not null,
data_incepere date,
buget int,
termen_limita date,
foreign key(id_departament) references departament(id)
);

 create table angajat_proiect (
id_angajat int not null,
id_proiect int not null,
nr_ore_saptamana decimal(3,1) not null,
foreign key(id_angajat) references angajat(id),
foreign key (id_proiect) references proiect(id),
primary key(id_angajat ,id_proiect)
);

-- angajatul poate avea legal doar un partener de viata , iar partenerul poate fi casatorit doar cu un singur angajat
create table partenerAngajat (
id int unique,
nume varchar(50),
prenume varchar(50),
sex char(1)
foreign key (id) references angajat(id)
);

-- populare
insert into departament values
   ('IT','IT011'),
   ('HR','HR021'),
   ('Marketing&PR','MPR05'),
   ('Cercetare','C07'),
   ('Juridic','J001'),
   ('Contabilitate','CON'),
   ('QA','QA31'),
   ('Dezvoltare','DEV01'),
   ('Transport','T001'),
   ('Depozite','DEP');

   select * from departament;

   insert into sector values
  ('Sector 1' ,032736),
  ('Sector 1', 061165),
  ('Sector 3', 011824),
  ('Sector 2', 023595),
  ('Sector 4', 041795),
  ('Sector 5', 062234),
  ('Sector 6', 061902),
  ('Sector 5', 021583),
  ('Sector 4', 060789),
  ('Sector 2', 031025),
  ('Sector 1', 059494);

  select * from sector;

  insert into angajat values 
  (1,2,'Popescu','Maria','Islazului',3,'F',null,'2016-01-01',5300,'maria@gmail.com'),
  (1,1,'Ionescu','Marian','Veseliei',6,'M','1977-02-02','2004-06-07',5900,'marian@gmail.com' ),
  (2,5,'Udrea','Ioana','Oltina',8,'F','1980-04-03','2007-02-09 ',1800,'ioana@gmail.com'),
  (2,3,'Lungu','Ioan','Roma',12,'F','1978-01-01','2004-03-03',1900,'ioan@gmail.com'),
  (1,7,'Cristea','Dan','Atena',17,'M','1975-04-09','2007-01-04',3500,'dan@gmail.com'),
  (7,8,'Ionescu','Andrei','Soarelui',2,'M',null,'2007-01-03',2600,'andre@gmail.com'),
  (5,4,'Vasile','Ion','Gazelei',3,'M',null,'2008-01-01',2200,'ion@gmail.com'),
  (6,6,'Novac','Ionela','Frigul',8,'F','1995-08-12','2019-06-07',4000,'ionela@gmail.com'),
  (9,6,'Norin','Andreea','Frigul',1,'F',null,'2012-06-07',3500,'andreea@gmail.com'),
  (5,7,'Novac','Luciana','Atena',8,'F','1990-06-05','2020-05-07',3000,'luciana@gmail.com'),
  (4,5,'Udrea','Corina','Oltina',9,'F','1984-04-03','2019-02-09 ',2100,'corina@gmail.com');

  select * from angajat;

  insert into proiect values 
  (1,'BCR Asset Management','BCR01','2009-01-02',35000,'2011-07-02'),
  (1,'CreditEurope Bank','CE0102','2005-01-04',35000,'2018-01-05'),
  (2,'Motivarea personalului','MP0102','2019-08-05',5000,null),
  (1,'Alpha Bank LMS','AB0201','2018-09-10',40000,'2022-12-01'),
  (2,'TeamBuilding','TB08',null,3000,null),
  (8,'Masini noi firma','MN44','2019-07-08',25000,null),
  (10,'Renovare depozit 1','REN07','2020-05-04',4000,'2021-05-06'),
  (3,'Promovare site','PROM6','2019-05-04',3800,'2020-09-10'),
  (4,'Piesa LOW ','LOW001','2020-10-10',5000,null),
  (8,'Magazinul Nr.4','DES4','2021-09-10',9000,'2024-09-10');

  select * from proiect ;

  insert into angajat_proiect values
  (1,1,15),
  (1,2,23),
  (7,3,40),
  (2,4,15),
  (2,2,3),
  (3,5,17),
  (5,6,26),
  (6,1,3),
  (8,9,28),
  (4,6,7),
  (5,4,8);

  select * from angajat_proiect;

  insert into partenerAngajat values 
  (1 , 'Popescu' , 'Cornel' , 'M'),
  (2 , 'Ionescu' , 'Larisa' , 'F'),
  (5 , 'Noval' ,'Mirela' , 'F'),
  (7 , 'Vasile' , 'Roxana' ,'F');

  select * from partenerAngajat;

  -- adaugare 2 coloane
  alter table angajat add data_adaugare date;
  alter table angajat add data_modificare date;

  alter table angajat_proiect add data_adaugare date;
  alter table angajat_proiect add data_modificare date;

  alter table departament add data_adaugare date;
  alter table departament add data_modificare date;

  alter table partenerAngajat add data_adaugare date;
  alter table partenerAngajat add data_modificare date;

  alter table proiect add data_adaugare date;
  alter table proiect add data_modificare date;

  alter table sector add data_adaugare date;
  alter table sector add data_modificare date;

 --pentru fiecare departament afisam nr de angajati si salariul mediu
select d.denumire , count(a.id) as Numar_angajati, 
avg(a.salariu) as Medie_salarii
from departament d left join angajat a
on d.id = a.id_departament
group by d.denumire;

--cele mai mari 3 salarii ale angajatilor care lucreaza in departamentul 'IT'
select top 3 a.id, a.nume,a.prenume, a.salariu
from angajat a join departament d
on a.id_departament = d.id
where d.denumire = 'IT'
order by a.salariu desc;

--nr total de ore lucrate la proiectele din fiecare departament
--afisam in ordine descrescatoare dupa nr de ore 
select d.denumire ,sum(ap.nr_ore_saptamana) as 'Total ore pe proiectele departamentului '
from departament d inner join proiect p on d.id = p.id_departament 
inner join angajat_proiect ap on ap.id_proiect =p.id
group by d.denumire
order by 'Total ore pe proiectele departamentului ' desc;

--id-urile proiectelor la care se lucreaza mai mult de 20 ore/saptamana. 
select id_proiect ,sum(nr_ore_saptamana) as nr_ore from angajat_proiect 
group by id_proiect 
having sum(nr_ore_saptamana) >20;

--id-ul departamentelor care au cel putin 2 angajati
select id_departament ,count(id) from angajat
group by id_departament
having count(id) >=2;