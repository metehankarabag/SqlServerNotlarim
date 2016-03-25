/* Bu dersi gelecek derste SubQuery mi hızlı Join mi hızlı anlamak için yapıyoruz.
information_schema.tables: Uygulandığı veri tabanının tüm tablolarını gösterir.

*/
-- If Table exists drop the tables
If (Exists (select *  from information_schema.tables where table_name = 'tblProductSales')) --> tablo varsa
Begin
 Drop Table tblProductSales --> sil
End
--Aynısı
If (Exists (select * from information_schema.tables where table_name = 'tblProducts'))
Begin
 Drop Table tblProducts
End 

--tblProducts tablosuna kaç çeşit ürünümüzün olduğunu girdik ve her ürüne bir açıklama yazdık.
Create Table tblProducts
(
 [Id] int identity primary key,
 [Name] nvarchar(50),
 [Description] nvarchar(250)
)

Declare @Id int
Set @Id = 1

While(@Id <= 300000) --> 300 bin tane farklı ürünümüz var.
Begin
 Insert into tblProducts values('Product - ' + CAST(@Id as nvarchar(20)), 
 'Product - ' + CAST(@Id as nvarchar(20)) + ' Description')
 
 Print @Id
 Set @Id = @Id + 1
End
-----------------------------------------------------------------------------

--tblProductsales tablosuna hangi üründen kaç tane satıldığını ve ürünlerin birim fiyatını belirledik.
Create Table tblProductSales
(
 Id int primary key identity,
 ProductId int foreign key references tblProducts(Id),
 UnitPrice int,
 QuantitySold int
)
declare @UpperLimitForProductId int
declare @LowerLimitForProductId int
set @LowerLimitForProductId = 1
set @UpperLimitForProductId = 100000 --> En fazla 100 bin tür üründen en az bir tane satılmış. 100 bin 1. ve sonrasından hiç satılmamış.


declare @UpperLimitForUnitPrice int
declare @LowerLimitForUnitPrice int
set @LowerLimitForUnitPrice = 1
set @UpperLimitForUnitPrice = 100 --> en ucusu 1 en pahalısı 100

declare @UpperLimitForQuantitySold int
declare @LowerLimitForQuantitySold int
set @LowerLimitForQuantitySold = 1
set @UpperLimitForQuantitySold = 10 --> satılan ürünlerden her seferde en fazla 10 tane satılabilir.
--Bunlar sonuçları sorguya eklemek için
declare @RandomProductId int --> satılan ürünün Id'si
declare @RandomUnitPrice int --> fiyatı
declare @RandomQuantitySold int --> kaç tane satıldığı.

Declare @Counter int
Set @Counter = 1

While(@Counter <= 450000)
Begin
 select @RandomProductId = Round(((@UpperLimitForProductId - @LowerLimitForProductId) * Rand() + @LowerLimitForProductId), 0)
 select @RandomUnitPrice = Round(((@UpperLimitForUnitPrice - @LowerLimitForUnitPrice) * Rand() + @LowerLimitForUnitPrice), 0)
 select @RandomQuantitySold = Round(((@UpperLimitForQuantitySold - @LowerLimitForQuantitySold) * Rand() + @LowerLimitForQuantitySold), 0)
 
 Insert into tblProductsales 
 values(@RandomProductId, @RandomUnitPrice, @RandomQuantitySold)

 Print @Counter
 Set @Counter = @Counter + 1
End