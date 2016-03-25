/*CHECK CONSTRAÝNT
Bir Sütune girilebilecek deðeri sýnýrlamak için kullanýlýr.
Alter Table tblPerson
Add Constraint CK_tblPerson_Age 
check (AGE>0 and AGE<150) -> Sütun'u iþlemde belirledik.

Not: Null kýsaylanabilir bir deðer olmadýðý için Null girilirse kabul ediyor.
Not: Check Constraints penceresindeki > Table Designer > Check Existing Data... yes deðeri aldýðýnda konuþla uymayan satýr varsa Constraint'i ekleyemeyiz.

Alter Table tblPerson
Add Constraint CK_tblPerson_Age check (AGE>0 and AGE<150)
*/

Use Sample6
Go
Create Table tblPerson
(
ID int Not null Primary key,
Name nvarchar(50) not null,
Email nvarchar(50) not null,
GenderId int null,
Age int null
)
select * from tblPerson
insert into tblPerson values(4,'Sara','s@s.com',2,-970)
insert into tblPerson values(5,'Sara','s@s.com',2,NULL)

Delete from tblPerson where ID = 4

Alter Table tblPerson
Drop Constraint CK_tblPerson_Age

Alter Table tblPerson
Add Constraint CK_tblPerson_Age check (AGE>0 and AGE<150)
