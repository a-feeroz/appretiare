drop table trans;
drop table g_dept;
drop table factors;
drop table grp;
drop table employee;
drop table department;
drop table phase;




create table department(
d_no number(4) primary key,
d_name varchar2(20) not null,
d_loc varchar2(20) );


insert into department values(10,'technical','Block A');
insert into department values(20,'sales','Block B');
insert into department values(30,'accounts','Block A');
insert into department values(40,'research','Block C');
commit;


create table employee(
e_no number(4) primary key,
e_name varchar2(20) not null,
e_sex number not null,
password varchar2(20),
e_job varchar2(50) not null,
e_sal number(7) not null,
e_mgr number(4),
marks number(3),
d_no number(4) ,foreign key(d_no) references department(d_no) );

insert into employee (e_no,e_name,e_sex,password,e_job,e_sal,e_mgr,d_no) values(1001,'Arshad',1,'1000','Software Engineer',20000,1006,10);
insert into employee (e_no,e_name,e_sex,password,e_job,e_sal,e_mgr,d_no) values(1002,'Angelina',2,'1000','Tester',19000,1006,10);
insert into employee (e_no,e_name,e_sex,password,e_job,e_sal,e_mgr,d_no) values(1003,'Rio',1,'1000','Clerk',30000,1007,30);
insert into employee (e_no,e_name,e_sex,password,e_job,e_sal,e_mgr,d_no) values(1004,'Tom',1,'1000','Field marketing',25500,1013,20);
insert into employee (e_no,e_name,e_sex,password,e_job,e_sal,e_mgr,d_no) values(1005,'Prince',1,'1000','Junior Scientist',29800,1008,40);
insert into employee (e_no,e_name,e_sex,password,e_job,e_sal,d_no) values(1006,'Smith',1,'1000','Technical Manager',10500,10);
insert into employee (e_no,e_name,e_sex,password,e_job,e_sal,d_no) values(1007,'Jack',1,'1000','Accounts Manager',40000,30);
insert into employee (e_no,e_name,e_sex,password,e_job,e_sal,d_no) values(1008,'Jones',1,'1000','Research Manager',50000,40);
insert into employee (e_no,e_name,e_sex,password,e_job,e_sal,e_mgr,d_no) values(1009,'Peter',1,'1000','Data Analyst',15000,1010,10);
insert into employee (e_no,e_name,e_sex,password,e_job,e_sal,e_mgr,d_no) values(1010,'Jennifer',2,'1000','DBA',35000,1006,10);
insert into employee (e_no,e_name,e_sex,password,e_job,e_sal,e_mgr,d_no) values(1011,'Layka',1,'1000','Tester',19000,1006,10);
insert into employee (e_no,e_name,e_sex,password,e_job,e_sal,e_mgr,d_no) values(1012,'Daniel',1,'1000','Software Engineer',20000,1006,10);
insert into employee (e_no,e_name,e_sex,password,e_job,e_sal,d_no) values(1013,'Ronald',1,'1000','Sales Manager',45000,20);
commit; 


create table grp(
g_id number(4) primary key,
g_name varchar2(20)
);



insert into grp values(1,'General Skills');
insert into grp values(2,'Social Skills');
insert into grp values(3,'Technical Skills');
insert into grp values(4,'Sales Skills');
insert into grp values(5,'Accounts Skills');
insert into grp values(6,'Research Skills');

create table factors(
f_id number(4) primary key,
f_name varchar2(30),
g_id number(4)references grp(g_id),
f_weight number(3)
);


insert into factors values(1,'Communication Skills',1,2);
insert into factors values(2,'Confidence',1,2);
insert into factors values(3,'Dedication',1,2);
insert into factors values(4,'Emp-Emp Relationship',2,2);
insert into factors values(5,'Initiative',2,2);
insert into factors values(6,'Dependabality',2,2);
insert into factors values(7,'Domain Of Knowledge',3,4);
insert into factors values(8,'Technical Skills',3,4);
insert into factors values(9,'Quantity And Quality',3,4);
insert into factors values(10,'Marketing Skills',4,4);
insert into factors values(11,'Management',4,4);
insert into factors values(12,'Ego-Drive',4,4);
insert into factors values(13,'Time Management',5,4);
insert into factors values(14,'Competency',5,4);
insert into factors values(15,'Math Skills',5,4);
insert into factors values(16,'Scientific Skills',6,4);
insert into factors values(17,'Creativity',6,4);
insert into factors values(18,'Focus',6,4);
commit;



create table g_dept(
d_no number(4) not null references department(d_no),
g_id number(4) not null references grp(g_id)
);

alter table G_DEPT add constraint pk_G_DEPT primary key(D_NO,G_id);

insert into g_dept values(10,1);
insert into g_dept values(10,2);
insert into g_dept values(10,3);
insert into g_dept values(20,1);
insert into g_dept values(20,2);
insert into g_dept values(20,4);
insert into g_dept values(30,1);
insert into g_dept values(30,2);
insert into g_dept values(30,5);
insert into g_dept values(40,1);
insert into g_dept values(40,2);
insert into g_dept values(40,6);
commit;



create table phase(
p_id number(4) primary key,
p_name varchar2(30));

insert into phase values(1,'1st Quarter ,' || to_char(sysdate,'yyyy'));
insert into phase values(2,'2nd Quarter ,' || to_char(sysdate,'yyyy'));
insert into phase values(3,'3rd Quarter ,' || to_char(sysdate,'yyyy'));
insert into phase values(4,'4th Quarter ,' || to_char(sysdate,'yyyy'));
commit;


create table trans(
e_no number(4) references employee(e_no),
f_id number(4) references factors(f_id),
score number(2),
p_id number(4) references phase(p_id) 
);

alter table trans add constraint pk_trans primary key(e_no,f_id,p_id);

insert into trans values(1001,1,4,1);
insert into trans values(1001,2,3,1);
insert into trans values(1001,3,2,1);
insert into trans values(1001,4,5,1);
insert into trans values(1001,5,3,1);
insert into trans values(1001,6,5,1);
insert into trans values(1001,7,4,1);
insert into trans values(1001,8,4,1);
insert into trans values(1001,9,3,1);



insert into trans values(1003,1,5,2);
insert into trans values(1003,2,2,2);
insert into trans values(1003,3,4,2);
insert into trans values(1003,4,5,2);
insert into trans values(1003,5,4,2);
insert into trans values(1003,6,4,2);
insert into trans values(1003,10,3,2);
insert into trans values(1003,11,2,2);
insert into trans values(1003,12,3,2);
commit;

 
create or replace view scoring as select e_no ,trans.f_id,score,f_weight, (score*f_weight) as mult from trans,factors where trans.f_id=factors.f_id;
