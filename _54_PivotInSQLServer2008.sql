/*PIVOT: Bir tablonun Unique değerlerini sütunlara çevirmek için kullanılabilecek bir Sql Server operatörüdür. 
Not: Pivot'u rahat kullanabilmek için Groupby ile satır değerlerini gruplayıp sütuna çevrilecek satır değerlerini görmeliyiz.

2 örnek yaptık birincisinde, Id sütunu yok ikincisinde var. 2. örneğe Pviot uyguladığımızda Id sütnundaki değeri seçmesek bile Primary Key'in tablodaki varlığı satır bütünlüğünün  korunmasını sağlıyor.(BÖyle düşünmemin nedeni: sütuna çevirdiğimiz satır değerlerinin, gerçek satırda değeri yoksa NULL alıyor.) Bu sorunu çözmek için Drived Table kullanıyoruz. form'dan sonra Id sütununu çıkararak parantez içinde yazdığımız sorguya As ile isim verdiğimizde oluşan tablonun Id sütunun olmadığı için satır değerleri tek bir yerde toplanabiliyor.
*/


Select SalesCountry, SalesAgent, SUM(SalesAmount) as Total 
from tblProductSales
group by SalesCountry, SalesAgent --> Bu iki değerin aynı olduğu satırları gruployur.
order by SalesCountry, SalesAgent

Select SalesAgent, India, US, UK --> Tablosa sadece SalesAgent sütunu var. Diğerleri yok.
from tblProductSales --> tablo
Pivot 
(
   Sum(SalesAmount) --> SalesAmount sütunundaki değerleri 
   for SalesCountry --> SalesCountry sütunundaki değerlere göre tablo
   in ([India],[US],[UK]) --> SalesCountry'deki satır değerlerini sütunlara çevirip, satır değerlerini alt alt'a yazıyor
) as PivotTable --> 2. tablo

Create Table tblProductSales --> Product Sale
(
 SalesAgent nvarchar(50),
 SalesCountry nvarchar(50),
 SalesAmount int 
)
Insert into tblProductSales values('Tom', 'UK', 200)
Insert into tblProductSales values('John', 'US', 180)
Insert into tblProductSales values('John', 'UK', 260)
Insert into tblProductSales values('David', 'India', 450)
Insert into tblProductSales values('Tom', 'India', 350)
Insert into tblProductSales values('David', 'US', 200)
Insert into tblProductSales values('Tom', 'US', 130)
Insert into tblProductSales values('John', 'India', 540)
Insert into tblProductSales values('John', 'UK', 120)
Insert into tblProductSales values('David', 'UK', 220)
Insert into tblProductSales values('John', 'UK', 420)
Insert into tblProductSales values('David', 'US', 320)
Insert into tblProductSales values('Tom', 'US', 340)
Insert into tblProductSales values('Tom', 'UK', 660)
Insert into tblProductSales values('John', 'India', 430)
Insert into tblProductSales values('David', 'India', 230)
Insert into tblProductSales values('David', 'India', 280)
Insert into tblProductSales values('Tom', 'UK', 480)
Insert into tblProductSales values('John', 'US', 360)
Insert into tblProductSales values('David', 'UK', 140) 

--------------------------------------------------------	

--Gelen yazımı
SELECT <non-pivoted column>,
    [first pivoted column] AS <column name>,
    [second pivoted column] AS <column name>,
    ...
    [last pivoted column] AS <column name>
FROM
    (<SELECT query that produces the data>) 
    AS <alias for the source query>
PIVOT
(
    <aggregation function>(<column being aggregated>)
FOR 
    [<column that contains the values that will become column headers>] -- Burayı yanlış anlamışım.
    IN ( [first pivoted column], [second pivoted column], ... [last pivoted column])
) 
AS <alias for the pivot table>
<optional ORDER BY clause>; 

--Derste kullandığımız.
Select SalesAgent, India, US, UK
from 
(
   Select SalesAgent, SalesCountry, SalesAmount from tblProductsSale --Products Salee
) as SourceTable --> Bu tabloda Id sütunun yok.
Pivot
(
 Sum(SalesAmount) for SalesCountry in (India, US, UK)
) as PivotTable

Create Table tblProductsSale
(
   Id int primary key,
   SalesAgent nvarchar(50),
   SalesCountry nvarchar(50),
   SalesAmount int 
)

Insert into tblProductsSale values(1, 'Tom', 'UK', 200)
Insert into tblProductsSale values(2, 'John', 'US', 180)
Insert into tblProductsSale values(3, 'John', 'UK', 260)
Insert into tblProductsSale values(4, 'David', 'India', 450)
Insert into tblProductsSale values(5, 'Tom', 'India', 350)
Insert into tblProductsSale values(6, 'David', 'US', 200)
Insert into tblProductsSale values(7, 'Tom', 'US', 130)
Insert into tblProductsSale values(8, 'John', 'India', 540)
Insert into tblProductsSale values(9, 'John', 'UK', 120)
Insert into tblProductsSale values(10, 'David', 'UK', 220)
Insert into tblProductsSale values(11, 'John', 'UK', 420)
Insert into tblProductsSale values(12, 'David', 'US', 320)
Insert into tblProductsSale values(13, 'Tom', 'US', 340)
Insert into tblProductsSale values(14, 'Tom', 'UK', 660)
Insert into tblProductsSale values(15, 'John', 'India', 430)
Insert into tblProductsSale values(16, 'David', 'India', 230)
Insert into tblProductsSale values(17, 'David', 'India', 280)
Insert into tblProductsSale values(18, 'Tom', 'UK', 480)
Insert into tblProductsSale values(19, 'John', 'US', 360)
Insert into tblProductsSale values(20, 'David', 'UK', 140)

