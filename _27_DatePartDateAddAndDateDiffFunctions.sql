/*DATePART(), DATENAME(),
2 site 2 parametre alýr. 1. Parametre Tarihin bölümü 2. Tarih.
DATAPART(): Tarihin bir bölümü verir(INT).
DATENAME(): Tarihin bir bölümünün adýný verir(STRING).
*/
/*DateAdd()
Tarihe birþey eklemek için kullanýlýr.3 parametre alýr.
1. Parametre Tarihin tarih eklenecek bölümü
2. Ne kadar ekleneceðini belirten sayý(sayý positif veya negatif olabilir.)
3. tarihin kendisi
Not: Gün eklerken bir sonraki aya geçme durumu için ayýn kaç çektiði dikkate alýnýr.
*/
/*DateDiff()
Ýki tarih arasýndaki farký buluyor
3 Paremetre alýyor.
1. Parametre Tarih farký alýnacak tarih bölümü
2. baþlangýç tarihi
3. bitiþ tarihi
Not: Date Part olarak Year veya Month verdiðimizde sadece yýl/ay deðerlerini birbirinden çýkarýlýr ve farký verir. Yani aylar arasýndaki gerçek farký bulmak için güne bakýlmaz ve yýllar arasýndaki gerçek farký bulmak için ay ve güne bakýlmaz. Sadece Ay ve yýl deðerleri bir birinden çýkarýlýr. Bu durumda fazladan 1 ay veya 1 yýl sonuç alabiliriz. Fakat günler arasýndaki farký bulmak için Month'a bakýlýr.
*/
Select DATEPART(weekday, '2012-08-30 19:45:31.793')
Select DATENAME(weekday, '2012-08-30 19:45:31.793')

Select DateAdd(DAY, 20, '2012-08-30 19:45:31.793') 
-- Returns 2012-09-19 19:45:31.793
Select DateAdd(DAY, -20, '2012-08-30 19:45:31.793') 
-- Returns 2012-08-10 19:45:31.793

Select DATEDIFF(MONTH, '11/30/2005','01/31/2006') -- returns 2
Select DATEDIFF(DAY, '11/30/2005','01/31/2006') -- returns 62

CREATE FUNCTION fnComputeAge(@DOB DATETIME)
RETURNS NVARCHAR(50)
AS
BEGIN

DECLARE @tempdate DATETIME, 
@years INT, 
@months INT, 
@days INT
SELECT @tempdate = @DOB
												--Burada yaptýðýmýz iþ: Eski olan tarihin ayý büyükse veya aylar ayný iken günü büyükse yýl Datediff ile bulunan yýl varkýndan bir çýkartmak. Çünkü bu durumda bir yýldan az oluyor. Datediff bunu hesaplamadýðý için bir yýl fazla verebiliyor.
SELECT @years = DATEDIFF(YEAR, @tempdate, GETDATE()) - CASE WHEN (MONTH(@DOB) > MONTH(GETDATE())) OR (MONTH(@DOB) = MONTH(GETDATE()) AND DAY(@DOB) > DAY(GETDATE())) THEN 1 ELSE 0 END
SELECT @tempdate = DATEADD(YEAR, @years, @tempdate)
													  -- Bir ilk tarihdeki ayýn günü þimdikinden büyük ise bir ay çýkartýyoruz.
SELECT @months = DATEDIFF(MONTH, @tempdate, GETDATE()) - CASE WHEN DAY(@DOB) > DAY(GETDATE()) THEN 1 ELSE 0 END
SELECT @tempdate = DATEADD(MONTH, @months, @tempdate)

SELECT @days = DATEDIFF(DAY, @tempdate, GETDATE())

DECLARE @Age NVARCHAR(50)
SET @Age = Cast(@years AS  NVARCHAR(4)) + ' Years ' + Cast(@months AS  NVARCHAR(2))+ ' Months ' +  Cast(@days AS  NVARCHAR(2))+ ' Days Old'
RETURN @Age

End