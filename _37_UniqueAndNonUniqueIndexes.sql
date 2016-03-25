/*Unique ve NonUnique Index
Bunları Index'lerin Attribute'u gibi düşünebiliriz. Index'ın uygulandığı sütuna girilecek her değerin özel olmasını istiyorsak, Index'e Unique özelliğini uygularız. Tersi için de NonUnique.
Bu özelliği Index'i oluştururken, kullandığımız Index türünden önce yazarak belirtebiliriz. Varsayılanı NonUnique'dir.

Unique Key Constraint ile Unique Index önemli bir fark yokmuş. Unique Key Constraint oluşturulduğunda görünenin arkasında Unique Index oluşturulur. Veri bütünlüğü nesnel olduğunda, Constraint kullan. Index veya Constraint kullandığımızda da verinin onaylanma şekli aynıdır ve Query Optimizer ikisi arasında bir fark görmez.

Hatırlanması gerekenler
 1. Primary Key Constraint'i  Unique Clustered Index oluşturur. Unique Key Constraint'i Unique NonClustered Index oluşturur.  Constraint'lerim Indexes kalsöründe oluşturduğu Index'leri silersek Constraint'ler de silinir.
 2. Unique Constraint veya Index, sütunlarında aynı değer olan bir tabloya eklenemezler.
 
 Not: Clutered Index oluşturduğumuzda Indexes klasörü içinde Uniqe olup olmadığı görünmüyor. Görüntülemek için ya Properties penceresini açıp bakmalıyız yada sp_HelIndex ile görebiliriz.
*/
CREATE TABLE [tblEmployee]
(
 [Id] int Primary Key,
 [FirstName] nvarchar(50),
 [LastName] nvarchar(50),
 [Salary] int,
 [Gender] nvarchar(10),
 [City] nvarchar(50)
)

Insert into tblEmployee Values(1,'Mike', 'Sandoz',4500,'Male','New York')
Insert into tblEmployee Values(1,'John', 'Menco',2500,'Male','London')
Insert into tblEmployee Values(1,'Mike', 'Sandoz',4500,'Male','New York')
Insert into tblEmployee Values(1,'John', 'Menco',2500,'Male','London')


Create Unique NonClustered Index UIX_tblEmployee_FirstName_LastName
On tblEmployee(FirstName, LastName)

ALTER TABLE tblEmployee 
ADD Constraint UQ_tblEmployee_City 
Unique NONCLUSTERED (City) --> Uniqe Consraint oluşturma şekli. Varsayılan olarak kullandığı Index türü NonClustered'di bunuda belirleyebiliriz. -> Unique Clustered

	
CREATE Unique Index IX_tblEmployee_City
ON tblEmployee(City)
WITH IGNORE_DUP_Key