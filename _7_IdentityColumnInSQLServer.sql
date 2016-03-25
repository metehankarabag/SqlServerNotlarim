/*Identity Column
Bir sütun identity olarak ayarlandýrsa, her yeni satýr için sütunun deðerleri otomatik olarak oluþturulur. BÝr Ýdentity sütun oluþturmak için sütunu tanýmladýktan sonra identity key word'ünü kullanmak gerekir. identity(1,1) gibi kullanarak baþkalnýþ deðerini ve kaçar kaçar artacaðýný da belirleyebiliriz.

Identity bir sütüna elle deðer giremeyiz. Girebilmek için SET IDENTITY_INSERT tabloAdi ON -> Elle deðer girmemize izin verir. Off yaðtýðýmýzda tekrar engeller. 
Not: Identity sütuna deðer girmeyi izin verirsek, kullanacaðýmýz insert sorgusuna tablo adýndan sonra deðer girmek için kullanacaðýmýz tüm sütun adlarýný belirlemeliyiz.

Not: Bir sütunun Ýdentity olup olmadýðýna sütuna sað týklayýp Properties penceresinden bakarak anlayabiliriz.

Bir tablodaki tüm satýrlarý sildiðimizde Identity deðerleri silinmez. Bu yüzden silip yeni bir kayýt eklediðimizde deðer 1 den baðlamaz. Bu sorunu çözmek için 
-> dbcc checkident(TabloAdi, RESEED, 0) çalýþtýrmamýz gerekiyor.(Bu tüm tabloyu sýfýrlar)

*/
--Delete ile tablodaki tüm verileri sildik.
Delete from tblPerson1

--IDENTITY yi sýfýrladýk.
dbcc checkident(tblPerson1, RESEED, 0)

SELECT * FROM dbo.tblPerson
select * from dbo.tblPerson

insert into dbo.tblPerson1 values ('Sara')
Delete from dbo.tblPerson1 where PersonID = 1

select * from dbo.tblPerson1

insert into dbo.tblPerson1(PersonID, Name) values (1,'Jhon')



