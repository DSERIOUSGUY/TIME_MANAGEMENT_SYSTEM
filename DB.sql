
use db2;
drop table schedule1;
drop table meeting;
drop table employee;
drop table secretary;
drop table Client1;
drop table project;

create table secretary(sec_id numeric(7,0), s_password varchar(20), department varchar(20),
					   primary key(department));
                       
create table employee( e_id numeric(5,0) , e_password varchar(20), f_name varchar(10),
					   l_name varchar(10), salary numeric(10,0), email varchar(40),
                       phone numeric(10,0), address varchar(50), department varchar(20),
                       designation varchar(25), primary key(e_id),
                       foreign key(department) references secretary(department) on delete set null);		

                       
create table Client1(c_id numeric(5,0), c_name varchar(30), c_phone numeric(10,0),
					 c_email varchar(40), c_address varchar(50), primary key(c_id));
                     
create table project(p_name varchar(30), p_id numeric(5,0), primary key(p_id));

create table schedule1(s_date date, s_time  time, e_id numeric(5,0));

create table meeting(m_id numeric(6,0), purpose varchar(50), duration varchar(7), e_id numeric(5,0),
					 m_date date, m_time time, p_id numeric(5,0), c_id numeric(5.0), primary key(m_id),
                     foreign key(p_id) references project(p_id), foreign key(c_id) references Client1(c_id), 
                     foreign key(e_id) references employee(e_id) on delete set null);
                     
                     
insert into secretary values(1234567 , 'Asdfgh' , 'Power');
insert into secretary values(1234568 , 'Bsdfgh' , 'Public Relations');
insert into secretary values(1234569 , 'Csdfgh' , 'Business');
insert into employee values(11111 , 'asd12' , 'Chandan' , 'Prabhu' , 100000.0 , 'cpr@tms.com' , 9876543210 , 'New Delhi' , 'Business', 'Clerk');
insert into employee values(11112 , 'asd13' , 'Asif' , 'Khan' , 109600.0 , 'akh@tms.com' , 9876777210 , 'Mumbai' , 'Public Relations' , 'Executive Director');
insert into employee values(11113 , 'asd14' , 'Bhushan' , 'Kumar' , 365000.0 , 'bku@tms.com' , 9111543210 , 'Chennai' , 'Public Relations' , 'Clerk');
insert into Client1 values(25251 , 'Raj Kumar' , 9297374545 , 'rjk@gmail.com' , 'Gurgaon');
insert into Client1 values(25252 , 'Priya Prakash' , 9296664545 , 'prpk@gmail.com' , 'Faridabad');
insert into Client1 values(25253 , 'Jethalal' , 7371212456 , 'jeth@gmail.com' , 'Gokuldham');
insert into project values('Heavy Building Material' , 55110);
insert into project values('Bridge of Bombay' , 55111);
insert into project values('Dharavi Sports Complex' , 55112);
insert into schedule1 values(2018-11-27 , '10:00:00' , 11112);
insert into schedule1 values(2018-11-27 , '14:30:00' , 11113);
insert into schedule1 values(2018-11-28 , '09:25:00' , 11111);
insert into meeting values(112230 , 'Discussing Budget' , '2 hours' , 11111 , 2018-11-28 , '09:25:00' , NULL , 25253);
insert into meeting values(112231 , 'Nominating Project Head' , '1 hour' , 11112 , 2018-11-27 , '14:30:00' , 55111 , NULL);
insert into meeting values(112231 , 'Nominating Project Head' , '1 hour' , 11113 , 2018-11-27 , '14:30:00' , 55111 , NULL);                     