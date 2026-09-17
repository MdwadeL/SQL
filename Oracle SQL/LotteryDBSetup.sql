SET SERVEROUTPUT ON;
--
-- This script is used to test various concepts
--
PROMPT Database setup is running . . . 

-- Drop Tables
drop table Receives cascade constraint; 
drop table Takes cascade constraint;
drop table Advised cascade constraint;
drop table Semester cascade constraint;
drop table Course cascade constraint;
drop table Student cascade constraint;
drop table Institution cascade constraint;
drop table Scholarship_Type cascade constraint;
drop table faculty cascade constraint;
DROP TABLE DUMMY cascade constraint;

-- Create Tables
CREATE TABLE Faculty(
 FactId       Char(5) Constraint faculty_pk primary key,
 FName        VarChar2(10),
 LName        VarChar2(20),
 Rank         VarChar2(20),
 Salary       Number(9,2)
);

CREATE TABLE Scholarship_Type(
 ScholarshipId      Number(2) Constraint   ScholarshipId_pk001 Primary Key,
 Name               VarChar2(10)
);

CREATE TABLE Institution(
 SchoolCde      Number(4) Constraint   SchoolCde_pk001 Primary Key,
 Name           VarChar2(30)
);


CREATE TABLE Student(
 StudId       Char(9) Constraint studentid_pk001 Primary Key,
 FName        VarChar2 (10),
 LName        VarChar2(20),
 Tuition      Number(9,2),
 FinancialAid Number(9,2),
 Major        VarChar2(16),
 Gender       Char(1),
 EnrollDate    Date,
 SchoolCde    Number(4),
 Constraint  student_SchoolCde_fk001  Foreign Key (SchoolCde) 
                References Institution(SchoolCde)
);


CREATE TABLE Course(
 SeqCde       Char(6) Constraint  seqcde_pk001 Primary Key,
 CourseName   VarChar2(35),
 MeetingDays  VarChar2(24),
 Sect         Char(3),
 Hours        Number(1),
 ProfName     VarChar2(10)
);


CREATE TABLE Semester(
  Semester     VarChar2(6) Constraint semester_pk001 Primary Key,
  Tuition      Number(6,2),
  BudgetCut    Char(1)
);


CREATE TABLE Advised(
 StudId       Char(9),
 FactId       Char(5),
 Semester     VarChar2(6),
 Constraint  Advised_pk001  Primary Key (StudId, FactId,Semester), 
 Constraint  Advised_fk001  Foreign Key (StudId) 
                 References Student(StudId),
 Constraint  Advised_fk002  Foreign Key (FactId) 
                References Faculty(FactId)
);

		    
CREATE TABLE Takes(
 StudId       Char(9),
 SeqCde       Char(6),
 Semester     VarChar2(6),
 grade        number(3),
 Constraint  takes_pk001  Primary Key (StudId, SeqCde,Semester), 
 Constraint  studid_fk001  Foreign Key (StudId) 
                 References Student(StudId),
 Constraint  seqcde_fk001  Foreign Key (SeqCde) 
                References Course (SeqCde)
);

CREATE TABLE Receives(
 StudId          Char(9),
 ScholarshipId    Number(2),
 Semester        VarChar2(6),
 Amount          Number(9,2),
 Constraint  Receives_pk001  Primary Key (StudId, ScholarshipId,Semester), 
 Constraint  Receives_studid_fk001  Foreign Key (StudId) 
                 References Student(StudId),
 Constraint  Receives_ScholarshipId_fk001  Foreign Key (ScholarshipId) 
                References Scholarship_Type(ScholarshipId)
);

CREATE TABLE DUMMY
      ( DUMMY NUMBER );

INSERT INTO DUMMY VALUES (0);

-- Load the Faculty Table
INSERt INTO Faculty(FactId, FName, LName, Rank, Salary)
    VaLUES('10001', 'Ron', 'Fulbright', 'Associate Professor', 75000);

INSERt INTO Faculty(FactId, FName, LName, Rank, Salary)
    VaLUES('10002', 'Ric', 'Routh', 'Instructor', 68000);

INSERt INTO Faculty(FactId, FName, LName, Rank, Salary)
    VaLUES('10003', 'Carol', 'Tesh', 'Instructor', 70000);

INSERt INTO Faculty(FactId, FName, LName, Rank, Salary)
    VaLUES('10004', 'Tyrone', 'Toland', 'Assistant Professor', 63000);

INSERt INTO Faculty(FactId, FName, LName, Rank, Salary)
    VaLUES('10005', 'Angelina', 'Tzacheva', 'Assistant Professor', 65000);

-- Load the Course Table
INSERT INTO Course (SeqCde, CourseName, MeetingDays, Sect, Hours, ProfName)
  VALUES ('523764','SEGL W101 - COMPOSITION I',
  'M-W-F 9:00am - 9:50am','001',3,'TAYLOR N');
INSERT INTO Course (SeqCde, CourseName, MeetingDays, Sect, Hours, ProfName)
  VALUES ('586359','SEGL W102 - COMPOSITION II',
  'M-W-F 9:00am - 9:50am','001',3,NULL);
INSERT INTO Course (SeqCde, CourseName, MeetingDays, Sect, Hours, ProfName)
  VALUES ('521954','SMTH W121 - COLLEGE ALGEBRA', 
  'M-W-F 10:00am - 10:50am','001',3,'WHITE W');
INSERT INTO Course (SeqCde, CourseName, MeetingDays, Sect, Hours, ProfName)
  VALUES ('521374','SCSC W138 - INTRO TO COMPUTER TECH',
  'T-Th 8:00am - 9:15am','001',3,'SPIESS E');
INSERT INTO Course (SeqCde, CourseName, MeetingDays, Sect, Hours, ProfName)
  VALUES ('519054','SHST W111 - INTRO EUROPEAN HISTORY',
  'T-Th 10:50am - 12:05pm','001',3,'BOGGS S');
INSERT INTO Course (SeqCde, CourseName, MeetingDays, Sect, Hours, ProfName)
  VALUES ('529834','SIMS W139 - VISUAL BASIC I',
  'T-Th 2:35pm - 3:50pm','001',3,'TOLAND T');
INSERT INTO Course (SeqCde, CourseName, MeetingDays, Sect, Hours, ProfName)
  VALUES ('514684','SIMS W239 - VISUAL BASIC II',
  'T-Th 2:35pm - 3:50pm','001',3,'Williams D');
INSERT INTO Course (SeqCde, CourseName, MeetingDays, Sect, Hours, ProfName)    VALUES ('529894','SIMS W421 - DATA WAREHOUSING TECH',
  'T-Th 2:35pm - 3:50pm','001',3,'Toland T');
INSERT INTO Course (SeqCde, CourseName, MeetingDays, Sect, Hours, ProfName)    VALUES ('568709','SIMS W347 - WEBPAGE CONSTRUCTION',
  'M-W 6:00pm - 7:15pm','101',3,'AHNER A');
INSERT INTO Course (SeqCde, CourseName, MeetingDays, Sect, Hours, ProfName)    VALUES ('568099','SSPH W201 - PUBLIC SPEAKING',
  'T-Th 3:05pm - 4:20pm','016',3,'CURTIS J');
INSERT INTO Course (SeqCde, CourseName, MeetingDays, Sect, Hours, ProfName)
  VALUES ('586049','SEGL W101 - COMPOSITION I',
  'M-W-F 9:00am - 9:50am','002',3,NULL);

INSERT INTO Scholarship_Type(ScholarshipId,Name)
  VALUES(1, 'LIFE');

INSERT INTO Scholarship_Type(ScholarshipId,Name)
  VALUES(2, 'HOPE');

INSERT INTO Scholarship_Type(ScholarshipId,Name)
  VALUES(3, 'Palmetto');

INSERT INTO Institution(SchoolCde,Name)
  VALUES(5850, 'USC Upstate');

INSERT INTO Institution(SchoolCde,Name)
  VALUES(5818, 'USC Columbia');

INSERT INTO Institution(SchoolCde,Name)
  VALUES(5846, 'USC Union');

INSERT INTO Institution(SchoolCde,Name)
  VALUES(5668, 'Spartanburg Technical College');

INSERT INTO Institution(SchoolCde,Name)
  VALUES(5278, 'Greenville Technical College');

INSERT INTO Institution(SchoolCde,Name)
  VALUES(5442, 'Francis Marion University');

INSERT INTO Institution(SchoolCde,Name)
  VALUES(5111, 'Clemson University');

INSERT INTO Institution(SchoolCde,Name)
  VALUES(5910, 'Winthrop University');

INSERT INTO Institution(SchoolCde,Name)
  VALUES(5363, 'Lander University');


-- *************************************************
--                      FUNCTIONS

-- Check to see if the same Take entry is randomly
-- generated, because the same student cannot be
-- placed in the same course in the same semester.

-- ************************************************
CREATE or REPLACE FUNCTION 
  isStudentInCourse(id varchar2, sc varchar2, sem varchar2)

  RETURN boolean

  IS 
     b boolean := false;
     x number := 0;
     tTrace   boolean := false;
   
begin
 

  select count(*) into x
     from takes
       where studid = id and seqcde = sc and semester = sem;

  if x = 1 then
     if tTrace then
        dbms_output.put_line('true');
     end if;
      b := true;
  else
     if tTrace then
        dbms_output.put_line('false');
     end if;
      b := false;
  end if;

   return b;

end isStudentInCourse;
/	

-- *************************************************
--                      FUNCTIONS

-- Check to see if the same Take entry is randomly
-- generated, because the same student cannot be
-- placed in the same course in the same semester.

-- ************************************************
CREATE or REPLACE FUNCTION 
  isSemesterLoaded(sem varchar2)

  RETURN boolean

  IS 
     b boolean := false;
     x number := 0;
     tTrace   boolean := false;
   
begin
 
  select count(*) into x
     from Semester
       where semester = UPPER(sem);

  if x = 1 then
     if tTrace then
        dbms_output.put_line('true');
     end if;
      b := true;
  else
     if tTrace then
        dbms_output.put_line('false');
     end if;
      b := false;
  end if;

   return b;

end isSemesterLoaded;

/	


-- *************************************************
--                      Procedure

-- This procedure will assign advisors to the 
-- students. This procedure will read the student
-- table and randomly assign advisors for a particular
-- semester.

-- ************************************************
CREATE or REPLACE Procedure AssignAdvisors
 (inStudId IN Char, inFactId IN Number, inSemester IN VarChar2) 

 IS

     mTrace boolean := false;

     qte            varchar2(1) := CHR(39);

     x           number(1)  := 0;
    tAdvisorQ    varchar2(200); 


  BEGIN

   if mTrace = true then
     dbms_output.put_line('instudid = ' || inStudId ||
        ' infactid = ' || inFactId || ' inSemester = ' || inSemester);

   end if;


   select count(*) into x
     from Advised
       where studid = inStudId and factid = inFactId and 
        Semester = inSemester;


   if x = 0 then -- No Avisor assigned for that semester

    if mTrace = true then
         dbms_output.put_line('No advisor assigned!!!!');
      end if;


    tAdvisorQ   := 'insert into Advised values(' || qte ||
      inStudId  || qte || ',' || qte ||
      inFactId   || qte || ',' ||  qte ||
      inSemester ||  qte || ')';
                


      if mTrace = true then
         dbms_output.put_line(tAdvisorQ || ';');
      end if;

       EXECUTE IMMEDIATE tAdvisorQ;


  ELSE 
    if mTrace = true then
         dbms_output.put_line('Advisor assigned!!!!');
      end if;
      
 end if;




end AssignAdvisors;
/

-- 
--   The main procedure to create the Lottery Database
-- 

-- ************************************************
CREATE or REPLACE Procedure LotteryDBSetup(inNum IN Number) 

 IS

   mTrace      boolean := false;
   mBol        boolean;
   ssn3        dbms_utility.name_array;
   sem         dbms_utility.name_array;

   j           number;
   i           number;
   k           number;
   l           number;
   m           number;
   y           number;

--   tStudId        varchar2(9);
   StudId        Student.StudId%TYPE;

   tFName         dbms_utility.name_array;
    Fname          Student.FName%TYPE;

   tLName         dbms_utility.name_array; 
    LName         Student.LName%TYPE;

    Tuition       Student.Tuition%TYPE;   
    FinancialAid  Student.FinancialAid%TYPE;

    tMajor         dbms_utility.name_array;
    Major         Student.Major%TYPE;

    tEnrollDate	  dbms_utility.name_array;
    EnrollDate     VarChar2(25);

   tStudentQ      varchar2(200);
   tTakesQ        varchar2(200);
   tSemesterQ     varchar2(200);
   tReceivesQ     varchar2(200);

   tSeqCde        dbms_utility.name_array;

-- Scholarship Info

CURSOR c1 IS
  SELECT ScholarshipId FROM Scholarship_Type;

CURSOR c2 IS
  SELECT schoolcde FROM Institution;


 tScholarshipId         dbms_utility.name_array;
 ScholarshipId  	Scholarship_Type.ScholarshipId%TYPE;
-- tScholarName           dbms_utility.name_array;
-- ScholarName            Scholarship_Type.Name%TYPE;

-- Institution Info

 tSchoolCde            dbms_utility.name_array;
 SchoolCde             Institution.SchoolCde%TYPE;
-- tSchoolName           dbms_utility.name_array; 
-- SchoolName            Institution.Name%TYPE;
  Amount                Receives.Amount%TYPE;

   qte            varchar2(1) := CHR(39);

    gSeqCde     Takes.SeqCde%TYPE;
    theYear     DATE;

    tSemester     Takes.Semester%TYPE;
    tGrade        Takes.Grade%TYPE;

    tGender         dbms_utility.name_array;
    FNameIdx         number;
    lotteryIdx       number(3);

    Gender           Char(1);
    num2             number;
    SemTuition       number;
    BudgetCut        Char(1);
    theYY            Char(2);

    tFactId          Number(5);

    TotalFact        Number(10);
    TotalScholarships     Number(2);
    TotalInstitues       Number(3);
    NumSemester       Number(9);
    
    rand_value       number(1);

    exq              number;
    
    Num number;




BEGIN
Num := inNum;

--Load the number of faculty
  select count(*) into TotalFact
   from faculty;

  select count(*) into TotalScholarships
   from Scholarship_Type;

  select count(*) into TotalInstitues
   from Institution;

-- User a Cursor to Load Arrays


  lotteryIdx  := 1;

  FOR item IN c1 LOOP

    tScholarshipId(lotteryIdx) := item.ScholarshipId;
    lotteryIdx := lotteryIdx + 1;


  END LOOP;

  lotteryIdx  := 1;
  FOR item IN c2 LOOP

    tSchoolCde(lotteryIdx) := item.schoolcde;
    lotteryIdx := lotteryIdx + 1;

  END LOOP;


-- Manually Load Arrays

   ssn3(1) := '150';
   ssn3(2) := '250';
   ssn3(3) := '350';
   ssn3(4) := '450';
   ssn3(5) := '550';

   sem(1)   := 'Fa';
   sem(2)   := 'Sp';
   sem(3)   := 'May';
   sem(4)   := 'SuI';
   sem(5)   := 'SuII';

    SemTuition := 2600;

   tFName(1) := 'Susan';
   tFName(2) := 'James';
   tFName(3) := 'Mary';
   tFName(4) := 'John';
   tFName(5) := 'Patricia';
   tFName(6) := 'Robert';
   tFName(7) := 'Linda';
   tFName(8) := 'Michael';


   tLName(1) := 'Martin';
   tLName(2) := 'Smith';
   tLName(3) := 'Johnson';
   tLName(4) := 'Williams';
   tLName(5) := 'Jones';
   tLName(6) := 'Brown';
   tLName(7) := 'Davis';
   tLName(8) := 'Miller';

   tGender(1) := 'F';
   tGender(2) := 'M';
   tGender(3) := 'F';
   tGender(4) := 'M';
   tGender(5) := 'F';
   tGender(6) := 'M';
   tGender(7) := 'F';
   tGender(8) := 'M';
   
   

   tMajor(1) := 'IMS - B';
   tMajor(2) := 'IMS - C';
   tMajor(3) := 'IMS - E';
   tMajor(4) := 'IMS - H';
   tMajor(5) := 'CS';
   tMajor(6) := 'English';
   tMajor(7) := 'Math';
   tMajor(8) := 'Nursing';
   tMajor(9) := 'Business';
   tMajor(10) := 'CSE';
   tMajor(11) := 'Education';
   tMajor(12) := 'Communications';
   tMajor(13) := 'Sociology';
   tMajor(14) := 'Psychology';
   tMajor(15) := 'Sociology';

   tEnrollDate(1) := '2012-01-15 8:31 AM';
   tEnrollDate(2) := '2012-08-15 9:00 AM';
   tEnrollDate(3) := '2013-01-15 10:22 AM';
   tEnrollDate(4) := '2013-05-15 4:00 AM';
   tEnrollDate(5) := '2013-08-15 11:45 AM';
   tEnrollDate(6) := '2014-08-15 1:00 AM';
   tEnrollDate(7) := '2015-01-15 9:38 AM';
   tEnrollDate(8) := '2015-08-15 11:45 AM';



   tSeqCde(1)    := '514684';
   tSeqCde(2)    := '519054';
   tSeqCde(3)    := '521374';
   tSeqCde(4)    := '521954';
   tSeqCde(5)    := '523764';
   tSeqCde(6)    := '529834';
   tSeqCde(7)    := '529894';
   tSeqCde(8)    := '586359';
   tSeqCde(9)    := '568709';
   tSeqCde(10)   := '568099';
   tSeqCde(11)   := '586049';

-- Seeding the Number Generator

  dbms_random.seed(1234535678);

-- building studid

   for i in 1..Num  loop

      j := mod(i,5);

      if (j = 0) then

         j := j + 1;

      end if;

      num2 := trunc(dbms_random.value(1, 99));

      if num2 < 10 then

	  StudId := ssn3(j) || '0' || num2 ||  (5000 + i);
       else
	      
         StudId := ssn3(j) || num2  ||  (5000 + i);
	 
      end if;
      

      Tuition      := trunc(dbms_random.value(3000, 5500));
      FinancialAid := trunc(dbms_random.value(5000, 16000));
      FNameIdx     := trunc(dbms_random.value(1, 8));
      
      FName  := tFName(FNameIdx);
      Gender := tGender(FNameIdx);

      LName     := tLName(trunc(dbms_random.value(1, 8)));
      Major     := tMajor(trunc(dbms_random.value(1, 15)));
      EnrollDate := tEnrollDate(trunc(dbms_random.value(1, 8)));

      SchoolCde     := tSchoolCde(trunc(dbms_random.value(1, TotalInstitues)));

      tStudentQ := 'insert into student values(' || qte ||
      StudId || qte || ',' || qte ||
      FName  || qte || ',' ||  qte ||
      LName ||  qte || ',' || 
      Tuition || ',' || FinancialAid || ',' || qte || 
      Major || qte ||',' || qte || Gender || qte || ',' 
      ||  'TO_DATE(' || qte ||
      EnrollDate || qte || ',' 
      || qte || 'YYYY-MM-DD HH:MI AM' || qte || ')' || ',' || SchoolCde
      || ')';
       

      if mTrace = true then
         dbms_output.put_line(tStudentQ || ';');
      end if;

       EXECUTE IMMEDIATE tStudentQ;

       y := 1;
       theYear     := sysdate;

       theYear     := ADD_MONTHS(theYear,-72);
              
		
       theYear     := ADD_MONTHS(theYear,y);


    while(y < 8) loop

--  Determine which schoolar ship and institutions

       if y = 1 then  
        
         ScholarshipId := tScholarshipId(dbms_random.value(1, TotalScholarships));

         if ScholarshipId = 1 then
             Amount := 5000/2;

         elsif ScholarshipId = 2  then

            Amount := 2800/2;

         elsif ScholarshipId = 3 then
            Amount  := 7500/2;

         end if;
         

       end if;

        for k in 1..5 loop

-- dbms_output.put_line('semester integer value of k is ' || k);

           if k = 1 or k = 2 then     


              for l in 1..4 loop

                commit;

                gSeqCde := tSeqCde(trunc(dbms_random.value(1, 11)));
                tSemester := sem(k) || to_char(theYear,'YY');
                tSemester := UPPER(tSemester);
		

-- Loading the Student Advisor Information

             rand_value  := dbms_random.value(1, TotalFact);
             tFactId    := rand_value + 10000;
             AssignAdvisors(Studid,Tfactid,Tsemester);


                mBol := isStudentInCourse( StudId,gSeqCde,tSemester); 

                while mBol = true loop 
                 
                    gSeqCde := tSeqCde(trunc(dbms_random.value(1, 11)));
                    mBol := isStudentInCourse( StudId,gSeqCde,tSemester); 
                end loop;

                 tGrade  := dbms_random.value(60, 100); 

                 if mTrace = true then
                   dbms_output.put_line(tGrade);
                 end if;
                  
                  tTakesQ := 'insert into takes values(' ||  qte ||
                   StudId  || qte || ','  || qte || 
                    gSeqCde || qte || ',' 
                    ||  qte ||
                  tSemester || qte || ',' || tGrade || ')';

                 if mTrace = true then
                    dbms_output.put_line(tTakesQ || ';');
                 end if;

                --Will randomanize when a student took a course
                exq := trunc(dbms_random.value(0, 10));

                --dbms_output.put_line('exq := ' || exq);

                if exq > 0 then

                   EXECUTE IMMEDIATE tTakesQ;
                   commit;

                end if;




              end loop; -- for

--              Build and Load Scholarship - Fall and Spring

                tReceivesQ := 'insert into  Receives values(' ||  qte ||
                   StudId  || qte || ','  ||  
                     ScholarshipId  ||  ',' 
                    ||  qte || tSemester || qte || ',' || Amount || ')';

                 if mTrace = true then
                    dbms_output.put_line(tReceivesQ|| ';');
                 end if;

                   EXECUTE IMMEDIATE tReceivesQ;
                   commit;


           else

              for m in 1..2 loop

                commit;

                gSeqCde   := tSeqCde(trunc(dbms_random.value(1, 11)));
                tSemester := sem(k) || to_char(theYear,'YY');
                tSemester := UPPER(tSemester);
                
                
		
                mBol      := isStudentInCourse( StudId,gSeqCde,tSemester); 

                while mBol = true loop 
                    gSeqCde := tSeqCde(trunc(dbms_random.value(1, 11)));
                    mBol    := isStudentInCourse( StudId,gSeqCde,tSemester); 
                end loop;

                tGrade  := dbms_random.value(60, 100);

                tTakesQ := 'insert into takes values(' ||  qte ||
                   StudId  || qte || ','  || qte || 
                   gSeqCde || qte || ',' 
                   ||  qte ||
                   tSemester || qte || ',' || tGrade || ')';

                if mTrace = true then
                     dbms_output.put_line(tTakesQ || ';');
                end if;

                --Will randomanize when a student took a course
                exq := trunc(dbms_random.value(0, 10));

                --dbms_output.put_line('exq := ' || exq);

                if exq > 0 then

                   EXECUTE IMMEDIATE tTakesQ;
                   commit;

                end if;

              end loop; --for

--              Build and Load Scholarship - May and Summer

                tReceivesQ := 'insert into  Receives values(' ||  qte ||
                   StudId  || qte || ','  ||  
                     ScholarshipId  ||  ',' 
                    ||  qte || tSemester || qte || ',' || Amount || ')';

                 if mTrace = true then
                    dbms_output.put_line(tReceivesQ|| ';');
                 end if;

                   EXECUTE IMMEDIATE tReceivesQ;
                   commit;



           end if;

--Load the Semester table here
           if isSemesterLoaded(tSemester) = FALSE then
              If K = 1 Then
		            Semtuition := 2655;
	           Else
		            Semtuition := Semtuition * 1.09;
	           end if;
		    
	            theYY := SUBSTR(tSemester,Length(tSemester)-1, 2);
	      
	      --load semester table
              if theYY = '08' OR theYY = '09' then
		 
                 Tsemesterq := 'INSERT INTO Semester VALUES(' ||  Qte ||
		             Tsemester ||  Qte || ',' || Semtuition || ',' ||
		             Qte || 'Y' || Qte || ')';
	           Else
	               Tsemesterq := 'INSERT INTO Semester VALUES(' ||  Qte ||
		             tSemester ||  qte || ',' || SemTuition || ',' ||
		             Qte || 'N' || Qte || ')';
	           end if;

        

             EXECUTE IMMEDIATE tSemesterQ;
             commit;


-- Loading the Student Advisor Information

           --  rand_value  := dbms_random.value(1, TotalFact);
            -- tFactId    := rand_value + 10000;
           --  AssignAdvisors(StudId,tFactId,tSemester);

	    
           end if;
	   
     end loop;
     
  
       y := y + 1;
       theYear     := ADD_MONTHS(theYear,12);

   end loop; -- while
  end loop; -- for  


--- Add Code to remove extra lottery
    theYear     := ADD_MONTHS(theYear,(-6*12)); -- move back 

    for i in 1..2 loop


        tReceivesQ := 'delete from Receives ' ||  
                      'WHERE semester like ' || qte || '%'  ||  
                    to_char(theYear,'YY')   || qte || ' ';
										
--        dbms_output.put_line(tReceivesQ|| ';');
				
        if mTrace = true then
           dbms_output.put_line(tReceivesQ|| ';');
        end if;

        EXECUTE IMMEDIATE tReceivesQ;
        commit;

--      Advised

        tReceivesQ := 'delete from Advised ' ||  
                      'WHERE semester like ' || qte || '%'  ||  
                    to_char(theYear,'YY')   || qte || ' ';
										
--        dbms_output.put_line(tReceivesQ|| ';');
				
        if mTrace = true then
           dbms_output.put_line(tReceivesQ|| ';');
        end if;

        EXECUTE IMMEDIATE tReceivesQ;
        commit;


--      Takes
        tReceivesQ := 'delete from Takes ' ||  
                      'WHERE semester like ' || qte || '%'  ||  
                    to_char(theYear,'YY')   || qte || ' ';
										
--        dbms_output.put_line(tReceivesQ|| ';');
				
        if mTrace = true then
           dbms_output.put_line(tReceivesQ|| ';');
        end if;

        EXECUTE IMMEDIATE tReceivesQ;
        commit;


--      Semester

        tReceivesQ := 'delete from Semester ' ||  
                      'WHERE semester like ' || qte || '%'  ||  
                    to_char(theYear,'YY')   || qte || ' ';
										
--        dbms_output.put_line(tReceivesQ|| ';');
				
        if mTrace = true then
           dbms_output.put_line(tReceivesQ|| ';');
        end if;

        EXECUTE IMMEDIATE tReceivesQ;
        commit;








        theYear     := ADD_MONTHS(theYear,-12);

     end loop; -- end of loop




--Adding the Semester fk to Takes
   tSemesterQ := 'Alter Table Takes ' ||
                 'Add Constraint  Takes_semesterid_fk002 ' || 
                 'Foreign Key (Semester) ' ||
                   'References Semester(Semester)';

   EXECUTE IMMEDIATE tSemesterQ;

--  dbms_output.put_line('Database successfully built and loaded . . . ');

END;




/

column EnrollDate format a9
column lname      format a9
column major format a9
column FinancialAid format $99,999.99

EXEC    LotteryDBSetup(15)
/

set termout on
set termout off
set feedback off

DROP TABLE "SEMESTER" CASCADE CONSTRAINT;
--------------------------------------------------------
--  DDL for Table SEMESTER
--------------------------------------------------------

CREATE TABLE "SEMESTER" (
 "SEMESTER" VARCHAR2(6), 
 "TUITION" NUMBER(6,2), 
 "BUDGETCUT" CHAR(1), 
 "SEMESTERDATE" DATE);
 
REM INSERTING into SEMESTER
SET DEFINE OFF;
Insert into SEMESTER (SEMESTER,TUITION,BUDGETCUT,SEMESTERDATE) values ('FA' || TO_CHAR(ADD_MONTHS(sysdate,-48),'YY'),2655,'N',to_date('01-AUG-' || TO_CHAR(ADD_MONTHS(sysdate,-48),'YY'),'DD-MON-RR'));
Insert into SEMESTER (SEMESTER,TUITION,BUDGETCUT,SEMESTERDATE) values ('SP' || TO_CHAR(ADD_MONTHS(sysdate,-48),'YY'),2893.95,'N',to_date('01-JAN-' || TO_CHAR(ADD_MONTHS(sysdate,-48),'YY'),'DD-MON-RR'));
Insert into SEMESTER (SEMESTER,TUITION,BUDGETCUT,SEMESTERDATE) values ('MAY' || TO_CHAR(ADD_MONTHS(sysdate,-48),'YY'),3154.41,'N',to_date('01-MAY-' || TO_CHAR(ADD_MONTHS(sysdate,-48),'YY'),'DD-MON-RR'));
Insert into SEMESTER (SEMESTER,TUITION,BUDGETCUT,SEMESTERDATE) values ('SUI' || TO_CHAR(ADD_MONTHS(sysdate,-48),'YY'),3438.3,'N',to_date('01-JUN-' || TO_CHAR(ADD_MONTHS(sysdate,-48),'YY'),'DD-MON-RR'));
Insert into SEMESTER (SEMESTER,TUITION,BUDGETCUT,SEMESTERDATE) values ('SUII' || TO_CHAR(ADD_MONTHS(sysdate,-48),'YY'),3747.75,'N',to_date('01-JUL-' || TO_CHAR(ADD_MONTHS(sysdate,-48),'YY'),'DD-MON-RR'));
Insert into SEMESTER (SEMESTER,TUITION,BUDGETCUT,SEMESTERDATE) values ('FA' || TO_CHAR(ADD_MONTHS(sysdate,-36),'YY'),2655,'N',to_date('01-AUG-' || TO_CHAR(ADD_MONTHS(sysdate,-36),'YY'),'DD-MON-RR'));
Insert into SEMESTER (SEMESTER,TUITION,BUDGETCUT,SEMESTERDATE) values ('SP' || TO_CHAR(ADD_MONTHS(sysdate,-36),'YY'),2893.95,'N',to_date('01-JAN-' || TO_CHAR(ADD_MONTHS(sysdate,-36),'YY'),'DD-MON-RR'));
Insert into SEMESTER (SEMESTER,TUITION,BUDGETCUT,SEMESTERDATE) values ('MAY' || TO_CHAR(ADD_MONTHS(sysdate,-36),'YY'),3154.41,'N',to_date('01-MAY-' || TO_CHAR(ADD_MONTHS(sysdate,-36),'YY'),'DD-MON-RR'));
Insert into SEMESTER (SEMESTER,TUITION,BUDGETCUT,SEMESTERDATE) values ('SUI' || TO_CHAR(ADD_MONTHS(sysdate,-36),'YY'),3438.3,'N',to_date('01-JUN-' || TO_CHAR(ADD_MONTHS(sysdate,-36),'YY'),'DD-MON-RR'));
Insert into SEMESTER (SEMESTER,TUITION,BUDGETCUT,SEMESTERDATE) values ('SUII' || TO_CHAR(ADD_MONTHS(sysdate,-36),'YY'),3747.75,'N',to_date('01-JUL-' || TO_CHAR(ADD_MONTHS(sysdate,-36),'YY'),'DD-MON-RR'));
Insert into SEMESTER (SEMESTER,TUITION,BUDGETCUT,SEMESTERDATE) values ('FA' || TO_CHAR(ADD_MONTHS(sysdate,-24),'YY'),2655,'N',to_date('01-AUG-' || TO_CHAR(ADD_MONTHS(sysdate,-24),'YY'),'DD-MON-RR'));
Insert into SEMESTER (SEMESTER,TUITION,BUDGETCUT,SEMESTERDATE) values ('SP' || TO_CHAR(ADD_MONTHS(sysdate,-24),'YY'),2893.95,'N',to_date('01-JAN-' || TO_CHAR(ADD_MONTHS(sysdate,-24),'YY'),'DD-MON-RR'));
Insert into SEMESTER (SEMESTER,TUITION,BUDGETCUT,SEMESTERDATE) values ('MAY' || TO_CHAR(ADD_MONTHS(sysdate,-24),'YY'),3154.41,'N',to_date('01-MAY-' || TO_CHAR(ADD_MONTHS(sysdate,-24),'YY'),'DD-MON-RR'));
Insert into SEMESTER (SEMESTER,TUITION,BUDGETCUT,SEMESTERDATE) values ('SUI' || TO_CHAR(ADD_MONTHS(sysdate,-24),'YY'),3438.3,'N',to_date('01-JUN-' || TO_CHAR(ADD_MONTHS(sysdate,-24),'YY'),'DD-MON-RR'));
Insert into SEMESTER (SEMESTER,TUITION,BUDGETCUT,SEMESTERDATE) values ('SUII' || TO_CHAR(ADD_MONTHS(sysdate,-24),'YY'),3747.75,'N',to_date('01-JUL-' || TO_CHAR(ADD_MONTHS(sysdate,-24),'YY'),'DD-MON-RR'));
Insert into SEMESTER (SEMESTER,TUITION,BUDGETCUT,SEMESTERDATE) values ('FA' || TO_CHAR(ADD_MONTHS(sysdate,-12),'YY'),2655,'N',to_date('01-AUG-' || TO_CHAR(ADD_MONTHS(sysdate,-12),'YY'),'DD-MON-RR'));
Insert into SEMESTER (SEMESTER,TUITION,BUDGETCUT,SEMESTERDATE) values ('SP' || TO_CHAR(ADD_MONTHS(sysdate,-12),'YY'),2893.95,'N',to_date('01-JAN-' || TO_CHAR(ADD_MONTHS(sysdate,-12),'YY'),'DD-MON-RR'));
Insert into SEMESTER (SEMESTER,TUITION,BUDGETCUT,SEMESTERDATE) values ('MAY' || TO_CHAR(ADD_MONTHS(sysdate,-12),'YY'),3154.41,'N',to_date('01-MAY-' || TO_CHAR(ADD_MONTHS(sysdate,-12),'YY'),'DD-MON-RR'));
Insert into SEMESTER (SEMESTER,TUITION,BUDGETCUT,SEMESTERDATE) values ('SUI' || TO_CHAR(ADD_MONTHS(sysdate,-12),'YY'),3438.3,'N',to_date('01-JUN-' || TO_CHAR(ADD_MONTHS(sysdate,-12),'YY'),'DD-MON-RR'));
Insert into SEMESTER (SEMESTER,TUITION,BUDGETCUT,SEMESTERDATE) values ('SUII' || TO_CHAR(ADD_MONTHS(sysdate,-12),'YY'),3747.75,'N',to_date('01-JUL-' || TO_CHAR(ADD_MONTHS(sysdate,-12),'YY'),'DD-MON-RR'));
Insert into SEMESTER (SEMESTER,TUITION,BUDGETCUT,SEMESTERDATE) values ('FA' || TO_CHAR(sysdate,'YY'),2655,'N',to_date('01-AUG-' || TO_CHAR(sysdate,'YY'),'DD-MON-RR'));
Insert into SEMESTER (SEMESTER,TUITION,BUDGETCUT,SEMESTERDATE) values ('SP' || TO_CHAR(sysdate,'YY'),2893.95,'N',to_date('01-JAN-' || TO_CHAR(sysdate,'YY'),'DD-MON-RR'));
Insert into SEMESTER (SEMESTER,TUITION,BUDGETCUT,SEMESTERDATE) values ('MAY' || TO_CHAR(sysdate,'YY'),3154.41,'N',to_date('01-MAY-' || TO_CHAR(sysdate,'YY'),'DD-MON-RR'));
Insert into SEMESTER (SEMESTER,TUITION,BUDGETCUT,SEMESTERDATE) values ('SUI' || TO_CHAR(sysdate,'YY'),3438.3,'N',to_date('01-JUN-' || TO_CHAR(sysdate,'YY'),'DD-MON-RR'));
Insert into SEMESTER (SEMESTER,TUITION,BUDGETCUT,SEMESTERDATE) values ('SUII' || TO_CHAR(sysdate,'YY'),3747.75,'N',to_date('01-JUL-' || TO_CHAR(sysdate,'YY'),'DD-MON-RR'));
COMMIT; 

--------------------------------------------------------
--  DDL for Index SEMESTER_PK001
--------------------------------------------------------
 
 
  CREATE UNIQUE INDEX "SEMESTER_PK001" ON "SEMESTER" ("SEMESTER");
  
  COMMIT;  
--------------------------------------------------------
--  Constraints for Table SEMESTER
--------------------------------------------------------

  ALTER TABLE "SEMESTER" ADD CONSTRAINT "SEMESTER_PK001" PRIMARY KEY ("SEMESTER") ENABLE;
  COMMIT; 


SET TERMOUT ON
PROMPT Database setup successfully ends . . . 

set feedback ON