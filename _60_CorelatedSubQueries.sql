/*
Non-Corelated Subquery: Sadece bir kez çalıştırılırlar ve çalıştırıldıktan sonra sonuçları Outer Query tarafından kullanılır. Outer query ne kadar çalışırsa çalışsın, subQuery sadece bir kez çalışıp sonucunu verir.
Corelated Subquery: OuterQuery'deki bir değere göre çalışan SubQuery'e denir. Corelated subqueries OuterQuery'nin seçtiği her satır için bir kez çalışır ve kendi başına çalışamaz.( Bunun anlamı Outer Query'nin kullandığı tablonun her satırı için Sub Query'nin kullandığı tüm tablo üzerinde çalışacağız.)

Yani Sub Query'de bir Query ve bu Query dışarıdan değer almıyorsa kendi kafasına göre takılabilir.
*/

--SUBQUERY
Select [Id], [Name], [Description]
from tblProducts
where Id not in (Select Distinct ProductId from tblProductSales)  -->

--CORELATED SUBQUERY
Select [Name], (Select SUM(QuantitySold) from tblProductSales where ProductId = tblProducts.Id) as TotalQuantity --> Outer Query'nin İd değerine göse çalışıyor.
from tblProducts
order by Name 