/*View Limitations
 VIEW'lar parametre almaz. Bunun yerine Inline Table Valued Function kullanarak yapabiliriz. -> Bu Parametreli View yerine kullanılabilir.(Function'da veri tutmaz.)
 Ayrıca View'dan aldığımız sorgu sonucunu filitrelemek için yeni bir sorguya sokabiliriz. Bu sorgu parametre alır.
 Rule ve Default lar VIEW'lerle ilişkilendirilemez. VIEW'lar veri almadığı için bi anlamıda yok(INDEXED VIEW da ne oluyor bilmiyorum.)
 ORDER BY, TOP veya FOR XML belirtilmesse VIEW'larda geçersizdir. 
 VIEW'lar Temporary tablolar üzerinde çalışmaz.
 */
Create View vWEmployeeDetails
@Gender nvarchar(20)
as
Select Id, Name, Gender, DepartmentId
from  tblEmployee
where Gender = @Gender

Create function fnEmployeeDetails(@Gender nvarchar(20))
Returns Table
as
Return 
(Select Id, Name, Gender, DepartmentId
from tblEmployee where Gender = @Gender)

--Calling the function
Select * from dbo.fnEmployeeDetails('Male')

Create View vwOnTempTable
as
Select Id, Name, Gender
from ##TestTempTable


Create View vWEmployeeDetailsSorted
as
Select Id, Name, Gender, DepartmentId
from tblEmployee
order by Id

CREATE TABLE tblEmployee
(
  Id int Primary Key,
  Name nvarchar(30),
  Salary int,
  Gender nvarchar(10),
  DepartmentId int
)

Insert data into tblEmployee table
Insert into tblEmployee values (1,'John', 5000, 'Male', 3)
Insert into tblEmployee values (2,'Mike', 3400, 'Male', 2)
Insert into tblEmployee values (3,'Pam', 6000, 'Female', 1)
Insert into tblEmployee values (4,'Todd', 4800, 'Male', 4)
Insert into tblEmployee values (5,'Sara', 3200, 'Female', 1)
Insert into tblEmployee values (6,'Ben', 4800, 'Male', 3) 



Create Table ##TestTempTable(Id int, Name nvarchar(20), Gender nvarchar(10))

Insert into ##TestTempTable values(101, 'Martin', 'Male')
Insert into ##TestTempTable values(102, 'Joe', 'Female')
Insert into ##TestTempTable values(103, 'Pam', 'Female')
Insert into ##TestTempTable values(104, 'James', 'Male')

