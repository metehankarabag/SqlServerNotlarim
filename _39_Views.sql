/*View
View'lar kaydedilmiş SQL sorgularıdır. Her zaman birleştirilip gösterilmesi gereken 2 tablo varsa, tabloları birleştiren sorguyu sürekli yazmak yerine, View içinde yazıp View'ı sürekli kullanabiliriz. View her kullanıldığında bu 2 tablonun sonucunu tek tabloymuş gibi vereceği için View'lara sanal tablolar da denebilir. Yani View'ın kullanım amacı veri tabanındaki tabloların hazır kullanımını belirlemek.
 
View'ın Avantajları
1. View'lar hazır kullanım belirlediği için sadece View'lara bakarak yapabileceğimiz işi seçebiliriz. Bu veri tabanı karmaşasını azaltır.
2. Kullanılan tablonun satır ve sütun güvenliğini sağlar. View'da kullandığımız sorguya Where ekleyerek bazı satırları sonuçtan çıkartarak satır güvenliği sağlayabilir veya kullandığımız sorgudan tabloların bazı sütunlarını çıkartarak sütun güvenliğini sağlayabiliriz.
3. Toplu sonuçları göstermek için kullanabiliriz.

Üsttekilerin hepsi aynı mantıkla çalışıyor -> View'lar veri tabanı tablolarının nasıl kullanılabileceğini belirlemek için kullanılır. Gerçek tablolara erişimi engellememiz gerekir.
sp_Helptext ile nasıl oluşturulduğunu görebiliriz.
*/
CREATE TABLE tblEmployee
(
  Id int Primary Key,
  Name nvarchar(30),
  Salary int,
  Gender nvarchar(10),
  DepartmentId int
)

SQL Script to create tblDepartment table: 
CREATE TABLE tblDepartment
(
 DeptId int Primary Key,
 DeptName nvarchar(20)
)

Insert into tblDepartment values (1,'IT')
Insert into tblDepartment values (2,'Payroll')
Insert into tblDepartment values (3,'HR')
Insert into tblDepartment values (4,'Admin')

Insert into tblEmployee values (1,'John', 5000, 'Male', 3)
Insert into tblEmployee values (2,'Mike', 3400, 'Male', 2)
Insert into tblEmployee values (3,'Pam', 6000, 'Female', 1)
Insert into tblEmployee values (4,'Todd', 4800, 'Male', 4)
Insert into tblEmployee values (5,'Sara', 3200, 'Female', 1)
Insert into tblEmployee values (6,'Ben', 4800, 'Male', 3)


Create View vWEmployeesByDepartment
as
Select Id, Name, Salary, Gender, DeptName
from tblEmployee
join tblDepartment
on tblEmployee.DepartmentId = tblDepartment.DeptId


SELECT * from vWEmployeesByDepartment

1 - 
Create View vWITDepartment_Employees
as
Select Id, Name, Salary, Gender, DeptName
from tblEmployee
join tblDepartment
on tblEmployee.DepartmentId = tblDepartment.DeptId
where tblDepartment.DeptName = 'IT'

2 - 
Create View vWEmployeesNonConfidentialData
as
Select Id, Name, Gender, DeptName
from tblEmployee
join tblDepartment
on tblEmployee.DepartmentId = tblDepartment.DeptId

3 - 
Create View vWEmployeesCountByDepartment
as
Select DeptName, COUNT(Id) as TotalEmployees
from tblEmployee
join tblDepartment
on tblEmployee.DepartmentId = tblDepartment.DeptId
Group By DeptName