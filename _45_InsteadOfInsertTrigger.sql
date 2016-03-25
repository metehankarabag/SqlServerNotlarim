/*Instead Of Insert Triggers
1 - Instead Of Insert Triggers: Trigger'ın uygulandığı tabloya Insert Sorgusu uygulanırsa, sorgu çalışmaz Trigger'daki işlem çalışır. Ekleme işini Trigger'da düzenli bir şekilde yapacağız. Birden fazla Tablo üzerinde çalışan View'ların sorun çıkartabileceğini görmüştük. Bu sorunu çözmek için kullanıcı ekleme işlemi gerçekleştiğinde, gönderdiği değerleri alarak Trigger içinde düzgün bir şekilde ekleyeğiz.
Triggerin oluşturulma şekli aynı. tek fark DML Trigger'da kullandığımız FOR yerine INSTEAD kullanıyoruz.
Not: Birden fazla tablo üzerinde güncelleme işi yanlış çalışıyor, Insert hiç çalışmıyor.
*/

Create view vWEmployeeDetails
as
Select Id, Name, Gender, DeptName
from tblEmployee 
join tblDepartment
on tblEmployee.DepartmentId = tblDepartment.DeptId



Create Trigger tr_vWEmployeeDetails_InsteadOfInsert
on vWEmployeeDetails
Instead Of Insert
as
Begin
 Declare @DeptId int
--> Eşleşmenin gerçekleşirse, tblDepartment satırının Id değerini al demek. 
 Select @DeptId = DeptId  
 from 	tblDepartment  
 join 	Inserted
 on 	Inserted.DeptName = tblDepartment.DeptName --> Eşleşme sağlanırsa sütunların birleştiği bir tablo oluşur ve eşleşen satırların değerleri bu tabloya eklenir.
 
 --> Herhangi bir değer alamamışsak kullanıcı, yanlış bir Department adı göndermiştir.
 if(@DeptId is null)
 Begin
	Raiserror('Invalid Department Name. Statement terminated', 16, 1)
  return
 End
 -->Null değilse Department'in Id değerini Employee tablosuna ekle.
 Insert into tblEmployee(Id, Name, Gender, DepartmentId) -->Burada tablonun ekleme yapılacak sütunları belirlenmiş
 Select Id, Name, Gender, @DeptId  --> Burada ekleme değerleri select sorgusundan alınmış ve Values key word'u kullanılmamış.
 from Inserted
End


Insert into vWEmployeeDetails values(7, 'Valarie', 'Female', 'IT')
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

