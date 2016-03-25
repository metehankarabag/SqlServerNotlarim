/* Kullanıcının tanımladığı Function'ları -> Kısaltma UDF
Bu derste göreceğimiz -> Scalar User Defined Functin türünde Function oluşturmayı,çağarmayı, nerede kullanabileceğimizi göreceğiz.

3 farklı Kullanıcı tanımlı Function türü var. > 1. Scalar > 2. Inline -> table-Valued > 3. Multi -> Statement-Valued

Scalar Function: Parametreli veya parametresi olabilir. Fakat bir Return değeri olmak zorundadır ve Return Type -> text, ntext, image, cursor ve timestamp türleri dışındaki türler olabilir.
CREATE FUNCTION Function_Name(@Parameter1 DataType, @Parameter2 DataType,..@ParameterN Datatype)
RETURNS Return_Datatype -> Dönüş türünü belirlemek için Returns anahtarını kullanıyoruz.
AS
BEGIN 
    Function Body
    Return Return_Datatype
END

Function'ı çalıştırmak için Function adından önce dbo. yazmalıyız. Function'ı oluşturulduğu veritabanından farklı bir veri tabanında çalıştıracaksak. dbo. önüne veritabaniAdi. yazmalıyız.

Oluşturduğumuz Age() Function'ında yaptığımız işi Stored Procedure kullanarakda yapabilirdik. Function'ın dönüş değerlerini select sorgusuna ekleyebilir veya sonuçları Where ile filitreleme yapmak için kullanabilirken, Stored Procedure ile bunu yapamayız.(Gösterdiği Procedure'nin dönüş değeri yok Select sorgusu var. Yani aynı Void gibi direk sonucunu yazdırıyor.)
*/

CREATE FUNCTION Age(@DOB Date)
RETURNS INT
AS
BEGIN
 DECLARE @Age INT
 SET @Age = DATEDIFF(YEAR, @DOB, GETDATE()) - CASE WHEN (MONTH(@DOB) > MONTH(GETDATE())) OR (MONTH(@DOB) = MONTH(GETDATE()) AND DAY(@DOB) > DAY(GETDATE())) THEN 1 ELSE 0 END
 RETURN @Age
END

Select dbo.Age( dbo.Age('10/08/1982')
Select SampleDB.dbo.Age('10/08/1982')


Select Name, DateOfBirth, dbo.Age(DateOfBirth) as Age from tblEmployees --> method sonuçları select sorgusuna eklenmiş.
Select Name, DateOfBirth, dbo.Age(DateOfBirth) as Age from tblEmployees Where dbo.Age(DateOfBirth) > 30 --> method sonuçlarına filitre uygulanmış.

sp_helptext gibi methodlar kullanılabilir. Fakat dbo. yazmıyoruz.
 