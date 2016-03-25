/* Bir tablonun oluþturulan son satýrýndaki Identity deðerini almamýzý saðlayan methodlar ve bu methodlar arasýndaki farklarý göreceðiz.
Bu methodlar aralarýndaki fark etki alanlarýdýr.
->Session : Sql'de New Query Windows açtýðýmýzda veri tabanýna bir baðlantý açmýþ oluruz ve buna session denir. 
->Scope: Çalýþma ortamý demek ve bir Scope'da gerçekleþen iþ baþka bir iþi tetikliyorsa, diðer iþ, iþi tetikleyen Scope'un kullandýðý Session'ý kullanýr. her Query penceresi bir Scope'dur.

scope_identity(): Identity deðerini alacaðýmýz kayýt methodun çalýþtýrýldýðý ayný Session ve Scope'da eklenen kayýtdýr. Yani Sadece geçerli Query penceresinde eklenen son kaydý görebilir.
@@identity: Çalýþtýðý Session içinde eklenen son kaydý ve bu Session aracýlýðý ile tetiklenen farký Scope'daki kaydý görebilir. Hangisi Scope'daki kayýd en son eklenmiþse onu alýrýz.
Ident_Current(TableName): Her hangi bir ortamda eklenmiþ son kayýt deðerini alabiliriz.

*/

--------------------1. iþ tablolarý oluþturmak-------------
Use Sample8
Go
Create Table Test1
(
ID int identity(1,1),
Value nvarchar(20)
)
Create Table Test2
(
ID int identity(1,1),
Value nvarchar(20)
)



Insert into Test1 values('X')
select	SCOPE_IDENTITY () 	 
Insert into Test1 values('X')
select SCOPE_IDENTITY ()
Select @@IDENTITY

Create Trigger trForInsert on Test1 for insert
as
Begin
	Insert into Test2 values('YYYY')
End

select * from Test1
select * from Test2

Insert into Test1 values('X')

select SCOPE_IDENTITY ()
Select @@IDENTITY

Insert into Test2 values('zzz')


select SCOPE_IDENTITY ()
Select @@IDENTITY
select IDENT_CURRENT('Test2')

Select * from Test1
Select * from Test2

Insert into Test1 values('X')
Select * from Test1
Select * from Test2

select SCOPE_IDENTITY ()
Select @@IDENTITY
select IDENT_CURRENT('Test2')