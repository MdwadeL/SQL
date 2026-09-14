REM Drop Tables
drop table attends cascade constraint;
drop table concert cascade constraint;
drop table producer cascade constraint;
drop table customer cascade constraint;

 
REM Create Tables
Create table Customer(
CustNo     	Char(6) Constraint custno_pk Primary Key, 
FName      	VarChar2(15),
LName      	VarChar2(25),
Address         VarChar2(25),
City            VarChar2(15),
State           Char(2),
Zip             Char(5)
);

Create table Producer(
ProdNo	   Char(6) Constraint prodno_pk Primary Key, 
Name       VarChar2(25),
Revenue     Number(9,2)
);

 

Create table Concert(
ConcertId 	Char(9) Constraint concertid_pk Primary Key,
Name 		VarChar2(33), 
ConcertDate	Date,
City		VarChar2(25),
State		Char(2),
Budget	  	 Number(10,2),
ProdNo	        Char(6),
Constraint      prodno_fk  Foreign Key (prodno) 
                 References Producer(prodno)
);

Create Table Attends(
CustNo     	Char(6), 
ConcertId 	Char(9),
Cost            Number(9,2),
   Constraint attends_pk Primary Key(CustNo,ConcertId),
   Constraint  custno_fk  Foreign Key (custno) 
                 References Customer(custno),
   Constraint  concertid_fk  Foreign Key (concertid) 
                 References Concert(concertId)
);


REM Load Tables
INSERT INTO Customer(CustNo,FName,LName,Address,City,State,Zip)
  VALUES('0001','John', 'Smith', '800 University Way','Spartanburg','SC', '29303');
INSERT INTO Customer(CustNo,FName,LName,Address,City,State,Zip)
  VALUES('0002','James', 'Jackson', '231 Apple Way','Boiling Springs','SC', '29316');
INSERT INTO Customer(CustNo,FName,LName,Address,City,State,Zip)
  VALUES('0003','Alice', 'Jones', '111 Main Street','Spartanburg','SC', '29301');
INSERT INTO Customer(CustNo,FName,LName,Address,City,State,Zip)
  VALUES('0004','William', 'Smith', '231 University Way','Greenville','NC', '27834');
INSERT INTO Customer(CustNo,FName,LName,Address,City,State,Zip)
  VALUES('0005','John', 'Smith', '124 Maplel Leaf Drive','Charlotte','NC', '28204');
INSERT INTO Customer(CustNo,FName,LName,Address,City,State,Zip)
  VALUES('0006','Alice', 'Jones', '111 Raintree Drive','Spartanburg','SC', '29301');

INSERT INTO Producer(ProdNo,Name,Revenue)
  VALUES('P001','ACME Production', 150234.53);
INSERT INTO Producer(ProdNo,Name,Revenue)
  VALUES('P002','4 Men, Inc', 50911.12);
INSERT INTO Producer(ProdNo,Name,Revenue)
  VALUES('P003','John Smith', 55000.52);
INSERT INTO Producer(ProdNo,Name,Revenue)
  VALUES('P004','C and J Production', 115234.53);
INSERT INTO Producer(ProdNo,Name,Revenue)
  VALUES('P005','John Smith', 55000.52);


INSERT INTO Concert(ConcertId,Name,ConcertDate,City,State,Budget,ProdNo)
  Values('C101','Hootie and the Blowfish',TO_DATE('01-Jan-2023 8:00 PM','DD-Mon-YYYY HH:MI PM'), 'Spartanburg', 'SC', Null, 'P003');
INSERT INTO Concert(ConcertId,Name,ConcertDate,City,State,Budget,ProdNo)
  Values('C102','Hootie and the Blowfish',TO_DATE('03-Mar-2023 8:00 PM','DD-Mon-YYYY HH:MI pM'), 'Ashville', 'NC', 77000, 'P003');
INSERT INTO Concert(ConcertId,Name,ConcertDate,City,State,Budget,ProdNo)
  Values('C103','New Edition',TO_DATE('01-June-2023 8:00 PM','DD-Mon-YYYY HH:MI PM'), 'Spartanburg', 'SC', 207000, 'P003');
INSERT INTO Concert(ConcertId,Name,ConcertDate,City,State,Budget,ProdNo)
  Values('C104','Justin Timberlake',TO_DATE('01-Sep-2023 8:00 PM','DD-Mon-YYYY HH:MI PM'), 'Greenville', 'NC', NULL, 'P001');
INSERT INTO Concert(ConcertId,Name,ConcertDate,City,State,Budget,ProdNo)
  Values('C105','Fantasia, Robin Thicke and Tank',TO_DATE('07-Mar-2023 8:00 PM','DD-Mon-YYYY HH:MI PM'), 'Greenville', 'NC', 120123, 'P001');
INSERT INTO Concert(ConcertId,Name,ConcertDate,City,State,Budget,ProdNo)
  Values('C106','Fantasia, Robin Thicke and Tank',TO_DATE('25-Mar-2023 8:00 PM','DD-Mon-YYYY HH:MI PM'), 'Greenville', 'SC', 250000, 'P001');
INSERT INTO Concert(ConcertId,Name,ConcertDate,City,State,Budget,ProdNo)
  Values('C107','New Edition',TO_DATE('01-Sep-2023 8:00 PM','DD-Mon-YYYY HH:MI PM'),'Spartanburg', 'SC', 207000, 'P003');




INSERT INTO Attends(CustNo,ConcertId,Cost)
   Values('0001', 'C102', 10.50);
INSERT INTO Attends(CustNo,ConcertId,Cost)
   Values('0004', 'C102', 10.50);
INSERT INTO Attends(CustNo,ConcertId,Cost)
   Values('0003', 'C102', 10.50);
INSERT INTO Attends(CustNo,ConcertId,Cost)
   Values('0003', 'C103', 25.50);
INSERT INTO Attends(CustNo,ConcertId,Cost)
   Values('0001', 'C103', 25.50);
INSERT INTO Attends(CustNo,ConcertId,Cost)
   Values('0004', 'C103', 25.50);
   
   
Rem Displaying Data
SELECT * FROM Customer;
SELECT * FROM Producer;
SELECT * FROM Concert;
SELECT * FROM  Attends;

commit;

