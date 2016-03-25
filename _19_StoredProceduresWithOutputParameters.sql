/*OUT PARAMETRESÝ ÝLE DEPOLANMIÞ ÝÞLEM OLUÞTURMA
As'den önce @ParameterName type out. 
Bu parametre Procedure'den return deðerinden farklý bir sonuç daha çýkmasýný saðlar.

Output parametreli Procedure parametre olarak deðerini çýkaracaðý bir Field bekler. Bu yüzden ilk önce bir field oluþturup bunu Procedure'a vermeliyiz. Procedure'de out put deðiþkenine attýðýmýz deðer bu filed'a alýnýr.
Sql'de bir Field tanýmlamak için Declare kelimesini kullanýrýz. -> Declare ParametreAdý türü
Not: Tanýmladýðýmýz Field'ý Procedure'e verirken out anahtarý ile birlikte vermezsek hata alýrýz.
Not: Procedure birden fazla parametre istiyorsa ve parametre sýrasýný bilmiyorsak, deðerleri parametrelere, Procedure'ý oluþtururken kullandýðýmýz Parametre isimlerini kullanarak verebilriz.
*/
/*System Stored Procedure
sp_Help: Procedure'nin parametreleri, paramaetrelerin türleri, Procedure oluþturulma tarihi, gibi bilgileri veriyor. 
sp_Depends: Stored Procedure'nin kullandýý tablolar ve sütunlarý hakkýnda bilgi verir. 
Bu System Stored Procedure'ý tüm SQL nesneleri için kullanabiliriz.
*/

Create Procedure spGetPersonelCountByGender
@Gender nvarchar(20),
@PersonelCount int out
as
begin
	select @PersonelCount = COUNT(ID) FROM tblPersonel where Gender = @Gender
end

Declare @TotalCount int
Execute	spGetPersonelCountByGender 'Male',@TotalCount output

if(@TotalCount is null)
	Print '@TotalCount is null'
else
	Print '@TotalCount is not null'

Print @TotalCount

Declare @TotalCount int
Execute	spGetPersonelCountByGender @EmployeeCount = @TotalCount out,@Gender ='Male'
Print @TotalCount 

sp_Help spGetPersonelCountByGender
sp_Help tblPersonel
sp_Helptext spGetPersonelCountByGender
sp_Depends tblPersonel
sp_Depends spGetPersonelCountByGender
-- I want to drop tblPersonel table if I delete tblPersonel table and If I execute this store Procedure what happens I will throw an error çünkü This Stored Procedure using that table an if that table is not present, obviously We get an eror
