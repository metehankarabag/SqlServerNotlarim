/*Indexed View
Index'ler belirlediğimiz sütunundan alınan değerlerie göre satırları sıralayarak bir tablo içinde tutar. Yani Clustered Index verdiğimiz sütun değerlerini kullanarak tablo yeniden oluşturur.(tahminim) NonClustered Index ise başka bir tablo oluşturup gerçek tabloya referans verir. Yani View'a Index eklediğimizde View sorgudan aldığı veri ile bir tablo oluşturur ve View'ı verilerini bu tablodan alır. Fakat oluşturduğumuz View'ın tablosu olmadığı için NonClutered Index kuramayız. Çünkü View içinde referans edilecek bir tablo yok. Bu yüzden oluşturacağımız ilk Index'in türü Clustered olmak zorunda.(Verileri alarak View'da tablo oluşturuyor. Tahminimin nedeni. Kullandığımız Clustered Index Unique olmak zorunda. neden alamadım. Sadece bir Clustered Index kullanabileceğimiz için non uniqe Clustered oluşturamıyoruz.)

Indexed View oluşturmak için yaptığımız her işe eklememiz gereken özel durumlar var.(Bunlar bazıları tüm liste Msdn'de var.)
1 - SCHEMABINDING kullanılmalı: Çünkü View'ın bağlı olduğu tablo view'dan bağımsız bir şekilde değişirilememeli.
2 - Sorguda Aggregate Function kullanıyorsak ve parametre olarak verdiğimiz sütundan  null gelme olasılığı varsa Null değer yerine varsayılan bir değer getirmeliyiz. Bu yüzden kullandığımız Aggregate Function'a parametre oalrak IsNull() Function'ı vardır. Bu FUnction 2 parametre alır 1. parametreye gelen değer Null'sa 2. parametredeki değeri döner.
3 - Sorguda Group By kullanıyorsak Count() ile gruplarada kaç eleman olduğunu gösteremeyiz. Bu yüzden Count_Big() kullanmamız gerekir.(Indexed View oluşturmayı istiyorsak)
4 - Schemabinding kullandığımız zaman tabloların adlarını 2 parçada alacağız. yani dbo. ile

Indexed View verisinin sürekli değiştiği durumlarda kullanılmaz. Çünkü Base Tablodaki veri değiştirilir,eklenir veya silinirse, View'ın kullandığı Index, silinir ve yeniden oluşturulur.
Not: Geçen dersteki sorun çıkartan iş çözülmedi.
Not: 2 sütun değerleri arasında çarpma işlemi yapıyorsa bir sütuna null geldiğinde sonuç null olur.

*/

Create View vWTotalSalesByProduct
with SchemaBinding
as
Select Name, 
SUM(ISNULL((QuantitySold * UnitPrice), 0)) as TotalSales, 
COUNT_BIG(*) as TotalTransactions
from dbo.tblProductSales
join dbo.tblProduct
on dbo.tblProduct.ProductId = dbo.tblProductSales.ProductId
group by Name

Create Unique Clustered Index UIX_vWTotalSalesByProduct_Name
on vWTotalSalesByProduct(Name) 





Create Table tblProduct
(
 ProductId int primary key,
 Name nvarchar(20),
 UnitPrice int
)
Insert into tblProduct Values(1, 'Books', 20)
Insert into tblProduct Values(2, 'Pens', 14)
Insert into tblProduct Values(3, 'Pencils', 11)
Insert into tblProduct Values(4, 'Clips', 10)


Create Table tblProductSales
(
 ProductId int,
 QuantitySold int
)
Insert into tblProductSales values(1, 10)
Insert into tblProductSales values(3, 23)
Insert into tblProductSales values(4, 21)
Insert into tblProductSales values(2, 12)
Insert into tblProductSales values(1, 13)
Insert into tblProductSales values(3, 12)
Insert into tblProductSales values(4, 13)
Insert into tblProductSales values(1, 11)
Insert into tblProductSales values(2, 12)
Insert into tblProductSales values(1, 14) 



