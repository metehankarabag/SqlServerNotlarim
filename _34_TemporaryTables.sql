/*Temporary Table
Permanent tablolara oluşturulma açısından benzerdir. Permanent tablolar silinene kadar veri tabanında kalan tablolardır. Temporary tablolar TempDB veri tabanı içinde oluşturulan ve otomatik olarak silinen tablolardır.

Temporary Table'lar 2 ye ayrılır.
1. Local Temporary Table: Oluşturulurken normal bir tablo gibi oluşturulur fakat adının önüne bir tane # işareti alır. Local Temporary Table'lar sadece kendisini oluşturan bağlantıda(Session'da) geçerlidir. Session kapandığında tablo silinir.
2. Global Temporary Table: Oluştururken tablo adından önce 2 tane # işareti alır. Farklı bağlantılar ile görünebilirler. Yani geçici tabloya birden fazla kullanıcının farklı Session'lar ile bağlanması gerekiyorsa kullanılır. Tabloyu kullanon son Session kapanınca Tablo silinir.

Not: Local Temporary Table'ı Stored Procedure içinde oluşturduğumuzda, Procedure işini tamaladığı an tablo silinir.
Not: Farklı Session'ları kullanan kullanıcılar aynı Local Temporary Table ismi ile tablo oluşturabilir. Çünkü tablo oluşturulurken verdiğimiz ad değiştilir. belirlediğimiz tablo ismi #Temporary ise bu TempDb veri tabanı içinde #Temporary_________...+rasgele bir sayı verilerek oluşturulur. Bu yüzden biz aynı isimi versek bile farklı isim kullanılarak oluşturulur.

Temporary Table'nun oluşturulup oluşturulmadığını anlamak için
System databases > temdb
Select name from tempdb..sysobjects -> tüm sistem nesnelerinden
where name like '#PersonDetails%' --Tabloyu veri tabanı içinden aldığımız için ve belirlediğimiz talo adına ne eklendiğini bilmediğimiz için Like ve % kullanıyoruz.
*/

Create Table #PersonDetails(Id int, Name nvarchar(20))

Insert Data into the temporary table:
Insert into #PersonDetails Values(1, 'Mike')
Insert into #PersonDetails Values(2, 'John')
Insert into #PersonDetails Values(3, 'Todd')


Select * from #PersonDetails


Select name from tempdb..sysobjects 
where name like '#PersonDetails%'

	
DROP TABLE #PersonDetails

Create Procedure spCreateLocalTempTable
as
Begin
Create Table #PersonDetails(Id int, Name nvarchar(20))

Insert into #PersonDetails Values(1, 'Mike')
Insert into #PersonDetails Values(2, 'John')
Insert into #PersonDetails Values(3, 'Todd')

Select * from #PersonDetails
End


Create Table ##EmployeeDetails(Id int, Name nvarchar(20))
