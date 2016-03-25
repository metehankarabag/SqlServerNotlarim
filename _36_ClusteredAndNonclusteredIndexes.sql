/*Index türleri
1. Clustered, 2. NonClustered, 3. Unique, 4. Filtered, 5. XML, 6. Full text, 7. Spatial, 8. Columnstore, 9. Index with included columns, 10. Index on computed columns

1. Clustered: Tablonun varsayılan sıralamasını belirleyen Index türüdür. her tabloda bir tane olabilir. Örneğin Primary key Constraint oluşturmak için Clustered Index ve Unique kullanılır. 2 sütun üzerinde çalışan bir Clustered Index oluşturduğumuzda bu Index'ın adı Composite Index olur.  Telefon rehberine mantığı ile çalışır. İlk önce isme göre sonra soyada göre sıralanır.
2. NonClustered: Bir tabloda birden fazla kez kullanabileceğimiz Index türüdür. Bir kitabın içindekiler sayfasına benzeyen bir mantıkla çalışır. NonClustered Index'ler de birden fazla sütun üzerinde çalışabilir bu durumda adı Composite NonClustered Index olur.

Clustered Index'in her tablo içinde sadece bir tane oluşturulabilmesinin nedeni tabloya ait olmasıdır. Non Clustered Index'ler gerçek tabloya ait değildir. Bu yüzden bir kitabın içindekiler sayfasına benzer ve birden fazla olabilir. NonClustered Index'ler bir sütuna uygulandığında, sütuna gelen tüm değerleri alınarak yeni bir tablo oluşturulur. Oluşturulan tabloda 2 sütun bulunur ve 2. sütundaki değer 1. sütundaki değeri veren gerçek tablo satırının referans değeridir. 
--NonClustered Index bir tablo oluşturuyorsa, Clustered Index'de aynı tabloyu yeniden oluşturuyor olabilir mi?
Not: Clustered Index daha hızlıdır. Çünkü gerçek tablo üzerinde çalışıyor. NonClustered Index yan tablo üzerinde çalıştığı için gidip gelme olayı var.
Not: NonClustered Index başka bir tablo oluşturduğu için fazladan disk alanı kullanır.
*/



CREATE TABLE [tblEmployee]
(
 [Id] int Primary Key,
 [Name] nvarchar(50),
 [Salary] int,
 [Gender] nvarchar(10),
 [City] nvarchar(50)
)

Insert into tblEmployee Values(3,'John',4500,'Male','New York')
Insert into tblEmployee Values(1,'Sam',2500,'Male','London')
Insert into tblEmployee Values(4,'Sara',5500,'Female','Tokyo')
Insert into tblEmployee Values(5,'Todd',3100,'Male','Toronto')
Insert into tblEmployee Values(2,'Pam',6500,'Female','Sydney')

Select * from tblEmployee


Create Clustered Index IX_tblEmployee_Name
ON tblEmployee(Name)


Create NonClustered Index IX_tblEmployee_Name
ON tblEmployee(Name)
