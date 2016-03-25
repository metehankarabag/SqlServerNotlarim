/* STORED PROCEDURES
STORED PROCEDURES bir grup T_SQL açýklamasýdýr.

Yazýmý
Create PROC/PROCEDURE procedureAdý
-> Parametreli Procedure oluþturmayý istiyorsak parametreleri burada parametre adýnýn önüne @ koyarak yazmalýyýz.
as
Begin
	iþ
End

SQL'de bir NESNE'yi düzenlerken her zaman olduðu gibi ALTER kullanýyoruz

Çalýþtýrma
Procedure adýnýn önüne Exec/Execute yazarak ve ya hiç bir þey yazmadan çalýþtýrabiliriz. Parametreli bir Procedure'u çalýþtýrýyorsak, gireceðimiz parametrelerin sýrasý oluþturma sýrasý ile ayný olmalýdýr.

System Strored Procedure: sp_ ön eki ile olurlar bizde bu ön ek ile oluþturabiliriz. Fakat bu karýþýklýklara neden oluþ bu yüzden yapmýyoruz.
Sp_Helptext Prodecure'nin oluþturulma metnini verir.
Stored Procedure'yi þfreleme: AS anahtar kelimesinden hemen önce With Encryption yazarsak PROCEDURE oluþturulma metnini alamayýz.(Almanýn bir yolu var sonra görcez bunlarý.)
*/
use Sample18
go
select * from tblPersonel

CREATE PROCEDURE spGetPersonel
as
begin
	select Name,Gender from tblPersonel
end

spGetPersonel


create procedure spGetPersonelByGenderandDepartment
@Gender nvarchar(20),
@DepartmentID int
as
Begin
	select Name,Gender,DepartmentID FROM tblPersonel WHERE Gender = @Gender
	and DepartmentID = @DepartmentID
end
select * from tblPersonel

spGetPersonelByGenderandDepartment 'Male',1


sp_helptext spGetPersonel
Alter PROCEDURE spGetPersonel
as 
begin
 select Name,Gender from tblPersonel order by Name
end
Drop proc spGetPersonel


sp_helptext spGetPersonelByGenderandDepartment
Alter procedure spGetPersonelByGenderandDepartment  
@Gender nvarchar(20),  
@DepartmentID int  
With Encryption
as  
Begin  
 select Name,Gender,DepartmentID FROM tblPersonel WHERE Gender = @Gender  
 and DepartmentID = @DepartmentID  
end
