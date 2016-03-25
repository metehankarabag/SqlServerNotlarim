/*Merge
  Tek bir sorgu ile tüm DML işlemlerini gerçekleştirmemizi sağlar. Merge'ü kullanabilmemiz için  2 tabloya ithiyacımız var.
  1. Source Table: Target Tabloya uygulaanması gereken değişiklikleri içeren tablodur. 
  2. Target Table: Haliyle tüm DML sorgularının üzerinde çalıştığı tablodur. 
  Bu iki tablonun satırları Join kullanılarak eşleştirilir. Eşleşme sonucuna göre bir DML sorgusu çalıştırılır. Join'in eşleşme değerini alabilmek için sorguda Not Matched / Matched anahtarlarını kullanabiiriz. 
  Eşleşme 3 farklı durumu var.
  1. Satırın iki tabloda olması --> Bu durumda yeni veri Source tabloda olduğu için Target tabloya Update sorgusu uygularız.
  2. Satır Source'da vardır, Target'de yoktur. -> Bu durumda Target'e Insert uygularız.
  3. Satır Source'da yoktur, Targer'de vardır. --> Bu durumda  target'den veriyi silebiliriz. Fakat Target tablo gerçek verimisin olduğu tablo olduğu için silme işlemini yapmasak daha iyi.
  
  Merge Statement Sql Server 2008'de tanıtılmış. 
  Not: Merge sorgusu ; ile bitmek zorunda. Yazmassak zaten hata da söylüyor.
  Not: Matched ve Not Matched her tabloya sadece bir kez uygulanarak When oluşturulabilir.
  Not: When'e koşul olarak başka bir şey veremiyoruz.
*/
MERGE [TARGET] AS T
USING [SOURCE] AS S
   ON [JOIN_CONDITIONS]
 WHEN MATCHED THEN 
      [UPDATE STATEMENT]
 WHEN NOT MATCHED BY TARGET THEN
      [INSERT STATEMENT] 
 WHEN NOT MATCHED BY SOURCE THEN
      [DELETE STATEMENT]
	  
  Merge into StudentTarget as T --> 1. tablo Target
  Using StudentSource as S -->2. tablo Source
  On T.Id = S.Id --> Join koşulu
  When Not Matched By Source Then --> Matched değeri By Source ile Source tabloya göre alınır. 
	Delete;
  When Not Matched Then --> Target tabloda satır yoksa, demek. Çünkü varsayılanı By Target.
	Insert (Id,Name )values(S.Id, S.Name)
  When Matched Then
	Update Set T.Name = S.Name
 
	
Create table StudentSource
(
     ID int primary key,
     Name nvarchar(20)
)
Create table StudentTarget
(
     ID int primary key,
     Name nvarchar(20)
)

Insert into StudentSource values (1, 'Mike')
Insert into StudentSource values (2, 'Sara')
Insert into StudentTarget values (1, 'Mike M')
Insert into StudentTarget values (3, 'John')

Truncate table StudentTarget
Truncate table StudentSource