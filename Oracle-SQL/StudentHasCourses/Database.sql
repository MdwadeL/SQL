REM  Drop Statements  
drop table has cascade constraint;
drop table course cascade constraint;
drop table student cascade constraint;

REM   Create Statements 
CREATE TABLE Student(
StudId       Char(9) Constraint student_pk Primary Key,
FName        VarChar2 (15),
LName        VarChar2(25),
Tuition      Number(6,2),
FinancialAid Number(6,2),
Major        Char(15),
EnrollDte    Date
);
CREATE TABLE Course(
SeqCde       Char(6) Constraint  course_pk Primary Key,
CourseName   VarChar2(35),
MeetingDays  VarChar2(24),
Sect         Char(3),
Hours        Number(1),
ProfName     VarChar2(10)
);
CREATE TABLE Has(
 StudId       Char(9),
 SeqCde       Char(6),
 Constraint  has_pk  Primary Key (StudId, SeqCde), 
 Constraint  has_fk1  Foreign Key (StudId) References Student(StudId),
 Constraint  has_fk2  Foreign Key (SeqCde) References Course (SeqCde)
);

REM  Insert Statements 
INSERT INTO Student (StudId, FName, LName, Tuition, FinancialAid, Major,EnrollDte)
  VALUES ('142519864','Susan','Martin',2800,3900,'IMS',TO_DATE('2005-01-25 8:31 AM','YYYY-MM-DD HH:MI AM'));
INSERT INTO Student (StudId, FName, LName, Tuition, FinancialAid, Major,EnrollDte)
  VALUES ('242518965','James','Smith',2800,6800,'CS',TO_DATE('2005-01-25 9:00 AM','YYYY-MM-DD HH:MI AM'));
INSERT INTO Student (StudId, FName, LName, Tuition, FinancialAid, Major,EnrollDte)
  VALUES ('141582651','Mary','Johnson',2800,4400,'IMS',TO_DATE('2005-01-25 10:22 AM','YYYY-MM-DD HH:MI AM'));
INSERT INTO Student (StudId, FName, LName, Tuition, FinancialAid, Major,EnrollDte)
  VALUES ('011564812','John','Williams',2800,3500,'English',TO_DATE('2005-01-20 4:00 PM','YYYY-MM-DD HH:MI PM'));
INSERT INTO Student (StudId, FName, LName, Tuition, FinancialAid, Major,EnrollDte)
  VALUES ('254099823','Patricia','Jones',2800,2800,'Math',TO_DATE('2005-01-21 11:45 AM','YYYY-MM-DD HH:MI AM'));
INSERT INTO Student (StudId, FName, LName, Tuition, FinancialAid, Major,EnrollDte)
  VALUES ('356187925','Robert','Brown',2800,2800,'Math',TO_DATE('2005-01-25 1:00 PM','YYYY-MM-DD HH:MI PM'));
INSERT INTO Student (StudId, FName, LName, Tuition, FinancialAid, Major,EnrollDte)
  VALUES ('489456522','Linda','Davis',2800,2600,'IMS',TO_DATE('2005-01-21 9:38 AM','YYYY-MM-DD HH:MI AM'));
INSERT INTO Student (StudId, FName, LName, Tuition, FinancialAid, Major,EnrollDte)
  VALUES ('287321212','Michael','Miller',2800,6200,'English',TO_DATE('2005-01-27 11:45 AM','YYYY-MM-DD HH:MI AM'));

INSERT INTO Course (SeqCde, CourseName, MeetingDays, Sect, Hours, ProfName)
  VALUES ('523764','SEGL W101 - COMPOSITION','M-W-F 9:30am - 10:20am','001',3,'TAYLOR N');
INSERT INTO Course (SeqCde, CourseName, MeetingDays, Sect, Hours, ProfName)
  VALUES ('521954','SMTH W121 - COLLEGE ALGEBRA', 'M-W-F 10:30am - 11:20am','001',3,'WHITE W');
INSERT INTO Course (SeqCde, CourseName, MeetingDays, Sect, Hours, ProfName)
  VALUES ('521374','SCSC W138 - INTRO TO COMPUTER TECH','T-Th 8:00am - 9:15am','001',3,'SPIESS E');
INSERT INTO Course (SeqCde, CourseName, MeetingDays, Sect, Hours, ProfName)
  VALUES ('519054','SHST W111 - INTRO EUROPEAN HISTORY','T-Th 10:30am - 11:45am','001',3,'BOGGS S');
INSERT INTO Course (SeqCde, CourseName, MeetingDays, Sect, Hours, ProfName)
  VALUES ('529834','SIMS W139 - VISUAL BASIC I','T-Th 2:35pm - 3:50pm','001',3,'TOLAND T');
INSERT INTO Course (SeqCde, CourseName, MeetingDays, Sect, Hours, ProfName)
  VALUES ('514684','SIMS W239 - VISUAL BASIC II','T-Th 2:35pm - 3:50pm','001',3,'Williams D');
INSERT INTO Course (SeqCde, CourseName, MeetingDays, Sect, Hours, ProfName)  VALUES ('529894','SIMS W421 - DATABASE IMPL.','T-Th 2:35pm - 3:50pm','001',3,'Toland T');


INSERT INTO Has (SeqCde,  StudId)
  VALUES ('523764','142519864');
INSERT INTO Has (SeqCde, StudId)
  VALUES ('523764','242518965');
INSERT INTO Has (SeqCde,  StudId)
  VALUES ('523764','141582651');
INSERT INTO Has (SeqCde,  StudId)
  VALUES ('523764','011564812');
INSERT INTO Has (SeqCde,  StudId)
  VALUES ('523764','254099823');
INSERT INTO Has (SeqCde, StudId)
  VALUES ('523764','356187925');
INSERT INTO Has (SeqCde, StudId)
  VALUES ('523764','489456522');
INSERT INTO Has (SeqCde, StudId)
  VALUES ('521954','142519864');
INSERT INTO Has (SeqCde,  StudId)
  VALUES ('521954','242518965');
INSERT INTO Has (SeqCde,  StudId)
  VALUES ('521954','141582651');
INSERT INTO Has (SeqCde,  StudId)
  VALUES ('521954','011564812');
INSERT INTO Has (SeqCde,  StudId)
  VALUES ('521954','254099823');
INSERT INTO Has (SeqCde, StudId)
  VALUES ('521954','356187925');
INSERT INTO Has (SeqCde, StudId)
  VALUES ('521954','489456522');
INSERT INTO Has (SeqCde, StudId)
  VALUES ('521374','142519864');
INSERT INTO Has (SeqCde, StudId)
  VALUES ('521374','242518965');
INSERT INTO Has (SeqCde, StudId)
  VALUES ('521374','141582651');
INSERT INTO Has (SeqCde, StudId)
  VALUES ('521374','011564812');
INSERT INTO Has (SeqCde, StudId)
  VALUES ('521374','254099823');
INSERT INTO Has (SeqCde, StudId)
  VALUES ('521374','356187925');
INSERT INTO Has (SeqCde, StudId)
  VALUES ('521374','489456522');
INSERT INTO Has (SeqCde, StudId)
  VALUES ('519054','142519864');
INSERT INTO Has (SeqCde, StudId)
  VALUES ('519054','242518965');
INSERT INTO Has (SeqCde, StudId)
  VALUES ('519054','141582651');
INSERT INTO Has (SeqCde, StudId)
  VALUES ('519054','011564812');
INSERT INTO Has (SeqCde, StudId)
  VALUES ('519054','254099823');
INSERT INTO Has (SeqCde, StudId)
  VALUES ('519054','356187925');
INSERT INTO Has (SeqCde, StudId)
  VALUES ('519054','489456522');
INSERT INTO Has (SeqCde, StudId)
  VALUES ('514684','142519864');
INSERT INTO Has (SeqCde, StudId)
  VALUES ('514684','242518965');
INSERT INTO Has (SeqCde, StudId)
  VALUES ('514684','141582651');
INSERT INTO Has (SeqCde, StudId)
  VALUES ('514684','011564812');
INSERT INTO Has (SeqCde, StudId)
  VALUES ('514684','254099823');
INSERT INTO Has (SeqCde, StudId)
  VALUES ('514684','356187925');
INSERT INTO Has (SeqCde, StudId)
  VALUES ('514684','489456522');
INSERT INTO Has (SeqCde, StudId)
  VALUES ('529834','142519864');
INSERT INTO Has (SeqCde, StudId)
  VALUES ('529834','242518965');
INSERT INTO Has (SeqCde, StudId)
  VALUES ('529834','141582651');
INSERT INTO Has (SeqCde, StudId)
  VALUES ('529834','011564812');
INSERT INTO Has (SeqCde, StudId)
  VALUES ('529834','254099823');
INSERT INTO Has (SeqCde, StudId)
  VALUES ('529834','356187925');
INSERT INTO Has (SeqCde, StudId)
  VALUES ('529834','489456522');
INSERT INTO Has (SeqCde, StudId)
  VALUES ('529894','141582651');
INSERT INTO Has (SeqCde, StudId)
  VALUES ('529894','011564812');
INSERT INTO Has (SeqCde, StudId)
  VALUES ('529894','254099823');
INSERT INTO Has (SeqCde, StudId)
  VALUES ('529894','356187925');
INSERT INTO Has (SeqCde, StudId)
  VALUES ('529894','489456522');

REM Setting width of columns when displaying
column enrolldate format A10
column tuition    format $9,999.99
column lname      format A10
column fname      format A10
column major      format A7
