/*Cte Recursive (Öz yinelemeli): Recursive Function 
*/
With
  EmployeesCTE (EmployeeId, Name, ManagerId, [Level]) --> Level Cte'e eklediðimiz sütun. level kelimesi Key Word olduðu için [] içinde yazýyoruz. Cte içinde kullandýðýmýz sorgulardan öyle bir deðer gelmiyor hata vermemesi için elle vereceðiz.
  as
  (
    Select EmployeeId, Name, ManagerId, 1
    from tblEmployee
    where ManagerId is null --> 1.1 Bulduðumuz satýr CTE'e eklenir.

    union all --> üstteki sorgunun sonucuna alttaki sorgunun sonucunu olduðu gibi birleþtirecek.

    Select tblEmployee.EmployeeId, tblEmployee.Name, tblEmployee.ManagerId, EmployeesCTE.[Level] + 1 --> 3. Eþleþmenin saðlandýðý Employee satýrýnýn deðerleri ile CTE'deki satýrýn Level sütunundaki deðeri birleþtirip seçiyoruz. Seçilenler CTE'e eklenecek. Level deðerini bir arttýrmak gerekiyor. Çünkü eþleþmenin CTE'den aldýðýmýz deðerleri seçilecek satýra ait deðil. Seçilecek satýra ait olan deðer CTE'idekinin bir fazlasý. Eþleþmenin saðlandýðý tüm satýrlar CTE'e eklendiði için CTE' tablosu büyür ve ayný düzen devam eder. Bu yüzden buna Recursive CTE deniyor.
    from tblEmployee
    join EmployeesCTE --> 1.2 CTE'e üsteki sorgu ile eklenen satýrý Employee tablosundaki bazý satýrlar ile birleþtiriyoruz.
    on tblEmployee.ManagerID = EmployeesCTE.EmployeeId --> 2. Burada eþleþme mantýðýný belirledik.(daha önce göstermiþti)
	
  )
Select EmpCTE.Name as Employee, Isnull(MgrCTE.Name, 'Super Boss') as Manager, EmpCTE.[Level] 
from EmployeesCTE EmpCTE
left join EmployeesCTE MgrCTE
on EmpCTE.ManagerId = MgrCTE.EmployeeId


Create Table tblEmployee
(
  EmployeeId int Primary key,
  Name nvarchar(20),
  ManagerId int
)

Insert into tblEmployee values (1, 'Tom', 2)
Insert into tblEmployee values (2, 'Josh', null)
Insert into tblEmployee values (3, 'Mike', 2)
Insert into tblEmployee values (4, 'John', 3)
Insert into tblEmployee values (5, 'Pam', 1)
Insert into tblEmployee values (6, 'Mary', 3)
Insert into tblEmployee values (7, 'James', 1)
Insert into tblEmployee values (8, 'Sam', 5)
Insert into tblEmployee values (9, 'Simon', 1)

--Cte ile ayný iþi yapýyor.
Select Employee.Name as [Employee Name],
IsNull(Manager.Name, 'Super Boss') as [Manager Name]
from tblEmployee Employee
left join tblEmployee Manager
on Employee.ManagerId = Manager.EmployeeId
