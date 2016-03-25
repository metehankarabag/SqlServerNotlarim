/*CTE
CTE sadece kendisinden sonra gelen sorgu ile çalıştırabilen geçici bir sonuç setidir.
Oluşturmak için
With CTEName
as
(
	Sorgu
)
CTE'i oluştururken  CTE adından sonra parantezler içinde CTE sütunlarını belirleyebiliriz. (Optional'dır). Bu sütunlar değerlerini CTE içindeki sorgudan alır. Sorgunun sütun değerleri sıra ile CTE sütunlarına atılır. CTE'de sütun belirlemenın amacı sütun adlarını değiştirmektir. Değiştirmeyi istemiyorsak kullanmaya gerek yok.(Sütun sayıları aynı olmak zorunda)

Oluşturduğumuz CTE'nin sonuna virgül koyup yeni bir CTE oluşturabiliriz. -> , YeniCTEADI (sorgu )
UNION: 2 sorgu sonucunu birleştirir. Bu yüzden CTE'den sonra kullandığımız sorguya Union vererek başka bir sorgu kullanabiliriz.
*/
CREATE TABLE tblEmployee
(
  Id int Primary Key,
  Name nvarchar(30),
  Gender nvarchar(10),
  DepartmentId int
)

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


WITH cte_name (Column1, Column2, ..)
AS
( CTE_query )


With EmployeeCount(DepartmentId, TotalEmployees)
as
(
 Select DepartmentId, COUNT(*) as TotalEmployees
 from tblEmployee
 group by DepartmentId
)

Select DeptName, TotalEmployees
from tblDepartment
join EmployeeCount
on tblDepartment.DeptId = EmployeeCount.DepartmentId
order by TotalEmployees


With EmployeeCount(DepartmentId, TotalEmployees)
as
(
 Select DepartmentId, COUNT(*) as TotalEmployees
 from tblEmployee
 group by DepartmentId
)

Select 'Hello'

Select DeptName, TotalEmployees
from tblDepartment
join EmployeeCount
on tblDepartment.DeptId = EmployeeCount.DepartmentId
order by TotalEmployees


With EmployeesCountBy_Payroll_IT_Dept(DepartmentName, Total)
as
(
 Select DeptName, COUNT(Id) as TotalEmployees
 from tblEmployee
 join tblDepartment 
 on tblEmployee.DepartmentId = tblDepartment.DeptId
 where DeptName IN ('Payroll','IT')
 group by DeptName
),
EmployeesCountBy_HR_Admin_Dept(DepartmentName, Total)
as
(
 Select DeptName, COUNT(Id) as TotalEmployees
 from tblEmployee
 join tblDepartment 
 on tblEmployee.DepartmentId = tblDepartment.DeptId
 group by DeptName 
)
Select * from EmployeesCountBy_HR_Admin_Dept 
UNION
Select * from EmployeesCountBy_Payroll_IT_Dept