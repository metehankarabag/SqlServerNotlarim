/*Cursors: Bir satırı gösteren işaretçi den başka bir şey değilmiş. Sql Server gibi Relational Database Management System'ler Set'lerdeki veriyi işlemlede çok iyi. Yani aynı anda bir çok satırı işleyebilirler. Her satırı kendi içinde değerlendirip satır satır işlemek gerekiyorsa, Cursor'lar kullanmak iyidir. Çoğunlukla Join'ler ile yer değiştirilebilirler.
Bir kaç Cursor türü var --> 1. Forward-Only, 2. Static, 3. Keyset, 4. Dynamic

Cursor For: Cursor tanımlamak için için kullanılır. Cursoru tanımladıktan hemen sonra üzerinde çalışacağı sonuç setini veren sorguyuda tanımlamalıyız.
Open: Cursor'un sorgusunu çalıştırır ve Cursor'u birinici satırı alması için hazırlar.(aldırmaz)
Close: Cursor'daki sonuç setini sunmak için kapatmak gerekir.
Deallocate: kaynağı serbest bırakmak için Close'dan sonra kullanılır.
Fetch Next & Into: Birlikte kullanılırlar. Fetch Next Cursor'u bulunduğu sütundan bir sonraki sütuna yönlendirir. Into Cursor'un bu satırın hangi sütunlardan değer alacağını belirler.
@@Fetch_Status: Function'ı Cursor'un alabileceği satır olduğu sürece 0 döner.

Not: ağadığı önemli bir not var.
*/
Declare @ProductId int
Declare ProductIdCursor CURSOR FOR --> Tanımladık
Select ProductId from tblProductSales

Open ProductIdCursor --> Başlattık.

Fetch Next from ProductIdCursor into @ProductId, @Name --> İlk satırın belirlediğimiz sütunlarındaki değerlerini Cursor'a aldık.

While(@@FETCH_STATUS = 0) -->  Satır olduğu sürece yukarıda Cursor'a aldığımız değerler üzerinde çalışacağız.
Begin
 Declare @ProductName nvarchar(50)
 Select @ProductName = Name from tblProducts where Id = @ProductId -->Sattığımız ürünler tablosundan satılan ürünün Id'sini kullanarak, mevcut ürünler tablosundan adını alıyoruz.
 
 if(@ProductName = 'Product - 55') --> Satılan ürünün adı bu ise
 Begin
  Update tblProductSales set UnitPrice = 55 where ProductId = @ProductId --> Ürünün fiyatını değiştiriyoruz. Bu sorgu eşleşmenin sağlandığı tüm satırlar üzerinde çalışacak. Yani Cursor bir sonraki satırdan aynı ProductId değerini alırsa, uygulama buraya tekrar girer ve aynı iş tekrarlanır. (Tahminim bu yüzden çok yavaş oluyor.) Yani Cursor kullanıyorsak, tablonun diğer satırları üzerinde çalışmamalıyız.(if'de ayrıca Unite Price'ı kontrol etseydeki bu olmazdı tahminimce. Fakat işin yoksa birde bunu dene.)
 End
 else if(@ProductName = 'Product - 65')
 Begin
  Update tblProductSales set UnitPrice = 65 where ProductId = @ProductId
 End
 else if(@ProductName like 'Product - 100%')
 Begin
  Update tblProductSales set UnitPrice = 1000 where ProductId = @ProductId
 End
 
 Fetch Next from ProductIdCursor into @ProductId --> Hep aynı satırda çalışmaması için bunu kullanmalıyız. Yani While içinde if'leri falan da kullanarak her satırdan farklı sütun değerlerini  Cursor'a alabiliriz.
End

CLOSE ProductIdCursor --> Veriyi sunduk
Deallocate ProductIdCursor --> Kaynağı bıraktık.

Select  Name, UnitPrice 
from tblProducts join
tblProductSales on tblProducts.Id = tblProductSales.ProductId
where (Name='Product - 55' or Name='Product - 65' or Name like 'Product - 100%') 