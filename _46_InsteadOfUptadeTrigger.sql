/*Instead Of Update: 
Birden fazla tablo üzerinde çalýþan bir View oluþturmak için yazdýðýmýz sorgu birden fazla tabloya Inster veya Update iþlemi yapýyorsa View hata verir. Fakat tek bir tablo üzerinde güncelleme yapýyorsak hata vermesede sonuç istediðimiz gibi olmayabiliz.

Instead Of Update'de Insert ile ayný mantýkla çalýþýyor. Fark Deleted tablonun eski veri ile dolu olmasýdýr.
*/

Update tblDepartment set DeptName = 'HR' where DeptId = 3

Create Trigger tr_vWEmployeeDetails_InsteadOfUpdate
on vWEmployeeDetails
Instead Of Update
as
Begin
--> tüm sütunlar için bu kontrolü uyguluyoruz.
 if(Update(Id)) --> Update() methdu kullancýnýn çalýþtýrdýðý sorgunun sorgudaki bir sütunu güncelleyip güncellemediðini beliliyor.
 Begin
  Raiserror('Id cannot be changed', 16, 1) --> Id deðiþtirilemez.
  Return 
 End
 
 if(Update(DeptName)) --> View'ýn DeptName sütunu güncellenmiþse
 Begin
  Declare @DeptId int 

  Select @DeptId = DeptId
  from tblDepartment
  join inserted
  on inserted.DeptName = tblDepartment.DeptName --> yeni deðer tblDepartment Tablosunda varsa, varolan satýrýn ID dðerini deðiþkene al(geçen derste yaptýk.)
  
  if(@DeptId is NULL ) --> Id deðeri almamýþsa hata ver.
  Begin
   Raiserror('Invalid Department Name', 16, 1)
   Return
  End
  --> Id deðeri varsa Employee tablosunu güncelle
  Update tblEmployee set DepartmentId = @DeptId --> DeptId insertted tablodan gelmediði için elle yazmýþýz.
  from inserted
  join tblEmployee
  on tblEmployee.Id = inserted.id
 End
 
 -- If gender is Updated
 if(Update(Gender))
 Begin
  Update tblEmployee set Gender = inserted.Gender
  from inserted
  join tblEmployee
  on tblEmployee.Id = inserted.id
 End
 
 -- If Name is Updated
 if(Update(Name))
 Begin
  Update tblEmployee set Name = inserted.Name
  from inserted
  join tblEmployee
  on tblEmployee.Id = inserted.id
 End
End

 
Update vWEmployeeDetails 
set DeptName = 'IT'
where Id = 1

Update vWEmployeeDetails 
set Name = 'Johny', Gender = 'Female', DeptName = 'IT' 
where Id = 1


--------------------------------

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

Create view vWEmployeeDetails
as
Select Id, Name, Gender, DeptName
from tblEmployee 
join tblDepartment
on tblEmployee.DepartmentId = tblDepartment.DeptId

Update vWEmployeeDetails 
set Name = 'Johny', DeptName = 'IT'
where Id = 1

Update vWEmployeeDetails 
set DeptName = 'IT'
where Id = 1