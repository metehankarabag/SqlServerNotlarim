/*Updateable View
View'dan aldığımız tablo verilerine Inssert,Update,Delete uygulayabiliriz. Bu durumdaki View'lara Updateable View denir. 

View'da kullandığımız sorgu iki tabloyu birleştiriyorsa ve sol tablonun eşleştirme sütunundaki değeri değiştirerek satırın kullandığı sağ tablo değerlerini değiştirmeyi istiyorsak, View aracılığı ile yaptığımız güncelleme hata verebilir. View'lar veri barındırmadığı için yaptığımız değişiklikler base tablolara direk uygulanır ve sol tablonun eşleştirme sütunu kullanıcı için bir anlam ifade etmediğinden View'da kullandığımız sorguya eklemedik. Kullanıcı sol tablodaki bir değere göre sağ tablodan aldığımız bir sütununu değerini değiştirirse, sol tabloda bulunan satırın eşleşme sütunundaki değerine göre sağ tablodaki değer değişir. Bu durumda bu değeri kullanan tüm tablolar değişir. Bu işi Instread Of Trigger kullanarak sonraki değerlerde çözeceğiz.

Veri barındırabilen View türü var. -> Indexed View
*/

Create View vwEmployeeDetailsByDepartment
as
Select Id, Name, Salary, Gender, DeptName
from tblEmployee
join tblDepartment
on tblEmployee.DepartmentId = tblDepartment.DeptId

Select * from vwEmployeeDetailsByDepartment


Update vwEmployeeDetailsByDepartment 
set DeptName='IT' where Name = 'John'


CREATE TABLE tblEmployee
(
  Id int Primary Key,
  Name nvarchar(30),
  Salary int,
  Gender nvarchar(10),
  DepartmentId int
)

Insert into tblEmployee values (1,'John', 5000, 'Male', 3)
Insert into tblEmployee values (2,'Mike', 3400, 'Male', 2)
Insert into tblEmployee values (3,'Pam', 6000, 'Female', 1)
Insert into tblEmployee values (4,'Todd', 4800, 'Male', 4)
Insert into tblEmployee values (5,'Sara', 3200, 'Female', 1)
Insert into tblEmployee values (6,'Ben', 4800, 'Male', 3)


SQL Script to create tblDepartment table 
CREATE TABLE tblDepartment
(
 DeptId int Primary Key,
 DeptName nvarchar(20)
)

Insert data into tblDepartment table
Insert into tblDepartment values (1,'IT')
Insert into tblDepartment values (2,'Payroll')
Insert into tblDepartment values (3,'HR')
Insert into tblDepartment values (4,'Admin')

