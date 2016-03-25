/*CAST(),CONVERT(): iki Function da aldýðý parametreyi bir türe çevirir.
Kullanýlmalarý

CAST( expression AS data_type [ ( length ) ] )
CONVERT ( data_type [ ( length ) ] , expression [ , style ] )
iki methodda da Length [] içinde yazýlmýþ bu optional parametre olduðuna gelir. Çevirme sonucunun kaç karakterden oluþacaðýný belirlemek için kullanabiliriz.
Ayrýca Convert() metodunun Style optional parametresi çevrilme þeklini belirler.
Derste DateTime deðer string'e çevirilirken Style parametreye 103 verilmiþ buna benzer sayýlar tarih formatýný belirler.
Not: Stype parametresi sadece nvarchar veya varchar'a çevirme iþleminde çalýþýr. Parametre aldýðýmýz deðeri Date'e çevirirsek çalýþmýyor.

Kullaným yerleri
1 - Cast() Ansi'ye dayalý, Convert() SQL Server'a özeldir. Yani baþka ortamlarada da çalýþacak bir kod yazmayý istiyorsak Cast()'ý kullanmayýz.
2 - Convert() methodun Style parametresinden faydalanmayý istemiyorsak Cast()'ý kullanmalýyýz.
*/


Select Id, Name, DateOfBirth, CAST(DateofBirth as nvarchar) as ConvertedDOB 
from tblEmployees
Select Id, Name, DateOfBirth, Convert(nvarchar, DateOfBirth) as ConvertedDOB 
from tblEmployees

SELECT CONVERT(VARCHAR(10),GETDATE(),101)

SELECT CAST(GETDATE() as DATE)
SELECT CONVERT(DATE, GETDATE())


Select Id, Name, Name + ' - ' + CAST(Id AS NVARCHAR) AS [Name-Id] 
FROM tblEmployees

Select CAST(RegisteredDate as DATE) as RegistrationDate, COUNT(Id) as TotalRegistrations 
From tblRegistrations 
Group By CAST(RegisteredDate as DATE) --> Date'e çevirip grupladýðýmýz için gün/ay/yýl deðerlerine göre gruplama yapýyor. Çevirme iþlemini yapmasaydýk, aldýðýmýz deðerlerin mili saniyeye kadar ayný olmasý gerekirdi.