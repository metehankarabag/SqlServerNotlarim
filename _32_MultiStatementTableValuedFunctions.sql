/*Multi-Statement Valued Function
Inline ile bir kaç farkı var.
1. Inline'da RETURNS anahtarı ile sadece gönüş türünün Tablo olduğunu belirleyebiliriz. Fakat Milti'de tablonun yapısını da belirleyebiliriz.
2. Inline'da begin ve and blokları yok Multiline'da var. (Sanırım birden fazla satır kullanabildiğimiz için)
3. Inline'da return olarak select sorgusu varmeliyiz. Milti'de sadece return'a hiçbir şey vermiyoruz, sadece yazıyoruz. - Function body'de bir tabloya select uygulayıp oluşturduğumuz tabloya aldığımızta oluşturduğumuz tablo otomatik olarak dönderiliyor.
4. Inline performans olarak daha iyidir. Çünkü SQL Server Inline'a View muamelesi yapar(treat), Multiline'a Stroed Procedure gibi muamele yapar. Amaça Inline ile ulaşabiliyorsak her zaman Inline kullanmalıyız.
5. Inline Function'dan aldığımız tabloyu Update ve Delete sorgularına tablo olarak verebiliriz. Fakat Multi-Statement'den aldığımız tabloyu veremeyiz. Çünkü Milti Function ile çalışırken gerçek tablodu dönmüyoruz.
Not: Multi-statement STORED PROCURE muamelesi görüyor ve select sorgusuna tablo olarak verebiliyoruz.
*/
Create Function fn_ILTVF_GetEmployees()
Returns Table
as
Return (Select Id, Name, Cast(DateOfBirth as Date) as DOB From tblEmployees)


Create Function fn_MSTVF_GetEmployees()
Returns @Table Table (Id int, Name nvarchar(20), DOB Date)
as
Begin
 Insert into @Table
 Select Id, Name, Cast(DateOfBirth as Date) From tblEmployees --> Insert için sütun values falan kullanmadan böyle bir ekleme yapabiliyoruz sanırım.
 Return
End


Select * from fn_ILTVF_GetEmployees()
Select * from fn_MSTVF_GetEmployees()


Update fn_ILTVF_GetEmployees() set Name='Sam1' Where Id = 1
