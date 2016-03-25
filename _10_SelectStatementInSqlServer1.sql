--Bu derste Select Sorgusu ile ilgili her şeyi görecekmişiz.
/*DISTINCT(Farklı olan)
Select sorgusunu ile kullanabiliriz. sorguyu oluştururken göstermeyi istediğimiz sütunun önüne distinct yazarsak, o sütunda bulunan tüm farklı değerleri alırız.
select distinct Name from table
Distinct'den önce sütun yazamayız ve sonra yazdığımız tüm sütunlara da distinct uygulanır. Distinct anahtarından sonra  birden fazla sütun yazarsak, belirlenen sütunların tüm değerlerinin aynı olduğu 2. bir satır görürse sorguya almaz. Yani belirlenen sütunlardan sadece birinin değeri tekrarlanıyorsa bulunan 2. satır gösterilir.
select distinct Name, City from tblPerson

Operators
= : Eşittir, 
!=/<>: Eşit  değildir. 

IN: Birden fazla koşul uygulamayı istiyorsak kullanılır. 
In kullanmadan -> where Age = 20 or Age = 23 or Age = 30
select * from tblPerson where Age in (20,23,30)

Between: Belirtilen değerler aralığında kalanları gösterir.
Between kullanmadan 	Where Age > 20 and Age < 25
select * from tblPerson where Age Between 20 and 25

Like: Örneğin sadece ilk iki harfini bildiğimiz bir isim arıyorsak, like kullanırız. Yani Like karşılaştırma sütunundan alınan değerin bir kısmı ile filitreleme işlemi yapmamızı sağlar. Fakat girilen değerin sütundaki gerçek değerin neresinde aranacağını belirlemez. Bu iş için girdiğimiz değere bazı karakterler eklemeliyiz. %,_,[] 
% => girdiğimiz değerden sonra koyarsak sonrasını önemsemez, önce koyarsak öncesini önemsemez, hem önüne hem sonuna koyarsak kisini de önemsemez değer varmı yokmu diye bakar-> Contains()
where Name Like 'L%' / '%L' / '%L%'
_ => girdiğimiz değerin önünde ve sonunda kullanırsak değerin bulunduğu yerden önce ve sonra bir karakter olması gerekir.	
select * from tblPerson where Email Like '_@_.com'
[]= Bu operator birden fazla karakteri aramamızı sağlar. Yani içine ABC yazarsak ABC'nin varlığı tek tek aranır. %'den önce ABC yazsaydık, 3 karakterin de aynı anda olması gerekirdi. Bu operatör içinde yazdığımızda herhangi birinin olması yeterlidir. Karakterleri sütundan aldığımız değerin neresinde aradığımızı %, _, ile belirleyebiliriz.
Not: Operatör içinde ^ kullanırsak, belitilen karakterlerin olmadığı anlamına gelir.
select * from tblPerson where Name Like '[^TSR]%'

*/
select * from tblPerson where (City = 'London' or City = 'Mumabi')and Age >25 --> or ve and kullanımı
select * from tblPerson  order by Name Desc, Age ASC --> ilk önce name sütununa göre sıralar. Aynı isimde 2 değer varsa yaşa göre sıralar
select top 1 * from tblPerson --> Top ilk satırdan başlayarak belirtilen sayı kadar değeri alır.
select top 1 Name, Age from tblPerson -->Burda ilk satırın sadece Name ve Age sütunundaki değer alınmış.
select top 50 Percent * from tblPerson -->Baştan başlayarak tablonun yarısını almayı istiyorsak Top'a yüzde değer vermeliyiz.

select top 1 * from tblPerson order by Name Desc --> Sıralama sonucunda ilk değeri göster.
