/*Transaction: Veri tabanındaki veriyi değiştiren komutlar grubundan oluştur ve bu komutların hepsi tek bir birimmiş gibi çalışır. Bu sadece bir birinden bağımsız olan komutlardan birinde hata olursa, diğerlerinin çalışmasını engelleyebilir ve çalışmış olanların etkilerinin geri alabiliriz. Transaction'daki sorgular çalıştırıldıktan sonra RollBack Transaction anahtarı çalışırsa çalışan sorguların etkisi geri alınır, Commit Transaction anahtarı çalışırsa değişiklikler onaylanır. 

Bu anahtarlardan birini kullanmadan Transaction'ı sorguları ile çalıştırdığımızda, sorguların değişiklikleri tabloya uygulanır. Aynı session içinde bir select sorgusu çalıştırarak bunu görebilriz. Fakat aynı select sorgusunu farklı bir session'da çalıştırırsak sorgu sonucunu alamayız. Bunun nedeni Sql Serverin varsayılan olarak onaylanmamış veriyi okumamasından kaynaklanır. Varsayılan davranısı değiştirmek için Set Transaction Isolation Level Read Uncommited sorgusunu diğer session'da çalıştırmalıyız. Çalıştırdıktan sonra sorgu sonucunu onaylanmamış veri ile birlikte görürüz. 
Yani varsayılan olarak bir kullanıcı Transaction'daki bir sorguyu çalıştırdığında, sorguların tablo üzerindeki etkilerini başka bir kullanıcı göremez.
*/
Insert into tblMailingAddress values (1, 101, '#10', 'King Street', 'Londoon', 'CR27DW') 
Insert into tblPhysicalAddress values (1, 101, '#10', 'King Street', 'Londoon', 'CR27DW')


Create Procedure spUpdateAddress
as
Begin
 Begin Try
  Begin Transaction 
   Update tblMailingAddress set City = 'LONDON' 
   where AddressId = 1 and EmployeeNumber = 101
   
   Update tblPhysicalAddress set City = 'LONDON' 
   where AddressId = 1 and EmployeeNumber = 101
  Commit Transaction 
 End Try
 Begin Catch
  Rollback Transaction
 End Catch
End 


Alter Procedure spUpdateAddress
as
Begin
 Begin Try
  Begin Transaction
   Update tblMailingAddress set City = 'LONDON12' 
   where AddressId = 1 and EmployeeNumber = 101
   
   Update tblPhysicalAddress set City = 'LONDON LONDON' 
   where AddressId = 1 and EmployeeNumber = 101
  Commit Transaction
 End Try
 Begin Catch
  Rollback Transaction
 End Catch
End

Create Table tblMailingAddress
(
   AddressId int NOT NULL primary key,
   EmployeeNumber int,
   HouseNumber nvarchar(50),
   StreetAddress nvarchar(50),
   City nvarchar(10),
   PostalCode nvarchar(50)
)

Create Table tblPhysicalAddress
(
 AddressId int NOT NULL primary key,
 EmployeeNumber int,
 HouseNumber nvarchar(50),
 StreetAddress nvarchar(50),
 City nvarchar(10),
 PostalCode nvarchar(50)
)