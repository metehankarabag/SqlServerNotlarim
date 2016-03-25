/*SubQueries
Derived Table'lar Form'dan sonra yazılmış Select sorgularıdır. Sorgu sonucu tablo olarak kullanılır. SubQueries bir sorgunun her yerine parantezler içinde yazabileceğimiz Select sorgularıdır. Subquery'e Inner Query de denebilir. Bu durumda diğer sorguya Outer Query denir.
Where'den sonra Inner query kullanırsak, sorgunun kullandığı tablodaki bir sütundan gelen değerler ile Outer Query'inin kullandığı tablodaki bir sütundan gelen değeri karşılaştırabiliriz.
Outer Query'nin kullandığı tablodan alabileceğimiz sütunların yanında Inner Query'i kullanarak, Inner query'nin bir sütunundaki değeri Outer Query sütunları ile birleştirebiliriz.

Not: Where'den sonra kullandığımız sorgudan aldığımız bir sütunu outer query'de kullanmayız. Çünkü sadece parante içinde geçerli.
Not: Bir Subquery içinde başka bir tane o içinde başka bir tane barındırabilir. Böyle 32 kez olabiliyormuş
Not: SubQuery'ler Join'ler ile bir çok kez değiştirilebilirler.
*/
1
Select [Id], [Name], [Description]
from tblProducts
where Id not in (Select Distinct ProductId from tblProductSales) --> sorgu sonucu tablonun bir satırındaki tüm değerler aldığımız her değeri bu değerler içinde kontrol ettiğimiz için in kullanıyoruz.

Select tblProducts.[Id], [Name], [Description] --> yukarıdaki ile aynı işi yapıyor. Id sütunu iki tabloda da oluğu için değerin nereden geleceği beli değilse hata verir.
from tblProducts
left join tblProductSales
on tblProducts.Id = tblProductSales.ProductId
where tblProductSales.ProductId IS NULL

2
Select [Name], (Select SUM(QuantitySold) from tblProductSales where ProductId = tblProducts.Id) as TotalQuantity
from tblProducts
order by Name

Select [Name], SUM(QuantitySold) as TotalQuantity
from tblProducts
left join tblProductSales
on tblProducts.Id = tblProductSales.ProductId
group by [Name]
order by Name


Create Table tblProducts
(
 [Id] int identity primary key,
 [Name] nvarchar(50),
 [Description] nvarchar(250)
)

Create Table tblProductSales
(
 Id int primary key identity,
 ProductId int foreign key references tblProducts(Id),
 UnitPrice int,
 QuantitySold int
) 


Insert into tblProducts values ('TV', '52 inch black color LCD TV')
Insert into tblProducts values ('Laptop', 'Very thin black color acer laptop')
Insert into tblProducts values ('Desktop', 'HP high performance desktop')

Insert into tblProductSales values(3, 450, 5)
Insert into tblProductSales values(2, 250, 7)
Insert into tblProductSales values(3, 450, 4)
Insert into tblProductSales values(3, 450, 9)
