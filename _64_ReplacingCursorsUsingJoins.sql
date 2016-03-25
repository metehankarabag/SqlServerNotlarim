/*Cursor yerine Join kullanma.

*/
Update tblProductSales --> Güncellediğimiz tablo
set UnitPrice = 
			Case --> durumları değerlerindir.
				When Name = 'Product - 55' Then 155 --> Tablodan aldığımız değeri bişey olduğunda bir şey dön
				When Name = 'Product - 65' Then 165
				When Name like 'Product - 100%' Then 10001
			  --Else
				  --UnitPrice kendi değerlerini veriyoruz.
			End
from tblProductSales --> Güncellemenin yapılacağı tabloyu yukarıda belirledik. Fakat daha önce Update sorgusundan sonra From kullanmamıştık. Bu from'u güncellemeyi istediğimiz tablo başka bir tablo ile birleştirmek için yazdık.
join tblProducts
on tblProducts.Id = tblProductSales.ProductId --> Sadece satılmış ürünleri almak için
Where Name = 'Product - 55' or Name = 'Product - 65' or Name like 'Product - 100%' --> Satılmış ürünlerden sadece bazı'ları için. Üstte'de seçilen her satırın değeri değiştiriliyor. Diğerlerine sıra geldiğinde de diğerleri değiştiriliyor.

Select  Name, UnitPrice from 
tblProducts join
tblProductSales on tblProducts.Id = tblProductSales.ProductId
where (Name='Product - 55' or Name='Product - 65' or 
Name like 'Product - 100%')