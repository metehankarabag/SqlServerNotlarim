/* Derived Tables & CTE
Oluşturduğumuz karmaşık bir sorguyu birden fazla kez kullanmamız gerekiyorsa, sorguyu kullanarak View oluşturabiliriz. View veri tabanına kaydedildiği için başka sorgular, Procedure'ler, Function'lar, vs.. ile kullanılabilir. Fakat View'ı sadece bir sorgu, procedure,vs... ile kullanıyorsak, View yerine başka şeyler kullanabiliriz.
-> CTE, Derived Tables, Temp Tables, Table Variable, vs..

Temporary Table: Geçen derslerde görmüştük. Temporary tablolar TempDB veri tabanında tutulur. Local Temporary Table tablonun oluşturulduğu Session'da  geçerilidr ve tablo başka bir Procedure'i çağaran Procedure içinde oluşturuluyorsa, tablo çağarılan Procedure gönderilir. Global Temprorary Table, tablo oluşturulduktan tüm Session'lar ile kullanılabilir, tabloyu kullanan son session kapandığında tablo silinir.
Tepporary tabloyu session kapanana kadar istediğimiz gibi kullanabiliriz. Session kapandığında otomatik olarak silinir fakat işimiz bittikten sonra silmek iyidir.

Table Variable: Table Variable'lar(tablo türündeki Field'lar) da Temporary tablolar gibi TempDb veri tabanında tutulur. İnt gibi bir tür olduğu için sadece oluşturulduğu alanda gerçerlidir. Program alanın dışına çıktığında veri tabanından otomatik olarak silinir ve bir Field olduğu için Procedure'lere, Function'lara,vs... parametre olarak verilebilir.

Derived Table: Bir sorgu oluştururken form'dan sonra tablo yazarız. Sorguda As anahtarı ile herhangi sütuna takma ad verebiliriz. Form anahtarından sonra sorgu kullanıp sorgu sonucuna as ile isim verdiğimizde tablo ismi belirlemiş oluruz. Sadece sorgunun parantez içinde olması gerekir. Bu sorgu sadece üst sorgusu ile birlikte kullanılabilri başka bir yerde kullanılamaz.

CTE: Bir CTE bir sorgu ile çalışabilen geçici bir sonuç seti olarak düşünülebilir. Oluşturduğumuz CTE'i View oluşturmak için de kullanabiliriz.
*/
--View
Create view vWEmployeeCount
as
Select DeptName, DepartmentId, COUNT(*) as TotalEmployees
from tblEmployee
join tblDepartment
on tblEmployee.DepartmentId = tblDepartment.DeptId
group by DeptName, DepartmentId

Select DeptName, TotalEmployees from vWEmployeeCount where  TotalEmployees >= 2

--Temporary Table: Oluşturulma şekli View ile neredeye aynı
Select DeptName, DepartmentId, COUNT(*) as TotalEmployees
into #TempEmployeeCount--> Insert anahtarı kullanmıyoruz fakat into ile temp tabloya select sonuçlarını alıyoruz.
from tblEmployee
join tblDepartment
on tblEmployee.DepartmentId = tblDepartment.DeptId --> Sonuçlar iki tabloda eşleşen satırlar olur
group by DeptName, DepartmentId

Select DeptName, TotalEmployees
From #TempEmployeeCount
where TotalEmployees >= 2

Drop Table #TempEmployeeCount


--Table Variable
Declare @tblEmployeeCount table(DeptName nvarchar(20),DepartmentId int, TotalEmployees int) --> Tablo Field'ını belirlemek için sütunlarını belirlemeliyiz.

Insert @tblEmployeeCount --> Değişkene ekle(burda da into kullanılmamış normal dede zorunlu değil sanırım)
Select DeptName, DepartmentId, COUNT(*) as TotalEmployees --> Select sorgusunun aldığı verileri değişlene atıyoruz.
from tblEmployee
join tblDepartment
on tblEmployee.DepartmentId = tblDepartment.DeptId
group by DeptName, DepartmentId

Select DeptName, TotalEmployees
From @tblEmployeeCount --> Bu değişkeni oluşturulduğu alan içinde istediğimiz kadar kullanabiliriz.
where  TotalEmployees >= 2

--Derived Table
Select DeptName, TotalEmployees --> İç sorgudan aldığımız sütunların bazılarını eliyoruz.
from 
 (
  Select DeptName, DepartmentId, COUNT(*) as TotalEmployees --> Select sorgu sonucu tablo değerlerini oluşturuyor.
  from tblEmployee
  join tblDepartment
  on tblEmployee.DepartmentId = tblDepartment.DeptId
  group by DeptName, DepartmentId
 ) 
as EmployeeCount --> tablo ya isim verdik
where TotalEmployees >= 2

--CTE:
With EmployeeCount(DeptName, DepartmentId, TotalEmployees) --> Parametre içindekiler CTE'nin üstunları tanımlamaya gerek yok.(optional)
as
(
 Select DeptName, DepartmentId, COUNT(*) as TotalEmployees
 from tblEmployee
 join tblDepartment
 on tblEmployee.DepartmentId = tblDepartment.DeptId
 group by DeptName, DepartmentId
)

Select DeptName, TotalEmployees
from EmployeeCount --> Bu Cte sadece kendisinden hemen sonra yazılmış sorguda geçerlidir. Sorgu önünde bir şey varsa geçersizdir.
where TotalEmployees >= 2

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
