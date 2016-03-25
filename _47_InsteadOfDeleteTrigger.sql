/*INSTEAD OF DELETE
Geçen derstekiler ile aynı mantık.
VIEW 2 veya daha fazla tablodan oluşmuşsa, bir satır silmeye çalıştığımız zaman hata alırız.

join yerine Subquery kullanılabilir fakat çoğu zaman joın daha hızlıdır. Ne zaman Subquery hızlıdır join ile eklenmek istenen tabloda milyonlarca kayıt varsa ve biz bir kaç tanesini kullanmak istiyorsak Subquery'ler daa hızlı olabilir. Bu çok nadir bir durummuş
*/


Delete from vWEmployeeDetails where Id = 1

Create Trigger tr_vWEmployeeDetails_InsteadOfDelete
on vWEmployeeDetails
instead of delete
as
Begin
 Delete tblEmployee 
 from tblEmployee
 join deleted
 on tblEmployee.Id = deleted.Id
 
 --Subquery
 --Delete from tblEmployee 
 --where Id in (Select Id from deleted)
End

SQL Script to create tblDepartment table 
CREATE TABLE tblDepartment
(
 DeptId int Primary Key,
 DeptName nvarchar(20)
)

CREATE TABLE tblEmployee
(
  Id int Primary Key,
  Name nvarchar(30),
  Gender nvarchar(10),
  DepartmentId int
)
Insert data into tblDepartment table
Insert into tblDepartment values (1,'IT')
Insert into tblDepartment values (2,'Payroll')
Insert into tblDepartment values (3,'HR')
Insert into tblDepartment values (4,'Admin')

Insert data into tblEmployee table
Insert into tblEmployee values (1,'John', 'Male', 3)
Insert into tblEmployee values (2,'Mike', 'Male', 2)
Insert into tblEmployee values (3,'Pam', 'Female', 1)
Insert into tblEmployee values (4,'Todd', 'Male', 4)
Insert into tblEmployee values (5,'Sara', 'Female', 1)
Insert into tblEmployee values (6,'Ben', 'Male', 3)


Create view vWEmployeeDetails
as
Select Id, Name, Gender, DeptName
from tblEmployee 
join tblDepartment
on tblEmployee.DepartmentId = tblDepartment.DeptId

