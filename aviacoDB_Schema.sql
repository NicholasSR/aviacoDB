/* Database Systems, Coronel/Morris */
/* Type of SQL : MySQL */

CREATE DATABASE aviaco_base;
USE aviaco_base;

/* Database Systems, Coronel/Morris */
/* Type of SQL : MySQL */

CREATE TABLE AIRCRAFT (
AC_NUMBER varchar(5),
MOD_CODE varchar(10),
AC_TTAF float(8),
AC_TTEL float(8),
AC_TTER float(8)
);

/* -- */
CREATE TABLE CHARTER (
CHAR_TRIP int,
CHAR_DATE datetime,
AC_NUMBER varchar(5),
CHAR_DESTINATION varchar(3),
CHAR_DISTANCE float(8),
CHAR_HOURS_FLOWN float(8),
CHAR_HOURS_WAIT float(8),
CHAR_FUEL_GALLONS float(8),
CHAR_OIL_QTS int,
CUS_CODE int
);

/* -- */
CREATE TABLE CREW (
CHAR_TRIP int,
EMP_NUM int,
CREW_JOB varchar(20)
);

/* -- */
CREATE TABLE CUSTOMER (
CUS_CODE int,
CUS_LNAME varchar(15),
CUS_FNAME varchar(15),
CUS_INITIAL varchar(1),
CUS_AREACODE varchar(3),
CUS_PHONE varchar(8),
CUS_BALANCE float(8)
);

/* -- */
CREATE TABLE EARNEDRATING (
EMP_NUM int,
RTG_CODE varchar(5),
EARNRTG_DATE datetime
);

/* -- */
CREATE TABLE EMPLOYEE (
EMP_NUM int,
EMP_TITLE varchar(4),
EMP_LNAME varchar(15),
EMP_FNAME varchar(15),
EMP_INITIAL varchar(1),
EMP_DOB datetime,
EMP_HIRE_DATE datetime
);

/* -- */
CREATE TABLE MODEL (
MOD_CODE varchar(10),
MOD_MANUFACTURER varchar(15),
MOD_NAME varchar(20),
MOD_SEATS float(8),
MOD_CHG_MILE float(8)
);

/* -- */
CREATE TABLE PILOT (
EMP_NUM int,
PIL_LICENSE varchar(25),
PIL_RATINGS varchar(30),
PIL_MED_TYPE varchar(1),
PIL_MED_DATE datetime,
PIL_PT135_DATE datetime
);

/* -- */
CREATE TABLE RATING (
RTG_CODE varchar(5),
RTG_NAME varchar(50)
);

/* -- */
INSERT INTO CUSTOMER VALUES('10010','Aziz','Khurram','','902','444-0000','0');
INSERT INTO CUSTOMER VALUES('10011','Dunne','Leona','K','713','894-1238','0');
INSERT INTO CUSTOMER VALUES('10012','Smith','Kathy','W','615','894-2285','896.54');
INSERT INTO CUSTOMER VALUES('10013','Olowski','Paul','F','615','894-2180','1285.19');
INSERT INTO CUSTOMER VALUES('10014','Orlando','Myron','','615','222-1672','673.21');
INSERT INTO CUSTOMER VALUES('10015','O''Brian','Amy','B','713','442-3381','1014.56');
INSERT INTO CUSTOMER VALUES('10016','Brown','James','G','615','297-1228','0');
INSERT INTO CUSTOMER VALUES('10017','Williams','George','','615','290-2556','0');
INSERT INTO CUSTOMER VALUES('10018','Farriss','Anne','G','713','382-7185','0');
INSERT INTO CUSTOMER VALUES('10019','Smith','Olette','K','615','297-3809','453.98');

INSERT INTO EMPLOYEE VALUES('100','Mr.','Kolmycz','George','D','1942-06-15','1987-03-15');
INSERT INTO EMPLOYEE VALUES('101','Ms.','Lewis','Rhonda','G','1965-03-19','1988-04-25');
INSERT INTO EMPLOYEE VALUES('102','Mr.','VanDam','Rhett','','1958-11-14','1992-12-20');
INSERT INTO EMPLOYEE VALUES('103','Ms.','Jones','Anne','M','1974-10-16','2005-08-28');
INSERT INTO EMPLOYEE VALUES('104','Mr.','Lange','John','P','1971-11-08','1996-10-20');
INSERT INTO EMPLOYEE VALUES('105','Mr.','Williams','Robert','D','1975-03-14','2006-01-08');
INSERT INTO EMPLOYEE VALUES('106','Mrs.','Duzak','Jeanine','K','1968-02-12','1991-01-05');
INSERT INTO EMPLOYEE VALUES('107','Mr.','Diante','Jorge','D','1974-08-21','1996-07-02');
INSERT INTO EMPLOYEE VALUES('108','Mr.','Wiesenbach','Paul','R','1966-02-14','1994-11-18');
INSERT INTO EMPLOYEE VALUES('109','Ms.','Travis','Elizabeth','K','1961-06-18','1991-04-14');
INSERT INTO EMPLOYEE VALUES('110','Mrs.','Genkazi','Leighla','W','1970-05-19','1992-12-01');

INSERT INTO MODEL VALUES('C-90A','Beechcraft','KingAir','8','2.67');
INSERT INTO MODEL VALUES('PA23-250','Piper','Aztec','6','1.93');
INSERT INTO MODEL VALUES('PA31-350','Piper','Navajo Chieftain','10','2.35');

INSERT INTO PILOT VALUES('101','ATP','ATP/SEL/MEL/Instr/CFII','1',    '2016-01-20','2016-01-11');
INSERT INTO PILOT VALUES('104','ATP','ATP/SEL/MEL/Instr','1',         '2015-12-18','2016-01-17');
INSERT INTO PILOT VALUES('105','COM','COMM/SEL/MEL/Instr/CFI','2',    '2016-01-05','2016-01-02');
INSERT INTO PILOT VALUES('106','COM','COMM/SEL/MEL/Instr','2',        '2015-12-10','2016-02-02');
INSERT INTO PILOT VALUES('109','COM','ATP/SEL/MEL/SES/Instr/CFII','1','2016-01-22','2016-01-15');

INSERT INTO RATING VALUES('CFI','Certified Flight Instructor');
INSERT INTO RATING VALUES('CFII','Certified Flight Instructor, Instrument');
INSERT INTO RATING VALUES('INSTR','Instrument');
INSERT INTO RATING VALUES('MEL','Multiengine Land');
INSERT INTO RATING VALUES('SEL','Single Engine, Land');
INSERT INTO RATING VALUES('SES','Single Engine, Sea');

INSERT INTO AIRCRAFT VALUES('1484P','PA23-250','1833.1','1833.1','101.8');
INSERT INTO AIRCRAFT VALUES('2289L','C-90A','4243.8','768.9','1123.4');
INSERT INTO AIRCRAFT VALUES('2778V','PA31-350','7992.9','1513.1','789.5');
INSERT INTO AIRCRAFT VALUES('4278Y','PA31-350','2147.3','622.1','243.2');

INSERT INTO CHARTER (CHAR_trip, char_date, ac_number, char_destination, char_distance, char_hours_flown, char_hours_wait, char_fuel_gallons, char_oil_qts, cus_code) VALUES('10001','2016-02-05','2289L','ATL','936','5.1','2.2','354.1','1','10011');
INSERT INTO CHARTER (CHAR_trip, char_date, ac_number, char_destination, char_distance, char_hours_flown, char_hours_wait, char_fuel_gallons, char_oil_qts, cus_code) VALUES('10002','2016-02-05','2778V','BNA','320','1.6','0','72.6','0','10016');
INSERT INTO CHARTER (CHAR_trip, char_date, ac_number, char_destination, char_distance, char_hours_flown, char_hours_wait, char_fuel_gallons, char_oil_qts, cus_code) VALUES('10003','2016-02-05','4278Y','GNV','1574','7.8','0','339.8','2','10014');
INSERT INTO CHARTER (CHAR_trip, char_date, ac_number, char_destination, char_distance, char_hours_flown, char_hours_wait, char_fuel_gallons, char_oil_qts, cus_code) VALUES('10004','2016-02-06','1484P','STL','472','2.9','4.9','97.2','1','10019');
INSERT INTO CHARTER (CHAR_trip, char_date, ac_number, char_destination, char_distance, char_hours_flown, char_hours_wait, char_fuel_gallons, char_oil_qts, cus_code) VALUES('10005','2016-02-06','2289L','ATL','1023','5.7','3.5','397.7','2','10011');
INSERT INTO CHARTER (CHAR_trip, char_date, ac_number, char_destination, char_distance, char_hours_flown, char_hours_wait, char_fuel_gallons, char_oil_qts, cus_code) VALUES('10006','2016-02-06','4278Y','STL','472','2.6','5.2','117.1','0','10017');
INSERT INTO CHARTER (CHAR_trip, char_date, ac_number, char_destination, char_distance, char_hours_flown, char_hours_wait, char_fuel_gallons, char_oil_qts, cus_code) VALUES('10007','2016-02-06','2778V','GNV','1574','7.9','0','348.4','2','10012');
INSERT INTO CHARTER (CHAR_trip, char_date, ac_number, char_destination, char_distance, char_hours_flown, char_hours_wait, char_fuel_gallons, char_oil_qts, cus_code) VALUES('10008','2016-02-07','1484P','TYS','644','4.1','0','140.6','1','10014');
INSERT INTO CHARTER (CHAR_trip, char_date, ac_number, char_destination, char_distance, char_hours_flown, char_hours_wait, char_fuel_gallons, char_oil_qts, cus_code) VALUES('10009','2016-02-07','2289L','GNV','1574','6.6','23.4','459.9','0','10017');
INSERT INTO CHARTER (CHAR_trip, char_date, ac_number, char_destination, char_distance, char_hours_flown, char_hours_wait, char_fuel_gallons, char_oil_qts, cus_code) VALUES('10010','2016-02-07','4278Y','ATL','998','6.2','3.2','279.7','0','10016');
INSERT INTO CHARTER (CHAR_trip, char_date, ac_number, char_destination, char_distance, char_hours_flown, char_hours_wait, char_fuel_gallons, char_oil_qts, cus_code) VALUES('10011','2016-02-07','1484P','BNA','352','1.9','5.3','66.4','1','10012');
INSERT INTO CHARTER (CHAR_trip, char_date, ac_number, char_destination, char_distance, char_hours_flown, char_hours_wait, char_fuel_gallons, char_oil_qts, cus_code) VALUES('10012','2016-02-08','2778V','MOB','884','4.8','4.2','215.1','0','10010');
INSERT INTO CHARTER (CHAR_trip, char_date, ac_number, char_destination, char_distance, char_hours_flown, char_hours_wait, char_fuel_gallons, char_oil_qts, cus_code) VALUES('10013','2016-02-08','4278Y','TYS','644','3.9','4.5','174.3','1','10011');
INSERT INTO CHARTER (CHAR_trip, char_date, ac_number, char_destination, char_distance, char_hours_flown, char_hours_wait, char_fuel_gallons, char_oil_qts, cus_code) VALUES('10014','2016-02-09','4278Y','ATL','936','6.1','2.1','302.6','0','10017');
INSERT INTO CHARTER (CHAR_trip, char_date, ac_number, char_destination, char_distance, char_hours_flown, char_hours_wait, char_fuel_gallons, char_oil_qts, cus_code) VALUES('10015','2016-02-09','2289L','GNV','1645','6.7','0','459.5','2','10016');
INSERT INTO CHARTER (CHAR_trip, char_date, ac_number, char_destination, char_distance, char_hours_flown, char_hours_wait, char_fuel_gallons, char_oil_qts, cus_code) VALUES('10016','2016-02-09','2778V','MQY','312','1.5','0','67.2','0','10011');
INSERT INTO CHARTER (CHAR_trip, char_date, ac_number, char_destination, char_distance, char_hours_flown, char_hours_wait, char_fuel_gallons, char_oil_qts, cus_code) VALUES('10017','2016-02-10','1484P','STL','508','3.1','0','105.5','0','10014');
INSERT INTO CHARTER (CHAR_trip, char_date, ac_number, char_destination, char_distance, char_hours_flown, char_hours_wait, char_fuel_gallons, char_oil_qts, cus_code) VALUES('10018','2016-02-10','4278Y','TYS','644','3.8','4.5','167.4','0','10017');

INSERT INTO CREW VALUES('10001','104','Pilot');
INSERT INTO CREW VALUES('10002','101','Pilot');
INSERT INTO CREW VALUES('10003','105','Pilot');
INSERT INTO CREW VALUES('10003','109','Copilot');
INSERT INTO CREW VALUES('10004','106','Pilot');
INSERT INTO CREW VALUES('10005','101','Pilot');
INSERT INTO CREW VALUES('10006','109','Pilot');
INSERT INTO CREW VALUES('10007','104','Pilot');
INSERT INTO CREW VALUES('10007','105','Copilot');
INSERT INTO CREW VALUES('10008','106','Pilot');
INSERT INTO CREW VALUES('10009','105','Pilot');
INSERT INTO CREW VALUES('10010','108','Pilot');
INSERT INTO CREW VALUES('10011','101','Pilot');
INSERT INTO CREW VALUES('10011','104','Copilot');
INSERT INTO CREW VALUES('10012','101','Pilot');
INSERT INTO CREW VALUES('10013','105','Pilot');
INSERT INTO CREW VALUES('10014','106','Pilot');
INSERT INTO CREW VALUES('10015','101','Copilot');
INSERT INTO CREW VALUES('10015','104','Pilot');
INSERT INTO CREW VALUES('10016','105','Copilot');
INSERT INTO CREW VALUES('10016','109','Pilot');
INSERT INTO CREW VALUES('10017','101','Pilot');
INSERT INTO CREW VALUES('10018','104','Copilot');
INSERT INTO CREW VALUES('10018','105','Pilot');

INSERT INTO EARNEDRATING VALUES('101','CFI','1998-02-18');
INSERT INTO EARNEDRATING VALUES('101','CFII','2005-12-15');
INSERT INTO EARNEDRATING VALUES('101','INSTR','1993-11-08');
INSERT INTO EARNEDRATING VALUES('101','MEL','1994-06-23');
INSERT INTO EARNEDRATING VALUES('101','SEL','1993-04-21');
INSERT INTO EARNEDRATING VALUES('104','INSTR','1996-07-15');
INSERT INTO EARNEDRATING VALUES('104','MEL','1997-01-29');
INSERT INTO EARNEDRATING VALUES('104','SEL','1995-03-12');
INSERT INTO EARNEDRATING VALUES('105','CFI','1997-11-18');
INSERT INTO EARNEDRATING VALUES('105','INSTR','1995-04-17');
INSERT INTO EARNEDRATING VALUES('105','MEL','1995-08-12');
INSERT INTO EARNEDRATING VALUES('105','SEL','1994-09-23');
INSERT INTO EARNEDRATING VALUES('106','INSTR','1995-12-20');
INSERT INTO EARNEDRATING VALUES('106','MEL','1996-04-02');
INSERT INTO EARNEDRATING VALUES('106','SEL','1994-03-10');
INSERT INTO EARNEDRATING VALUES('109','CFI','1998-11-05');
INSERT INTO EARNEDRATING VALUES('109','CFII','2003-06-21');
INSERT INTO EARNEDRATING VALUES('109','INSTR','1996-07-23');
INSERT INTO EARNEDRATING VALUES('109','MEL','1997-03-15');
INSERT INTO EARNEDRATING VALUES('109','SEL','1996-02-05');
INSERT INTO EARNEDRATING VALUES('109','SES','1996-05-12');
