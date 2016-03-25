/*Deterministic ve Nondeterministic 
Deterministic: Her zaman aynı sonucu veren Function'lara denir. -> SQUARE(), Power(),Sum(),AVG() ve Count()
NOT: Tüm aggregate() methodlar Deterministic'dir.

Nondeterministic: Her zaman farklı sonuç veren methodlar.
GetDate() ve Current_Timestamp
Not: RAND() Function parmetresi olarak kullanırsa Nondeterministic'dir. fakat parametreli kullanılırsa Deterministic'dir.

NOT: sp_helptext ile method body si alınabilir.

With Encryption: Text'in görünmemesi için as den önce kullanılabilir.
With Schemabinding: Oluşturduğumuz Function bir tabloya göre çalışıyor. Yani tablo silinirse Function çalıştırılamaz. Bu yüzden Function silinmeden tablonun silinmesini engellemeliyiz. Bu işi yapamak için Function oluştururken AS'den önce With Schemabinding yazmamız gerekir.(Tablonun yapısının değiştirilmesini de engeller.) Yazdıktan sonra Function içinde tabloyu kullanabilmemiz için tablo adının önüne dbo. eklememiz gerekiyor. yazmassak hata verir. -> Yani bu yazı tablo ile Function arasında bağ oluşturuyor. 

*/

	
CREATE TABLE [dbo].[tblEmployees]
(
 [Id] [int] Primary Key,
 [Name] [nvarchar](50) NULL,
 [DateOfBirth] [datetime] NULL,
 [Gender] [nvarchar](10) NULL,
 [DepartmentId] [int] NULL
)

Insert rows into the table using the insert script below.
Insert into tblEmployees values(1,'Sam','1980-12-30 00:00:00.000','Male',1)
Insert into tblEmployees values(2,'Pam','1982-09-01 12:02:36.260','Female',2)
Insert into tblEmployees values(3,'John','1985-08-22 12:03:30.370','Male',1)
Insert into tblEmployees values(4,'Sara','1979-11-29 12:59:30.670','Female',3)
Insert into tblEmployees values(5,'Todd','1978-11-29 12:59:30.670','Male',1)


Create Function fn_GetEmployeeNameById(@Id int)
Returns nvarchar(20)
as
Begin
 Return (Select Name from tblEmployees Where Id = @Id)
End

Alter Function fn_GetEmployeeNameById(@Id int)
Returns nvarchar(20)
With Encryption
as
Begin
 Return (Select Name from tblEmployees Where Id = @Id)
End


Alter Function fn_GetEmployeeNameById(@Id int)
Returns nvarchar(20)
With SchemaBinding
as
Begin
 Return (Select Name from dbo.tblEmployees Where Id = @Id)
End