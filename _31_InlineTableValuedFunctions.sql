/*Inline Function
Yani tek satırlı Function. Bu tür Function'ı oluştururken Begin ve End anahtarlarını kullanmamıza gerekiyor. If kullanır gibi.
Dönüş türü olarak'da Table kullanır ve tablo dönebilmemiz için Return'e select sorgusu vermeliyiz.

Nasıl kullanılır
1. Inline Table Valued Function parametreli View işlevini kazanmak için kullanılır. -> View'ın parametreli View'ın ne olduğunu anlatacak.
2. Table Valued Function'ın tablo döndüğü için sorguların tablo kısmına verilebilir, başaka tablolarla birleştirilebilir. Yani normal bir tablo gibi kullanılabilir. (Tahminim geçen dersteki Procedure'ı da böyle kullanabiliriz.)
*/

CREATE FUNCTION fn_EmployeesByGender(@Gender nvarchar(10))
RETURNS TABLE
AS
RETURN (Select Id, Name, DateOfBirth, Gender, DepartmentId from tblEmployees where Gender = @Gender) --parantezlere gerek yok fakat sorguyu satırlara bölüdüğümüzde nerede başlayıp bittiğini daha iyi görmemizi sağlar.


Select * from fn_EmployeesByGender('Male') 


Select Name, Gender, DepartmentName 
from fn_EmployeesByGender('Male') E
Join tblDepartment D on D.Id = E.DepartmentId