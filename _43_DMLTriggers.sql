/*Trigger
3'e ayrılır. > 1. DML Trigger, 2. DDL Trigger, 3. Logon Trigger

1. DML Trigger
 DML -> Update, Delete, Insert dir. -> Dml Trigger bu olaylar çalıştığında otomatik olarak tetiklenir.
 DML 2 ye ayrılır. 1. After Trigger 2. Instead Of Trigger

After Trigger: Tetiklenme gerçekleştikten sonra çalışan Trigger türüdür. Tetikleme olayını Insert, Update, Delete sorguları gerçekleştirebilir. Sorgular işlerini bitirdikten sonra tetikleme gerçekleşir.
INSTEAD OF Trigger: Tetikleme olayını gerçekleştiren sorgular yerine çalışır.
Oluşturma 
Create Trigger tr_TabloAdi_ForActionAdi -> Trigger'ın adı
ON tblEmployee -> Üzerinde çalışacağı tablo
FOR Insert -> Hangi Action'da tetikleneceği
AS -> Burdan sonrası Procedure gibi
BEGIN
	//Tetikleme gerçekleştiğinde çalışacak kodlar
END

C#'da property ve index oluştururken kullandığımız, values anahtarı ile aynı mantıkla çalışan Inserted, Deleted, Updated anahtarlarını Trigger Body'de kullanara silinen eklenen satır değerlerini Body'e getirebiliriz. Inserted, Deleted, Updated Bunlar tablodur.
*/

Create Trigger tr_tblEMployee_ForInsert
ON tblEmployee
FOR Insert
AS
BEGIN
 Declare @Id int
 Select @Id = Id from Inserted --> Eklenen değeri alan tablo.
 
 Insert into tblEmployeeAudit --> Eklenen tablonun değerlerini kullanak bu tabloya bir kayıt ekleyeceğiz. Bu tablo rapor muamelesi görecek.
 values('New employee with Id  = ' + Cast(@Id as nvarchar(5)) + ' is added at ' + cast(Getdate() as nvarchar(20)))
END

Insert into tblEmployee values (7,'Tan', 2300, 'Female', 3)

Create Trigger tr_tblEMployee_ForDelete
ON tblEmployee
FOR Delete
AS
BEGIN
 Declare @Id int
 Select @Id = Id from Deleted --> Silinen  satırın bir kopyası bu tabloya alınıır.
 
 Insert into tblEmployeeAudit 
 values('An existing employee with Id  = ' + Cast(@Id as nvarchar(5)) + ' is Deleted at ' + Cast(Getdate() as nvarchar(20)))
END


Create TABLE tblEmployee
(
  Id int Primary Key,
  Name nvarchar(30),
  Salary int,
  Gender nvarchar(10),
  DepartmentId int
)

Insert data into tblEmployee table
Insert into tblEmployee values (1,'John', 5000, 'Male', 3)
Insert into tblEmployee values (2,'Mike', 3400, 'Male', 2)
Insert into tblEmployee values (3,'Pam', 6000, 'Female', 1) 

Create TABLE tblEmployeeAudit
(
  Id int identity(1,1) primary key,
  AuditData nvarchar(1000)
)
