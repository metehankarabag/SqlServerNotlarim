/*CTE'i update sorgusu ile birlikte kullanabiliriz. CTE'de yapılan değişiklikler CTE'nin kullandığı tabloya uygulanır. Fakat sadece CTE tek bir tablo üzerinde çalışıyorsak. View'da olduğu gibi 2 tablo üzerinde çalışıyorsak ve tek sorgu 2 tabloda da güncelleme yapıyorsa hata veririr, bir sorgudaki değere göre diğer sorgudaki değeri güncelliyorsak hatalı çalışır. (Trigger kullanarak bu sorunu çözemiyoruz. Çünkü CTE kayıtlı bir nesne değil.)


*/
CREATE TABLE tblEmployee
(
  Id int Primary Key,
  Name nvarchar(30),
  Gender nvarchar(10),
  DepartmentId int
)

SQL Script to create tblDepartment table 
CREATE TABLE tblDepartment
(
 DeptId int Primary Key,
 DeptName nvarchar(20)
)

Insert into tblDepartment values (1,'IT')
Insert into tblDepartment values (2,'Payroll')
Insert into tblDepartment values (3,'HR')
Insert into tblDepartment values (4,'Admin')

Insert into tblEmployee values (1,'John', 'Male', 3)
Insert into tblEmployee values (2,'Mike', 'Male', 2)
Insert into tblEmployee values (3,'Pam', 'Female', 1)
Insert into tblEmployee values (4,'Todd', 'Male', 4)
Insert into tblEmployee values (5,'Sara', 'Female', 1)
Insert into tblEmployee values (6,'Ben', 'Male', 3) 

With Employees_Name_Gender
as
(
 Select Id, Name, Gender from tblEmployee
)
Select * from Employees_Name_Gender


With Employees_Name_Gender
as
(
 Select Id, Name, Gender from tblEmployee
)
Update Employees_Name_Gender Set Gender = 'Female' where Id = 1


With EmployeesByDepartment
as
(
 Select Id, Name, Gender, DeptName 
 from tblEmployee
 join tblDepartment
 on tblDepartment.DeptId = tblEmployee.DepartmentId
)
Select * from EmployeesByDepartment


With EmployeesByDepartment
as
(
 Select Id, Name, Gender, DeptName 
 from tblEmployee
 join tblDepartment
 on tblDepartment.DeptId = tblEmployee.DepartmentId
)
Update EmployeesByDepartment set Gender = 'Male' where Id = 1


With EmployeesByDepartment
as
(
 Select Id, Name, Gender, DeptName 
 from tblEmployee
 join tblDepartment
 on tblDepartment.DeptId = tblEmployee.DepartmentId
)
Update EmployeesByDepartment set 
Gender = 'Female', DeptName = 'IT'
where Id = 1

With EmployeesByDepartment
as
(
 Select Id, Name, Gender, DeptName 
 from tblEmployee
 join tblDepartment
 on tblDepartment.DeptId = tblEmployee.DepartmentId
)
Update EmployeesByDepartment set 
DeptName = 'IT' where Id = 1